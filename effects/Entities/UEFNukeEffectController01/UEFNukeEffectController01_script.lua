-----------------------------------------------------------------------------
--  File     : /effects/Entities/UEFNukeEffectController01/UEFNukeEffectController01_script.lua
--  Author(s): Gordon Duclos, Matt Vainio
--  Summary  : Nuke Damage Controller and Effect Visuals
--  Copyright © 2009 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------
local Projectile = import('/lua/sim/Projectile.lua').Projectile
local Util = import('/lua/system/utilities.lua')
local RandomFloat = Util.GetRandomFloat
local GetRandomInt = Util.GetRandomInt

UEFNukeEffectController01 = Class(Projectile) {
   
    OnCreate = function(self, inWater)
        Projectile.OnCreate(self, inWater)
    
        self.UseNukeDecal = true
    end,
   
    -- NOTE: This script has been modified to REQUIRE that data is passed in!  The nuke won't explode until this happens!
    --OnCreate = function(self)
    PassData = function(self, Data)
		-- Setup default values for incoming nuke data if it doesn't exist
		self.InnerDamage = Data.InnerDamage or 2
		self.InnerRadius = Data.InnerRadius or 10
		self.InnerToOuterSegmentCount = Data.InnerToOuterSegmentCount or 2
		self.OuterDamage = Data.OuterDamage or 1
		self.OuterRadius = Data.OuterRadius or 20
		self.PulseDamage = Data.PulseDamage or 5
		self.PulseCount = Data.PulseCount or 2
		self.StunDuration = Data.StunDuration or 0
		self.StunRadius = Data.StunRadius or self.OuterRadius
		self.TimeToOuterRadius = Data.TimeToOuterRadius or 20
		self:ForkThread(self.DoNukeDamage)

        self:CreateNuclearExplosion()
    end,

    DoNukeDamage = function(self)
		local position = self:GetPosition()
		local outerRingDistance = self.OuterRadius-self.InnerRadius
		local ringWidth = outerRingDistance / self.InnerToOuterSegmentCount
		local pulseTime = self.TimeToOuterRadius / self.PulseCount
		local pulseRadiusIncrease = outerRingDistance / self.PulseCount
		local currentRadius = self.InnerRadius
		local damageMul = (self.InnerDamage-self.OuterDamage)/outerRingDistance

		--LOG( 'NUKE: Damage Area in Inner Radius: ', self.InnerRadius, '(ogrids) Damage: ', self.InnerDamage )
		DamageArea( self:GetLauncher(), position, self.InnerRadius, self.InnerDamage, 'Normal', true, true)

		--LOG( 'NUKE: Damage Ring, Ring Width: ', ringWidth, '(ogrids)' )

		for i = 1, self.InnerToOuterSegmentCount do
			local ringDamage = self.InnerDamage - ( math.max( 0, (currentRadius + ringWidth) - self.InnerRadius ) * damageMul )
			--LOG( 'NUKE: Damage Ring: Radius Inner: ' .. currentRadius, ' Outer: ', currentRadius + ringWidth, ' Damage: ', ringDamage )
			if ringDamage > 0 then
				DamageRing( self:GetLauncher(), position, currentRadius, currentRadius + ringWidth, ringDamage, 'Normal', true, true)
			end
			currentRadius = currentRadius + ringWidth
		end

		if self.StunDuration > 0 then
			StunArea( self:GetArmy(), position, self.StunRadius, 100.0, self.StunDuration, true )
		end

		--LOG( 'NUKE: Pulse Damage, Area Radius Increase: ', pulseRadiusIncrease, '(ogrids) Pulse Time: ', pulseTime, '(seconds)' )
		currentRadius = self.InnerRadius

		for i = 1, self.PulseCount do
			currentRadius = currentRadius + pulseRadiusIncrease
			--LOG( 'NUKE: Pulse Damage Area: Radius: ' .. currentRadius, ' Damage: ', self.PulseDamage )
			DamageArea( self:GetLauncher(), self:GetPosition(), currentRadius, self.PulseDamage, 'Normal', true, true)
            WaitSeconds( pulseTime )
		end
    end,

    CreateNuclearExplosion = function(self)
        local myBlueprint = self:GetBlueprint()
            
        -- Play the "NukeExplosion" sound
        if myBlueprint.Audio.NukeExplosion then
            self:PlaySound(myBlueprint.Audio.NukeExplosion, false)
        end

		self:ShakeCamera( 55, 6, 1, 6.5 ) 

		-- Create thread that spawns and controls effects
        self:ForkThread(self.EffectThread)
    end,    

    EffectThread = function(self)
        local army = -1
        local position = self:GetPosition()
        
        -- Create light at location
        local lightHandle = CreateLight( position[1], position[2]+25, position[3], 0, -1, 0, 100, 4, 0.1, 13, 7 )
        
        -- Base flash, glow and shockwave
		for k, v in EffectTemplates.Weapons.Generic_Nuke01_Base01 do
			  CreateEmitterAtEntity(self, army, v ) 
		end

        -- Central column plume
        local PlumeEffectYOffset = 1
        self:CreateProjectile('/effects/entities/UEFNukeEffect02/UEFNukeEffect02_proj.bp',0,PlumeEffectYOffset,0,0,0,1)
        
        -- Rolling column edges
        self:ForkThread(self.CreateRollingColumn)       
        
        -- Primary faster shockwave
        ----self:ForkThread(self.CreatePrimarySmokeRing)
        
        if self.UseNukeDecal then 
            -- Create ground scorch mark
            CreateDecal(self:GetPosition(),RandomFloat(0,2*math.pi), '/textures/Terrain/Decals/scorch_001_diffuse.dds', '', '', 100 , 100, 320, 320, army, 54 )
        end
        
        WaitSeconds(1)
        
        -- Secondary slower shockwave
        self:ForkThread(self.CreateSecondarySmokeRing)
        
        WaitSeconds(1) 
        
        -- Inward debris
        self:ForkThread(self.CreateInwardColumn)
        
        -- Inward rings/lines
		for k, v in EffectTemplates.Weapons.Generic_Nuke01_Base02 do
			  CreateEmitterAtEntity(self, army, v ) 
		end
		
		WaitSeconds(5)
		
		-- Upward air currents
        --self:ForkThread(self.CreateUpwardRibbons)
                
        --WaitSeconds(2.5)
                
        -- Leftover steam
		for k, v in EffectTemplates.Weapons.Generic_Nuke01_Leftover01 do
			  CreateEmitterAtEntity(self, army, v ) 
		end
    end,
    
    
    CreateInwardColumn = function(self)
        local sides = 12
        local angle = (2*math.pi) / sides
        --local velocity = 7
        local OffsetMod = 20
        local projectiles = {}

        for i = 0, (sides-1) do
            local X = math.sin(i*angle)
            local Z = math.cos(i*angle)
            local proj =  self:CreateProjectile('/effects/entities/UEFNukeEffect04/UEFNukeEffect04_proj.bp', X * OffsetMod , 1.5, Z * OffsetMod, X, 0, Z)
                --:SetVelocity(velocity)
            table.insert( projectiles, proj )
        end        
    end, 
    
    CreateRollingColumn = function(self)
        local sides = 12
        local angle = (2*math.pi) / sides
        --local velocity = 7
        local OffsetMod = 1
        local projectiles = {}

        for i = 0, (sides-1) do
            local X = math.sin(i*angle)
            local Z = math.cos(i*angle)
            local proj =  self:CreateProjectile('/effects/entities/UEFNukeEffect03/UEFNukeEffect03_proj.bp', X * OffsetMod , 2.5, Z * OffsetMod, X, 0, Z)
                --:SetVelocity(velocity)
            table.insert( projectiles, proj )
        end        
    end, 
    
    CreatePrimarySmokeRing = function(self)
        local sides = 32
        local angle = (2*math.pi) / sides
        local velocity = 30
        local OffsetMod = 8
        local projectiles = {}

        for i = 0, (sides-1) do
            local X = math.sin(i*angle)
            local Z = math.cos(i*angle)
            local proj =  self:CreateProjectile('/effects/entities/UEFNukeShockwave01/UEFNukeShockwave01_proj.bp', X * OffsetMod , 2.5, Z * OffsetMod, X, 0, Z)
                :SetVelocity(velocity * RandomFloat( 0.9, 1.1 ))
            table.insert( projectiles, proj )
        end  
        
        WaitSeconds( 3 )

        -- Slow projectiles down to normal speed
        for k, v in projectiles do
            v:SetAcceleration(-0.45)
        end         
    end,        

    CreateSecondarySmokeRing = function(self)
        local sides = 32
        local angle = (2*math.pi) / sides
        local velocity = 10
        local OffsetMod = 8
        local projectiles = {}

        for i = 0, (sides-1) do
            local X = math.sin(i*angle)
            local Z = math.cos(i*angle)
            local proj =  self:CreateProjectile('/effects/entities/UEFNukeShockwave02/UEFNukeShockwave02_proj.bp', X * OffsetMod , 2.5, Z * OffsetMod, X, 0, Z)
                :SetVelocity(velocity * RandomFloat( 0.9, 1.1 ))
            table.insert( projectiles, proj )
        end  
        
        WaitSeconds( 3 )

        -- Slow projectiles down to normal speed
        for k, v in projectiles do
            v:SetAcceleration(-0.45)
        end         
    end,   
    
    CreateUpwardRibbons = function(self)
        local sides = 24
        local angle = (2*math.pi) / sides
        local velocity = 5
        local OffsetMod = 38
        local projectiles = {}
        local count = 0
        
        for i = 0, (sides-1) do
            local X = math.sin(i*angle)
            local Z = math.cos(i*angle)
                      
            local proj =  self:CreateProjectile('/effects/entities/UEFNukeShockwave01/UEFNukeShockwave01_proj.bp', X * OffsetMod * RandomFloat( 0.9, 1.1 ) , 2.5, Z * OffsetMod * RandomFloat( 0.9, 1.1 ), -X, 0, -Z)
                :SetVelocity(velocity * RandomFloat( 1.0, 1.0 ))
                --:SetAcceleration(-0.1)
                :SetBallisticAcceleration(1.3)
            table.insert( projectiles, proj )
        end  
    end,    
}
TypeClass = UEFNukeEffectController01