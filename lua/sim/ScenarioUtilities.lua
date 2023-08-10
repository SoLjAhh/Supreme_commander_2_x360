-----------------------------------------------------------------------------
--  File     :  /data/lua/sim/ScenarioUtilities.lua
--  Author(s):  Ivan Rumsey
--  Summary  :  Utility functions for use with scenario save file.
--				Created from examples provided by Jeff Petkau.
--  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------

local Entity = import('/lua/sim/Entity.lua').Entity
local Spawner = import('/lua/sim/Spawner.lua').Spawner
local LevelLight = import('/lua/sim/LevelLight.lua').LevelLight


---------------------------------------------------------------------
-- GetMarkers:
--	returns all markers for the current scenario
function GetMarkers()
    return Scenario.MasterChain._MASTERCHAIN_.Markers
end

---------------------------------------------------------------------
-- GetMarker:
--	returns the saved data for the specified marker
function GetMarker(name)
    return Scenario.MasterChain._MASTERCHAIN_.Markers[name]
end

---------------------------------------------------------------------
-- GetMarkersByType:
--	returns all markers for the current scenario that match the specified type
function GetMarkersByType(type)
    local markers = {}

    for k,v in Scenario.MasterChain._MASTERCHAIN_.Markers do
        local stop = true
        if v.type == type then
            table.insert( markers, v )
        end
    end

    return markers
end

---------------------------------------------------------------------
-- ChainToPositions:
--	converts a marker chain as specified in the saved data to a table of positions
function ChainToPositions(chainName)
    local chain = Scenario.Chains[chainName]
    if not chain then
        error('ERROR: Invalid Chain Named- ' .. chainName, 2)
    end
    local positionTable = {}
    for num, marker in chain.Markers do
        table.insert(positionTable, Scenario.MasterChain._MASTERCHAIN_.Markers[marker]['position'])
    end
    return positionTable
end

---------------------------------------------------------------------
-- FindParentChain:
--	given a specific marker, return a chain it is saved in or nil
function FindParentChain(markerName)
    for cName,chain in Scenario.Chains do
        for mNum,marker in chain.Markers do
            if marker == markerName then
                return chain
            end
        end
    end
    return nil
end

---------------------------------------------------------------------
-- GetMarkerChain:
--	return the saved data for the specified chain name
function GetMarkerChain(name)
    local chain = Scenario.Chains[name]
    if not chain then
        error('ERROR: Invalid Chain Named- ' .. name, 2)
    end
    return chain
end

---------------------------------------------------------------------
-- MarkerToPosition:
--	Converts a marker as specified in *_save.lua file to a position.
function MarkerToPosition(strMarker)
    local marker = GetMarker(strMarker)
        if not marker then
            error('ERROR: Invalid marker name- '..strMarker)
        end
    return marker.position
end

---------------------------------------------------------------------
-- MarkerToOrientation:
--	Converts a marker as specified in *_save.lua file to a orientation.
function MarkerToOrientation(strMarker)
    local marker = GetMarker(strMarker)
        if not marker then
            error('ERROR: Invalid marker name- '..strMarker)
        end
    return marker.orientation
end

---------------------------------------------------------------------
-- AreaToRect:
--	Converts an area as specified in *_save.lua file to a rectangle.
function AreaToRect(strArea)
    local area = Scenario.Areas[strArea]
    if not area then
        error('ERROR: Invalid area name')
    end
    local rectangle = area.rectangle
    return Rect(rectangle[1],rectangle[2],rectangle[3],rectangle[4])
end

---------------------------------------------------------------------
-- InRect:
--	test if the specified pos is within the given rect.
function InRect( vectorPos, rect )
    return vectorPos[1] > rect.x0 and vectorPos[1] < rect.x1 and
           vectorPos[3] > rect.y0 and vectorPos[3] < rect.y1
end

---------------------------------------------------------------------
-- AssembleUnitGroup:
--	Returns all units (leaf nodes) under the specified group.
function AssembleUnitGroup(tblNode,tblResult)
    tblResult = tblResult or {}

    if nil == tblNode then
        return tblResult
    end

    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            tblResult = AssembleUnitGroup(tblData,tblResult)
        else
            tblResult[strName] = tblData
        end
    end

    return tblResult
end

---------------------------------------------------------------------
-- AssemblePlatoons:
--	Returns all platoon template names specified under group.
function AssemblePlatoons(tblNode,tblResult)
    tblResult = tblResult or {}

    if nil == tblNode then
        return tblResult
    end

    if nil != tblNode.platoon and '' != tblNode.platoon then
        table.insert(tblResult,tblNode.platoon)
    end

    if 'GROUP' == tblNode.type then
        for strName, tblData in pairs(tblNode.Units) do
            tblResult = AssemblePlatoons(tblData,tblResult)
        end
    end

    return tblResult
end

---------------------------------------------------------------------
-- FindUnit:
--	Finds the saved data for the specified unit by name.
function FindUnit(strUnit,tblNode)
    if nil == tblNode then
        return nil
    end

    local tblResult = nil

    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            tblResult = FindUnit(strUnit,tblData)
        elseif strName == strUnit then
            tblResult = tblData
        end

        if nil != tblResult then
            break
        end
    end

    return tblResult
end

---------------------------------------------------------------------
-- CreateArmyUnit:
--	Creates a named unit in an army.
--	One of the primary methods for instantiating units.
function CreateArmyUnit(strArmy,strUnit)
    local tblUnit = FindUnit(strUnit,Scenario.Armies[strArmy].Units)

    local brain = GetArmyBrain(strArmy)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
    end
    if nil != tblUnit then
        local unit = CreateUnitHPR(
            tblUnit.type,
            strArmy,
            tblUnit.Position[1], tblUnit.Position[2], tblUnit.Position[3],
            tblUnit.Orientation[1], tblUnit.Orientation[2], tblUnit.Orientation[3]
        )
        if unit:GetBlueprint().Physics.OccupyGround then
            unit:CreateTarmac(true, true, false, false)
        end
        local platoon
        local brain = GetArmyBrain(strArmy)
        if tblUnit.platoon ~= nil and tblUnit.platoon ~= '' then
            local i = 3
            while i <= table.getn(Scenario.Platoons[tblUnit.platoon]) do
                if tblUnit.Type == currTemplate[i][1] then
                    platoon = brain:MakePlatoon('None', 'None')
                    brain:AssignUnitsToPlatoon(platoon, {unit}, currTemplate[i][4], currTemplate[i][5])
                    break
                end
                i = i + 1
            end
        end
        local armyIndex = brain:GetArmyIndex()
        if ScenarioInfo.UnitNames[armyIndex] then
            ScenarioInfo.UnitNames[armyIndex][strUnit] = unit
        end
        unit.UnitName = strUnit
        if not brain.IgnoreArmyCaps then
            SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
        end
        return unit, platoon, tblUnit.platoon
    end
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
    end
    return nil
end

---------------------------------------------------------------------
-- FindUnitGroup:
--	Finds the saved data for the specified group by name.
function FindUnitGroup(strGroup,tblNode)
    if nil == tblNode then
        return nil
    end

    local tblResult = nil
    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            if strName == strGroup then
                tblResult = tblData
            else
                tblResult = FindUnitGroup(strGroup,tblData)
            end
        end

        if nil != tblResult then
            break
        end
    end

    return tblResult
end

---------------------------------------------------------------------
-- AssembleArmyGroup:
--	Returns a table of units in the group owned by the specified army.
function AssembleArmyGroup(strArmy,strGroup)
    return AssembleUnitGroup(FindUnitGroup(strGroup,Scenario.Armies[strArmy].Units))
end

---------------------------------------------------------------------
-- CreateArmySubGroup:
--	Creates Army groups from a number of groups specified in order from the Units Hierarchy.
function CreateArmySubGroup(strArmy,strGroup,...)
    local tblNode = Scenario.Armies[strArmy].Units
    local tblResult = {}
    local treeResult = {}
    local platoonList = {}
    local brain = GetArmyBrain(strArmy)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
    end
    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            if strName == strGroup then
                if arg['n'] >= 1 then
                    platoonList, tblResult, treeResult = CreateSubGroup(tblNode.Units[strName], strArmy, unpack(arg))
                else
                    platoonList, tblResult, treeResult = CreatePlatoons( strArmy, tblNode.Units[strName] )
                end
            end
        end
    end
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
    end
    if tblResult == nil then
        error('SCENARIO UTILITIES WARNING: No units found for for Army- ' .. strArmy .. ' Group- ' .. strGroup, 2)
    end
    return tblResult, treeResult, platoonList
end

---------------------------------------------------------------------
-- CreateSubGroup:
--	Used by CreateArmySubGroup.
function CreateSubGroup(tblNode, strArmy, strGroup, ...)
    local tblResult = {}
    local treeResult = {}
    local platoonList = {}
    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            if strName == strGroup then
                if arg['n'] >= 1 then
                    platoonList, tblResult, treeResult = CreateSubGroup(tblNode.Units[strName], strArmy, unpack(arg))
                else
                    platoonList, tblResult, treeResult = CreatePlatoons( strArmy, tblNode.Units[strName] )
                end
            end
        end
    end
    return platoonList, tblResult, treeResult
end

---------------------------------------------------------------------
-- CreateInitialArmyGroup:
--	Create units for the given army, as found in a named group folder 'INITIAL'.
function CreateInitialArmyGroup(strArmy, bCreateDefaultUnits)
    local tblGroup = CreateArmyGroup( strArmy, 'INITIAL')
    local cdrUnit = false
	local aiBrain = GetArmyBrain(strArmy)
	local factionIndex = aiBrain:GetFactionIndex()
	local factionsTable = import('/lua/common/factions.lua').Factions[factionIndex]
    if bCreateDefaultUnits then
        local initialUnitName = factionsTable.InitialUnit
        cdrUnit = CreateInitialArmyUnit(strArmy, initialUnitName)

		local additionalInitialUnits = factionsTable.AdditionalInitialUnits
		if additionalInitialUnits then
			-- define tblGroup as an empty table if it was not already valid from spawning the editor defined group 'INITIAL'
			if not tblGroup then
				tblGroup = {}
			end

			local posX, posY = aiBrain:GetArmyStartPos()
			for _,unitName in additionalInitialUnits do
				local unit = aiBrain:CreateUnitNearSpot(unitName, posX, posY)
				table.insert(tblGroup, unit)
			end
		end
    end

    return tblGroup, cdrUnit
end

---------------------------------------------------------------------
-- CreateLights:
function CreateLights()
	ScenarioInfo.Lights = ScenarioInfo.Lights or {}
	local markers = GetMarkersByType('Light Marker')
	for k,v in markers do
		ScenarioInfo.Lights[v.lightName] = LevelLight( v )
	end
end

---------------------------------------------------------------------
-- CreateObjectiveArrows:
function CreateObjectiveArrows( callbackFn )
	ScenarioInfo.ObjectiveArrows = ScenarioInfo.ObjectiveArrows or {}
	local markers = GetMarkersByType('Objective Arrow')
	for k,v in markers do
		ScenarioInfo.ObjectiveArrows[v.objectiveArrowName] = import('/lua/sim/ObjectiveDirectionArrow.lua').ObjectiveDirectionArrow(v)
	end
end

---------------------------------------------------------------------
-- CreateSpawners:
function CreateSpawners( callbackFn )
	ScenarioInfo.Spawners = ScenarioInfo.Spawners or {}
	local markers = GetMarkersByType('Spawner')
	for k,v in markers do
		if v.spawnUnit == '' or v.spawnArmyName == '' then
			continue
		end
		ScenarioInfo.Spawners[v.spawnerName] = Spawner( v, callbackFn )
	end
end

---------------------------------------------------------------------
-- CreateProps:
function CreateProps()
    for i, tblData in pairs(Scenario['Props']) do
        CreatePropHPR(
            tblData.prop,
            tblData.Position[1], tblData.Position[2], tblData.Position[3],
            tblData.Orientation[1], tblData.Orientation[2], tblData.Orientation[3]
        )
    end
end

---------------------------------------------------------------------
-- CreateResources:
function CreateResources()
    local markers = GetMarkers()
    for i, tblData in pairs(markers) do
        if tblData.resource then
			local position = tblData.position
            local diffuse, sx, sz, lod

			-- Fixing up even sized markers, so they are centered properly in ogrids with no odd border cases
			-- This should be fixed up in the editor as well, so will become redundant.
			if math.mod(tblData.size,2) == 0 then
				position[1] = math.floor(position[1])
				position[3] = math.floor(position[3])
				position[2] = GetTerrainHeight(position[1],position[3])
			end

            CreateResourceDeposit(
                tblData.type,
                position[1], position[2], position[3],
				--tblData.size, -- TEST
                2
            )

            -- fixme: texture names should come from editor
            local albedo, sx, sz, lod
            if tblData.type == "Mass" then
                diffuse = "/textures/splats/mass_marker.dds"
                sx = 2.3
                sz = 2.3
                lod = 200
                CreatePropHPR(
                    '/props/Markers/massDeposit01_prop.bp',
                    position[1], position[2], position[3],
                    0, 0, 0
                )
            else
                diffuse = "/textures/splats/hydrocarbon_marker.dds"
                sx = 2
                sz = 2
                lod = 200
                CreatePropHPR(
                    '/props/Markers/hydrocarbonDeposit01_prop.bp',
                    position[1], position[2], position[3],
                    Random(0,360), 0, 0
                )
            end
            -- Decal - (position, heading, textureName1, textureName2, type, sizeX, sizeZ, lodParam, duration, army)
            -- Splat - (position, heading, textureName1, textureName2, type, sizeX, sizeZ, lodParam, duration, army)
--            if not ScenarioInfo.MapData.Decals then
--                ScenarioInfo.MapData.Decals = {}
--            end
--            table.insert( ScenarioInfo.MapData.Decals, CreateDecal(
--                position, -- position
--                0, -- heading
--                diffuse, "", -- TEX1, TEX2
--                "Diffuse", -- TYPE
--                sx, sz, -- SIZE
--                lod, -- LOD
--                0, -- DURACTION
--                -1 -- ARMY
--            ) )
            CreateSplat(
                position,					-- Position
                0,                          -- Heading (rotation)
                diffuse,                    -- Texture name for albedo
                sx, sz,                     -- SizeX/Z
                lod,                        -- LOD
                0,                          -- Duration (0 == does not expire)
                -1 ,                        -- army (-1 == not owned by any single army)
                2							-- sort order ( Sort above tarmacs 0 and explosion decals 1 )
            )
        end
    end
end

---------------------------------------------------------------------
-- InitializeArmies:
function InitializeArmies()
    local tblGroups = {}
    local tblArmy = ListArmies()

    local civOpt = ScenarioInfo.Options.CivilianAlliance

    local bCreateInitial = ShouldCreateInitialArmyUnits()

    for iArmy, strArmy in pairs(tblArmy) do
        local tblData = Scenario.Armies[strArmy]

        tblGroups[ strArmy ] = {}

        if tblData then

            ----[ If an actual starting position is defined, overwrite the        ]--
            ----[ randomly generated one.                                         ]--

            --LOG('*DEBUG: InitializeArmies, army = ', strArmy)

			-- SC2 Army research economy is defaulting to a value of 0, tblData.Economy needs to be fixed and saved out by the editor.
            SetArmyEconomy( strArmy, tblData.Economy.mass, tblData.Economy.energy, 0 )

            --GetArmyBrain(strArmy):InitializePlatoonBuildManager()
            --LoadArmyPBMBuilders(strArmy)
            if GetArmyBrain(strArmy).SkirmishSystems then
                GetArmyBrain(strArmy):InitializeSkirmishSystems()
            end

            local armyIsCiv = ScenarioInfo.ArmySetup[strArmy].Civilian

            if (not armyIsCiv and bCreateInitial) or (armyIsCiv and civOpt != 'removed') then
                local commander = (not ScenarioInfo.ArmySetup[strArmy].Civilian)
                local cdrUnit
                tblGroups[strArmy], cdrUnit = CreateInitialArmyGroup( strArmy, commander)
                if commander and cdrUnit and ArmyBrains[iArmy].Nickname then
                    cdrUnit:SetCustomName( ArmyBrains[iArmy].Nickname )
                end
            end

            local wreckageGroup = FindUnitGroup('WRECKAGE', Scenario.Armies[strArmy].Units)
            if wreckageGroup then
                local platoonList, tblResult, treeResult = CreatePlatoons(strArmy, wreckageGroup )
                for num,unit in tblResult do
                    unit:CreateWreckageProp(0)
                    unit:Destroy()
                end
            end



            ----[ irumsey                                                         ]--
            ----[ Temporary defaults.  Make sure some fighting will break out.    ]--
            for iEnemy, strEnemy in pairs(tblArmy) do
                local enemyIsCiv = ScenarioInfo.ArmySetup[strEnemy].Civilian

                if iArmy != iEnemy and strArmy != 'NEUTRAL_CIVILIAN' and strEnemy != 'NEUTRAL_CIVILIAN' then
                    if (armyIsCiv or enemyIsCiv) and civOpt == 'neutral' then
                        SetAlliance( iArmy, iEnemy, 'Neutral')
                    else
                        SetAlliance( iArmy, iEnemy, 'Enemy')
                    end
                elseif strArmy == 'NEUTRAL_CIVILIAN' or strEnemy == 'NEUTRAL_CIVILIAN' then
                    SetAlliance( iArmy, iEnemy, 'Neutral')
                end
            end

            GetArmyBrain(strArmy):InitializeSkirmishManagers()

        end

    end

    return tblGroups
end

---------------------------------------------------------------------
-- InitializeAudio:
function InitializeAudio()
    local markers = Scenario.MasterChain._MASTERCHAIN_.Markers
    local reverbPreset = 'Generic'

    -- The reverb preset can be taken from the scenario info in the map preset.
    if ( ScenarioInfo.reverbPreset != nil ) then
		reverbPreset = ScenarioInfo.reverbPreset
	end

    for name, marker in markers do
        if(marker.type == 'LoopingSound') then
            local ent = Entity()
            ent:SetPosition(Vector(marker.position[1],marker.position[2],marker.position[3]),true)
            ent:SetAmbientSound(marker.event, nil)
        end
        if(marker.type == 'Reverb' ) then
            reverbPreset = marker.Preset
        end
    end

    if reverbPreset then
        SetAmbientReverb( reverbPreset )
    end
end

---------------------------------------------------------------------
-- InitializeScenarioArmies:
function InitializeScenarioArmies()
    local tblGroups = {}
    local tblArmy = ListArmies()
    local factions = import('/lua/common/factions.lua')

    local bCreateInitial = ShouldCreateInitialArmyUnits()

    ScenarioInfo.CampaignMode = true
    Sync.CampaignMode = true
    import('/lua/sim/simuistate.lua').IsCampaign(true)

    -- Add callback to track what units are finished being built; Add OnUnitBuilt is called when any unit is
    -- finished being built; parameters passed include builder and buildee
    local callback = function(builder, buildee)
        local aiBrain = builder:GetAIBrain()
        aiBrain:UnitConstructionComplete(builder, buildee)
    end

    local Unit = import('/lua/sim/Unit.lua').Unit
    table.insert( Unit.ClassCallbacks.OnStopBuild, callback )

    for iArmy, strArmy in pairs(tblArmy) do

        local tblData = Scenario.Armies[strArmy]

        tblGroups[ strArmy ] = {}

        if tblData then

            LOG('*DEBUG: InitializeScenarioArmies, army = ', strArmy)

			-- SC2 Army research economy is defaulting to a value of 0, tblData.Economy needs to be fixed and saved out by the editor.
            SetArmyEconomy( strArmy, tblData.Economy.mass, tblData.Economy.energy, 0 )

            if tblData.faction != nil then
				SetArmyFactionIndex( strArmy, tblData.faction )
            end

            if tblData.color != nil then
                SetArmyColorIndex( strArmy, tblData.color)
            end

            if tblData.personality != nil then
                SetArmyAIPersonality( strArmy, tblData.personality)
            end

            if bCreateInitial then
                tblGroups[strArmy] = CreateInitialArmyGroup( strArmy )
            end

            local wreckageGroup = FindUnitGroup('WRECKAGE', Scenario.Armies[strArmy].Units)
            if wreckageGroup then
                local platoonList, tblResult, treeResult = CreatePlatoons(strArmy, wreckageGroup )
                for num,unit in tblResult do
                    unit:CreateWreckageProp(0)
                    unit:Destroy()
                end
            end

            ----[ eemerson                                                         ]--
            ----[ Override alliances with custom alliance settings                 ]--
            if tblData.Alliances != nil then
                for iEnemy,iAlliance in pairs(tblData.Alliances) do
                    if iArmy != iEnemy and table.find(tblArmy, strArmy) and table.find(tblArmy, iEnemy) then
                        SetAllianceOneWay( strArmy, iEnemy, iAlliance )
                    end
                end
            end

            GetArmyBrain(strArmy):InitializeCampaignManagers()

            --GetArmyBrain(strArmy):InitializePlatoonBuildManager()
            --LoadArmyPBMBuilders(strArmy)

        end

    end

    return tblGroups
end

---------------------------------------------------------------------
-- AssignOrders:
function AssignOrders( strQueue, tblUnit, target)
    local tblOrder = Scenario.Orders[ strQueue ]
    for i, order in pairs(tblOrder) do
        order.cmd(tblUnit,target)
    end
end


---------------------------------------------------------------------
-- SpawnPlatoon:
--	Spawns unit group and assigns to platoon it is a part of.
function SpawnPlatoon( strArmy, strGroup )
    local tblNode = FindUnitGroup( strGroup, Scenario.Armies[strArmy].Units )
    if nil == tblNode then
        error('SCENARIO UTILITIES WARNING: No Group found for Army- ' .. strArmy .. ' Group- ' .. strGroup, 2)
        return false
    end

    local brain = GetArmyBrain(strArmy)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
    end
    local platoonName
    if nil ~= tblNode.platoon and '' != tblNode.platoon then
        platoonName = tblNode.platoon
    end

    local platoonList, tblResult, treeResult = CreatePlatoons(strArmy, tblNode)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
    end
    if tblResult == nil then
        error('SCENARIO UTILITIES WARNING: No units found for for Army- ' .. strArmy .. ' Group- ' .. strGroup, 2)
    end
    return platoonList[platoonName], platoonList, tblResult, treeResult
end

---------------------------------------------------------------------
-- SpawnTableOfPlatoons:
function SpawnTableOfPlatoons( strArmy, strGroup )
    local brain = GetArmyBrain(strArmy)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
    end
    local platoonList, tblResult, treeResult = CreatePlatoons(strArmy,
                                                              FindUnitGroup( strGroup, Scenario.Armies[strArmy].Units))
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
    end
    if tblResult == nil then
        error('SCENARIO UTILITIES WARNING: No units found for for Army- ' .. strArmy .. ' Group- ' .. strGroup, 2)
    end
    return platoonList, tblResult, treeResult
end

---------------------------------------------------------------------
-- CountChildUnits:
function CountChildUnits(tblNode)
    local count = 0

    for k,v in pairs(tblNode.Units) do
        if v.type == 'GROUP' then
            count = count + CountChildUnits(v)
        else
            count = count + 1
        end
    end

    tblNode.TotalUnits = count

    return count
end

---------------------------------------------------------------------
-- CreatePlatoons:
function CreatePlatoons( strArmy, tblNode, tblResult, platoonList, currPlatoon, treeResult, balance )
    tblResult = tblResult or {}
    platoonList = platoonList or {}
    treeResult = treeResult or {}
    currPlatoon = currPlatoon or false
    local treeLocal = {}

    if nil == tblNode then
        return nil
    end

    local brain = GetArmyBrain(strArmy)
    local armyIndex = brain:GetArmyIndex()
    local currTemplate
    local numRows
    local reversePlatoon = false
    local reverseRows
    local reverseTemplate
    if nil ~= tblNode.platoon and '' != tblNode.platoon and tblNode ~= currPlatoon
        and not platoonList[tblNode.platoon] then
        currTemplate = Scenario.Platoons[tblNode.platoon]
        if currTemplate then
            platoonList[tblNode.platoon] = brain:MakePlatoon('', currTemplate[2])
            platoonList[tblNode.platoon].squadCounter = {}
            currPlatoon = tblNode.platoon
        end
    end
    if currPlatoon then
        currTemplate = Scenario.Platoons[currPlatoon]
        numRows = table.getn(currTemplate)
    end

    local unit = nil

    --local timePerChild = nil

    --[[
    if timeLeft and not tblNode.TotalUnits then
        --Calculate the number of units
        local totalUnits = CountChildUnits(tblNode)
    end

    if timeLeft then
        timePerChild = (timeLeft/tblNode.TotalUnits)
    end
    ]]--

    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            --[[
            if timeLeft and tblData.TotalUnits > 0 then
                timePerChild = (timeLeft/tblNode.TotalUnits)*tblData.TotalUnits
            end
            --]]--

            platoonList, tblResult, treeResult[strName] = CreatePlatoons(strArmy, tblData, tblResult,
                                                                         platoonList, currPlatoon, treeResult[strName], balance)

        else
            unit = CreateUnitHPR( tblData.type,
                                 strArmy,
                                 tblData.Position[1], tblData.Position[2], tblData.Position[3],
                                 tblData.Orientation[1], tblData.Orientation[2], tblData.Orientation[3]
                             )
            if unit:GetBlueprint().Physics.OccupyGround then
                unit:CreateTarmac(true, true, false, false)
            end
            table.insert(tblResult, unit)
            treeResult[strName] = unit
            if ScenarioInfo.UnitNames[armyIndex] then
                ScenarioInfo.UnitNames[armyIndex][strName] = unit
            end
            unit.UnitName = strName
            if tblData.platoon ~= nil and tblData.platoon ~= '' and tblData.platoon ~= currPlatoon then
                reversePlatoon = currPlatoon
                reverseRows = numRows
                reverseTemplate = currTemplate
                if not platoonList[tblData.platoon] then
                    currTemplate = Scenario.Platoons[tblData.platoon]
                    platoonList[tblData.platoon] = brain:MakePlatoon('', currTemplate[2])
                    platoonList[tblData.platoon].squadCounter = {}
                end
                currPlatoon = tblData.platoon
                currTemplate = Scenario.Platoons[currPlatoon]
                numRows = table.getn(currTemplate)
            end
            if currPlatoon then
                local i = 3
                local inserted = false
                while i <= numRows and not inserted do
                    if platoonList[currPlatoon].squadCounter[i] == nil then
                        platoonList[currPlatoon].squadCounter[i] = 0
                    end
                    if tblData.type == currTemplate[i][1] and
                            platoonList[currPlatoon].squadCounter[i] < currTemplate[i][3] then
                        platoonList[currPlatoon].squadCounter[i] = platoonList[currPlatoon].squadCounter[i] + 1
                        brain:AssignUnitsToPlatoon(platoonList[currPlatoon],{unit},currTemplate[i][4],currTemplate[i][5] )
                        inserted = true
                    end
                    i = i + 1
                end
                if reversePlatoon then
                    currPlatoon = reversePlatoon
                    numRows = reverseRows
                    currTemplate = reverseTemplate
                    reversePlatoon = false
                end
            end

            if balance then
                --Accumulate for one tick so we don't get too much overhead from thread switching...
                --ScenarioInfo.LoadBalance.Accumulator = ScenarioInfo.LoadBalance.Accumulator + timePerChild
                ScenarioInfo.LoadBalance.Accumulator = ScenarioInfo.LoadBalance.Accumulator + 1

                if ScenarioInfo.LoadBalance.Accumulator > ScenarioInfo.LoadBalance.UnitThreshold then
                    WaitSeconds(0)
                    ScenarioInfo.LoadBalance.Accumulator = 0
                end
            end
        end
    end

    return platoonList, tblResult, treeResult
end

---------------------------------------------------------------------
-- CreateArmyGroup:
--	Creates the specified group in game.
function CreateArmyGroup(strArmy,strGroup,wreckage, balance)
    local brain = GetArmyBrain(strArmy)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
    end
    local platoonList, tblResult, treeResult = CreatePlatoons(strArmy,
                                                              FindUnitGroup( strGroup, Scenario.Armies[strArmy].Units ), nil, nil, nil, nil, balance )

    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
    end
    if tblResult == nil and strGroup ~= 'INITIAL' then
        error('SCENARIO UTILITIES WARNING: No units found for for Army- ' .. strArmy .. ' Group- ' .. strGroup, 2)
    end
    if wreckage then
        for num, unit in tblResult do
            unit:CreateWreckageProp()
            unit:Destroy()
        end
        return
    end
    return tblResult, treeResult, platoonList
end

---------------------------------------------------------------------
-- CreateArmyTree:
--	Returns tree of units created by the editor. 2nd return is table of units
function CreateArmyTree(strArmy, strGroup)
	local army = GetArmyBrain(strArmy)
    local brain = GetArmyBrain(army)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
    end
    local platoonList, tblResult, treeResult = CreatePlatoons(strArmy,
                                                              FindUnitGroup(strGroup, Scenario.Armies[strArmy].Units) )
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
    end
    if tblResult == nil then
        error('SCENARIO UTILITIES WARNING: No units found for for Army- ' .. strArmy .. ' Group- ' .. strGroup, 2)
    end
    return treeResult, tblResult, platoonList
end

---------------------------------------------------------------------
-- CreateArmyGroupAsPlatoonBalanced:
function CreateArmyGroupAsPlatoonBalanced(strArmy, strGroup, formation, OnFinishedCallback)
    ScenarioInfo.LoadBalance.Accumulator = 0
    local units = CreateArmyGroupAsPlatoon(strArmy, strGroup, formation, nil, nil, true)

    OnFinishedCallback(units)
end

---------------------------------------------------------------------
-- CreateArmyGroupAsPlatoon:
--	Returns a platoon that is created out of all units in a group and its sub groups.
function CreateArmyGroupAsPlatoon(strArmy, strGroup, formation, tblNode, platoon, balance)
    if ScenarioInfo.LoadBalance.Enabled then
        --note that tblNode in this case is actually the callback function
        table.insert(ScenarioInfo.LoadBalance.PlatoonGroups, {strArmy, strGroup, formation, tblNode})
        return
    end

    local tblNode = tblNode or FindUnitGroup(strGroup, Scenario.Armies[strArmy].Units)
    if not tblNode then
        error('*SCENARIO UTILS ERROR: No group named- ' .. strGroup .. ' found for army- ' .. strArmy, 2)
    end
    if not formation then
        error('*SCENARIO UTILS ERROR: No formation given to CreateArmyGroupAsPlatoon')
    end
    local brain = GetArmyBrain(strArmy)
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
    end
    local platoon = platoon or brain:MakePlatoon('','')
    local armyIndex = brain:GetArmyIndex()

    local unit = nil
    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            platoon = CreateArmyGroupAsPlatoon(strArmy, strGroup, formation, tblData, platoon)
            if not brain.IgnoreArmyCaps then
                SetIgnoreArmyUnitCap(brain:GetArmyIndex(), true)
            end
        else
            unit = CreateUnitHPR( tblData.type,
                                 strArmy,
                                 tblData.Position[1], tblData.Position[2], tblData.Position[3],
                                 tblData.Orientation[1], tblData.Orientation[2], tblData.Orientation[3]
                             )
            if unit:GetBlueprint().Physics.OccupyGround then
                unit:CreateTarmac(true, true, false, false)
            end
            if ScenarioInfo.UnitNames[armyIndex] then
                ScenarioInfo.UnitNames[armyIndex][strName] = unit
            end
            unit.UnitName = strName
            brain:AssignUnitsToPlatoon(platoon, {unit}, 'Attack', formation)

            if balance then
                ScenarioInfo.LoadBalance.Accumulator = ScenarioInfo.LoadBalance.Accumulator + 1

                if ScenarioInfo.LoadBalance.Accumulator > ScenarioInfo.LoadBalance.UnitThreshold/5 then
                    WaitSeconds(0)
                    ScenarioInfo.LoadBalance.Accumulator = 0
                end
            end
        end
    end
    if not brain.IgnoreArmyCaps then
        SetIgnoreArmyUnitCap(brain:GetArmyIndex(), false)
    end
    return platoon
end

---------------------------------------------------------------------
-- CreateArmyGroupAsPlatoonVeteran:
--	Creates an army group at a certain veteran level.
function CreateArmyGroupAsPlatoonVeteran(strArmy, strGroup, formation, veteranLevel)
    local plat = CreateArmyGroupAsPlatoon(strArmy, strGroup, formation)
    veteranLevel = veteranLevel or 5
    for k,v in plat:GetPlatoonUnits() do
        v:SetVeterancy(veteranLevel)
    end
    return plat
end

---------------------------------------------------------------------
-- FlattenTreeGroup:
function FlattenTreeGroup( strArmy, strGroup, tblData, unitGroup )
    tblData = tblData or FindUnitGroup( strGroup, Scenario.Armies[strArmy].Units )
    unitGroup = unitGroup or {}
    for strName, tblData in pairs(tblData.Units) do
        if 'GROUP' == tblData.type then
            FlattenTreeGroup( strArmy, strGroup, tblData, unitGroup )
        else
            table.insert( unitGroup, tblData )
        end
    end
    return unitGroup
end

---------------------------------------------------------------------
-- InitializeStartLocation:
function InitializeStartLocation(strArmy)
    local start = GetMarker(strArmy)
    if start then
        if not ScenarioInfo.StartPositions then
            ScenarioInfo.StartPositions = {}
        end
        table.insert( ScenarioInfo.StartPositions, start.position )
        SetArmyStart(strArmy, start.position[1], start.position[3])
    else
        GenerateArmyStart(strArmy)
    end
end

---------------------------------------------------------------------
-- SetPlans:
function SetPlans(strArmy)
    if Scenario.Armies[strArmy] then
        SetArmyPlans(strArmy, Scenario.Armies[strArmy].plans)
    end
end

---------------------------------------------------------------------
-- ApplyBonusesToArmies:
function ApplyBonusesToArmies( data, addBonuses )

	-- Loop over each set of army/bonus data
	for _,bonusData in data do

		-- Loop over bonuses to apply
		for k,bonus in bonusData.bonuses do

			-- Add/Remove bonus to each army
			for j,army in bonusData.armies do

				if addBonuses then
					army:AddArmyBonus( bonus )
				else
					army:RemoveArmyBonus( bonus )
				end
			end
		end
	end
end

---------------------------------------------------------------------
-- SetupArmyDifficultyBuffs:
function SetupArmyDifficultyBuffs(army, buffs)
	local brain = nil
	if type(army) == 'string' then
		brain = GetArmyBrain(army)
	else
		brain = ArmyBrains[army]
	end

    if brain and buffs then
        if type(buffs) == 'table' and table.getn(buffs) > 0 then
            local startingUnits = brain:GetListOfUnits(categories.ALLUNITS, false)
            for _,buffName in buffs do
                for _,unit in startingUnits do
                    ApplyBuff(unit, buffName)
                end
            end
            brain.CampaignBuffs = buffs
        elseif type(buffs) == 'string' then
            local startingUnits = brain:GetListOfUnits(categories.ALLUNITS, false)
            for _,unit in startingUnits do
                ApplyBuff(unit, buffs)
            end
            brain.CampaignBuffs = {buffs}
        end
    end
end

---------------------------------------------------------------------
-- SetArmyResearchCapped:
function SetArmyResearchCapped(strArmy)
    if Scenario.Armies[strArmy] then
        local brain = GetArmyBrain(strArmy)
        local cap = brain:GetEconomyStored('RESEARCH')
        brain.ResearchCapped = true
        brain:SetMaxStorage('RESEARCH', cap)
    end
end

---------------------------------------------------------------------
-- SendUIEvent:
function SendUIEvent( event )
	Sync.SendUIEvent = { event }
end

---------------------------------------------------------------------
-- ForceSelectAll:
function ForceSelectAll( playSound )
	Sync.ForceSelectAll = { playSound or false }
end

---------------------------------------------------------------------
-- HideCursor:
function HideCursor( hidden )
	Sync.HideCursor = { hidden }
end