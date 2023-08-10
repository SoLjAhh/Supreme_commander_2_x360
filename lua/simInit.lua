-- Copyright © 2023 Gas Powered Games, Inc.  All rights reserved.
-- Modified by SOLJA
-- This is the sim-specific top-level lua initialization file. It is run at initialization time
-- to set up all lua state for the sim.
--
-- Initialization order within the sim:
--
--   1. __blueprints is filled in from preloaded data
--
--   2. simInit.lua [this file] runs. It sets up infrastructure necessary to make Lua classes work etc.
--
--   if starting a new session:
--
--     3a. ScenarioInfo is setup with info about the scenario
--
--     4a. SetupSession() is called
--
--     5a. Armies, brains, recon databases, and other underlying game facilities are created
--
--     6a. BeginSession() is called, which loads the actual scenario data and starts the game
--
--   otherwise (loading a old session):
--
--     3b. The saved lua state is deserialized
--


--===================================================================================
-- Do global init and set up common global functions
--===================================================================================
doscript '/lua/globalInit.lua'

LOG('Active mods in sim: ', repr(__active_mods))

WaitTicks = coroutine.yield

function WaitSeconds(n)
	local ticks = math.max(1, n * 10)
	WaitTicks(ticks)
end

--===================================================================================
-- Set up the sync table and some globals for use by scenario functions
--===================================================================================
doscript '/lua/SimSync.lua'

--===================================================================================
-- Set up any globals we want to instantiate early
--===================================================================================
doscript '/lua/sim/Buff.lua'
doscript '/lua/sim/BuffAffects.lua'
doscript '/lua/sim/Research.lua'
doscript '/lua/sim/Experience.lua'

--===================================================================================
--SetupSession will be called by the engine after ScenarioInfo is set
--but before any armies are created.
--===================================================================================

function SetupSession()
	--LOG('SetupSession: ', repr(ScenarioInfo))
	ArmyBrains = {}

	--===================================================================================
	-- ScenarioInfo is a table filled in by the engine with fields from the _scenario.lua
	-- file we're using for this game. We use it to store additional global information
	-- needed by our scenario.
	--===================================================================================
	ScenarioInfo.PlatoonHandles = {}
	ScenarioInfo.UnitGroups = {}
	ScenarioInfo.UnitNames = {}

	ScenarioInfo.VarTable = {}
	ScenarioInfo.OSPlatoonCounter = {}
	ScenarioInfo.BuilderTable = { Air = {}, Land = {}, Sea = {}, Gate = {} }
	ScenarioInfo.BuilderTable.AddedPlans = {}
	ScenarioInfo.MapData = { PathingTable = { Amphibious = {}, Water = {}, Land = {}, }, IslandData = {} }

	-- SC2 - Economy changes this seeds an armies economies initial values. We will want this to be a game option.
	ScenarioInfo.Options.InitialEnergy = 4000
	ScenarioInfo.Options.InitialMass = 1600
	ScenarioInfo.Options.InitialResearch = 5

	--===================================================================================
	-- ScenarioInfo.Env is the environment that the save file and scenario script file
	-- are loaded into.
	--
	-- We set it up here with some default functions that can be accessed from the
	-- scenario script.
	--===================================================================================
	ScenarioInfo.Env = import('/lua/sim/scenarioEnvironment.lua')


	--===========================================================================
	-- Load the scenario save and script files
	--
	-- The save file creates a table named "Scenario" in ScenarioInfo.Env,
	-- containing most of the save data. We'll copy it up to a top-level global.
	--===========================================================================
	LOG('Loading save file: ',ScenarioInfo.save)
	doscript('/lua/dataInit.lua')
	doscript(ScenarioInfo.save, ScenarioInfo.Env)

	Scenario = ScenarioInfo.Env.Scenario

	LOG('Loading script file: ',ScenarioInfo.script)
	doscript(ScenarioInfo.script, ScenarioInfo.Env)

	if ScenarioInfo.type == 'campaign' then
		LOG('*AI DEBUG: Initializing campaign')
		-- We need to import/doscript all the campaign related stuff here
		doscript '/lua/ai/campaign/system/CAIInitializeSystems.lua'
	else
        LOG('*AI DEBUG: Initializing skirmish')
		-- We need to import/doscript all the skirmish related stuff here
        doscript '/lua/ai/skirmish/system/SAIInitializeSystems.lua'
	end

	-- Set up current gravity
	PhysicsSetGravity( 4.9 )

	ResetSyncTable()
end


--===================================================================================
-- Army Brains
--
-- OnCreateArmyBrain() is called by then engine as the brains are created, and we
-- use it to store off various useful bits of info.
--
-- The global variable "ArmyBrains" contains an array of AI brains, one for each army.
--===================================================================================
function OnCreateArmyBrain(index, brain, name, nickname)
	--LOG(string.format("OnCreateArmyBrain %d %s %s",index,name,nickname))
	import('/lua/sim/ScenarioUtilities.lua').InitializeStartLocation(name)
	import('/lua/sim/ScenarioUtilities.lua').SetPlans(name)

	ArmyBrains[index] = brain
	ArmyBrains[index].Name = name
	ArmyBrains[index].Nickname = nickname
	ScenarioInfo.PlatoonHandles[index] = {}
	ScenarioInfo.UnitGroups[index] = {}
	ScenarioInfo.UnitNames[index] = {}

	InitializeArmyAI(name)
	--brain:InitializePlatoonBuildManager()
	--import('/lua/sim/ScenarioUtilities.lua').LoadArmyPBMBuilders(name)
	--LOG('*SCENARIO DEBUG: ON POP, ARMY BRAINS = ', repr(ArmyBrains))
end

function InitializePrebuiltUnits(name)
	ArmyInitializePrebuiltUnits(name)
end

--===================================================================================
-- Prefetch helpers - these help get data to the prefetching logic in SimMain.cpp
--===================================================================================
function GetUnitsFromGroupTable( tblNode, unitBPs )
    if nil == tblNode then
        return
    end

    for strName, tblData in pairs(tblNode.Units) do
        if 'GROUP' == tblData.type then
            GetUnitsFromGroupTable(tblData, unitBPs)
        else
			if tblData.type then
				unitBPs[ tblData.type ] = true
			end
		end
    end
end

-- gets a list of units for this scenario
function PreloadUnits()
	local unitBPs = {}
    local tblArmy = ListArmies()

    for iArmy, strArmy in pairs(tblArmy) do
        local tblData = Scenario.Armies[strArmy]
        if tblData then
			GetUnitsFromGroupTable( tblData.Units, unitBPs )
        end
    end

	return unitBPs
end


-- get a list of things to prefetch for a given scenario
function GetPrefetchList()
	local returnTable = {}
	local prefetchTable = import('/lua/sim/prefetchscenarios.lua')
	if prefetchTable and ScenarioInfo.description and prefetchTable[ScenarioInfo.description] then
		LOG("Getting prefetch table for this scenario")
		returnTable = prefetchTable[ScenarioInfo.description]
	end
	local otherData = import('/lua/sim/prefetchOther.lua')
	if otherData and otherData["scmresources"] then
		returnTable["otherscmresource"] = otherData["scmresources"]
	end
	if otherData and otherData["scaresources"] then
		returnTable["otherscaresource"] = otherData["scaresources"]
	end
	if otherData and otherData["textureresources"] then
		returnTable["othertextureresource"] = otherData["textureresources"]
	end
	if otherData and otherData["batchtexturedata"] then
		returnTable["otherbatchtexturedata"] = otherData["batchtexturedata"]
	end
	return returnTable
end

--===================================================================================
-- BeginSession will be called by the engine after the armies are created (but without
-- any units yet) and we're ready to start the game. It's responsible for setting up
-- the initial units and any other gameplay state we need.
--===================================================================================
function BeginSession()

	if ScenarioInfo.type == 'campaign' then
		ScenarioInfo.PropDecayDisabled = true
	end

	import('/lua/sim/ScenarioUtilities.lua').CreateProps()
	import('/lua/sim/ScenarioUtilities.lua').CreateResources()

	local focusarmy = GetFocusArmy()
	if focusarmy>=0 and ArmyBrains[focusarmy] then
		LocGlobals.PlayerName = ArmyBrains[focusarmy].Nickname
	end

	-- Initialize strategy icons to render.
	import('/lua/system/Utilities.lua').UserConRequest('ui_RenderIcons true')

	-- Pass ScenarioInfo into OnPopulate() and OnStart() for backwards compatibility
	ScenarioInfo.Env.OnPopulate(ScenarioInfo)
	ScenarioInfo.Env.OnStart(ScenarioInfo)
	ScenarioInfo.Env.OnInitCamera(ScenarioInfo)

	-- Look for teams
	local teams = {}
	for name,army in ScenarioInfo.ArmySetup do
		if army.Team > 1 then
			if not teams[army.Team] then
				teams[army.Team] = {}
			end
			table.insert(teams[army.Team],army.ArmyIndex)
		end
	end

	if ScenarioInfo.Options.TeamLock == 'locked' then
		-- Specify that the teams are locked.  Parts of the diplomacy dialog will
		-- be disabled.
		ScenarioInfo.TeamGame = true
		Sync.LockTeams = true
	end

	-- if build restrictions chosen, set them up
	local buildRestrictions = nil
	local unlockAllResearch = false
	local unlockAllUnitsNoResearch = false
	if ScenarioInfo.Options.RestrictedCategories then
		local restrictedUnits = import('/lua/ui/lobby/restrictedUnitsData.lua').restrictedUnits
		for index, restriction in ScenarioInfo.Options.RestrictedCategories do
			if restriction == "ALL_RESEARCH" then
				unlockAllResearch = true
			elseif restriction == "ALL_RESEARCH_UNITS" then
				unlockAllUnitsNoResearch = true
			else
				local restrictedCategories = nil
				for index, cat in restrictedUnits[restriction].categories do
					if restrictedCategories == nil then
						restrictedCategories = categories[cat]
					else
						restrictedCategories = restrictedCategories + categories[cat]
					end
				end
				if buildRestrictions == nil then
					buildRestrictions = restrictedCategories
				else
					buildRestrictions = buildRestrictions + restrictedCategories
				end
			end
		end
	end

	if buildRestrictions or unlockAllResearch or unlockAllUnitsNoResearch then
		local tblArmies = ListArmies()
		for index, name in tblArmies do
			if buildRestrictions then
				AddBuildRestriction(index, buildRestrictions)
			end
			if unlockAllResearch then
				UnlockAllResearch(index)
			end
			if unlockAllUnitsNoResearch then
				UnlockAllUnitsNoResearch(index)
			end
		end
	end

	-- Set up the teams we found
	for team,armyIndices in teams do
		for k,index in armyIndices do
			for k2,index2 in armyIndices do
				SetAlliance(index,index2,"Ally")
			end
			ArmyBrains[index].RequestingAlliedVictory = true
		end
	end

	--start the runtime score loop
	ForkThread(import('/lua/sim/aibrain.lua').CollectCurrentScores)
	ForkThread(import('/lua/sim/aibrain.lua').SyncCurrentScores)

	--start watching for victory conditions
	ForkThread(import('/lua/sim/victory.lua').CheckVictory, ScenarioInfo)

	local markers = import('/lua/sim/ScenarioUtilities.lua').GetMarkers()
	local Entity = import('/lua/sim/Entity.lua').Entity
    if markers then
        for k, v in markers do
            if v.type == 'Effect' then
				if EffectTemplates.Marker[v.EmitterTemplate] then
					local EffectMarkerEntity = Entity()
					Warp( EffectMarkerEntity, v.position )
					EffectMarkerEntity:SetOrientation(v.orientation, true)
					for k, v2 in EffectTemplates.Marker[v.EmitterTemplate] do
						CreateEmitterAtBone(EffectMarkerEntity,-2,-1,v2):ScaleEmitter(v.EmitterScale or 1):OffsetEmitter(v.EmitterOffset.x or 0, v.EmitterOffset.y or 0, v.EmitterOffset.z or 0)
					end
				else
					WARN( 'Map Effect Marker, unable to find ', v.EmitterTemplate,  ' in /lua/sim/EffectTemplates.lua ' )
				end
			elseif v.type == 'Sound' then
				if v.EventName then
					local SoundMarkerEntity = Entity()
					SoundMarkerEntity:SetPosition(v.position,true)
					SoundMarkerEntity:SetAmbientSound(v.EventName, nil)
				end
			end
        end
    end

    -- Initialize our audio for the session (set reverb for map, etc.)
	import('/lua/sim/ScenarioUtilities.lua').InitializeAudio()

	if ScenarioInfo.Options.SimTest then
		import('/lua/sim/ScenarioFramework/ScenarioTesting.lua').BeginSimTest()
	end
end

--===================================================================================
-- OnPostLoad called after loading a saved game
--===================================================================================
function OnPostLoad()
	---NOTE: we no longer call into ScenarioFramework as if it is a sub-system, handling has been migrated directly to here. - bfricks 7/4/09
	if ScenarioInfo.DialogueFinished then
		for k,v in ScenarioInfo.DialogueFinished do
			ScenarioInfo.DialogueFinished[k] = true
		end
	end

	---NOTE: adding ScenarioInfo data storing so we can manage save/load of updated defaults
	---			this is NOT the best idea - but covers things for ship - bfricks 1/30/10
	if ScenarioInfo.UpdatedCameraDefaults then
		LOG('SIM INIT: OnPostLoad: updating camera defaults set during earlier save session...')
		import('/lua/sim/SimCamera.lua').SimCamera('WorldCamera'):UpdateDefaults(ScenarioInfo.UpdatedCameraDefaults)
	end

	import('/lua/sim/SimObjectives.lua').OnPostLoad()
	import('/lua/sim/SimUIState.lua').OnPostLoad()
	import('/lua/sim/SimPing.lua').OnArmyChange()
	import('/lua/sim/SimPingGroup.lua').OnPostLoad()
	import('/lua/sim/SimDialogue.lua').OnPostLoad()
	import('/lua/SimSync.lua').OnPostLoad()
	if GetFocusArmy() != -1 then
		Sync.SetAlliedVictory = ArmyBrains[GetFocusArmy()].RequestingAlliedVictory or false
	end
	
	-- Initialize strategy icons to render.
	import('/lua/system/Utilities.lua').UserConRequest('ui_RenderIcons true')
end


--===================================================================================
-- DestroySession called when session is shutdown
--===================================================================================
function DestroySession()
	if ScenarioInfo.Lights then
		for k,v in ScenarioInfo.Lights do
			v:OnDestroy()
		end
	end
	if ScenarioInfo.Spawners then
		for k,v in ScenarioInfo.Spawners do
			v:OnDestroy()
		end
	end
end

--===========================================================================
-- Load effect templates and effect utilities
--===========================================================================
doscript('/lua/sim/EffectTemplates.lua')
doscript('/lua/sim/EffectUtilities.lua')


--===========================================================================
-- Set up list of files to prefetch
--===========================================================================
Prefetcher = CreatePrefetchSet()

function DefaultPrefetchSet()
	local set = { models = {}, anims = {}, d3d_textures = {} }

--    for k,file in DiskFindFiles('/units/*.scm') do
--        table.insert(set.models,file)
--    end

--    for k,file in DiskFindFiles('/units/*.sca') do
--        table.insert(set.anims,file)
--    end

--    for k,file in DiskFindFiles('/units/*.dds') do
--        table.insert(set.d3d_textures,file)
--    end

	return set
end

Prefetcher:Update(DefaultPrefetchSet())

--====================================================================================
-- re-enable native hooking of lua scripts
-- this some what mimics the GPG Devs way of Loading mods through a mod_info file
--------------------------------------------------------------------------------------
doscript '/lua/system/repr.lua'

local Hook = { }
local Hook_2 = false

local include = doscript
doscript = function(file, env)
include(file, env)
	if not Hook_2 then  
		local active_mod = {}
		for k, FileName in DiskFindFiles('/mods/shadow', '*sc2_info.lua') or {} do
			--LOG("DISK: sc2_info.lua file found at: " .. FileName)
			local env = {
				location = Dirname(FileName),
				name = FileName,
				description = "<LOC uimod_0006>(No description)",
				author = '',
				copyright = '',
				exclusive = false,
				icon = '/textures/ui/common/dialogs/mod-manager/generic-icon_bmp.dds',
				selectable = true,
				enabled = true,
				hookdir = '/hook',      -- specify the name of the hook sub-directory
				shadowdir = '/shadow',  -- specify the name of shadow sub-directory
				uid = FileName, 		-- default uid to name, should be a unique id
			}
			local ok, result = pcall(include, FileName, env)
				if ok then
					if env and (env.enabled != false) then
						active_mod[env.uid] = env
					end
				else
					LOG("DISK: Problem loading " .. env.name .. ":\n" .. result)
				end
			end
			LOG("Active User mods in Sim loading:  ",repr(active_mod))
			Hook_2 = active_mod
	else 		
		-- build up all mod scripts, skipping .bp files because they have "merge=true" as a method for hooking
		if not Hook[file] and string.find(file, '.lua') then
			for k, FileName in pairs(Hook_2) do
				local filename = DiskGetFileInfo(FileName.location .. FileName.hookdir .. file)
				if filename and filename ~= '' then
					if not Hook[file] then
						Hook[file] = {}
						table.insert(Hook[file], FileName.location .. FileName.hookdir .. file)
					end
				end
			end
		end
		
		-- load mod scripts
		if Hook[file] then
			for k, modfile in pairs(Hook[file] or {}) do
				LOG("Hooked "..file.." with "..modfile)
				local ok, result = pcall(include, modfile, env)
				if not ok then
					LOG("DISK: Problem loading "..file..":\n"..result)
				end
			end
		end
	end
end