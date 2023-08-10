-----------------------------------------------------------------------------
--  File     : /data/lua/effectutilities.lua
--  Author(s): Gordon Duclos, Matt Vainio, Aaron Lundquist
--  Summary  : Effect Utility functions for scripts.
--  Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------
local util = import('/lua/system/utilities.lua')
local Entity = import('/lua/sim/Entity.lua').Entity

-- AttachEffectsOnProjectile( proj, name, scale(optional), offset(optional) )
--
-- Description:
--   Creates a set of projectile specific effect emitters on projectile entity.
--
-- Params:
--   unit                    - unit entity.
--   name                    - projectile emitter effect template name, index into EffectTemplate definitions.
--   scale (optional)        - size scalar multiplier to all emitter blueprints in this effect template.
--   offset (optional)       - vector x,y,z position offset to all emitters.
function AttachEffectsOnProjectile( proj, name, scale, offset )
    if EffectTemplates.Weapons[name] then
		local emitters = CreateEmittersOnEntity( proj, proj:GetArmy(), EffectTemplates.Weapons[name], true )

		for _, vEffect in emitters do
			if scale then
				vEffect:ScaleEmitter( scale )
			end
			if offset then
				vEffect:OffsetEmitter( offset[1] or 0, offset[2] or 0, offset[3] or 0 )
			end
		end
	end
end

-- AttachBeamsOnProjectile( proj, name, scale(optional), offset(optional) )
--
-- Description:
--   Creates a set of projectile specific beam emitters on projectile entity.
--
-- Params:
--   unit                    - unit entity.
--   name                    - projectile beam effect template name, index into EffectTemplate definitions.
--   scale (optional)        - size scalar multiplier to all emitter blueprints in this effect template.
--   offset (optional)       - vector x,y,z position offset to all emitters.

function AttachBeamsOnProjectile( proj, name, scale, offset )
    if EffectTemplates.Weapons[name] then
		local army = proj:GetArmy()
		local emit = nil

		for _, vEffect in EffectTemplates.Weapons[name] do
			emit = CreateBeamEmitterOnEntity( proj, -2, army, vEffect )
			if scale then
				emit:ScaleEmitter( scale )
			end
			if offset then
				emit:OffsetEmitter( offset[1] or 0, offset[2] or 0, offset[3] or 0 )
			end
		end
	end
end

-- AttachPolytrailsOnProjectile( proj, name, scale(optional), offset(optional) )
--
-- Description:
--   Creates a set of polytrail emitters on a projectile.
--
-- Params:
--   proj                    - projectile entity.
--   name                    - polytrail effect template name, index into EffectTemplate definitions.
--   scale (optional)        - size scalar multiplier to all emitter blueprints in this effect template.
--   offset (optional)       - vector x,y,z position offset to all emitters.

function AttachPolytrailsOnProjectile( proj, name, scale, offset )
    if EffectTemplates.Weapons[name] then
		local army = proj:GetArmy()
		local emit = nil

		for _, vEffect in EffectTemplates.Weapons[name] do
			emit = CreateTrail( proj, -2, army, vEffect )
			if scale then
				emit:ScaleEmitter( scale )
			end
			if offset then
				emit:OffsetEmitter( offset[1] or 0, offset[2] or 0, offset[3] or 0 )
			end
		end
	end
end

-- CreateImpactEffectsOnProjectileCollision( proj, name, scale(optional), offset(optional) )
--
-- Description:
--   Creates a set of projectile specific impact emitters on projectile entity.
--
-- Params:
--   unit                    - unit entity.
--   name                    - impact emitter effect template name, index into EffectTemplate definitions.
--   scale (optional)        - size scalar multiplier to all emitter blueprints in this effect template.
--   offset (optional)       - vector x,y,z position offset to all emitters.

function CreateImpactEffectsOnProjectileCollision( proj, name, scale, offset, align )
    --LOG ('effects = ', repr(EffectTemplates.Weapons[name]))
	if EffectTemplates.Weapons[name] then
		if align then
			CreateEmittersAtBone( proj, -2, proj:GetArmy(), EffectTemplates.Weapons[name], false, scale, offset )
		else
			CreateEmittersAtEntity( proj, proj:GetArmy(), EffectTemplates.Weapons[name], false, scale, offset )
		end
	else
		WARN( 'CreateImpactEffectsOnProjectileCollision, invalid effect template: ', name )
	end
end

-- CreateTeleportEffects( unit )
--
-- Description:
--   Creates teleport effects based on units effects group classification.
--
-- Params:
--   unit                    - unit entity.

function CreateTeleportEffects( unit, attached )
	---NOTE: adding here for convenience at end of project - bfricks 1/11/10
	unit:PlaySound('SC2/SC2/Units/ILLUMINATE/snd_TeleportStartBIG_Gate')

    local fxclass = unit:GetBlueprint().Display.EffectGroupClassification
    if not fxclass then
		WARN( 'CreateTeleportEffects, no EffectGroupClassification for:', unit:GetBlueprint().Display.DisplayName )
		return
    end

    if EffectTemplates.Teleport01[fxclass] then
		local army = unit:GetArmy()

		for kEffect, vEffect in EffectTemplates.Teleport01[fxclass] do
			if attached then
				CreateAttachedEmitter( unit, -2, army, vEffect)
			else
				CreateEmitterAtEntity( unit, army, vEffect)
			end
		end
	end
end

-- CreateTerrainImpactEffects( proj, targetType, terrainClass )
--
-- Description:
--   Creates a set of projectile specific impact emitters on projectile entity.
--
-- Params:
--   proj                    - unit entity.
--   targetType              - the type of impact (Terrain, Water, Unit, etc)
--   terrainClass            - size classification of terrain impacts

function CreateTerrainImpactEffects( proj, targetType, terrainClass )
    local TerrainType = nil

    if terrainClass then
		local pos = proj:GetPosition()
        TerrainType = GetTerrainType( pos.x,pos.z )
        if TerrainType.FXImpact[targetType][terrainClass] == nil then
		    TerrainType = GetTerrainType( -1, -1 )
	    end
    else
        TerrainType = GetTerrainType( -1, -1 )
    end

	if TerrainType.FXImpact[targetType][terrainClass] then
		local army = proj:GetArmy()
		for _, vEffect in TerrainType.FXImpact[targetType][terrainClass] do
			CreateEmitterAtEntity( proj, army, vEffect )
		end
	end
end

-- CreateWeaponMuzzleFlashEffect( unit, muzzle, name )
--
-- Description:
--   Creates a set of muzzleflash effect emitters on a unit at a specified bone.
--
-- Params:
--   unit                    - unit entity.
--   muzzle                  - muzzle bone to play effects on.
--   name                    - muzzle flash effect template name, index into EffectTemplate definitions.
function CreateWeaponMuzzleFlashEffect( unit, muzzle, name )
	if EffectTemplates.Weapons[name] then
		CreateAttachedEmitters( unit, muzzle, unit:GetArmy(), EffectTemplates.Weapons[name] )
	end
end

function CreateEffectsWithRandomOffset( obj, army, EffectTable, xRange, yRange, zRange )
    local emitters = {}
    local x,y,z = util.GetRandomOffset(xRange, yRange, zRange, 1)
	table.resizeandclear(emitters, EffectTable)
	local index = 1
    for k, v in EffectTable do
		emitters[index] = CreateEmitterOnEntity( obj, army, v ):OffsetEmitter(x,y,z)
		index = index + 1
    end
    return emitters
end

function CreateBoneEffects( obj, bone, army, EffectTable )
    local emitters = {}
	table.resizeandclear(emitters, EffectTable)
	local index = 1
    for k, v in EffectTable do
		emitters[index] = CreateEmitterAtBone( obj, bone, army, v )
		index = index + 1
    end
    return emitters
end

function ScaleEmittersParam( Emitters, param, minRange, maxRange )
    for k, v in Emitters do
        v:SetEmitterParam( param, util.GetRandomFloat( minRange, maxRange ) )
    end
end

function CreateBuildSliceBeams( builder, unitBeingBuilt, BuildEffectBones, BuildEffectsBag )
    local army = builder:GetArmy()
    local BeamBuildEmtBp = '/effects/emitters/units/uef/general/uef_build_beam_01_emit.bp'
    local buildbp = unitBeingBuilt:GetBlueprint()
    local x, y, z = unpack(unitBeingBuilt:GetPosition())
    y = y + (buildbp.Physics.MeshExtentsOffsetY or 0)

    -- Create a projectile for the end of build effect and warp it to the unit
    local BeamEndEntity = unitBeingBuilt:CreateProjectile('/effects/entities/UEFBuild/UEFBuild01_proj.bp',0,0,0,nil,nil,nil)
    BuildEffectsBag:Add( BeamEndEntity )

    -- Create build beams
    if BuildEffectBones != nil then
        local beamEffect = nil
        for i, BuildBone in BuildEffectBones do
            BuildEffectsBag:Add( AttachBeamEntityToEntity( builder, BuildBone, BeamEndEntity, -1, army, BeamBuildEmtBp ) )
            BuildEffectsBag:Add( CreateAttachedEmitter( builder, BuildBone, army, '/effects/emitters/ambient/units/flashing_blue_glow_01_emit.bp' ) )
        end
    end

    -- Determine beam positioning on build cube, this should match sizes of CreateBuildCubeThread
    local mul = 1.15
    local ox = buildbp.Physics.MeshExtentsX or (buildbp.Footprint.SizeX * mul)
    local oz = buildbp.Physics.MeshExtentsZ or (buildbp.Footprint.SizeZ * mul)
    local oy = (buildbp.Physics.MeshExtentsY or (0.5 + (ox + oz) * 0.1))

    ox = ox * 0.5
    oz = oz * 0.5

    -- Determine the the 2 closest edges of the build cube and use those for the location of our laser
    local VectorExtentsList = { Vector(x + ox, y + oy, z + oz), Vector(x + ox, y + oy, z - oz), Vector(x - ox, y + oy, z + oz), Vector(x - ox, y + oy, z - oz) }
    local endVec1 = util.GetClosestVector(builder:GetPosition(), VectorExtentsList )

    for k,v in VectorExtentsList do
        if(v == endVec1) then
            table.remove(VectorExtentsList, k)
        end
    end

    local endVec2 = util.GetClosestVector(builder:GetPosition(), VectorExtentsList )
    local cx1, cy1, cz1 = unpack(endVec1)
    local cx2, cy2, cz2 = unpack(endVec2)

    -- Determine a the velocity of our projectile, used for the scaning effect
    local velX = 2 * (endVec2.x - endVec1.x)
    local velY = 2 * (endVec2.y - endVec1.y)
    local velZ = 2 * (endVec2.z - endVec1.z)

    if unitBeingBuilt:GetFractionComplete() == 0 then
        Warp( BeamEndEntity, Vector( (cx1 + cx2) * 0.5, ((cy1 + cy2) * 0.5) - oy, (cz1 + cz2) * 0.5 ) )
        WaitSeconds( 0.8 )
    end

    local flipDirection = true

    -- Warp our projectile back to the initial corner and lower based on build completeness
    while not builder:BeenDestroyed() and not unitBeingBuilt:BeenDestroyed() do
        if flipDirection then
            Warp( BeamEndEntity, Vector( cx1, (cy1 - (oy * unitBeingBuilt:GetFractionComplete())), cz1 ) )
            BeamEndEntity:SetVelocity( velX, velY, velZ )
            flipDirection = false
        else
            Warp( BeamEndEntity, Vector( cx2, (cy2 - (oy * unitBeingBuilt:GetFractionComplete())), cz2 ) )
            BeamEndEntity:SetVelocity( -velX, -velY, -velZ )
            flipDirection = true
        end
        WaitSeconds( 0.6 )
    end
end

function CreateRepairBeams( builder, unitBeingBuilt, BuildEffectBones, BuildEffectsBag, EmtBp )
	-- This is used for the repair beam.
    local BeamBuildEmtBp = EmtBp or '/effects/emitters/units/general/event/repair/repair_01_beam_emit.bp'
    local ox, oy, oz = unpack(unitBeingBuilt:GetPosition())
    local BeamEndEntity = Entity()
    local army = builder:GetArmy()
	local targetbp = unitBeingBuilt:GetBlueprint()
	local scalar = targetbp.RepairSizeScalar or 1
    BuildEffectsBag:Add( BeamEndEntity )
    Warp( BeamEndEntity, Vector(ox, oy, oz))

    -- Effect at muzzle bone on builder
    if BuildEffectBones != nil then
        local beamEffect = nil
        for i, BuildBone in BuildEffectBones do
            local beamEffect = AttachBeamEntityToEntity(builder, BuildBone, BeamEndEntity, -1, army, BeamBuildEmtBp )
            BuildEffectsBag:Add( CreateAttachedEmitter( builder, BuildBone, army, '/effects/emitters/units/general/event/repair/repair_06_glow_muzzle_emit.bp' ) )
            BuildEffectsBag:Add( CreateAttachedEmitter( builder, BuildBone, army, '/effects/emitters/units/general/event/repair/repair_05_sparks_muzzle_emit.bp' ) )
            BuildEffectsBag:Add(beamEffect)
        end
    end

	-- Effect at the end on the beam, played on the target
    CreateEmitterOnEntity( BeamEndEntity, builder:GetArmy(),'/effects/emitters/units/general/event/repair/repair_02_glow_emit.bp')
    CreateEmitterOnEntity( BeamEndEntity, builder:GetArmy(),'/effects/emitters/units/general/event/repair/repair_03_sparks_blue_emit.bp')
    CreateEmitterOnEntity( BeamEndEntity, builder:GetArmy(),'/effects/emitters/units/general/event/repair/repair_04_sparks_yellow_emit.bp')
    CreateEmitterOnEntity( BeamEndEntity, builder:GetArmy(),'/effects/emitters/units/general/event/repair/repair_07_smoke_emit.bp')
    local waitTime = util.GetRandomFloat( 0.3, 1.3 )

    while not builder:BeenDestroyed() and not unitBeingBuilt:BeenDestroyed() do
        local x, y, z = builder.GetRandomOffset(unitBeingBuilt, scalar)
        Warp( BeamEndEntity, Vector(ox + x, oy + y, oz + z))
        WaitSeconds(waitTime)
    end
end

function CreateBuildAssistBeams( builder, unitBeingBuilt, BuildEffectBones, BuildEffectsBag )
    local ox, oy, oz = unpack(unitBeingBuilt:GetPosition())
    local BeamEndEntity = Entity()
    local army = builder:GetArmy()
    BuildEffectsBag:Add( BeamEndEntity )
    Warp( BeamEndEntity, Vector(ox, oy, oz))

	for kBone, vBone in BuildEffectBones do
		BuildEffectsBag:Add( CreateAttachedEmitter( builder, vBone, army, '/effects/emitters/ambient/units/flashing_blue_glow_01_emit.bp' ) )
		BuildEffectsBag:Add( AttachBeamEntityToEntity( builder, vBone, BeamEndEntity, -2, army, '/effects/emitters/units/uef/general/uef_build_beam_01_emit.bp' ) )
	end
end

function CreateBlueWavyBuildBeams( builder, scaffoldUnit, BuildEffectBones, BuildEffectsBag )
	local buildBone = scaffoldUnit:GetClosestBuildPoint( builder )
	local army = builder:GetArmy()

	for kBone, vBone in BuildEffectBones do
		BuildEffectsBag:Add( CreateAttachedEmitter( builder, vBone, army, '/effects/emitters/units/illuminate/general/illuminate_build_01_emit.bp' ) )

		for k, v in EffectTemplates.IlluminateBuildBeams01 do
			BuildEffectsBag:Add( AttachBeamEntityToEntity( builder, vBone, scaffoldUnit, buildBone, army, v ) )
		end
		for k, v in EffectTemplates.IlluminateBuildBeams02 do
			BuildEffectsBag:Add( CreateAttachedEmitter( scaffoldUnit, buildBone, army, v ) )
		end
	end
end

function CreateBlueSolidBuildBeams( builder, scaffoldUnit, BuildEffectBones, BuildEffectsBag )
    local army = builder:GetArmy()
	local buildBone = scaffoldUnit:GetClosestBuildPoint( builder )

	for k, v in BuildEffectBones do
		BuildEffectsBag:Add( CreateAttachedEmitter( builder, v, army, '/effects/emitters/ambient/units/flashing_blue_glow_01_emit.bp' ) )
		BuildEffectsBag:Add( AttachBeamEntityToEntity( builder, v, scaffoldUnit, buildBone, army, '/effects/emitters/units/uef/general/uef_build_beam_01_emit.bp' ) )
	end
end

function CreateCybranBuildBeams( builder, unitBeingBuilt, BuildEffectBones, BuildEffectsBag )
    WaitSeconds(0.2)
    local army = builder:GetArmy()
    local BeamBuildEmtBp = '/effects/emitters/units/cybran/general/event/build/c_general_e_b_beam_01_emit.bp'
    local BeamEndEntities = {}
    local ox, oy, oz = unpack(unitBeingBuilt:GetPosition())

    if BuildEffectBones then
		table.resizeandclear(BeamEndEntities, BuildEffectBones)
		local index = 1
        for i, BuildBone in BuildEffectBones do
            local beamEnd = Entity()
            builder.Trash:Add(beamEnd)
			BeamEndEntities[index] = beamEnd
            BuildEffectsBag:Add( beamEnd )
            Warp( beamEnd, Vector(ox, oy, oz))

            -- Using generic glow and spark as temp effect.  Deleted old cybran build effects.  AL 04/29/09
            CreateEmitterOnEntity( beamEnd, army, '/effects/emitters/units/cybran/general/event/build/c_general_e_b_glow_02_emit.bp' )
            CreateEmitterOnEntity( beamEnd, army, '/effects/emitters/units/cybran/general/event/build/c_general_e_b_sparks_03_emit.bp' )

            BuildEffectsBag:Add(AttachBeamEntityToEntity(builder, BuildBone, beamEnd, -1, army, BeamBuildEmtBp))
			index = index + 1
        end
    end

    while not builder:BeenDestroyed() and not unitBeingBuilt:BeenDestroyed() do
        for k, v in BeamEndEntities do
            local x, y, z = builder.GetRandomOffset(unitBeingBuilt, 1 )
            if v and not v:BeenDestroyed() then
                Warp( v, Vector(ox + x, oy + y, oz + z))
            end
        end
        WaitSeconds(Random()*1.5 + 0.2)
    end
end

function PlayReclaimEffects( reclaimer, reclaimed, BuildEffectBones, EffectsBag )

	--create reclaim effect at target with a vector towards the reclaimer.
    local unitpos = table.copy(reclaimer:GetPosition())
    unitpos[2] = unitpos[2]+3
    local dir = VDiff(unitpos,reclaimed:GetPosition())
    local dist = VLength( dir )
    dir = VNormal(dir)

    local unitbp = reclaimed:GetBlueprint()
    local unitheight = unitbp.SizeY
    local unitwidth = (unitbp.SizeX + unitbp.SizeZ) / 2
    local unitVol = (unitbp.SizeX + unitbp.SizeZ + unitheight) / 3
    local army = reclaimer:GetArmy()

    --LOG (repr(dist))
    --LOG (repr(unitheight))
    --LOG (repr(unitwidth))

	-- Create blank emitter tables, depending on the positions of the reclaimer and reclaimed
	-- we will do different effects.
	local fxReclaimMuzzle = {}
	local fxReclaimBeams = {}
	local fxReclaimObjectAOE = {}
	local fxReclaimDustDebris = {}
	local fxReclaimPlasma = {}

	local army = reclaimer:GetArmy()
    local pos = table.copy(reclaimed:GetPosition())
	local waterHeight = GetWaterHeight()
	local targetAboveWater = true
	local reclaimerUnderWater = false
	local layerType = 'Surface'

    local beamEnd = Entity()
	EffectsBag:Add( beamEnd )

	-- If the reclaimed is below water height then it is underwater.
	if pos[2] > waterHeight then

		-- Reclaiming unit and object being reclaimed are both above water.
	    pos[2] = GetSurfaceHeight(pos[1], pos[3])
		Warp( beamEnd, pos )
	else
		-- Object being reclaimed is below water.
		targetAboveWater = false

		-- Find out if the reclaimer muzzles are below or above water.
		for kBone, vBone in BuildEffectBones do
			local muzzlePos = table.copy(reclaimer:GetPosition(vBone))
			if muzzlePos[2] < waterHeight then
				reclaimerUnderWater = true
			end
		end

		-- If the reclaimer is reclaiming something underwater then we just
		-- need to show underwater reclaiming effects.
		if reclaimerUnderWater then
			Warp( beamEnd, pos )
			layerType = 'UnderWater'
		else
		-- Otherwise, our reclaimer is above water and we need to show a two stage visual.
			pos[2] = waterHeight
			Warp( beamEnd, pos )
		end
	end

	for kBone, vBone in BuildEffectBones do
		-- Effect at muzzle bone on reclaimer
		for kEmit, vEmit in EffectTemplates.ReclaimMuzzle01[layerType] do
			EffectsBag:Add( CreateAttachedEmitter( reclaimer, vBone, army, vEmit ) )
		end
		-- Reclaim beams
		for kEmit, vEmit in EffectTemplates.ReclaimBeams[layerType] do
			EffectsBag:Add( AttachBeamEntityToEntity( reclaimer, vBone, beamEnd, -1, army, vEmit ) )
		end
	end

	-- End of reclaim effect
	for k, v in EffectTemplates.ReclaimObjectAOE[layerType] do
		EffectsBag:Add( CreateEmitterOnEntity( reclaimed, army, v ):ScaleEmitter(unitwidth) )
	end

	-- Create an addition beam to the target below water.
	if not reclaimerUnderWater and not targetAboveWater then
		for kEmit, vEmit in EffectTemplates.ReclaimWaterSteam do
			EffectsBag:Add( CreateAttachedEmitter( beamEnd, -2, army, vEmit ) )
		end

		-- Create another beam end entity
		local beamEnd2 = Entity()
		EffectsBag:Add( beamEnd2 )
		Warp( beamEnd2, reclaimed:GetPosition() )

		-- Reclaim beams
		for kEmit, vEmit in EffectTemplates.ReclaimBeams.UnderWater do
			EffectsBag:Add( AttachBeamEntityToEntity( beamEnd, -1, beamEnd2, -1, army, vEmit ) )
		end

		layerType = 'UnderWater'
	end

	-- Dust and Debris
	for k, v in EffectTemplates.ReclaimEffects01[layerType] do
		emit = CreateAttachedEmitter( reclaimed, -2, army, v )
		emit:SetEmitterCurveParam('EMITRATE_CURVE', unitVol*3.5, 0.0)
		emit:SetEmitterCurveParam('LIFETIME_CURVE', dist, dist*0.8)
		emit:SetEmitterCurveParam('XDIR_CURVE', dir[1], 0.3)
		emit:SetEmitterCurveParam('YDIR_CURVE', dir[2], 0.0)
		emit:SetEmitterCurveParam('ZDIR_CURVE', dir[3], 0.3)
		emit:SetEmitterCurveParam('X_POSITION_CURVE', 0.0, unitwidth)
		emit:SetEmitterCurveParam('Y_POSITION_CURVE', unitheight*0.4, unitheight)
		emit:SetEmitterCurveParam('Z_POSITION_CURVE', 0.0, unitwidth)
		EffectsBag:Add(emit)
	end

	-- Plasma energy
	for k, v in EffectTemplates.ReclaimEffects02[layerType] do
		emit = CreateAttachedEmitter( reclaimed, -2, army, v )
		emit:SetEmitterCurveParam('EMITRATE_CURVE', unitVol*0.5, 0.0)
		emit:SetEmitterCurveParam('LIFETIME_CURVE', dist, dist*1.2)
		emit:SetEmitterCurveParam('XDIR_CURVE', dir[1], 0.3)
		emit:SetEmitterCurveParam('YDIR_CURVE', dir[2], 0.0)
		emit:SetEmitterCurveParam('ZDIR_CURVE', dir[3], 0.3)
		emit:SetEmitterCurveParam('X_POSITION_CURVE', 0.0, unitwidth)
		emit:SetEmitterCurveParam('Y_POSITION_CURVE', unitheight*0.4, unitheight)
		emit:SetEmitterCurveParam('Z_POSITION_CURVE', 0.0, unitwidth)
		EffectsBag:Add(emit)
	end
end


function PlayReclaimEndEffects( reclaimer, reclaimed )
    local army = -1
    if reclaimer then
        army = reclaimer:GetArmy()
    end

	local pos = reclaimed:GetPosition()
	local layerType = 'Surface'
	if pos[2] < GetWaterHeight() then
		layerType = 'UnderWater'
	end

	for k, v in EffectTemplates.ReclaimObjectEnd[layerType] do
	    CreateEmitterAtEntity( reclaimed, army, v )
	end
end

function PlayCaptureEffects( capturer, captive, BuildEffectBones, EffectsBag )

	--create capture effect based on captive unit size.
	local army = capturer:GetArmy()
    local unitpos = table.copy(capturer:GetPosition())
    unitpos[2] = unitpos[2]+3

    local dir = VDiff(unitpos,captive:GetPosition())
    local dist = VLength( dir )
    dir = VNormal(dir)
    local unitbp = captive:GetBlueprint()
    local unitheight = unitbp.SizeY
    local unitwidth = (unitbp.SizeX + unitbp.SizeZ) / 2
    local unitVol = (unitbp.SizeX + unitbp.SizeZ + unitheight) / 3

	local fx1 = EffectTemplates.CaptureEndEffect

	-- Glow and Dust
    for k, v in fx1 do
        emit = CreateAttachedEmitter( captive, -2, army, v )
        emit:SetEmitterCurveParam('EMITRATE_CURVE', unitVol*2.0, 0.0)
        emit:SetEmitterCurveParam('LIFETIME_CURVE', dist, dist*0.8)
        emit:SetEmitterCurveParam('X_POSITION_CURVE', 0.0, unitwidth)
        emit:SetEmitterCurveParam('Y_POSITION_CURVE', unitheight*0.4, unitheight)
        emit:SetEmitterCurveParam('Z_POSITION_CURVE', 0.0, unitwidth)
        EffectsBag:Add(emit)
    end

    for kBone, vBone in BuildEffectBones do
		-- Create an emitter on each muzzle
		for kEmit, vEmit in EffectTemplates.CaptureMuzzleEffect do
			EffectsBag:Add(CreateAttachedEmitter( capturer, vBone, army, vEmit ))
		end

		-- Create beams from each muzzle
		for kEmit, vEmit in EffectTemplates.CaptureBeams do
			EffectsBag:Add(AttachBeamEntityToEntity(capturer, vBone, captive, -1, army, vEmit ))
		end
	end

end

function CleanupEffectBag( self, EffectBag )
    for k, v in self[EffectBag] do
        v:Destroy()
    end
    self[EffectBag] = {}
end

function GetUnitSizes( unit )
    local bp = unit:GetBlueprint()
    return bp.SizeX or 0, bp.SizeY or 0, bp.SizeZ or 0
end

function GetAverageBoundingXYZRadius( unit )
    local bp = unit:GetBlueprint()
    return ((bp.SizeX or 0 + bp.SizeY or 0 + bp.SizeZ or 0) * 0.333)
end

-----------------------------------------------------------------
-- UNIT WRECKAGE EFFECTS
-----------------------------------------------------------------
function CreateWreckageEffects( obj, prop )
    if IsUnit(obj) then
        local army = obj:GetArmy()
        local scale = GetAverageBoundingXYZRadius( obj )
        local emitters = {}
        local layer = obj:GetCurrentLayer()
		local x,y,z = GetUnitSizes(obj)
		local EffectType = 'Small'

		-- Default to small units
        if scale > 0.7 then
			if scale > 2.0 then -- Large units
				scaleLifeTime = false
				EffectType = 'Large'
			else -- Medium units
				EffectType = 'Medium'
			end
		end

		if layer == 'Water' or layer == 'Seabed' then
			--add water wreckage effects here
		else
			-- Random Fire
			if Random(1,2) == 1 then
				local selection = Random(1, table.getn( EffectTemplates.Wreckage[EffectType].Fire ) )
				emitters = CreateEffectsWithRandomOffset( prop, army, EffectTemplates.Wreckage[EffectType].Fire[selection], x, 0, z )
				ScaleEmittersParam( emitters, 'LIFETIME', 500, 1000 )
			end

			-- Random Smoke
			if Random(1,2) == 1 then
				selection = Random(1,table.getn(EffectTemplates.Wreckage[EffectType].Smoke) )
				emitters = CreateEffectsWithRandomOffset( prop, army, EffectTemplates.Wreckage[EffectType].Smoke[selection], x, 0, z )
				for k, v in emitters do
					v:ScaleEmitter(Random()*0.4 + 0.8)
				end

				ScaleEmittersParam( emitters, 'LIFETIME', 500, 1000 )
			end

			-- Random Plume
			if Random(1,4) == 1 then
				selection = Random(1,table.getn(EffectTemplates.Wreckage[EffectType].Plume) )
				emitters = CreateEffectsWithRandomOffset( prop, army, EffectTemplates.Wreckage[EffectType].Plume[selection], x, 0, z )
				for k, v in emitters do
					v:ScaleEmitter(Random()*0.4 + 0.8)
				end
				ScaleEmittersParam( emitters, 'LIFETIME', 500, 1000 )
			end
		end
    end
end