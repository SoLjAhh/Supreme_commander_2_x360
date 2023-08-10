-- logic and defaults for launching non-skirmish sessions
local Prefs = import('/lua/user/prefs.lua')
local MapUtils = import('/lua/ui/maputil.lua')

function GetRandomName(faction, aiKey)
    WARN('GRN: ',faction)
    local aiNames = import('/lua/ui/lobby/ainames.lua').ainames
    local factions = import('/lua/common/factions.lua').Factions

    faction = faction or (math.random(table.getn(factions)))

    local name = aiNames[factions[faction].Key][math.random(table.getn(aiNames[factions[faction].Key]))]

    if aiKey then
        local aiTypes = import('/lua/ui/lobby/aitypes.lua').aitypes
        local aiName = "AI"
        for index, value in aiTypes do
            if aiKey == value.key then
                aiName = value.name
            end
        end
        name = name .. " (" .. LOC(aiName) .. ")"
    end

    return name
end

function GetRandomFaction()
    return math.random(table.getn(import('/lua/common/factions.lua').Factions))
end

function VerifyScenarioConfiguration(scenarioInfo)
    if scenarioInfo == nil then
        error("VerifyScenarioConfiguration - no scenarioInfo")
    end

    if scenarioInfo.Configurations == nil or scenarioInfo.Configurations.standard == nil or scenarioInfo.Configurations.standard.teams == nil then
        error("VerifyScenarioConfiguration - scenarios require the standard team configuration")
    end

    if scenarioInfo.Configurations.standard.teams[1].name != 'FFA' then
        error("VerifyScenarioConfiguration - scenarios require all teams be set up as FFA")
    end

    if scenarioInfo.Configurations.standard.teams[1].armies == nil then
        error("VerifyScenarioConfiguration - scenarios require at least one army")
    end
end



-- note that the map name must include the full path, it won't try to guess the path based on name
function SetupCampaignSession(scenario, difficulty, inFaction, campaignFlowInfo, isTutorial)
    local factions = import('/lua/common/factions.lua').Factions
    local faction = inFaction or 1
    if not scenario then
        error("SetupCampaignSession - scenario required")
    end
    VerifyScenarioConfiguration(scenario)

    if not difficulty then
        error("SetupCampaignSession - difficulty required")
    end

    local sessionInfo = {}

    sessionInfo.playerName = Prefs.GetFromCurrentProfile('Name') or 'Player'
    sessionInfo.createReplay = false
    sessionInfo.scenarioInfo = scenario

    local armies = sessionInfo.scenarioInfo.Configurations.standard.teams[1].armies

    sessionInfo.teamInfo = {}

    for index, name in armies do
        sessionInfo.teamInfo[index] = import('/lua/ui/lobby/lobbyComm.lua').GetDefaultPlayerOptions(sessionInfo.playerName)
        if index == 1 then
            sessionInfo.teamInfo[index].PlayerName = sessionInfo.playerName
            sessionInfo.teamInfo[index].Faction = faction
        else
            sessionInfo.teamInfo[index].PlayerName = name
            sessionInfo.teamInfo[index].Human = false
            sessionInfo.teamInfo[index].Faction = 1
        end
        sessionInfo.teamInfo[index].ArmyName = name
    end

    sessionInfo.scenarioInfo.Options = {}
    sessionInfo.scenarioInfo.Options.FogOfWar = 'explored'
    sessionInfo.scenarioInfo.Options.Difficulty = difficulty
    sessionInfo.scenarioInfo.Options.DoNotShareUnitCap = true
    sessionInfo.scenarioInfo.Options.Timeouts = -1
    sessionInfo.scenarioInfo.Options.GameSpeed = 'normal'
    sessionInfo.scenarioInfo.Options.FACampaignFaction = factions[faction].Key
    -- Copy campaign flow information for the front end to use when ending the game
    -- or when restoring from a saved game
    if campaignFlowInfo then
        sessionInfo.scenarioInfo.campaignInfo = campaignFlowInfo
    end

    if isTutorial and (isTutorial == true) then
        sessionInfo.scenarioInfo.tutorial = true
    end

	if HasCommandLineArg("/nonis") then
		sessionInfo.scenarioInfo.Options.NoNIS = true
	end

	if HasCommandLineArg("/nofmv") then
		sessionInfo.scenarioInfo.Options.NoFMV = true
	end

	if HasCommandLineArg("/usegamepad") then
		sessionInfo.scenarioInfo.Options.UseGamePad = true
	end

    Prefs.SetToCurrentProfile('LoadingFaction', faction)

    sessionInfo.scenarioMods = import('/lua/system/mods.lua').GetCampaignMods(sessionInfo.scenarioInfo)
    LOG('sessioninfo: ', repr(sessionInfo.teamInfo))
    return sessionInfo
end




function FixupMapName(mapName)
    if (not string.find(mapName, "/")) and (not string.find(mapName, "\\")) then
        mapName = "/maps/" .. mapName .. "/" .. mapName .. "_scenario.lua"
    end
    return mapName
end


local defaultOptions = {
    FogOfWar = 'explored',
    NoRushOption = 'Off',
    PrebuiltUnits = 'Off',
    Difficulty = 2,
    DoNotShareUnitCap = true,
    Timeouts = -1,
    GameSpeed = 'normal',
    UnitCap = '500',
    Victory = 'sandbox',
    CheatsEnabled = 'true',
    CivilianAlliance = 'enemy',
}

local function GetCommandLineOptions(isPerfTest)
    local options = table.copy(defaultOptions)

    if isPerfTest then
        options.FogOfWar = 'none'
    elseif HasCommandLineArg("/nofog") then
        options.FogOfWar = 'none'
    end

    local norush = GetCommandLineArg("/norush", 1)
    if norush then
        options.NoRushOption = norush[1]
    end

    if HasCommandLineArg("/predeployed") then
        options.PrebuiltUnits = 'On'
    end

    local victory = GetCommandLineArg("/victory", 1)
    if victory then
        options.Victory = victory[1]
    end

    local diff = GetCommandLineArg("/diff", 1)
    if diff then
        options.Difficulty = tonumber(diff[1])
    end

    local noai = HasCommandLineArg("/noai")
    if noai then
        options.NoAI = true
    end

    local fullai = HasCommandLineArg("/fullai")
    if fullai then
        options.FullAI = true
    end

    local aiEngTrain = HasCommandLineArg("/aiengtrain")
    if aiEngTrain then
        options.EngineerANNTraining = true
    end

    return options
end


function SetupBotSession(mapName)
    if not mapName then
        error("SetupBotSession - mapName required")
    end

    mapName = FixupMapName(mapName)

    local sessionInfo = {}

    sessionInfo.playerName = Prefs.GetFromCurrentProfile('Name') or 'Player'
    sessionInfo.createReplay = false

    sessionInfo.scenarioInfo = import('/lua/ui/maputil.lua').LoadScenario(mapName)
    if not sessionInfo.scenarioInfo then
        error("Unable to load map " .. mapName)
    end

    VerifyScenarioConfiguration(sessionInfo.scenarioInfo)

    local armies = sessionInfo.scenarioInfo.Configurations.standard.teams[1].armies

    sessionInfo.teamInfo = {}

    local numColors = table.getn(import('/lua/common/gameColors.lua').GameColors.PlayerColors)

    local ai
    local aiopt = GetCommandLineArg("/ai", 1)
    if aiopt then
        ai = aiopt[1]
    else
        aitypes = import('/lua/ui/lobby/aitypes.lua').aitypes
        ai = aitypes[1].key
    end

    LOG('ai=' .. repr(ai))

    for index, name in armies do
        sessionInfo.teamInfo[index] = import('/lua/ui/lobby/lobbyComm.lua').GetDefaultPlayerOptions(sessionInfo.playerName)
        sessionInfo.teamInfo[index].PlayerName = name
        sessionInfo.teamInfo[index].ArmyName = name
        sessionInfo.teamInfo[index].Faction = GetRandomFaction()
        sessionInfo.teamInfo[index].Human = false
        sessionInfo.teamInfo[index].PlayerColor = math.mod(index, numColors)
        sessionInfo.teamInfo[index].ArmyColor = math.mod(index, numColors)
        sessionInfo.teamInfo[index].AIPersonality = ai
    end

    sessionInfo.scenarioInfo.Options = GetCommandLineOptions(false)
    sessionInfo.scenarioMods = import('/lua/system/mods.lua').GetCampaignMods(sessionInfo.scenarioInfo)

    local seed = GetCommandLineArg("/seed", 1)
    if seed then
        sessionInfo.RandomSeed = tonumber(seed[1])
    end

    return sessionInfo
end


local function SetupCommandLineSkirmish(scenario, isPerfTest)

    local faction
    if HasCommandLineArg("/faction") or HasCommandLineArg("/factionall") then
        faction = tonumber(GetCommandLineArg("/faction", 1)[1])
        if not faction then
            faction = tonumber(GetCommandLineArg("/factionall", 1)[1])
        end
        local maxFaction = table.getn(import('/lua/common/factions.lua').Factions)
        if faction < 1 or faction > maxFaction then
            error("SetupCommandLineSession - selected faction index " .. faction .. " must be between 1 and " ..  maxFaction)
        end
    else
        faction = GetRandomFaction()
        if UseGamepad() then
			faction = 1
			WARN('Currently forcing the faction to be UEF.  Must change this post-milestone',faction)
		end
    end
	-- Custom AI fo RGH by SoLjA
	local strAIType = 'normal'
	local strIntelType
    if HasCommandLineArg("/aidiff") then
		if GetCommandLineArg("/aidiff", 2)[1] then
			strAIType = GetCommandLineArg("/aidiff", 2)[1]
			strIntelType = GetCommandLineArg("/aidiff", 2)[2]
		else
			strAIType = GetCommandLineArg("/aidiff", 1)[1]
		end
    end

    local playerLimit = nil
    if HasCommandLineArg("/playerlimit") then
        playerLimit = tonumber(GetCommandLineArg("/playerlimit", 1)[1])
    end

    VerifyScenarioConfiguration(scenario)

    scenario.Options = GetCommandLineOptions(isPerfTest)

    sessionInfo = { }
    sessionInfo.playerName = Prefs.GetFromCurrentProfile('Name') or 'Player'
    sessionInfo.createReplay = false
    sessionInfo.scenarioInfo = scenario
    sessionInfo.teamInfo = {}
    sessionInfo.scenarioMods = import('/lua/system/mods.lua').GetCampaignMods(scenario)

    local seed = GetCommandLineArg("/seed", 1)
    if seed then
        sessionInfo.RandomSeed = tonumber(seed[1])
    elseif isPerfTest then
        sessionInfo.RandomSeed = 2071971
    end

    local armies = sessionInfo.scenarioInfo.Configurations.standard.teams[1].armies

    local numColors = table.getn(import('/lua/common/gameColors.lua').GameColors.FactionColors[faction])

    for index, name in armies do
        sessionInfo.teamInfo[index] = import('/lua/ui/lobby/lobbyComm.lua').GetDefaultPlayerOptions(sessionInfo.playerName)
        if index == 1 and not scenario.Options.FullAI then
            sessionInfo.teamInfo[index].PlayerName = sessionInfo.playerName
            sessionInfo.teamInfo[index].Faction = faction
            sessionInfo.teamInfo[index].Human = true
        else
			if strAIType then
				sessionInfo.teamInfo[index].aitype = strAIType
				sessionInfo.teamInfo[index].aiintel = strIntelType
			else
				sessionInfo.teamInfo[index].AIPersonality = strAIType
			end

            if HasCommandLineArg("/factionall") then
                sessionInfo.teamInfo[index].Faction = tonumber(GetCommandLineArg("/factionall", 1)[1])
            else
                sessionInfo.teamInfo[index].Faction = GetRandomFaction()
            end
            sessionInfo.teamInfo[index].PlayerName = GetRandomName(sessionInfo.teamInfo[index].Faction, sessionInfo.teamInfo[index].AIPersonality)
            sessionInfo.teamInfo[index].Human = false
        end
        sessionInfo.teamInfo[index].ArmyName = name
        sessionInfo.teamInfo[index].PlayerColor = math.mod(index, numColors)
        sessionInfo.teamInfo[index].ArmyColor = math.mod(index, numColors)
        if playerLimit then
            playerLimit = playerLimit - 1
        end
        if playerLimit and playerLimit <= 0 then
            break
        end
    end

    local extras = MapUtils.GetExtraArmies(sessionInfo.scenarioInfo)
    if extras then
        for k,armyName in extras do
            local index = table.getn( sessionInfo.teamInfo ) + 1
            sessionInfo.teamInfo[index] = import('/lua/ui/lobby/lobbyComm.lua').GetDefaultPlayerOptions("civilian")
            sessionInfo.teamInfo[index].PlayerName = 'civilian'
            sessionInfo.teamInfo[index].Civilian = true
            sessionInfo.teamInfo[index].ArmyName = armyName
            sessionInfo.teamInfo[index].Human = false
        end
    end

    Prefs.SetToCurrentProfile('LoadingFaction', faction)

    return sessionInfo
end

function StartCommandLineSession(mapName, isPerfTest)
    if not mapName then
        error("SetupCommandLineSession - mapName required")
    end

    mapName = FixupMapName(mapName)

    local scenario = import('/lua/ui/maputil.lua').LoadScenario(mapName)
    if not scenario then
        error("Unable to load map " .. mapName)
    end

    local sessionInfo
    if scenario.type == 'campaign' then
        local difficulty = 2
        if HasCommandLineArg("/diff") then
            difficulty = tonumber(GetCommandLineArg("/diff", 1)[1])
        end
        local faction = false
        if HasCommandLineArg("/faction") then
            faction = GetCommandLineArg("/faction", 1)[1]
        end
        sessionInfo = SetupCampaignSession(scenario, difficulty, faction)
    else
        sessionInfo = SetupCommandLineSkirmish(scenario, isPerfTest)
    end
    LaunchSinglePlayerSession(sessionInfo)
end
