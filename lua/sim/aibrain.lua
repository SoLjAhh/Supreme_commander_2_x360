-----------------------------------------------------------------------------
--  File     :  /lua/sim/aibrain.lua
--  Author(s):  Drew Staltman, John Comes
--  Modder (s): SoLjA
--  Summary  :  AIBrain Lua Module Reworked for xbox 360.
--  Copyright © 2022 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------

local AIUtils = import('/lua/ai/aiutilities.lua')
local Utilities = import('/lua/system/utilities.lua')
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local AIBuildUnits = import('/lua/ai/aibuildunits.lua')
local DefaultBuildRestrictions = import('/lua/sim/DefaultBuildRestrictions.lua').DefaultBuildRestrictions
--LOG('aibrain_methods.__index = ',moho.aibrain_methods.__index,' ',moho.aibrain_methods)

local CampaignAISystem = import('/lua/ai/campaign/system/CampaignAISystem.lua')
local SkirmishAISystem = import('/lua/ai/skirmish/system/SkirmishAISystem.lua')
--local PlayerEconomyWatcher = import('/lua/ai/skirmish/system/PlayerEconomyWatcher.lua').PlayerEconomyWatcher
--local SAIEconomyWatch = import('/lua/ai/skirmish/system/SAIEconomyWatch.lua').SAIEconomyWatch

local Unit = import('/lua/sim/Unit.lua').Unit

_G.GrantAllResearchToArmies = function()
    WARN('GRANTING ALL RESEARCH TO ALL ARMIES- THIS CALL IS NO SYNC SAFE AND WILL DESYNC IN MULTIPLAYER')
    for k,v in ArmyBrains do
        v:AddAllResearch()
    end
end



------------------------------------------------------------------------------------------
------------ VO Timeout and Replay Durations ------------
------------------------------------------------------------------------------------------
local VOReplayTime = {
    OnTransportFull = 1,
    OnUnitCapLimitReached = 60,
    OnFailedUnitTransfer = 10,
    OnPlayNoStagingPlatformsVO = 5,
    OnPlayBusyStagingPlatformsVO = 5,
    OnCommanderUnderAttackVO = 15,
    ExperimentalDetected = 60,
    ExperimentalUnitDestroyed = 5,
    FerryPointSet = 5,
    CoordinatedAttackInitiated = 5,
    BaseUnderAttack = 30,
    UnderAttack = 60,
    EnemyForcesDetected = 120,
    NukeArmed = 1,
    NuclearLaunchInitiated = 1,
    NuclearLaunchDetected = 1,
    BattleshipDestroyed = 5,
    EnemyNavalForcesDetected = 60,
}


------------------------------------------------------------------------------------------
------------ Army Reseach to Kill Thresholds ------------
------------------------------------------------------------------------------------------
local ArmyResearchKillThresholds = {
	Level_1 = 10,
	Level_2 = 10,
	Level_3 = 10,
	Level_4 = 10,
	Level_5 = 10,
}
local NumArmyResearchKillThresholds = 5

------------------------------------------------------------------------------------------
------------ Combat/Economy Bonus Score Functions ------------
------------------------------------------------------------------------------------------
local CombatScoreBonusThresholds = {
    lessThan    = {1,5,20,50},
    award       = {0,.12,.25,.5,1},
    max_award   = 2,
}

local EconScoreBonusThresholds = {
    lessThan    = {.01,.05,.20,.50,1},
    award       = {0,.1,.2,.3,.4},
    max_award   = .5,
}

function GetBonusMultiplier(ratio,bonusData)
    local bonus = 0
    for k,v in bonusData.lessThan do
        if ratio < v then
            bonus = bonusData.award[k]
            return bonus
        end
    end
    bonus = bonusData.max_award
    
    return bonus
end


------------------------------------------------------------------------------------------
------------ Runtime score update sync loop  ------------
------------------------------------------------------------------------------------------
local ArmyScore = {}

function CollectCurrentScores()
	-- Initialize the score data stucture
    for index, brain in ArmyBrains do
       ArmyScore[index] = {}
       ArmyScore[index].score = 0
    end

	-- Collect the various scores at regular intervals
    while true do
        for index, brain in ArmyBrains do
           ArmyScore[index].score = brain:CalculateScore()
        end
        
	    WaitSeconds(0.5)  -- update scores every 1/2 second
    end
end

function SyncScores()
	Sync.Score = {}
    for index, brain in ArmyBrains do
	   Sync.Score[index] = {}
	   Sync.Score[index].score = ArmyScore[index].score
    end
end

function SyncCurrentScores()
	-- Sync the score at 1 sec intervals
    while true do
        SyncScores()
		RequestAllArmyStatsSyncArmy()
	    WaitSeconds(1)  -- update scores every second
    end
end

AIBrain = Class(moho.aibrain_methods) {

    ------------------------------------------------------------------------------------------------------------------------------------------
    ---- ------------- HUMAN BRAIN FUNCTIONS HANDLED HERE  ------------- ----
    ------------------------------------------------------------------------------------------------------------------------------------------
    OnCreateHuman = function(self, planName)
        self:CreateBrainShared(planName)

        self:InitializeEconomyState()
        self:InitializeVO()
        self:InitializeResearchExperience()
        self.BrainType = 'Human'
    end,

    OnCreateAI = function(self, planName)
        self:CreateBrainShared(planName)
        local civilian = false
        if ScenarioInfo.ArmySetup[self.Name] then
            civilian = ScenarioInfo.ArmySetup[self.Name].Civilian
        end

        if not civilian then
            local per = ScenarioInfo.ArmySetup[self.Name].AIPersonality

            -- Flag this brain as a possible brain to have skirmish systems enabled on
			if ScenarioInfo.type == 'skirmish' then
				self.SkirmishSystems = true
            end
			
            -- AI Redux For Xbox 360
			local easyPos = string.find( per, 'easy')
			local mediumPos = string.find( per, 'medium')			
			local normalPos = string.find( per, 'normal')
			local hardPos = string.find( per, 'hard')
			local cheatPos = string.find( per, 'cheat')
			
			-- Supreme Commander 1/ Forged Alliance AI
			local supremePos = string.find( per, 'supreme')
			local hordePos = string.find( per, 'horde')			
			local techPos = string.find( per, 'tech')
			
			if ScenarioInfo.ArmySetup[self.Name].aitype then
				self.AIType = ScenarioInfo.ArmySetup[self.Name].aitype
				self.IntelType = ScenarioInfo.ArmySetup[self.Name].aiintel
			else
				if easyPos then
					self.AIType = "easy"
					self.IntelType = "None"
				elseif mediumPos then
					self.AIType = "medium"
					self.IntelType = "None"
				elseif normalPos then
					self.AIType = "normal"
					self.IntelType = "None"
				elseif hardPos then
					self.AIType = "hard"
					self.IntelType = "Radar"
				elseif cheatPos then
					self.AIType = "cheat"
					self.IntelType = "LOS"
				elseif supremePos then
					self.AIType = "supreme"
					self.IntelType = "None"
				elseif hordePos then
					self.AIType = "horde"
					self.IntelType = "None"
				elseif techPos then
					self.AIType = "tech"
					self.IntelType = "Radar"
				end
			end
                        
            local difficulty = 2
			
			if self.AIType == "easy" then
                difficulty = 1
            elseif self.AIType == "medium" then
                difficulty = 2
            else
                difficulty = 3
            end
            
            self.DifficultyLevel = difficulty
			-- only want cheat AI to use the SetupCheat function
			if cheatPos then
                self:SetupCheat(true)
                ScenarioInfo.ArmySetup[self.Name].AIPersonality = string.sub( per, cheatPos + 4 )
			elseif supremePos then
				self:SetupCheat(false)
				ScenarioInfo.ArmySetup[self.Name].AIPersonality = string.sub( per, supremePos + 3 )
			elseif hordePos then
				self:SetupCheat(false)
				ScenarioInfo.ArmySetup[self.Name].AIPersonality = string.sub( per, hordePos + 3 )
			elseif techPos then
				self:SetupCheat(false)
				ScenarioInfo.ArmySetup[self.Name].AIPersonality = string.sub( per, techPos + 3 )
			else
			    self:SetupCheat(false)
            end
                   
            self.PlatoonNameCounter = {}
            self.PlatoonNameCounter['AttackForce'] = 0
            self.BaseTemplates = {}
            self.RepeatExecution = true
            self:InitializeEconomyState()
            self.IntelData = {
                ScoutCounter = 0,
            }
        end
        self.UnitBuiltTriggerList = {}
        self.FactoryAssistList = {}
        self:InitializeResearchExperience()
        self.BrainType = 'AI'
    end,
	 -- END OF CUSTOM AI FOR X360
	 
    CreateBrainShared = function(self,planName)
        self.Trash = TrashBag()
        self.AttackData = {
            NeedSort = false,
            AMPlatoonCount = { DefaultGroupAir = 0, DefaultGroupLand = 0, DefaultGroupSea = 0, },
        }

        self.Callbacks = {
            OnResearchTechnology = Callback(),
        }

        if ScenarioInfo.type == 'campaign' then
            self:SetResourceSharing(false)
        end

        self.ConstantEval = true
        self.IgnoreArmyCaps = false
        self.TriggerList = {}
        self.IntelTriggerList = {}
        self.VeterancyTriggerList = {}
        self.PingCallbackList = {}
		self.ResearchCallbacks = {}
        self.UnitBuiltTriggerList = {}
        self.ArmyBonusData = {}

        -- Restrict all default construction; all brains get all restrictions until research
        -- unlocks the units to build
        local armyIndex = self:GetArmyIndex()
        for k,v in DefaultBuildRestrictions do
            AddBuildRestriction(armyIndex,v)
        end
    end,

    -- RGH Edition
	OnSpawnPreBuiltUnits = function(self)
        local factionIndex = self:GetFactionIndex()
        local resourceStructures = nil
        local initialUnits = nil
        local posX, posY = self:GetArmyStartPos()

        if factionIndex == 1 then -- UEF
			resourceStructures = { 'UUB0701', 'UUB0701', 'UUB0701', 'UUB0701' } -- Mass Extractors only
			initialUnits = { 'UUB0001', 'UUB0702', 'UUB0702', 'UUB0702', 'UUB0702' } -- Units or structures
        elseif factionIndex == 2 then -- Cybran 
			resourceStructures = { 'UCB0701', 'UCB0701', 'UCB0701', 'UCB0701' } -- Mass Extractors only
			initialUnits = { 'UCB0001', 'UCB0702', 'UCB0702', 'UCB0702', 'UCB0702' } -- Units or structures
        elseif factionIndex == 3 then -- Illuminate
			resourceStructures = { 'UIB0701', 'UIB0701', 'UIB0701', 'UIB0701' } -- Mass Extractors only
			initialUnits = { 'UIB0001', 'UIB0702', 'UIB0702', 'UIB0702', 'UIB0702' } -- Units or structures
        end

        if resourceStructures then
    		-- place resource structures down
    		for k, v in resourceStructures do
                local unit = self:CreateResourceBuildingNearest(v, posX, posY)
                if unit != nil and unit:GetBlueprint().Physics.OccupyGround then
                    unit:CreateTarmac(true, true, false, false)
                end
    		end
    	end

		if initialUnits then
    		-- place initial units down
    		for k, v in initialUnits do
                local unit = self:CreateUnitNearSpot(v, posX, posY)
                if unit != nil and unit:GetBlueprint().Physics.OccupyGround then
                    unit:CreateTarmac(true, true, false, false)
                end
    		end
    	end

		self.PreBuilt = true
	end,

    ------------------------------------------------------------------------------------------------------------------------------------------
    ---- ------------- GLOBAL AI BRAIN ARMY FEATURES ------------------- ----
    ------------------------------------------------------------------------------------------------------------------------------------------

    InitializeEconomyState = function(self)
        -- This is called very early, so ensure stats exist
        self:SetArmyStat('Economy_Ratio_Mass',0.0)
        self:SetArmyStat('Economy_Ratio_Energy',0.0)

        if not self.EconStateUnits then
            self.EconStateUnits = {
                MassStorage = {},
                EnergyStorage = {},
            }
        end
        self.EconMassStorageState = nil
        self.EconEnergyStorageState = nil
        self.EconStorageTrigs = {}

        self:SetArmyStatsTrigger('Economy_Ratio_Mass','EconLowMassStore','LessThan',0.1)
        self:SetArmyStatsTrigger('Economy_Ratio_Energy','EconLowEnergyStore','LessThan',0.1)
    end,

    ESRegisterUnitMassStorage = function(self, unit)
        if not self.EconStateUnits then
            self.EconStateUnits = {
                MassStorage = {},
                EnergyStorage = {},
            }
        end
        table.insert(self.EconStateUnits.MassStorage, unit)
    end,

    ESRegisterUnitEnergyStorage = function(self, unit)
        if not self.EconStateUnits then
            self.EconStateUnits = {
                MassStorage = {},
                EnergyStorage = {},
            }
        end
        table.insert(self.EconStateUnits.EnergyStorage, unit)
    end,

    ESUnregisterUnit = function(self, unit)
        for k, v in self.EconStateUnits do
            for i, j in v do
                if j == unit then
                    table.remove(self.EconStateUnits[k], i)
                end
            end
        end
    end,

    ESMassStorageUpdate = function(self, newState)
        if self.EconMassStorageState != newState then
            for k, v in self.EconStateUnits.MassStorage do
                if not v:IsDead() then
                    v:OnMassStorageStateChange(newState)
                else
                    table.remove(self.EconStateUnits.MassStorage, k)
                end
            end
            if newState == 'EconLowMassStore' then
                if not self.EconStorageTrigs['EconMidMassStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Mass','EconMidMassStore','GreaterThanOrEqual',0.11)
                    self.EconStorageTrigs['EconMidMassStore'] = true
                end
            elseif newState == 'EconMidMassStore' then
                if not self.EconStorageTrigs['EconLowMassStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Mass','EconLowMassStore','LessThan',0.1)
                    self.EconStorageTrigs['EconLowMassStore'] = true
                end
                if not self.EconStorageTrigs['EconFullMassStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Mass','EconFullMassStore','GreaterThanOrEqual',0.9)
                    self.EconStorageTrigs['EconFullMassStore'] = true
                end
            elseif newState == 'EconFullMassStore' then
                if not self.EconStorageTrigs['EconMidMassStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Mass','EconMidMassStore','LessThan',0.89)
                    self.EconStorageTrigs['EconMidMassStore'] = true
                end
            end
            self.EconMassStorageState = newState
            return true
        end
        return false
    end,

    ESEnergyStorageUpdate = function(self, newState)
        if self.EconEnergyStorageState != newState then
            for k, v in self.EconStateUnits.EnergyStorage do
                if not v:IsDead() then
                    v:OnEnergyStorageStateChange(newState)
                else
                    table.remove(self.EconStateUnits.EnergyStorage, k)
                end
            end
            if newState == 'EconLowEnergyStore' then
                if not self.EconStorageTrigs['EconMidEnergyStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Energy','EconMidEnergyStore','GreaterThanOrEqual',0.11)
                    self.EconStorageTrigs['EconMidEnergyStore'] = true
                end
            elseif newState == 'EconMidEnergyStore' then
                if not self.EconStorageTrigs['EconLowEnergyStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Energy','EconLowEnergyStore','LessThan',0.1)
                    self.EconStorageTrigs['EconLowEnergyStore'] = true
                end
                if not self.EconStorageTrigs['EconFullEnergyStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Energy','EconFullEnergyStore','GreaterThanOrEqual',0.9)
                    self.EconStorageTrigs['EconFullEnergyStore'] = true
                end
            elseif newState == 'EconFullEnergyStore' then
                if not self.EconStorageTrigs['EconMidEnergyStore'] then
                    self:SetArmyStatsTrigger('Economy_Ratio_Energy','EconMidEnergyStore','LessThan',0.89)
                    self.EconStorageTrigs['EconMidEnergyStore'] = true
                end
            end
            self.EconMassStorageState = newState
            return true
        end
        return false
    end,

    CalculateScore = function(self)

        -- raw mass/energy values
        local massSpent = self:GetArmyStat("Economy_TotalConsumed_Mass",0.0).Value
        local energySpent = self:GetArmyStat("Economy_TotalConsumed_Energy",0.0).Value
        local massValueDestroyed = self:GetArmyStat("Enemies_MassValue_Destroyed",0.0).Value
        local energyValueDestroyed = self:GetArmyStat("Enemies_EnergyValue_Destroyed",0.0).Value
        local massValueLost = self:GetArmyStat("Units_MassValue_Lost",0.0).Value
        local energyValueLost = self:GetArmyStat("Units_EnergyValue_Lost",0.0).Value        

        -- tuning values
        local e2m               = 3         -- mass/energy equivalence: 1 unit of mass is equal to e2m units of energy
        local TRV_perPoint      = 10        -- how many TRV units (see below) equate to a single unit of score. Used to reduce overall digits of final score value.
        local COMBAT_weight     = 5         -- how many times COMBAT score is valued more than ECON score (1 = even value, or 50/50)

        -- Total Resource Values (TRV) - calculating a single number to represent the overall value of a unit according to energy:mass equivalence
        local TRV_spent         = massSpent * e2m + energySpent 
        local TRV_killed        = massValueDestroyed * e2m + energyValueDestroyed
        local TRV_lost          = massValueLost * e2m + energyValueLost
        
        if TRV_lost == 0 then
            TRV_lost = 1
        end
        
        if TRV_spent == 0 then
            TRV_spent = 1
        end

        -- base scores
        local COMBAT_base       = math.floor(TRV_killed/TRV_perPoint) * COMBAT_weight
        local ECON_base         = math.floor(TRV_spent/TRV_perPoint)
        
        -- efficiency ratios
        local ratio_kill_loss   = TRV_killed / TRV_lost
        local ratio_kill_spent  = TRV_killed / TRV_spent
        
        -- calculate bonus
        local COMBAT_bonus  = COMBAT_base * GetBonusMultiplier(ratio_kill_loss,CombatScoreBonusThresholds)
        local ECON_bonus    = ECON_base * GetBonusMultiplier(ratio_kill_spent,EconScoreBonusThresholds)

        -- final scores
        local COMBAT_score  = COMBAT_base + COMBAT_bonus
        local ECON_score    = ECON_base + ECON_bonus
        local score = math.floor(COMBAT_score + ECON_score)

        -- DEV log 
        --local scoreString = "SCORE: - ArmyIndex = " .. self:GetArmyIndex() .. ": score = " .. score .. ", mass spent: " .. massSpent .. ", energy spent: " .. energySpent .. ", mass destroyed: " .. massValueDestroyed .. ", energy destroyed: " .. energyValueDestroyed .. ", mass lost: " .. massValueLost .. ", energy lost: " .. energyValueLost
        --LOG(scoreString)        
   
        return score
    end,

    ------------------------------------------------------------------------------------------------------------------------------------------
    ---- ------------- TRIGGERS BASED ON AN AI BRAIN       ------------- ----
    ------------------------------------------------------------------------------------------------------------------------------------------

    OnStatsTrigger = function(self, triggerName)
        --LOG('*AI DEBUG: ON STATS TRIGGER, TRIGGERNAME = ', repr(triggerName),' Triggers = ', repr(self.TriggerList))
        for k, v in self.TriggerList do
            if v.Name == triggerName then
                if v.CallingObject then
                    if not v.CallingObject:BeenDestroyed() then
                        v.CallbackFunction(v.CallingObject)
                    end
                else
                    v.CallbackFunction(self)
                end
                table.remove(self.TriggerList, k)
            end
        end
        if triggerName == 'EconLowEnergyStore' or triggerName == 'EconMidEnergyStore' or triggerName == 'EconFullEnergyStore' then
            self.EconStorageTrigs[triggerName] = false
            self:ESEnergyStorageUpdate(triggerName)
        elseif triggerName == 'EconLowMassStore' or triggerName == 'EconMidMassStore' or triggerName == 'EconFullMassStore' then
            self.EconStorageTrigs[triggerName] = false
            self:ESMassStorageUpdate(triggerName)
        end
    end,

    RemoveEconomyTrigger = function(self, triggerName)
        for k, v in self.TriggerList do
            if v.Name == triggerName then
                table.remove(self.TriggerList, k)
            end
        end
    end,

--    INTEL TRIGGER SPEC
--    {
--        CallbackFunction = <function>,
--        Type = 'LOS'/'Radar'/'Sonar'/'Omni',
--        Blip = true/false,
--        Value = true/false,
--        Category: blip category to match
--        OnceOnly: fire onceonly
--        TargetAIBrain: AI Brain of the army you want it to trigger off of.
--    },

    SetupArmyIntelTrigger = function(self, triggerSpec)
        table.insert(self.IntelTriggerList, triggerSpec)
    end,


    -- Called when recon data changes for enemy units (e.g. A unit comes into line of sight)
    -- Params
    --   blip: the unit (could be fake) in question
    --   type: 'LOSNow', 'Radar', 'Sonar', or 'Omni'
    --   val: true or false
    -- calls callback function with blip it saw.
    OnIntelChange = function(self, blip, reconType, val)
        --LOG('*AI DEBUG: ONINTELCHANGED: Blip = ', repr(blip), ' ReconType = ', repr(reconType), ' Value = ', repr(val))
        --LOG('*AI DEBUG: IntelTriggerList = ', repr(self.IntelTriggerList))
        --LOG('*AI DEBUG: BlipID = ', repr(blip:GetBlueprint().BlueprintId))
        if self.IntelTriggerList then
            for k, v in self.IntelTriggerList do
                if EntityCategoryContains(v.Category, blip:GetBlueprint().BlueprintId)
                    and v.Type == reconType and (not v.Blip or v.Blip == blip:GetSource())
                    and v.Value == val and v.TargetAIBrain == blip:GetAIBrain() then
                    v.CallbackFunction(blip)
                    if v.OnceOnly then
                        self.IntelTriggerList[k] = nil
                    end
                end
            end
        end
    end,

    AddUnitBuiltPercentageCallback = function(self, callback, category, percent)
        if not callback or not category or not percent then
            error('*ERROR: Attempt to add UnitBuiltPercentageCallback but invalid data given',2)
        end
        table.insert(self.UnitBuiltTriggerList, { Callback=callback, Category=category, Percent=percent })
    end,

    SetupBrainVeterancyTrigger = function(self, triggerSpec)
        if not triggerSpec.CallCount then
            triggerSpec.CallCount = 1
        end
        table.insert(self.VeterancyTriggerList, triggerSpec)
    end,

    OnBrainUnitVeterancyLevel = function(self, unit, level)
        self:SkirmishUnitVeterancyIncrease(unit, level)

        for k,v in self.VeterancyTriggerList do
            if EntityCategoryContains( v.Category, unit ) and level == v.Level and v.CallCount > 0 then
                v.CallCount = v.CallCount - 1
                v.CallbackFunction(unit)
            end
        end
    end,

    AddPingCallback = function(self, callback, pingType)
        if callback and pingType then
            table.insert( self.PingCallbackList, { CallbackFunction = callback, PingType = pingType } )
        end
    end,

    DoPingCallbacks = function(self, pingData)
        for k,v in self.PingCallbackList do
            --if pingData.Type == v.PingType then
                v.CallbackFunction( self, pingData )
            --end
        end
    end,

    ------------------------------------------------------------------------------------------------------------------------------------
    ---- ------------- AI BRAIN FUNCTIONS HANDLED HERE  ------------- ----
    ------------------------------------------------------------------------------------------------------------------------------------
    ForkThread = function(self, fn, ...)
        if fn then
            local thread = ForkThread(fn, self, unpack(arg))
            self.Trash:Add(thread)
            return thread
        else
            return nil
        end
    end,

    OnDestroy = function(self)
        if self.BuilderManagers then
            self.ConditionsMonitor:Destroy()
            for k,v in self.BuilderManagers do
                v.FactoryManager:Destroy()
                v.PlatoonFormManager:Destroy()
                v.EngineerManager:Destroy()
                --v.StrategyManager:Destroy()
            end
        end
        if self.Trash then
            self.Trash:Destroy()
        end
        --LOG('===== AI DEBUG: Brain Evaluate Thead killed =====')
    end,
    
    KillArmy = function(self, time)
        WaitSeconds(time)
        local units = self:GetListOfUnits(categories.ALLUNITS - categories.WALL, false)
        for index,unit in units do
            unit:Kill()
        end
    end,

    -- I'm defeated, show the defeat screen.
    OnDefeat = function(self)
        SetArmyOutOfGame(self:GetArmyIndex())
        CreateSimSyncGameResult( self:GetArmyIndex(), "defeat" )
        import('/lua/sim/SimUtils.lua').UpdateUnitCap()
        import('/lua/sim/SimPing.lua').OnArmyDefeat(self:GetArmyIndex())
        self:ForkThread(self.KillArmy, 5)
    end,
    
    AbandonedByPlayer = function(self)
        self:ForkThread( self.KillArmy, 0.1 )
    end,

    OnVictory = function(self)
        CreateSimSyncGameResult( self:GetArmyIndex(), "victory" )    
    end,

    OnDraw = function(self)
		CreateSimSyncGameResult( self:GetArmyIndex(), "draw" )    
    end,

    IsDefeated = function(self)
        return ArmyIsOutOfGame(self:GetArmyIndex())
    end,

    AddAllResearch = function(self)
        local researchTable = {}

        local factionIndex = self:GetFactionIndex()
        local prependCharacter = 'I'
        if factionIndex == 1 then
            prependCharacter = 'U'
        elseif factionIndex == 2 then
            prependCharacter = 'C'
        end

        for k,v in ResearchDefinitions do
            if string.sub(k,1,1) == prependCharacter then
                table.insert( researchTable, k )
            end
        end

        self:CompleteResearch(researchTable)
    end,

    IgnoreArmyUnitCap = function(self, val)
        self.IgnoreArmyCaps = val
        SetIgnoreArmyCap(self, val)
    end,

    ------------------------------------------------------------------------------------------------------------------------------------
    ---- ---------- System for playing VOs to the Player ------------ ----
    ------------------------------------------------------------------------------------------------------------------------------------
    InitializeVO = function(self)
        if not self.VOTable then
            self.VOTable = {}
        end
    end,

    PlayVOSound = function(self, sound, string)
		--LOG( 'PlayVOSound ', sound )
		CreateSimSyncVoice( sound )
        local time = VOReplayTime[string]
        WaitSeconds(time)
        self.VOTable[string] = nil
    end,

    OnTransportFull = function(self)
        if GetFocusArmy() == self:GetArmyIndex() then
            if self.VOTable and not self.VOTable['OnTransportFull'] then
                self.VOTable['OnTransportFull'] = ForkThread(self.PlayVOSound, self, 'SC2/SC2/VO/Computer_TransportIsFull', 'OnTransportFull')
            end
        end
    end,

    OnUnitCapLimitReached = function(self)
        if GetFocusArmy() == self:GetArmyIndex() then
            local warningVoice = nil
            local factionIndex = self:GetFactionIndex()
            if factionIndex == 1 then
                warningVoice = 'SC2/VOC/COMPUTER/VOC_COMPUTER_Unit_Cap_010'
            elseif factionIndex == 2 then
                warningVoice = 'SC2/VOC/COMPUTER/VOC_COMPUTER_Unit_Cap_010'
            elseif factionIndex == 3 then
                warningVoice = 'SC2/VOC/COMPUTER/VOC_COMPUTER_Unit_Cap_010'
            end

            if self.VOTable and not self.VOTable['OnUnitCapLimitReached'] then
                self.VOTable['OnUnitCapLimitReached'] = ForkThread(self.PlayVOSound, self, warningVoice, 'OnUnitCapLimitReached')
            end
        end
    end,

    OnFailedUnitTransfer = function(self)
        if GetFocusArmy() == self:GetArmyIndex() then			
            if self.VOTable and not self.VOTable['OnFailedUnitTransfer'] then
				self.VOTable['OnFailedUnitTransfer'] = ForkThread(self.PlayVOSound, self, 'SC2/VOC/COMPUTER/VOC_COMPUTER_Unit_Cap_010', 'OnFailedUnitTransfer')
            end
        end
    end,

    OnPlayNoStagingPlatformsVO = function(self)
        if GetFocusArmy() == self:GetArmyIndex() then
            if self.VOTable and not self.VOTable['OnPlayNoStagingPlatformsVO'] then
                self.VOTable['OnPlayNoStagingPlatformsVO'] = ForkThread(self.PlayVOSound, self, 'SC2/VOC/COMPUTER/VOC_COMPUTER_Unit_Cap_010', 'OnPlayNoStagingPlatformsVO')
            end
        end
    end,

    OnPlayBusyStagingPlatformsVO = function(self)
        if GetFocusArmy() == self:GetArmyIndex() then
            if self.VOTable and not self.VOTable['OnPlayBusyStagingPlatformsVO'] then
                self.VOTable['OnPlayBusyStagingPlatformsVO'] = ForkThread(self.PlayVOSound, self, 'SC2/SC2/VO/Computer_TransportIsFull', 'OnPlayBusyStagingPlatformsVO')
            end
        end
    end,

    ExperimentalDetected = function(self)
		if GetFocusArmy() == self:GetArmyIndex() then
			if self.VOTable and not self.VOTable['ExperimentalDetected'] then
				self.VOTable['ExperimentalDetected'] = ForkThread(self.PlayVOSound, self, 'SC2/VOC/COMPUTER/VOC_COMPUTER_Exp_Detected_010', 'ExperimentalDetected')
			end
		end
    end,

    EnemyForcesDetected = function(self)
		if GetFocusArmy() == self:GetArmyIndex() then
			if self.VOTable and not self.VOTable['EnemyForcesDetected'] then
				self.VOTable['EnemyForcesDetected'] = ForkThread(self.PlayVOSound, self, 'SC2/VOC/COMPUTER/VOC_COMPUTER_Enemy_Detected_010', 'EnemyForcesDetected')
			end
		end
    end,

    EnemyNavalForcesDetected = function(self, sound)
        if self.VOTable and not self.VOTable['EnemyNavalForcesDetected'] then
            self.VOTable['EnemyNavalForcesDetected'] = ForkThread(self.PlayVOSound, self, sound, 'EnemyNavalForcesDetected')
        end
    end,

    FerryPointSet = function(self,sound)
        if self.VOTable and not self.VOTable['FerryPointSet'] then
            self.VOTable['FerryPointSet'] = ForkThread(self.PlayVOSound, self, sound, 'FerryPointSet')
        end
    end,

    UnderAttack = function(self,sound)
        if self.VOTable and not self.VOTable['UnderAttack'] then
            self.VOTable['UnderAttack'] = ForkThread(self.PlayVOSound, self, sound, 'UnderAttack')
        end
    end,

    OnPlayCommanderUnderAttackVO = function(self)
        if GetFocusArmy() == self:GetArmyIndex() then
            if self.VOTable and not self.VOTable['OnCommanderUnderAttackVO'] then
                self.VOTable['OnCommanderUnderAttackVO'] = ForkThread(self.PlayVOSound, self, 'SC2/VOC/COMPUTER/VOC_COMPUTER_ACU_Attack_010', 'OnCommanderUnderAttackVO')
            end
        end
    end,

    BaseUnderAttack = function(self)
		if GetFocusArmy() == self:GetArmyIndex() then
			if self.VOTable and not self.VOTable['BaseUnderAttack'] then
				self.VOTable['BaseUnderAttack'] = ForkThread(self.PlayVOSound, self, 'SC2/VOC/COMPUTER/VOC_COMPUTER_Base_Attack_010', 'BaseUnderAttack')
			end
		end
    end,

    NukeArmed = function(self,sound)
        if self.VOTable and not self.VOTable['NukeArmed'] then
            self.VOTable['NukeArmed'] = ForkThread(self.PlayVOSound, self, sound, 'NukeArmed')
        end
    end,

    NuclearLaunchInitiated = function(self,sound)
        if self.VOTable and not self.VOTable['NuclearLaunchInitiated'] then
            self.VOTable['NuclearLaunchInitiated'] = ForkThread(self.PlayVOSound, self, sound, 'NuclearLaunchInitiated')
        end
    end,

    NuclearLaunchDetected = function(self)
		if GetFocusArmy() == self:GetArmyIndex() then
			local warningVoice = nil
            local factionIndex = self:GetFactionIndex()
            if factionIndex == 1 then
                warningVoice = 'SC2/VOC/COMPUTER/VOC_COMPUTER_Strategic_Launch_Detected_010'
            elseif factionIndex == 2 then
                warningVoice = 'SC2/VOC/COMPUTER/VOC_COMPUTER_Strategic_Launch_Detected_010'
            elseif factionIndex == 3 then
                warningVoice = 'SC2/VOC/COMPUTER/VOC_COMPUTER_Strategic_Launch_Detected_010'
            end
			
			if self.VOTable and not self.VOTable['NuclearLaunchDetected'] then
				self.VOTable['NuclearLaunchDetected'] = ForkThread(self.PlayVOSound, self, warningVoice, 'NuclearLaunchDetected')
			end
		end
    end,

    ExperimentalUnitDestroyed = function(self,sound)
        if self.VOTable and not self.VOTable['ExperimentalUnitDestroyed'] then
            self.VOTable['ExperimentalUnitDestroyed'] = ForkThread(self.PlayVOSound, self, sound, 'ExperimentalUnitDestroyed')
        end
    end,

    BattleshipDestroyed = function(self,sound)
        if self.VOTable and not self.VOTable['BattleshipDestroyed'] then
            self.VOTable['BattleshipDestroyed'] = ForkThread(self.PlayVOSound, self, sound, 'BattleshipDestroyed')
        end
    end,

    InitializeCampaignManagers = function(self)
        if self.BrainType == 'Human' then
            return
        end

        CampaignAISystem.SetupCampaignSystems(self)
    end,

    InitializeSkirmishManagers = function(self)
        if self.BrainType == 'Human' and not ScenarioInfo.Options.FullAI then
            --self.EconomyWatcher = PlayerEconomyWatcher(self)
            --self.EconScore = SAIEconomyWatch(self)
            return
        end

        SkirmishAISystem.SetupSkirmishSystems(self)
    end,
    
    AiSkirmishResearchNeed = function(self, researchNeed)
        if self.SkirmishAISystem then
            self.SkirmishAISystem:ResearchNeed(researchNeed)
        end
    end,

    LoadAttackMarkers = function(self)
        WaitSeconds(5)
        --LOG('*CAMPAIGN DEBUG: Loading attack markers')
        local markers = ScenarioUtils.GetMarkersByType('Attack Marker')
        for k,v in markers do
            if v.armyName != '' and v.armyName != self.Name then
                continue
            end

            local factories = self:GetUnitsAroundPoint( categories.FACTORY, v.position, 30, 'Ally' )
            for _,unit in factories do
                if unit:CanBuild( v.unitId ) then
                    self:StartAttackMarker( unit, v )
                end
            end
        end
    end,

    InitializeAttackMarker = function(self, markerName)
        local marker = ScenarioUtils.GetMarker(markerName)
        if not marker then
            WARN('*ATTACK MARKER ERROR: Could not find attack marker - ' .. markerName)
            return
        end

        local factories = self:GetUnitsAroundPoint( categories.FACTORY, marker.position, 30, 'Ally' )
        for _,unit in factories do
            if unit:CanBuild( marker.unitId ) then
                self:ForkThread( self.StartAttackMarker, unit, marker )
            end
        end
    end,

    StartAttackMarker = function(self, unit, attackMarker)
        if attackMarker and unit.AttackMarker then
            return
        end

        if attackMarker then
            local unitToBuildBlueprint = GetUnitBlueprintByName(attackMarker.unitId)
            unit.AttackMarker = {
                Chain = ScenarioUtils.ChainToPositions( attackMarker.chainName ),
                UnitId = attackMarker.unitId,
                MassCost = unitToBuildBlueprint.Economy.MassValue,
                EnergyCost = unitToBuildBlueprint.Economy.EnergyValue,
            }
            WaitSeconds(0.5)
        end

        while self:GetEconomyStored('Mass') < unit.AttackMarker.MassCost or
                    self:GetEconomyStored('Energy') < unit.AttackMarker.EnergyCost do
            WaitSeconds(1)
            if unit:IsDead() then
                return
            end
        end

        while not unit:IsIdleState() do
            WaitSeconds(1)
            if unit:IsDead() then
                return
            end
        end

        -- LOG('*CAMPAIGN DEBUG: Ordering unit build')
        IssueBuildFactory( {unit}, unit.AttackMarker.UnitId, 1 )
        --self:BuildUnit( unit, unit.AttackMarker.UnitId, 5 )
    end,

    UnitConstructionComplete = function( self, builder, buildee )
        --LOG('*CAMPAIGN DEBUG: Unit Construction Complete')
        --LOG('*CAMPAIGN DEBUG: Builder = ' .. builder:GetUnitId() )
        --LOG('*CAMPAIGN DEBUG: Buildee = ' .. buildee:GetUnitId() )
        if builder.AttackMarker then
            self:ForkThread( self.StartAttackMarker, builder )
            self:ForkThread( function()
                    WaitTicks(1)
                    for k,v in builder.AttackMarker.Chain do
                        IssueAggressiveMove( {buildee}, v )
                    end
                end
            )
        end
    end,

    GetAllCurrentUnitCount = function( self, cat )
        return self:NumCurrentlyBuilding( cat, categories.ALLUNITS ) + self:GetCurrentUnits(cat)
    end,

    GetEconomyScore = function(self)
        local numMassExtractors = self:GetAllCurrentUnitCount( categories.MASSEXTRACTION )
        local massIncome = self:GetEconomyIncome('MASS')
        local massStorage = self:GetEconomyStored('MASS')
        local massTotal = self:GetArmyStat("Economy_TotalProduced_Mass", 0.0).Value

        local numPowerGenerators = self:GetAllCurrentUnitCount( categories.uub0702 + categories.uib0702 + categories.ucb0702 )
        local energyIncome = self:GetEconomyIncome('ENERGY')
        local energyStorage = self:GetEconomyStored('ENERGY')
        local energyTotal = self:GetArmyStat("Economy_TotalProduced_Energy", 0.0).Value

        local LandFactoryCat = categories.uub0001 + categories.ucb0001 + categories.uib0001
        local AirFactoryCat = categories.uub0002 + categories.ucb0002 + categories.uib0002
        local NavalFactoryCat = categories.uub0003 + categories.ucb0003

        local numLandFactories = self:GetAllCurrentUnitCount( LandFactoryCat )
        local numAirFactories = self:GetAllCurrentUnitCount( AirFactoryCat )
        local numNavalFactories = self:GetAllCurrentUnitCount( NavalFactoryCat )

        local numFactories = numLandFactories + numAirFactories + numNavalFactories

        local numEngs = self:GetAllCurrentUnitCount( categories.ENGINEER )

        local numResearch = math.min( self:GetAllCurrentUnitCount( categories.RESEARCHSTATION ), 1 )

        local numStructures = self:GetAllCurrentUnitCount( categories.STRUCTURE )

        --[[
        LOG('*AI DEBUG: Mass Extractors = ' .. numMassExtractors ..
            '\n           Mass Income = ' .. massIncome ..
            '\n           Mass Stored = ' .. massStorage ..
            '\n           Mass Total = ' .. massTotal ..

            '\n           Energy Generators = ' .. numPowerGenerators ..
            '\n           Energy Income = ' .. energyIncome ..
            '\n           Energy Stored = ' .. energyStorage ..
            '\n           Energy Total = ' .. energyTotal ..

            '\n           Num Factories = ' .. numFactories )

        --]]--

        local score = 0
        score = score + massIncome * 10
        score = score + math.min( energyIncome, 3 ) * 10

        score = score - ( numFactories * 5 )
        score = score - ( numEngs * 3 )
        score = score - ( numResearch * 2 )
        score = score - numStructures

        return score
    end,

    ------------------------------------------------------------------------------------------------------------------------------------
    ---- --------------- SKIRMISH AI HELPER SYSTEMS  ---------------- ----
    ------------------------------------------------------------------------------------------------------------------------------------

    InitializeSkirmishSystems = function(self)

        -- Make sure we don't do anything for the human player!!!
        if self.BrainType == 'Human' then
            return
        end

        -- Stores handles to all builders for quick iteration and updates to all
        self.BuilderHandles = {}

        -- Condition monitor for the whole brain
        -- self.ConditionsMonitor = ConditionsMonitor(self)

        -- Economy monitor for new skirmish - stores out econ over time to get trend over 10 seconds
        self.EconomyData = {}
        self.EconomyTicksMonitor = 50
        self.EconomyCurrentTick = 1
        self.EconomyMonitorThread = self:ForkThread(self.EconomyMonitor)
        self.LowEnergyMode = false

        -- Add default main location and setup the builder managers
        self.NumBases = 1

        self.BuilderManagers = {}

        --self:AddBuilderManagers(self:GetStartVector3f(), 100, 'MAIN', false)
        --self.BuilderManagers.MAIN.StrategyManager = StratManager.CreateStrategyManager(self, 'MAIN', self:GetStartVector3f(), 100)

        -- Begin the base monitor process
        --self:BaseMonitorInitialization()
        --local plat = self:GetPlatoonUniquelyNamed('ArmyPool')

        --plat:ForkThread( plat.BaseManagersDistressAI )

        --self.EnemyPickerThread = self:ForkThread( self.PickEnemy )
    end,

    GetStartVector3f = function(self)
        local startX, startZ = self:GetArmyStartPos()
        return { startX, 0, startZ }
    end,

    CalculateLayerPreference = function(self)
        local personality = self:GetPersonality()
        local factionIndex = self:GetFactionIndex()
        --SET WHAT THE AI'S LAYER PREFERENCE IS.
        --LOG('*AI DEBUG: PERSONALITY = ', repr(personality))
        local airpref = personality:GetAirUnitsEmphasis() * 100
        local tankpref = personality:GetTankUnitsEmphasis() * 100
        local botpref = personality:GetBotUnitsEmphasis() * 100
        local seapref = personality:GetSeaUnitsEmphasis() * 100
        local landpref = tankpref
        if tankpref < botpref then
            landpref = botpref
        end
        --SEA PREF COMMENTED OUT FOR NOW
        local totalpref = landpref + airpref  + seapref
        totalpref = totalpref
        local random = Random(0, totalpref)
            --LOG('*AI DEBUG: LANDPREF LAYER PREF = ', repr(landpref))
            --LOG('*AI DEBUG: AIRPREF FOR LAYER PREF = ', repr(airpref))
            --LOG('*AI DEBUG: SEAPREF FOR LAYER PREF = ', repr(seapref))
            --LOG('*AI DEBUG: TOTAL FOR LAYER PREF = ', repr(totalpref))
            --LOG('*AI DEBUG: RANDOM NUMBER FOR LAYER PREF = ', repr(random))
        if random < landpref then
            self.LayerPref = 'LAND'
        elseif random < (landpref + airpref) then
            self.LayerPref = 'AIR'
        else
            self.LayerPref = 'LAND'
            --COMMENTING OUT SEA FOR NOW
            self.LayerPref = 'SEA'
        end
        --LOG('*AI DEBUG: LAYER PREFERENCE = ', repr(self.LayerPref))
    end,

    AIGetLayerPreference = function(self)
        return self.LayerPref
    end,

    -- =============================================================================
    --     ECONOMY MONITOR
    -- Monitors the economy over time for skirmish; allows better trend analysis
    -- =============================================================================
    EconomyMonitor = function(self)
        while true do
            if not self.EconomyData[self.EconomyCurrentTick] then
                self.EconomyData[self.EconomyCurrentTick] = {}
            end
            self.EconomyData[self.EconomyCurrentTick].EnergyIncome = self:GetEconomyIncome('ENERGY')
            self.EconomyData[self.EconomyCurrentTick].MassIncome = self:GetEconomyIncome('MASS')
            self.EconomyData[self.EconomyCurrentTick].EnergyRequested = self:GetEconomyRequested('ENERGY')
            self.EconomyData[self.EconomyCurrentTick].MassRequested = self:GetEconomyRequested('MASS')

            self.EconomyCurrentTick = self.EconomyCurrentTick + 1
            if self.EconomyCurrentTick > self.EconomyTicksMonitor then
                self.EconomyCurrentTick = 1
            end

            WaitTicks(1)
        end
    end,

    GetEconomyOverTime = function(self)
        local eIncome = 0
        local mIncome = 0
        local eRequested = 0
        local mRequested = 0
        local num = 0
        for k,v in self.EconomyData do
            num = k
            eIncome = eIncome + v.EnergyIncome
            mIncome = mIncome + v.MassIncome
            eRequested = eRequested + v.EnergyRequested
            mRequested = mRequested + v.MassRequested
        end
        local retTable = {}
        retTable.EnergyIncome = eIncome / num
        retTable.MassIncome = mIncome / num
        retTable.EnergyRequested = eRequested / num
        retTable.MassRequested = mRequested / num

        return retTable
    end,

    -------------------------------------------------------
	-- SC2: Army Research point tracking, quick and dirty implementation of adding research points
	-- based on kills on an army level.
    -------------------------------------------------------
    InitializeResearchExperience = function( self )
		self.ResearchExperience = 0
		self.ResearchExperienceLevel = 1
	end,

    AwardResearchExperience = function(self, amount)
        local expToLevel = ResearchExperience.ExperienceToLevel
        local expMult = ResearchExperience.LevelMultiplier

        local levelMax = table.getn(expMult)

        local addedExp = amount * expMult[self.ResearchExperienceLevel]

        self.ResearchExperience = self.ResearchExperience + amount
        --LOG('*DEBUG: Research Experience Awarded: Exp: '..amount..' Total: '..self.ResearchExperience)
        while self.ResearchExperienceLevel < levelMax do
            if self.ResearchExperience >= expToLevel[self.ResearchExperienceLevel] then
                self.ResearchExperienceLevel = self.ResearchExperienceLevel + 1
                --LOG('*DEBUG: Research Experience Leveled: Current Level: '..self.ResearchExperienceLevel)
            else
                break
            end
        end

        self:GiveResource( 'RESEARCH', addedExp )
        --LOG('*DEBUG: Research Points Awarded: '..addedExp)
    end,

    AddResearchCallback = function(self, callback, name, event )
        if callback and name then
            table.insert( self.ResearchCallbacks, { CallbackFunction = callback, ResearchName = name, ResearchEvent = event, } )
        end
    end,

    DoResearchCallbacks = function(self, name, event )
        self.Callbacks.OnResearchTechnology:Call(name, event)
        for k,v in self.ResearchCallbacks do
			if v.ResearchName == name then
				if v.ResearchEvent == event then
					v.CallbackFunction( self, name, event )
				end
			end
        end
    end,

	OnResearchTechnology = function( self, researchName, event )
		local GResearchInfo = ResearchDefinitions[researchName]

        if self.ResearchCapped then
            local econ = self:GetEconomyStored('RESEARCH')
            self:SetMaxStorage('RESEARCH', econ)
        end

		-- Apply global research definitions upgrades.
		if GResearchInfo then
			if GResearchInfo.WIP then
				return
			end
			
			-- Build a list of our restricted categories in our skirmish exclusions ( if any )
			local restrictedCategories = nil
			if ScenarioInfo.Options.RestrictedCategories then
				local restrictedUnits = import('/lua/ui/lobby/restrictedUnitsData.lua').restrictedUnits
				for index, restriction in ScenarioInfo.Options.RestrictedCategories do							
					if restrictedUnits[restriction].categories != nil then
						for index, cat in restrictedUnits[restriction].categories do
							if restrictedCategories == nil then
								restrictedCategories = ParseEntityCategory(cat)
							else
								restrictedCategories = restrictedCategories + ParseEntityCategory(cat)
							end
						end
					end
				end
			end

			if GResearchInfo.BuildRestrictionRemoval and event == 'complete' then
				for kCategories, vCategories in GResearchInfo.BuildRestrictionRemoval do
					
					-- Subtract our unlocks from the skirmish exclusions.
					local unlockCategories = ParseEntityCategory(vCategories) 					
					if restrictedCategories != nil then
						--LOG( 'Researched ignored due to skirmish exclusions: '..vCategories )						
						unlockCategories = unlockCategories - restrictedCategories						
					end
					
					--LOG( 'OnResearchedTechnologyAdded ', upgradeName, ' BuildRestrictionRemoval: ', vCommand )
					RemoveBuildRestriction(self:GetArmyIndex(), unlockCategories)
				end
			end
		else
			LOG('AIBrain:OnResearchTechnology() Trying to apply upgrade ', upgradeName, ', which is not a defined ResearchDefinition.' )
		end

		--LOG( 'Research ', researchName, ' event: ', event )
		-- Currently supported research events: 'complete' 'started'
		self:DoResearchCallbacks( researchName, event )
	end,

	-- =============================================================================
	--     ARMY BONUS
	-- Army Bonuses are global buffs applied to all units of an army
	-- Ported from Demigod
	-- =============================================================================

	-- Returns a table with all the allied armies of the current brain
    GetAlliedArmies = function(self)
        local armies = {}

        local aIndex = self:GetArmyIndex()
        for _,brain in ArmyBrains do
            local bIndex = brain:GetArmyIndex()
            if aIndex != bIndex and not IsAlly( aIndex, bIndex ) then
                continue
            end

            table.insert( armies, brain )
        end

        return armies
    end,

	AddArmyBonus = function( self, bonusName, unit)
		local def = ArmyBonuses[bonusName]

		-- Make sure bonus exists
		if not def then
			WARN( 'Could not find ArmyBonus [' .. bonusName .. ']' )
			return
		end

		-- Get armies to apply bonus to
		local armies = { self }
		if def.ApplyArmies == 'Team' then
			armies = self:GetAlliedArmies()
		end

		-- Apply the bonus to each army
		for _,brain in armies do

			-- Add data to brain so it can be applied to new units later
			table.insert(brain.ArmyBonusData, bonusName)

			if def.OnApplyBonus then
				def.OnApplyBonus(brain, bonusName, unit)
			end

			if not def.UnitCategory then
				continue
			end

			-- Apply the new bonus to each unit in the army that needs it
			local units = brain:GetListOfUnits( ParseEntityCategoryEx( def.UnitCategory ), false )
			for k,unit in units do
				if unit:IsDead() then
					continue
				end

				self:ApplyArmyBonusToUnit(unit, bonusName)
			end

			-- If buf is to be removed on unit death setup callbacks
			if def.RemoveOnUnitDeath then
				local function RemoveOnDeathCallback(bonusName, unit )
					unit:GetAIBrain():RemoveArmyBonus(bonusName)
				end

				unit.Callbacks.OnKilled:Add(RemoveOnDeathCallback, bonusName)
			end
		end
	end,

	RemoveArmyBonus = function(self, bonusName)
		local def = ArmyBonuses[bonusName]

		-- Get armies to apply bonus to
		local armies = { self }
		if def.ApplyArmies == 'Team' then
			armies = self:GetAlliedArmies()
		end

		-- Remove the army bonus from each of the valid armies
		for _,brain in armies do

			-- Remove bonus from table
			for k,v in brain.ArmyBonusData do
				if v == bonusName then
					table.remove(brain.ArmyBonusData, k)
				end
			end

			if def.OnRemoveBonus then
				def.OnRemoveBonus(brain, bonusName)
			end

			if not def.UnitCategory then
				continue
			end

			-- Remove the bonus from each unit that it
			local units = brain:GetListOfUnits( ParseEntityCategoryEx( def.UnitCategory ), false )
			for k,unit in units do
				if unit:IsDead() then
					continue
				end

				self:RemoveArmyBonusFromUnit( unit, bonusName )
			end
		end
	end,

	-- Applies ArmyBonus to a given unit
	ApplyArmyBonusToUnit = function(self, unit, bonusName)
		local def = ArmyBonuses[bonusName]

		if not def.UnitCategory then
			return
		end

		if not EntityCategoryContains( ParseEntityCategoryEx( def.UnitCategory ), unit ) then
			return
		end

		if def.Buffs then
			for _,buffName in def.Buffs do
				Buff.ApplyBuff(unit, buffName)
			end
		end
	end,

	-- Removes ArmyBonus from a given unit
	RemoveArmyBonusFromUnit = function(self, unit, bonusName)
		local def = ArmyBonuses[bonusName]

		if not def.UnitCategory then
			return
		end

		if def.Buffs then
			for _,buffName in def.Buffs do
				Buff.RemoveBuff(unit, buffName)
			end
		end
	end,

	UnitAddedToArmy = function(self, unit)

        -- Update the unit with any army bonuses that we have added
        for k,v in self.ArmyBonusData do
            self:ApplyArmyBonusToUnit(unit, v)
        end

    end,
    --****************************
    --*     Cheat functions
    --****************************    
    SetupCheat = function(self, cheatBool)
        if cheatBool then
            self.CheatEnabled = true
        end
            
        local pool = self:GetPlatoonUniquelyNamed('ArmyPool')
        for k,v in pool:GetPlatoonUnits() do
            self:ApplyCheatBuffs(v)
        end        
    end,
    -- Custom Setup for RGH
    ApplyCheatBuffs = function(self, unit)
        if EntityCategoryContains( categories.uib0902, unit ) then
            return
        end
        
        local cheatBuff
        if IsXbox() then
            cheatBuff = 'CheatBuffSet0'..self.DifficultyLevel
        else
            cheatBuff = 'CheatBuffSet0'..self.DifficultyLevel
        end
        local def = Buffs[cheatBuff]
        
        if not def then return end
        
        ApplyBuff(unit, cheatBuff)
    end,

    OnEnterNIS = function( self )
    end,

    OnExitNIS = function( self )
    end,
}