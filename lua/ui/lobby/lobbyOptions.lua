--*****************************************************************************
--* File: lua/modules/ui/lobby/lobbyOptions.lua
--* Summary: Lobby options
--*
--* Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
--*****************************************************************************

-- options that show up in the team options panel
SearchOptions =
{
    {
        default = 1,
        label = "<LOC SC2_type_option0000>Victory Conditions",
        key = 'Type',
        pref = '',
        ui_index = 1,
        values = {
            {
                text = "<LOC SC2_type_demoralization_0000>Demoralization",
                help = "<LOC SC2_ttp_type_assassination_0000>Destroy the enemy ACU to demoralize your opponent",
                key = 'demoralization',
            },
            {
                text = "<LOC SC2_type_supremacy0000>Domination",
                help = "<LOC SC2_ttp_type_supremacy0000>Destroy all enemy Builders and Factories to dominate your opponent",
                key = 'domination',
            },
            {
                text = "<LOC SC2_type_random_0000>Any",
                help = "<LOC SC2_ttp_type_random_0000>Play either Assassination or Supremacy",
                key = 'any',
            },
        },
    },
    {
        default = 4,
        label = "<LOC SC2_faction_option0000>Faction",
        key = 'faction',
        pref = '',
        ui_index = 2,
        values = {
            {
                text = "<LOC SC2_faction_uef0000>Armada",
                help = "<LOC SC2_ttp_faction_uef0000>Choose the Armada faction",
                key = 'faction_uef',
            },
            {
                text = "<LOC SC2_faction_cybran0000>Cortex",
                help = "<LOC SC2_ttp_faction_cybran0000>Choose the Cortex faction",
                key = 'faction_cybran',
            },
            {
                text = "<LOC SC2_faction_illuminate0000>Sepluge",
                help = "<LOC SC2_ttp_faction_illuminate0000>Choose the Sepluge faction",
                key = 'faction_illuminate',
            },
            {
                text = "<LOC SC2_faction_random0000>Random",
                help = "<LOC SC2_ttp_faction_random0000>Choose a random faction",
                key = 'faction_random',
            },
        },
    },
    {
        default = 1,
        label = "<LOC SC2_opponent_option0000>Game Type",
        key = 'opponent',
        pref = '',
        ui_index = 3,
        values = {
            {
                text = "<LOC SC2_opponent_random0000>Any",
                help = "<LOC SC2_ttp_opponent_random0000>Play any type of game",
                key = 'opponent_any',
            },
            {
                text = "<LOC SC2_opponent_onevone0000>1v1",
                help = "<LOC SC2_ttp_opponent_onevone0000>Play against a single opponent",
                key = 'opponent_1v1',
            },
            {
                text = "<LOC SC2_opponent_twovtwo0000>2v2",
                help = "<LOC SC2_ttp_opponent_twovtwo0000>Play with a teammate against another team of two",
                key = 'opponent_2v2',
            },
            {
                text = "<LOC SC2_opponent_threefree0000>3-player FFA",
                help = "<LOC SC2_ttp_opponent_threefree0000>Play a free-for-all against two other opponents",
                key = 'opponent_3free',
            },
            {
                text = "<LOC SC2_opponent_fourfree0000>4-player FFA",
                help = "<LOC SC2_ttp_opponent_fourfree0000>Play a free-for-all against three other opponents",
                key = 'opponent_4free',
            },
        },
    },
}

teamOptions =
{
    {
        default = 2,
        label = "<LOC lobui_0088>Starting Position",
        help = "<LOC lobui_0089>Determine what positions players spawn on the map",
        key = 'TeamSpawn',
        pref = 'Lobby_Team_Spawn',
        values = {
            {
                text = "<LOC lobui_0090>Random",
                help = "<LOC lobui_0091>Spawn everyone in random locations",
                key = 'random',
            },
            {
                text = "<LOC lobui_0092>Fixed",
                help = "<LOC lobui_0093>Spawn everyone in fixed locations (determined by slot)",
                key = 'fixed',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0096>Team",
        help = "<LOC lobui_0097>Determines if players may switch teams while in game",
        key = 'TeamLock',
        pref = 'Lobby_Team_Lock',
        values = {
            {
                text = "<LOC lobui_0098>Locked",
                help = "<LOC lobui_0099>Teams are locked once play begins",
                key = 'locked',
            },
            {
                text = "<LOC lobui_0100>Unlocked",
                help = "<LOC lobui_0101>Players may switch teams during play",
                key = 'unlocked',
            },
        },
    },
}

globalOpts = {
    {
        default = 2,
        label = "<LOC lobui_0102>Maximum Number of Units",
        help = "<LOC lobui_0103>Set the maximum number of units that can be in play",
        key = 'UnitCap',
        pref = 'Lobby_Gen_Cap',
        ui_index = 3,
        --x360_override = 200,
        values = {
            {
                text = "250",
                help = "<LOC lobui_0171>250 units per player may be in play",
                key = '250',
            },
            {
                text = "500",
                help = "<LOC lobui_0173>500 units per player may be in play",
                key = '500',
            },
            {
                text = "750",
                help = "<LOC lobui_0175>750 units per player may be in play",
                key = '750',
            },
            {
                text = "1000",
                help = "<LOC lobui_0236>1000 units per player may be in play",
                key = '1000',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0112>Fog of War",
        help = "<LOC lobui_0113>Set up how fog of war will be visualized",
        key = 'FogOfWar',
        pref = 'Lobby_Gen_Fog',
        ui_index = 5,
        values = {
            {
                text = "<LOC lobui_0405>Explored Terrain/No Units",
                help = "<LOC lobui_0115>Terrain revealed, but units still need recon data",
                key = 'explored',
            },
            {
                text = "<LOC lobui_0118>None: Full Visibility",
                help = "<LOC lobui_0119>All terrain and units visible",
                key = 'none',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0120>Victory Condition",
        help = "<LOC lobui_0121>Determines how a victory can be achieved",
        key = 'Victory',
        pref = 'Lobby_Gen_Victory',
        ui_index = 1,
        values = {
            {
                text = "<LOC lobui_0122>Demoralization",
                help = "<LOC lobui_0123>Game ends when commander is destroyed",
                key = 'demoralization',
            },
            {
                text = "<LOC lobui_0126>Domination",
                help = "<LOC lobui_0125>Game ends when all structures, commanders and engineers are destroyed",
                key = 'domination',
            },
            {
                text = "<LOC lobui_0128>Sandbox",
                help = "<LOC lobui_0129>Practice makes perfect",
                key = 'sandbox',
            },
        },
    },
    {
        default = 2,
        label = "<LOC lobui_0242>Timeouts",
        help = "<LOC lobui_0243>Sets the number of timeouts each player can request",
        key = 'Timeouts',
        pref = 'Lobby_Gen_Timeouts',
        mponly = true,
        values = {
            {
                text = "<LOC lobui_0244>None",
                help = "<LOC lobui_0245>No timeouts are allowed",
                key = '0',
            },
            {
                text = "<LOC lobui_0246>Three",
                help = "<LOC lobui_0247>Each player has three timeouts",
                key = '3',
            },
            {
                text = "<LOC lobui_0248>Infinite",
                help = "<LOC lobui_0249>There is no limit on timeouts",
                key = '-1',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0258>Set the Game Speed",
        help = "<LOC lobui_0259>Set the game speed",
        key = 'GameSpeed',
        pref = 'Lobby_Gen_GameSpeed',
        ui_index = 6,
        values = {
            {
                text = "<LOC lobui_0260>Normal",
                help = "<LOC lobui_0261>Fixed at the normal game speed (+0)",
                key = 'normal',
            },
            {
                text = "<LOC lobui_0262>Fast",
                help = "<LOC lobui_0263>Fixed at a fast game speed (+4)",
                key = 'fast',
            },
            {
                text = "<LOC lobui_0264>Adjustable",
                help = "<LOC lobui_0265>Adjustable in-game",
                key = 'adjustable',
            },
        },
    },
    {
        default = 2,
        label = "<LOC lobui_0208>Cheating",
        help = "<LOC lobui_0209>Enable cheat codes",
        key = 'CheatsEnabled',
        pref = 'Lobby_Gen_CheatsEnabled',
        ui_index = 7,
        values = {
            {
                text = "<LOC _Off>Off",
                help = "<LOC lobui_0210>Cheats disabled",
                key = 'false',
            },
            {
                text = "<LOC _On>On",
                help = "<LOC lobui_0211>Cheats enabled",
                key = 'true',
            },
        },
    },
    {
        default = 3,
        label = "<LOC lobui_0291>Civilians",
        help = "<LOC lobui_0292>Set how civilian units are used",
        key = 'CivilianAlliance',
        pref = 'Lobby_Gen_Civilians',
        values = {
            {
                text = "<LOC lobui_0293>Enemy",
                help = "<LOC lobui_0294>Civilians are enemies of players",
                key = 'enemy',
            },
            {
                text = "<LOC lobui_0295>Neutral",
                help = "<LOC lobui_0296>Civilians are neutral to players",
                key = 'neutral',
            },
            {
                text = "<LOC lobui_0297>None",
                help = "<LOC lobui_0298>No Civilians on the battlefield",
                key = 'removed',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0310>Prebuilt Units",
        help = "<LOC lobui_0311>Set whether the game starts with prebuilt units or not",
        key = 'PrebuiltUnits',
        pref = 'Lobby_Prebuilt_Units',
        ui_index = 9,
        values = {
            {
                text = "<LOC lobui_0312>Off",
                help = "<LOC lobui_0313>No prebuilt units",
                key = 'Off',
            },
            {
                text = "<LOC lobui_0314>On",
                help = "<LOC lobui_0315>Prebuilt units set",
                key = 'On',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0316>Delay Combat",
        help = "<LOC lobui_0317>Enforce No Rush rules for a certain period of time",
        key = 'NoRushOption',
        pref = 'Lobby_NoRushOption',
        ui_index = 4,
        values = {
            {
                text = "<LOC lobui_0318>Off",
                help = "<LOC lobui_0319>Rules not enforced",
                key = 'Off',
            },
			{
                text = "<LOC lobui_0320>2",
                help = "<LOC lobui_0321>Rules enforced for 2 mins",
                key = '2',
            },
            {
                text = "<LOC lobui_0322>4",
                help = "<LOC lobui_0323>Rules enforced for 4 mins",
                key = '4',
            },
            {
                text = "<LOC lobui_0324>6",
                help = "<LOC lobui_0325>Rules enforced for 6 mins",
                key = '6',
            },
			{
                text = "<LOC lobui_0326>8",
                help = "<LOC lobui_0327>Rules enforced for 8 mins",
                key = '8',
            },
            {
                text = "<LOC lobui_0328>10",
                help = "<LOC lobui_0329>Rules enforced for 10 mins",
                key = '10',
            },
			{
                text = "<LOC lobui_0330>12",
                help = "<LOC lobui_0325>Rules enforced for 12 mins",
                key = '12',
            },
			{
                text = "<LOC lobui_0331>14",
                help = "<LOC lobui_0332>Rules enforced for 14 mins",
                key = '14',
            },
			{
                text = "<LOC lobui_0333>16",
                help = "<LOC lobui_0334>Rules enforced for 16 mins",
                key = '16',
            },
			{
                text = "<LOC lobui_0335>18",
                help = "<LOC lobui_0336>Rules enforced for 18 mins",
                key = '18',
            },
			{
                text = "<LOC lobui_0337>20",
                help = "<LOC lobui_0338>Rules enforced for 20 mins",
                key = '20',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0397>Observers",
        help = "<LOC lobui_0398>Allows observers in the game",
        key = 'Observers',
        pref = 'Lobby_Observers',
        ui_index = 8,
        values = {
            {
                text = "<LOC lobui_0399>Allowed",
                help = "<LOC lobui_0400>Observers are allowed",
                key = 'Allowed',
            },
            {
                text = "<LOC lobui_0401>None",
                help = "<LOC lobui_0402>Observers are not allowed",
                key = 'None',
            },
        },
    },
    {
        default = 1,
        label = "<LOC lobui_0088>Starting Position",
        help = "<LOC lobui_0089>Determine what positions players spawn on the map",
        key = 'TeamSpawn',
        pref = 'Lobby_Team_Spawn',
        ui_index = 2,
        values = {
            {
                text = "<LOC lobui_0090>Random",
                help = "<LOC lobui_0091>Spawn everyone in random locations",
                key = 'random',
            },
            {
                text = "<LOC lobui_0092>Fixed",
                help = "<LOC lobui_0093>Spawn everyone in fixed locations (determined by slot)",
                key = 'fixed',
            },
        },
    },
}
