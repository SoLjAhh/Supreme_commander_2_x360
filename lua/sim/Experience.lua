-----------------------------------------------------------------------------
--  File     : /lua/sim/Experience.lua
--  Author(s): Gordon Duclos, Eric Williamson
--  Summary  : Global experience table
--  Copyright © 2009 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------

Experience = {
	default = {
		-- Experience needed to reach level [X]
		ExperienceToLevel = {
			 1000,	-- 1
			 2000,	-- 2
			 3000,	-- 3
			 4000,	-- 4
			 5000,	-- 5
		},
		-- Rewards given to unit upon reaching level [X]
		-- Currently supports applying a singular buff. A single buff definition supports n number of
		-- awards, so one definition is all that is required here.
		-- This can easily extended to support other rewards other than buffs, e.g. anything our
		-- research tree is doing currently.
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	ACU = {
		ExperienceToLevel = {
			 5000,	-- 1
			 10000,	-- 2
			 15000,	-- 3
			 20000,	-- 4
			 25000,	-- 5
		},
		LevelRewards = {
			{	Buff = 'ACUVETERANCYLEVEL01',	},	-- 1
			{	Buff = 'ACUVETERANCYLEVEL02',	},	-- 2
			{	Buff = 'ACUVETERANCYLEVEL03',	},	-- 3
			{	Buff = 'ACUVETERANCYLEVEL04',	},	-- 4
			{	Buff = 'ACUVETERANCYLEVEL05',	},	-- 5
		},
	},
	AIRFACTORY = {
        ExperienceToLevel = {
			 14,	-- 1
			 32,	-- 2
			 54,	-- 3
			 80,	-- 4
			 110,	-- 5
        },
        LevelRewards = {
            { Buff = 'FACTORYVETERANCYLEVEL01'},  -- 1
            { Buff = 'FACTORYVETERANCYLEVEL02'},  -- 2
            { Buff = 'FACTORYVETERANCYLEVEL03'},  -- 3
            { Buff = 'FACTORYVETERANCYLEVEL04'},  -- 4
            { Buff = 'FACTORYVETERANCYLEVEL05'},  -- 5
        },
    },
    FACTORY = {
        ExperienceToLevel = {
			 14,	-- 1
			 32,	-- 2
			 54,	-- 3
			 80,	-- 4
			 110,	-- 5
        },
        LevelRewards = {
            { Buff = 'FACTORYVETERANCYLEVEL01'},  -- 1
            { Buff = 'FACTORYVETERANCYLEVEL02'},  -- 2
            { Buff = 'FACTORYVETERANCYLEVEL03'},  -- 3
            { Buff = 'FACTORYVETERANCYLEVEL04'},  -- 4
            { Buff = 'FACTORYVETERANCYLEVEL05'},  -- 5
        },
    },
    NAVALFACTORY = {
        ExperienceToLevel = {
			 7,  	-- 1
			 16,	-- 2
			 27,	-- 3
			 40,	-- 4
			 55,	-- 5
        },
        LevelRewards = {
            { Buff = 'FACTORYVETERANCYLEVEL01'},  -- 1
            { Buff = 'FACTORYVETERANCYLEVEL02'},  -- 2
            { Buff = 'FACTORYVETERANCYLEVEL03'},  -- 3
            { Buff = 'FACTORYVETERANCYLEVEL04'},  -- 4
            { Buff = 'FACTORYVETERANCYLEVEL05'},  -- 5
        },
    },
    GANTRY = {
        ExperienceToLevel = {
			 2,  	-- 1
			 5,		-- 2
			 9,		-- 3
			 14,	-- 4
			 20,	-- 5
        },
        LevelRewards = {
            { Buff = 'FACTORYVETERANCYLEVEL01'},  -- 1
            { Buff = 'FACTORYVETERANCYLEVEL02'},  -- 2
            { Buff = 'FACTORYVETERANCYLEVEL03'},  -- 3
            { Buff = 'FACTORYVETERANCYLEVEL04'},  -- 4
            { Buff = 'FACTORYVETERANCYLEVEL05'},  -- 5
        },
    },
	TANK = {
		ExperienceToLevel = {
			 250,	-- 1
			 500,	-- 2
			 750,	-- 3
			 1000,	-- 4
			 1250,	-- 5
		},
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	RANGED = {
		ExperienceToLevel = {
			 300,	-- 1
			 600,	-- 2
			 900,	-- 3
			 1200,	-- 4
			 1500,	-- 5
		},
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	TURRET = {
		ExperienceToLevel = {
			 750,	-- 1
			 1500,	-- 2
			 2250,	-- 3
			 3000,	-- 4
			 3750,	-- 5
		},
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	AIR = {
		ExperienceToLevel = {
			 450,	-- 1
			 900,	-- 2
			 1350,	-- 3
			 1800,	-- 4
			 2250,	-- 5
		},
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	NAVAL = {
		ExperienceToLevel = {
			 1000,	-- 1
			 2000,	-- 2
			 3000,	-- 3
			 4000,	-- 4
			 5000,	-- 5
		},
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	MINI = {
		ExperienceToLevel = {
			 4000,	-- 1
			 8000,	-- 2
			 12000,	-- 3
			 16000,	-- 4
			 20000,	-- 5
		},
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	MAJOR = {
		ExperienceToLevel = {
			 10000,	-- 1
			 20000,	-- 2
			 30000,	-- 3
			 40000,	-- 4
			 50000,	-- 5
		},
		LevelRewards = {
			{	Buff = 'VETERANCYLEVEL01',	},	-- 1
			{	Buff = 'VETERANCYLEVEL02',	},	-- 2
			{	Buff = 'VETERANCYLEVEL03',	},	-- 3
			{	Buff = 'VETERANCYLEVEL04',	},	-- 4
			{	Buff = 'VETERANCYLEVEL05',	},	-- 5
		},
	},
	EMPTY = {
		ExperienceToLevel = {
			 10000,	-- 1
		},
		LevelRewards = {
			{	},	-- 1
		},
	},
}
ResearchExperience = {
    -- Research Experience needed to reach level [x].
    -- Cumulative
    ExperienceToLevel = {
        5000,   -- 1
        10000,  -- 2
        15000,  -- 3
        20000,  -- 4
        25000,  -- 5
    },
    -- Multiplier used to convert Unit Experience to Research Points.
    LevelMultiplier = {
        0.0006,		-- 1
        0.00045,	-- 2
        0.0003,		-- 3
        0.000225,	-- 4
        0.00015,	-- 5
    },
}