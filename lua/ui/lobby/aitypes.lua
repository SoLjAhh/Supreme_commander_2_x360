--*****************************************************************************
--* File: lua/modules/ui/lobby/aitypes.lua
--* Author: Chris Blackwell
--* Modder: SoLjA
--* Summary: Contains a list of AI types and names for the game
--* 43 different AI types ranging from Easy to Cheat (Land, Air, Naval, 
--* Random, NoTrans, Balanced, Rush & Turtle). Added Supreme Commander 1 & Forged 
--* Alliance AI archetypes. Intel Type Presets added for xbox 360.
--* Copyright © 2022 Gas Powered Games, Inc. All rights reserved.
--*****************************************************************************
aitypes = {
    --*****************************************************************************
    --*  Easy
    --*****************************************************************************
    {
        key = 'easy',
        name = '<LOC lobui_0347>EasyAI: Archetype(Random)'
    },
    {
        key = 'easyair',
        name = '<LOC lobui_0346>EasyAI: Archetype(Air)'
    },
    {
        key = 'easybalanced',
        name = '<LOC lobui_0345>EasyAI: Archetype(Balanced)'
    },
    {
        key = 'easyland',
        name = '<LOC lobui_0344>EasyAI: Archetype(Land)'
    },
    {
        key = 'easynotrans',
        name = '<LOC lobui_0343>EasyAI: Archetype(NoTrans)'
    },
    {
        key = 'easynaval',
        name = '<LOC lobui_0342>EasyAI: Archetype(Naval)'
    },
    {
        key = 'easyrush',
        name = '<LOC lobui_0341>EasyAI: Archetype(Rush)'
    },
    {
        key = 'easyturtle',
        name = '<LOC lobui_0340>EasyAI: Archetype(Turtle)'
    },
    --*****************************************************************************
    --*  Medium
    --*****************************************************************************
    {
        key = 'medium',
        name = '<LOC lobui_0339>MediumAI: Archetype(Random)'
    },
    {
        key = 'mediumair',
        name = '<LOC lobui_0338>MediumAI: Archetype(Air)'
    },
    {
        key = 'mediumbalanced',
        name = '<LOC lobui_0337>MediumAI: Archetype(Balanced)'
    },
    {
        key = 'mediumland',
        name = '<LOC lobui_0336>MediumAI: Archetype(Land)'
    },
    {
        key = 'mediumnotrans',
        name = '<LOC lobui_0335>MediumAI: Archetype(NoTrans)'
    },
    {
        key = 'mediumnaval',
        name = '<LOC lobui_0334>MediumAI: Archetype(Naval)'
    },
    {
        key = 'mediumrush',
        name = '<LOC lobui_0333>MediumAI: Archetype(Rush)'
    },
    {
        key = 'mediumturtle',
        name = '<LOC lobui_0332>MediumAI: Archetype(Turtle)'
    },
    --*****************************************************************************
    --*  Normal
    --*****************************************************************************	
    {
        key = 'normal',
        name = '<LOC lobui_0331>NormalAI: Archetype(Random)'
    },
    {
        key = 'normalair',
        name = '<LOC lobui_0330>NormalAI: Archetype(Air)'
    },
    {
        key = 'normalbalanced',
        name = '<LOC lobui_0329>NormalAI: Archetype(Balanced)'
    },
    {
        key = 'normalland',
        name = '<LOC lobui_0328>NormalAI: Archetype(Land)'
    },
    {
        key = 'normalnotrans',
        name = '<LOC lobui_0327>NormalAI: Archetype(NoTrans)'
    },
    {
        key = 'normalnaval',
        name = '<LOC lobui_0326>NormalAI: Archetype(Naval)'
    },
    {
        key = 'normalrush',
        name = '<LOC lobui_0325>NormalAI: Archetype(Rush)'
    },
    {
        key = 'normalturtle',
        name = '<LOC lobui_0324>NormalAI: Archetype(Turtle)'
    },
    --*****************************************************************************
    --*  Hard
    --*****************************************************************************
    {
        key = 'hard',
        name = '<LOC lobui_0323>HardAI: Archetype(Random)'
    },
    {
        key = 'hardair',
        name = '<LOC lobui_0322>HardAI: Archetype(Air)'
    },
    {
        key = 'hardbalanced',
        name = '<LOC lobui_0321>HardAI: Archetype(Balanced)'
    },
    {
        key = 'hardland',
        name = '<LOC lobui_0320>HardAI: Archetype(Land)'
    },
    {
        key = 'hardnotrans',
        name = '<LOC lobui_0319>HardAI: Archetype(NoTrans)'
    },
    {
        key = 'hardnaval',
        name = '<LOC lobui_0318>HardAI: Archetype(Naval)'
    },
    {
        key = 'hardrush',
        name = '<LOC lobui_0317>HardAI: Archetype(Rush)'
    },
    {
        key = 'hardturtle',
        name = '<LOC lobui_0316>HardAI: Archetype(Turtle)'
    },
    --*****************************************************************************
    --*  Cheat
    --*****************************************************************************	
    {
        key = 'cheat',
        name = '<LOC lobui_0315>CheatAI: Archetype(Random)'
    },
    {
        key = 'cheatair',
        name = '<LOC lobui_0314>CheatAI: Archetype(Air)'
    },
    {
        key = 'cheatbalanced',
        name = '<LOC lobui_0313>CheatAI: Archetype(Balanced)'
    },
    {
        key = 'cheatland',
        name = '<LOC lobui_0312>CheatAI: Archetype(Land)'
    },
    {
        key = 'cheatnotrans',
        name = '<LOC lobui_0311>CheatAI: Archetype(NoTrans)'
    },
    {
        key = 'cheatnaval',
        name = '<LOC lobui_0310>CheatAI: Archetype(Naval)'
    },
    {
        key = 'cheatrush',
        name = '<LOC lobui_0309>CheatAI: Archetype(Rush)'
    },
    {
        key = 'cheatturtle',
        name = '<LOC lobui_0308>CheatAI: Archetype(Turtle)'
    },
    --*****************************************************************************
    --*  Supreme Commander 1 & Forged Alliance AI
    --*****************************************************************************	
    {
        key = 'supreme',
        name = '<LOC lobui_0307>SC1/FA_AI: Archetype(Supreme)'
    },
    {
        key = 'horde',
        name = '<LOC lobui_0306>SC1/FA_AI: Archetype(Horde)'
    },
    {
        key = 'tech',
        name = '<LOC lobui_0305>SC1/FA_AI: Archetype(Tech)'
    },
}
aioptions = {
	--	**********************
	--	* Preset AI Types
	--	**********************
    {
		catname = "<LOC lobui_0440>AI Types",
		{
			{
				reloadrequest = 'default',
				name = "<LOC lobui_0439>AI Profile",
				key = 'aitype',
				preset = true,
				type = "ECAIT_Selection",
				default = {1, 2, 3, 4, 5, 6, 7, 8},
				selectionkeys = {
					"easy",
					"medium",
					"normal",
					"hard",
					"cheat",
					"supreme",
					"horde",
					"tech",
				},	
				selections = {
					"<LOC lobui_0438>easy",
					"<LOC lobui_0437>medium",
					"<LOC lobui_0436>normal",
					"<LOC lobui_0435>hard",
					"<LOC lobui_0434>cheat",					
					"<LOC lobui_0433>supreme",
					"<LOC lobui_0432>horde",
					"<LOC lobui_0431>tech",
				},			
			},
		},
	},
	--	**********************
	--	* Preset AI Behavior
	--	**********************
	{
		catname = "<LOC lobui_0430>Behavior",
		{
			{
				name = "<LOC lobui_0429>Intel",
				key = 'aiintel',
				preset = true,
				type = "ECAIT_Selection",
				default = {1, 1, 1, 2, 3, 1, 1, 2},
				selectionkeys = {
					"None",
					"Radar",
					"LOS",
				},	
				selections = {
					"<LOC lobui_0428>No Bonus",
					"<LOC lobui_0427>Full Map Radar Only",
					"<LOC lobui_0426>Full Map Visibility",
				},	
			},
		},
	},
}