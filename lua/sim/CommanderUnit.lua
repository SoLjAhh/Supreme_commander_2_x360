-----------------------------------------------------------------------------
--  File     : /lua/CommanderUnit.lua
--  Author(s): Gordon Duclos
--  Modder(s): SoLjA
--  Summary  : SC2 Commander unit class
--  Copyright © 2022 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------
local MobileUnit = import('/lua/sim/MobileUnit.lua').MobileUnit
local Unit = import('/lua/sim/unit.lua').Unit

CommanderUnit = Class(MobileUnit) {

    OnCreate = function(self)
        MobileUnit.OnCreate(self)
		self.BuildScaffoldUnit = nil
		self.Hunkered = false

		self.animset = self:GetBlueprint().AnimSet or nil
		if self.animset then
			self:PushAnimSet(self.animset, "Base");
		end
    end,

	OnStartBeingBuilt = function(self, builder, layer)
		MobileUnit.OnStartBeingBuilt(self, builder, layer)

		local bp = self:GetBlueprint()
		if bp.Build.BuildScaffoldUnit then
			local x, y, z = unpack(self:GetPosition())
			local qx, qy, qz, qw = unpack(self:GetOrientation())
			self.BuildScaffoldUnit = CreateUnit(bp.Build.BuildScaffoldUnit, self:GetArmy(), x, y, z, qx, qy, qz, qw )
			self.BuildScaffoldUnit:DeployScaffold(self)
			self.Trash:Add(self.BuildScaffoldUnit)
		end
	end,

	GetBuildScaffoldUnit = function(self)
		return self.BuildScaffoldUnit
	end,

    OnStopBeingBuilt = function(self,builder,layer)
        MobileUnit.OnStopBeingBuilt(self,builder,layer)

		if self.BuildScaffoldUnit and not self.BuildScaffoldUnit:IsDead() then
			self.BuildScaffoldUnit:BuildUnitComplete()
		end

		self.BuildScaffoldUnit = nil
    end,

    OnStartBuild = function(self, unitBeingBuilt, order )
        MobileUnit.OnStartBuild(self,unitBeingBuilt, order)
        self.UnitBeingBuilt = unitBeingBuilt
        self.UnitBuildOrder = order
        self.BuildingUnit = true

		if order == 'Upgrade' then
			self.Upgrading = true
			self.BuildingUnit = false
		else
			if self.UnitBeingBuilt and not self.UnitBeingBuilt:IsDead() and
				self.UnitBeingBuilt.BuildScaffoldUnit and not self.UnitBeingBuilt.BuildScaffoldUnit:IsDead() then
				self.UnitBeingBuilt.BuildScaffoldUnit:OnUnpaused()
			end
            MobileUnit.StartBuildingEffects(self, unitBeingBuilt, order)
        end
    end,

    OnStopBuild = function(self, unitBeingBuilt)
        MobileUnit.OnStopBuild(self,unitBeingBuilt)
		if self.UnitBeingBuilt and not self.UnitBeingBuilt:IsDead() and
			self.UnitBeingBuilt.BuildScaffoldUnit and not self.UnitBeingBuilt.BuildScaffoldUnit:IsDead() then
			self.UnitBeingBuilt.BuildScaffoldUnit:OnPaused()
		end
        self.UnitBeingBuilt = nil
        self.UnitBuildOrder = nil

        self.BuildingUnit = false
    end,

    OnMotionHorzEventChange = function( self, new, old )
		MobileUnit.OnMotionHorzEventChange(self, new, old)

		if ( old == 'Stopped' ) and not self:IsUnitState( 'Jumping' ) then
            self:SendAnimEvent( 'OnWalk' )
        elseif ( new == 'Stopped' ) and not self.Hunkered then
            -- only keep the animator around if we are dying and playing a death anim
            -- or if we have an idle anim
            self:SendAnimEvent( 'OnIdle' )
        end
    end,

	OnMotionVertEventChange = function( self, new, old )
        MobileUnit.OnMotionVertEventChange( self, new, old )

		-- Support only for walking land unit animations with jump jets
		if new == 'Bottom' and old == 'Down' then
			if self.JumpEffects then
				for k, v in self.JumpEffects do
					v:Destroy()
				end
				self.JumpEffects = nil
			end
			if self:IsMoving() then
                self:SendAnimEvent( 'OnWalk' )
			end
		elseif new == 'Up' then
            self:SendAnimEvent( 'OnIdle' )
		end
	end,

    OnDamage = function(self, instigator, amount, vector, damageType)
		MobileUnit.OnDamage(self, instigator, amount, vector, damageType)
		local aiBrain = self:GetAIBrain()
		if self.CanTakeDamage and aiBrain then
			aiBrain:OnPlayCommanderUnderAttackVO()
		end
    end,
	
    OnKilled = function(self, instigator, type, overkillRatio)
		Unit.OnKilled(self, instigator, type, overkillRatio)
    end,

    DeathThread = function( self, overkillRatio, instigator)
        --LOG('*DEBUG: OVERKILL RATIO = ', repr(overkillRatio))
		if self:PrecacheDebris() then
			WaitTicks(1)
		end
		-- Destroy any ambient damage effects on unit
		self:DestroyAllDamageEffects()

		if not self.DeathWeaponEnabled then

			-- Play destruction effects
			local bp = self:GetBlueprint()
			local ExplosionEffect = bp.Death.ExplosionEffect

			if ExplosionEffect then
				local layer = self:GetCurrentLayer()
				local emitters = EffectTemplates.Explosions[layer][ExplosionEffect]

				if emitters then
					CreateBoneEffects( self, -2, self:GetArmy(), emitters )
				end
			end

			if bp.Death.DebrisPieces then
				self:DebrisPieces( self )
			end

			if bp.Death.ExplosionTendrils then
				self:ExplosionTendrils( self )
			end

			if bp.Death.Light then
				local myPos = self:GetPosition()
				myPos[2] = myPos[2] + 7
				CreateLight( myPos[1], myPos[2], myPos[3], 0, -1, 0, 10, 4, 0.1, 0.1, 0.5 )
			end

			-- Create destruction debris fragments.
			self:CreateUnitDestructionDebris()

			-- Play death animation
			self:SendAnimEvent( 'OnKilled' )
			if bp.Death.DeathAnimWaitTime then
				WaitSeconds(bp.Death.DeathAnimWaitTime)
			end

			-- Create unit wreckage
			self:CreateWreckage( overkillRatio )
			local scale = (bp.SizeX + bp.SizeZ) * 1.5
			if bp.Death.ScorchDecal then
				CreateDecal(self:GetPosition(),Random()*2*math.pi, bp.Death.ScorchDecal, '', '', scale , scale, (Random()*200)+150, (Random()*300)+300, self:GetArmy(), scale * 0.75 )
			else
				CreateDecal(self:GetPosition(),Random()*2*math.pi,'/textures/Terrain/Decals/scorch_001_diffuse.dds', '', '', scale , scale, (Random()*200)+150, (Random()*300)+300, self:GetArmy(), scale * 0.75 )
			end
		end
        self:PlayUnitSound('Destroyed')
        self:Destroy()
    end,

    CreateBuildEffects = function( self, unitBeingBuilt, order )
		local isBeingBuilt = unitBeingBuilt:IsBeingBuilt()
		if order == 'MobileBuild' then
			local scaffoldUnit = unitBeingBuilt:GetBuildScaffoldUnit()
			if scaffoldUnit then
				CreateBlueWavyBuildBeams( self, scaffoldUnit, self:GetBlueprint().Build.EffectBones, self.BuildEffectsBag )
			else
				CreateBuildSliceBeams( self, unitBeingBuilt, self:GetBlueprint().Build.EffectBones, self.BuildEffectsBag )
			end
		elseif order == 'Repair' then
            CreateRepairBeams( self, unitBeingBuilt, self:GetBlueprint().Build.EffectBones, self.BuildEffectsBag )
		elseif order == 'BuildAssist' then
            CreateBuildAssistBeams( self, unitBeingBuilt, self:GetBlueprint().Build.EffectBones, self.BuildEffectsBag )
		end
    end,

	OnKilledPlaySound = function(self,motionType)
		---NOTE: adding this here, which is slightly different than most VO calls - they are typically handled in aibrain.lua and a playVO function
		---		this was a lower impact change for SC2 late in the project - bfricks 3/3/2010 added to xbox 360 - SoLjA 3/30/2022
		if ScenarioInfo and ScenarioInfo.type == 'skirmish' then
			CreateSimSyncVoice( 'SC2/VOC/COMPUTER/VOC_COMPUTER_ACU_Destroyed_010' )
		end

        if self.DeathWeaponEnabled then
			self:PlayUnitSound('KilledNuke')
        else
            self:PlayUnitSound('Killed')
        end
	end,

    DestroyedOnTransport = function(self)
		MobileUnit.DestroyedOnTransport(self)
		self:SetCanTakeDamage(true)
    end,
}