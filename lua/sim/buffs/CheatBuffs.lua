--****************************************************************************
--**
--**  File     :  /lua/sim/CheatBuffs.lua
--**  RE-EDIT BY SoLjA
--**  Copyright © 2022 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************
-- Easy
BuffBlueprint {
    Name = 'CheatBuffSet',
    DisplayName = 'CheatBuffSet',
    BuffType = 'CHEATBUFFSET',
    Stacks = 'ALWAYS',
    Duration = -1,
    Affects = {
        BuildRate = {
            Mult = -0.25,
        },
        ExperienceGain = {
            Mult = 0.0,
        },
    },
}

-- Medium
BuffBlueprint {
    Name = 'CheatBuffSet01',
    DisplayName = 'CheatBuffSet01',
    BuffType = 'CHEATBUFFSET',
    Stacks = 'ALWAYS',
    Duration = -1,
    Affects = {
        BuildRate = {
            Mult = 0.0,
        },
	    ExperienceGain = {
            Mult = 0.0,
        },
        --RadarRadius = {
        --    Mult = 0,
        --},
    },
}

-- Normal
BuffBlueprint {
    Name = 'CheatBuffSet02',
    DisplayName = 'CheatBuffSet02',
    BuffType = 'CHEATBUFFSET',
    Stacks = 'ALWAYS',
    Duration = -1,
    Affects = {
        BuildRate = {
            Mult = 0,
        },
        --RadarRadius = {
        --    Mult = 0.75,
        --},
    },
}

-- Hard
BuffBlueprint {
    Name = 'CheatBuffSet03',
    DisplayName = 'CheatBuffSet02',
    BuffType = 'CHEATBUFFSET',
    Stacks = 'ALWAYS',
    Duration = -1,
    Affects = {
        BuildRate = {
            Mult = 0.5,
        },
        --RadarRadius = {
        --    Mult = 1.5,
        --},
        --VisionRadius = {
        --    Mult = 1.0,
        --},
        VeterancyLevel = {
            Add = 0.25,
        },
    },
}

-- Cheat
BuffBlueprint {
    Name = 'CheatBuffSet04',
    DisplayName = 'CheatBuffSet04',
    BuffType = 'CHEATBUFFSET',
    Stacks = 'ALWAYS',
    Duration = -1,
    Affects = {
        BuildRate = {
            Mult = 0.75,
        },
        VeterancyLevel = {
            Add = 1.0,
        },
        --RadarRadius = {
        --    Mult = 3.0,
        --},
        --VisionRadius = {
        --    Mult = 2.0,
        --},
    },
}