--****************************************************************************
--**  File     :  /lua/AI/skirmishAISystem.lua
--**  Modder(s): SoLjA
--**  Summary  : AI Redux For Xbox 360
--**  Copyright © 2022 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************

local SAIReseach = import('/lua/AI/skirmish/system/SAIResearch.lua').SAIResearch
local ArchetypeEvaluator = import('/lua/ai/ArchetypeEvaluator.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local VizMarker = import('/lua/sim/VizMarker.lua').VizMarker

local Unit = import('/lua/sim/Unit.lua').Unit

SkirmishAISystem = Class() {
    __init = function(self, aiBrain)
        self.Brain = aiBrain

        self.Researcher = false

        local handicap = 0.0
        
        if not self.Brain.DifficultyLevel then
            self.Brain.DifficultyLevel = 3
        end

        if IsXbox() then
		    if self.Brain.DifficultyLevel == 5 then     -- CHEAT
                handicap = 1.0
            elseif self.Brain.DifficultyLevel == 4 then -- HARD
                handicap = 0.75
            elseif self.Brain.DifficultyLevel == 3 then -- NORMAL
                handicap = 0.50
            elseif self.Brain.DifficultyLevel == 2 then -- MEDIUM
                handicap = 0.25
            elseif self.Brain.DifficultyLevel == 1 then -- EASY  
                handicap = 0.0
			else
				handicap = 0.12                         -- SC1/FA
            end
        else
            if self.Brain.DifficultyLevel == 5 then     -- CHEAT
                handicap = 1.0                          
            elseif self.Brain.DifficultyLevel == 4 then -- HARD
                handicap = 0.75                         
            elseif self.Brain.DifficultyLevel == 3 then -- NORMAL
                handicap = 0.50                         
            elseif self.Brain.DifficultyLevel == 2 then -- MEDIUM
                handicap = 0.25                         
            elseif self.Brain.DifficultyLevel == 1 then -- EASY  
                handicap = 0.0
			else
				handicap = 0.12                         -- SC1/FA
            end
        end

        SetArmyHandicap(self.Brain:GetArmyIndex(), handicap)

        ForkThread( self.SkirmishDelaySetup, self )
    end,

    SkirmishDelaySetup = function(self)
    
        WaitTicks(1)
        
        self.Brain.CurrentPlan = ArchetypeEvaluator.ChooseArchetype(self.Brain)

        -- Replace self.Brain.CurrentPlan with one of the above archetypes to test a particular one
        WARN('*AI DEBUG: Using archetype - ' .. self.Brain.CurrentPlan .. ' at difficulty ' .. self.Brain.DifficultyLevel .. ' Intel Type: ' .. self.Brain.IntelType)
        self.Brain:CreateStrategicManager(self.Brain.CurrentPlan)

        --if ( self.Brain:GetArmyIndex() > 1 ) then
        --    self.Brain:SetUseAlternateBehaviors(true)
        --end

        local function constructionCallback(self, unit, finishedUnit)
            self:ConstructionFinished(unit,finishedUnit)
        end
        Unit.ClassCallbacks.OnStopBuild:Add( constructionCallback, self )

        self.Brain:StartSkirmishConditions()

        self.Brain:StrategicManagerSetDifficultyLevel(self.Brain.DifficultyLevel)		

        self:BuildResearchData()

        WaitSeconds(2)

        self.Researcher = SAIReseach(self.Brain)

        local baseLocation = false
        local addUnits = {}

        local units = self.Brain:GetListOfUnits( categories.ALLUNITS, false )
        for k,v in units do
            if EntityCategoryContains( categories.ENGINEER, v ) then
                table.insert( addUnits, v )

                if not baseLocation then
                    local baseMarker = GetClosestMarker( 'BaseMarker', v:GetPosition() )
                    if ( baseMarker[1] != 0 and baseMarker[3] != 0 and VDist3XZ(baseMarker, v:GetPosition()) < 40 ) then
                        baseLocation = baseMarker
                    else
                        baseLocation = v:GetPosition()
                    end
                end
            end
        end

        local BaseName = 'INITIAL' -- Unique name of the base; you can look up a base by this name
        local BaseMarker = 'MainBaseMarker' -- Name of the marker to use for this base; this serves as the location

        baseLocation = baseLocation or {0, 0, 0}
        local ArmyBase = self.Brain:AddSkirmishBase(BaseName, baseLocation, 150)

        -- Add Omni cheat
        if self.Brain.IntelType == 'Radar' or self.Brain.IntelType == 'LOS' then
            local spec = {
                X = baseLocation[1],
                Z = baseLocation[3],
                Radius = 10000,
                LifeTime = -1,
                Vision = self.Brain.IntelType == 'LOS',
                Radar = self.Brain.IntelType == 'Radar',
                Army = self.Brain:GetArmyIndex(),
            }
            local vizmarker = VizMarker(spec)
        end

        for k,v in addUnits do
            ArmyBase:AddUnit(v)
            self.Brain:StrategicManagerUnitComplete(v) -- tell the strategic manager these units exist
        end

--[[
        ESKIRMISHRES_Defense,
        ESKIRMISHRES_LandUnits,
        ESKIRMISHRES_AirUnits,
        ESKIRMISHRES_NavalUnits,
        ESKIRMISHRES_Expansion,
        ESKIRMISHRES_Experimentals,
        ESKIRMISHRES_Misc,
        ESKIRMISHRES_Slush,
]]--

        -- Base resourcemanager
        ArmyBase:AddResourceManagerType('Defense', 'MASS', 0.05, 200)
        ArmyBase:AddResourceManagerType('Defense', 'ENERGY', 0.0, -1.0)

        ArmyBase:AddResourceManagerType('Artillery', 'MASS', 0.0, -1.0)
        ArmyBase:AddResourceManagerType('Artillery', 'ENERGY', 0.0, -1.0)

        ArmyBase:AddResourceManagerType('LandUnits', 'MASS', 0.0, -1.0)
        ArmyBase:AddResourceManagerType('LandUnits', 'ENERGY', 0.0, -1.0)

        ArmyBase:AddResourceManagerType('AirUnits', 'MASS', 0.0, -1.0)
        ArmyBase:AddResourceManagerType('AirUnits', 'ENERGY', 0.0, -1.0)

        ArmyBase:AddResourceManagerType('NavalUnits', 'MASS', 0.0, -1.0)
        ArmyBase:AddResourceManagerType('NavalUnits', 'ENERGY', 0.0, -1.0)

        ArmyBase:AddResourceManagerType('Expansion', 'MASS', 0.25, 150)
        ArmyBase:AddResourceManagerType('Expansion', 'ENERGY', 0.25, 400)

        ArmyBase:AddResourceManagerType('Experimentals', 'MASS', 0.0, 1200)
        ArmyBase:AddResourceManagerType('Experimentals', 'ENERGY', 0.0, 12000)
		
		ArmyBase:AddResourceManagerType('Misc', 'MASS', 0.0, -1.0)
        ArmyBase:AddResourceManagerType('Misc', 'ENERGY', 0.0, -1.0)

        local baseType = self.Brain:StrategicManagerPickStartingBase(BaseName);

        -- the bool is the flag that this base should use startup items
        ArmyBase:UseSkirmishBaseBlueprint(baseType, true)
    end,

    ConstructionFinished = function(self, unit, finishedUnit)
        if unit:GetArmy() != self.Brain:GetArmyIndex() then
            return
        end
    end,
    
    ResearchNeed = function(self, need)
        --LOG("*AI DEBUG: Research Need = " .. need)
        if need == 'NeedShields' then
            if self.Brain:GetFactionIndex() == 1 then
                table.insert( self.ResearchNeeds, 'UBU_SHIELDGENERATOR' )
            elseif self.Brain:GetFactionIndex() == 2 then
                table.insert( self.ResearchNeeds, 'CBU_SHIELDGENERATOR' )
            elseif self.Brain:GetFactionIndex() == 3 then
                table.insert( self.ResearchNeeds, 'IBU_SHIELDGENERATOR' )
            end
        elseif need == 'NeedMoreShields' then
            if self.Brain:GetFactionIndex() == 1 then
                table.insert( self.ResearchNeeds, 'UAP_SHIELDS' )
            elseif self.Brain:GetFactionIndex() == 2 then
                table.insert( self.ResearchNeeds, 'CAP_SHIELDS' )
            elseif self.Brain:GetFactionIndex() == 3 then
                table.insert( self.ResearchNeeds, 'IBP_SHIELDENERGYSPONGE' )
            end
        elseif need == 'NeedAntiNukes' then
            if self.Brain:GetFactionIndex() == 1 then
                table.insert( self.ResearchNeeds, 'UBU_TMLICBMCOMBODEFENSE' )
            elseif self.Brain:GetFactionIndex() == 2 then
                table.insert( self.ResearchNeeds, 'CBU_MISSILELAUNCHDEFENSE' )
            elseif self.Brain:GetFactionIndex() == 3 then
                table.insert( self.ResearchNeeds, 'IBU_TMLICBMCOMBODEFENSE' )
            end
        elseif need == 'NeedAAUpgrade' then
            if self.Brain:GetFactionIndex() == 1 then
                table.insert( self.ResearchNeeds, 'UBP_AAUPGRADE' )
            elseif self.Brain:GetFactionIndex() == 2 then
                table.insert( self.ResearchNeeds, 'CLU_ADV' )
            elseif self.Brain:GetFactionIndex() == 3 then
                table.insert( self.ResearchNeeds, 'ILP_ASSAULTBOTAA' )
            end
        elseif need == 'NeedNukes' then
            if self.Brain:GetFactionIndex() == 1 then
                table.insert( self.ResearchNeeds, 'UBU_ICBMLAUNCHFACILITY' )
            elseif self.Brain:GetFactionIndex() == 2 then
                table.insert( self.ResearchNeeds, 'CBU_MISSILELAUNCHDEFENSE' )
            elseif self.Brain:GetFactionIndex() == 3 then
                table.insert( self.ResearchNeeds, 'IBU_ICBMLAUNCHFACILITY' )
            end
        elseif need == 'NeedArtillery' then
            if self.Brain:GetFactionIndex() == 1 then
                table.insert( self.ResearchNeeds, 'UBU_LONGRANGEARTILLERY' )
            elseif self.Brain:GetFactionIndex() == 2 then
                table.insert( self.ResearchNeeds, 'CBU_LONGRANGEARTILLERY' )
			elseif self.Brain:GetFactionIndex() == 3 then
                table.insert( self.ResearchNeeds, 'IBU_TML' )
            end
        elseif need == 'NeedMassConv' then
            if self.Brain:GetFactionIndex() == 1 then
                table.insert( self.ResearchNeeds, 'UBU_MASSCONVERTOR' )
            elseif self.Brain:GetFactionIndex() == 2 then
                table.insert( self.ResearchNeeds, 'CBA_MASSCONVERSION' )
            elseif self.Brain:GetFactionIndex() == 3 then
                table.insert( self.ResearchNeeds, 'IBU_POWERDOME' )
            end
        end
    end,

    BuildResearchData = function(self)
		self.ResearchNeeds = {}
        self.UnresearchedItems = {}
        self.ResearchedItems = {}
        self.FactionSetPosition = 1
        self.ResearchSetNumber = 1

        local factionIndex = self.Brain:GetFactionIndex()
        -- LOG('*FACTION INDEX = ' .. factionIndex)
        local bp = self.Brain:GetStrategicArchetypeBlueprint()
        self.FactionSet = self:SelectFactionResearchSet(factionIndex, bp)

        local prependCharacter = 'I'
        if factionIndex == 1 then
            prependCharacter = 'U'
        elseif factionIndex == 2 then
            prependCharacter = 'C'
        end

        for k,v in ResearchDefinitions do

            -- Faction test
            if string.sub(k,1,1) != prependCharacter then
                continue
            end

            local level = 1
            -- Temporarily remove all naval research from the AI research plans.
            if string.sub(k,2,2) == 'S' then
                level = bp.ResearchPlans[self.FactionSet].NavalResearchPriority

            elseif string.sub(k,2,2) == 'A' then
                level = bp.ResearchPlans[self.FactionSet].AirResearchPriority

            elseif string.sub(k,2,2) == 'C' then
                level = bp.ResearchPlans[self.FactionSet].ACUResearchPriority

            elseif string.sub(k,2,2) == 'L' then
                level = bp.ResearchPlans[self.FactionSet].LandResearchPriority

            elseif string.sub(k,2,2) == 'B' then
                level = bp.ResearchPlans[self.FactionSet].StructureResearchPriority
            end

            if not self.UnresearchedItems[level] then
                self.UnresearchedItems[level] = {}
            end

            table.insert( self.UnresearchedItems[level], k )
        end
    end,

    SelectFactionResearchSet = function(self, factionIndex, archBlueprint)
        local index

        repeat
            index = Random(1, table.getn(archBlueprint.ResearchPlans) )
        until ( archBlueprint.ResearchPlans[index].FactionId == factionIndex )

        -- validate all research plan items
        for k,v in archBlueprint.ResearchPlans do
            for _,name in v.ResearchItems do
                if not ResearchDefinitions[name] then
                    WARN( '*AI ERROR: Could not find research definition named - ' .. name )
                end
            end
        end

        LOG('*AI DEBUG: Army'..self.Brain:GetArmyIndex()..': Using research index '..index)

        return index
    end,

    GetCheapestResearchPath = function(self, researchName)
        local startBp = ResearchDefinitions[researchName]

        -- If our desired research has no prereqs then research it
        if not startBp.PREREQUISITES then
            return researchName
        end

        local tokens = STR_GetTokens( startBp.PREREQUISITES, "," )
        local paths = {}

        -- fill in initial research paths
        for _, name in tokens do
            local newBp = ResearchDefinitions[name]
            if not newBp then
                WARN('*AI ERROR: Could not find research definitions named - ' .. name .. ' - it is should be a PreReq for ' .. researchName )
                continue
            end
            -- If we have a prereq then return our target research since we can research it
            if self.Brain:HasResearched(name) then
                return researchName
            end
            table.insert(paths, {cost = startBp.COST + newBp.COST, lastName = name})
        end

        if not table.getn(paths) > 0 then
            return researchName
        end

        local found = true

        while found do

            found = false

            for k, v in paths do
                local newBp = ResearchDefinitions[v.lastName]

                if not newBp then
                    WARN('*AI ERROR: Could not find research definitions named - ' .. v.lastName )
                    continue
                end

                if not newBp.PREREQUISITES then
                    continue
                end

                local tokens = STR_GetTokens( newBp.PREREQUISITES, "," )

                local lowCost = 100
                local lowName = v.lastName

                for _, name in tokens do
                    local testBp = ResearchDefinitions[name]

                    if not testBp then
                        -- WARN('*AI ERROR: Could not find research definitions named - ' .. name .. ' - it is supposed to be a PreReq for ' .. v.lastName )
                        continue
                    end

                    local currentResearched = self.Brain:HasResearched(name)

                    -- this is already researched; this is the cheapest way to research this path
                    if currentResearched then
                        lowCost = 0
                        lowName = v.lastName
                        found = false
                        break
                    end

                    if testBp.COST >= lowCost then
                        continue
                    end

                    found = true
                    lowCost = testBp.COST
                    lowName = name
                end

                v.cost = v.cost + lowCost
                v.lastName = lowName
            end
        end

        table.sort(paths, function(a,b) return a.cost < b.cost end)

        return paths[1].lastName
    end,

    GetResearchItem = function(self)
        if table.getn(self.UnresearchedItems) <= 0 then
            return false
        end

        local researchName = false
        local archBp = self.Brain:GetStrategicArchetypeBlueprint()

        while not table.empty(self.ResearchNeeds) do
            local researchBp = ResearchDefinitions[self.ResearchNeeds[1]]
            if researchBp and self.Brain:HasResearched(self.ResearchNeeds[1]) then
                table.remove( self.ResearchNeeds, 1 )
            else
                researchName = self:GetCheapestResearchPath(self.ResearchNeeds[1])
                researchBp = ResearchDefinitions[researchName]

                if not researchBp then
                    --LOG('*AI DEBUG: Invalid research for research need = ' .. self.ResearchNeeds[1] )
                    table.remove( self.ResearchNeeds, 1 )
                else
                    --LOG('*AI DEBUG: Researching research item - ' .. researchName .. ' - path to - ' .. self.ResearchNeeds[1])
                    return researchName, 1
                end
            end
        end

        if self.FactionSetPosition <= table.getn(archBp.ResearchPlans[self.FactionSet].ResearchItems) then
            local researchBp
            while not researchBp do
                -- we now have a research goal
                researchName = archBp.ResearchPlans[self.FactionSet].ResearchItems[self.FactionSetPosition]

                -- find out if we need to get a prereq for this goal
                researchBp = ResearchDefinitions[researchName]

                -- see if this research exists; if it doesn't throw an error
                if not researchBp then
                    WARN('*AI ERROR: Could not find research definitions named - ' .. researchName .. ' - skipping it and moving on')
                    self.FactionSetPosition = self.FactionSetPosition + 1
                    researchName = false

                -- see if we researched this elsewhere
                elseif self.Brain:HasResearched( researchName ) then
                    self.FactionSetPosition = self.FactionSetPosition + 1
                    researchName = false

                -- see if we need any prerequisites
                elseif researchBp.PREREQUISITES and not self.Brain:HasResearched( researchBp.PREREQUISITES ) then
                    researchName = self:GetCheapestResearchPath(researchName)
                    researchBp = ResearchDefinitions[researchName]
                end

                -- if we are now out of bounds leave the loop and get a random one
                if not researchBp and self.FactionSetPosition > table.getn(archBp.ResearchPlans[self.FactionSet].ResearchItems) then
                    researchName = false
                    break
                end
            end
        end

        -- We do not have any more goals set; pick a random research
        if not researchName then
            -- we loop over the unresearched items until we find a match
            while not researchName do

                if ( table.getn(self.UnresearchedItems) == 0 ) then
                    return false
                end

                -- make sure we still can research; pick next set if needed
                while ( not self.UnresearchedItems[self.ResearchSetNumber] or table.getn(self.UnresearchedItems[self.ResearchSetNumber]) == 0 ) do
                    self.ResearchSetNumber = self.ResearchSetNumber + 1
                    if ( self.ResearchSetNumber > 10 ) then
                        WARN('*AI ERROR: SkirmishAISystem Warning - could not find reasearch item or all items researched')
						SetSkirmishResearchNotRequired();
--
--                        -- Kill Research Stations When All Research Has Been Hit
--                        local cats = categories.RESEARCHSTATION - categories.EXPERIMENTAL - categories.COMMAND
--                        local units = self.Brain:GetListOfUnits(cats, false )
--                        for k, v in units do 
--                            v:Kill() 
--                        end
--                        WARN('KILL AI RESEARCH STATION PASSED')
                        return false
                    end
                end

                -- random grab
                local researchVal = Random(1, table.getn(self.UnresearchedItems[self.ResearchSetNumber]) )

                researchName = self.UnresearchedItems[self.ResearchSetNumber][researchVal]
                if not researchName then
                    WARN('*AI DEBUG: SkirmishAISystem warning - could not find a researchItem')
                    return false
                end

                -- Prerequisites; make sure it either has no prereqs or that we have researched them
                local researchBp = ResearchDefinitions[researchName]

                -- If we have already researched this item remove it from the list and move on.
				if self.Brain:HasResearched( researchName ) then
					for k,v in self.UnresearchedItems do
						table.removeByValue(v, researchName)
					end
					researchName = false
				-- If this item has prereqs and we have not researched them yet, move on.
                elseif researchBp.PREREQUISITES and researchBp.PREREQUISITES != '' and not self.Brain:HasResearched( researchBp.PREREQUISITES ) then
					researchName = false
				end
            end
        end

        -- for research with boost levels; check the level and store it so we can refer to it later
        -- boost doesn't exist so just alwasy return 1
        local level = 1

        --LOG('*AI DEBUG: ARMY ' .. self.Brain:GetArmyIndex() .. ': Research Returns = ' .. repr(researchName) )
        return researchName, 1
    end,

    -- callback for when research is finished
    ResearchCompleted = function(self, researchName)
        -- if the research just finished is the current faction goal we have; increment so we get next goal
        local archBp = self.Brain:GetStrategicArchetypeBlueprint()
        if researchName == archBp.ResearchPlans[self.FactionSet].ResearchItems[self.FactionSetPosition] then
            self.FactionSetPosition = self.FactionSetPosition + 1
        end

        -- remove the research from unfinished table so we don't random it later
        for k,v in self.UnresearchedItems do
            table.removeByValue(v, researchName)
        end
    end,
}

function SetupSkirmishSystems(aiBrain)
    if ScenarioInfo.Options.NoAI or ArmyIsCivilian(aiBrain:GetArmyIndex()) then -- or aiBrain:GetArmyIndex() != 1 then
        return
    end

    aiBrain.SkirmishAISystem = SkirmishAISystem(aiBrain)
end

local prevSkirmishAISystem = SkirmishAISystem
SkirmishAISystem = Class(prevSkirmishAISystem) {
    SkirmishDelaySetup = function(self)
    prevSkirmishAISystem.SkirmishDelaySetup(self)
        local AIMass = (1600)
        local AIEnergy = (4000)
        self.Brain:GiveResource('Mass', AIMass)
        self.Brain:GiveResource('Energy', AIEnergy)
    end      
}