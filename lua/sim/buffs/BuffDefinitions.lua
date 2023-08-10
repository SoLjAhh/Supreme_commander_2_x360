-----------------------------------------------------------------------------
--  File     : /lua/sim/BuffAffects.lua
--  Author(s): Gordon Duclos, Eric Williamson
--  Summary  : Buff Blueprint definitions
--  Copyright © 2009 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------
import('/lua/sim/buffs/AdjacencyBuffs.lua')
import('/lua/sim/buffs/ResearchBuffDefinitions.lua')
import('/lua/sim/buffs/CheatBuffs.lua') -- Buffs for AI Cheating
import('/lua/sim/buffs/CampaignBuffs.lua') -- Campaign Difficulty Buffs

------------------------------------------------------------------
-- VETERANCY BUFFS
------------------------------------------------------------------
BuffBlueprint {
    Name = 'VETERANCYLEVEL01',
    DisplayName = 'VeterancyLevel01',
    BuffType = 'VETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.1, },
        HealthMax = { Mult = 0.1, },
        HealthRegen = { Mult = 0.25, },
    },
}

BuffBlueprint {
    Name = 'VETERANCYLEVEL02',
    DisplayName = 'VeterancyLevel02',
    BuffType = 'VETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.2, },
        HealthMax = { Mult = 0.2, },
        HealthRegen = { Mult = 0.5, },
    },
}

BuffBlueprint {
    Name = 'VETERANCYLEVEL03',
    DisplayName = 'VeterancyLevel03',
    BuffType = 'VETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.3, },
        HealthMax = { Mult = 0.3, },
        HealthRegen = { Mult = 0.75, },
    },
}

BuffBlueprint {
    Name = 'VETERANCYLEVEL04',
    DisplayName = 'VeterancyLevel04',
    BuffType = 'VETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.4, },
        HealthMax = { Mult = 0.4, },
        HealthRegen = { Mult = 1, },
    },
}

BuffBlueprint {
    Name = 'VETERANCYLEVEL05',
    DisplayName = 'VeterancyLevel05',
    BuffType = 'VETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.5, },
        HealthMax = { Mult = 0.5, },
        HealthRegen = { Mult = 1.25, },
    },
}

------------------------------------------------------------------
-- ACU VETERANCY BUFFS
------------------------------------------------------------------
BuffBlueprint {
    Name = 'ACUVETERANCYLEVEL01',
    DisplayName = 'ACUVeterancyLevel01',
    BuffType = 'ACUVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.2, },
        HealthMax = { Mult = 0.2, },
        HealthRegen = { Mult = 0.5, },
    },
}

BuffBlueprint {
    Name = 'ACUVETERANCYLEVEL02',
    DisplayName = 'ACUVeterancyLevel02',
    BuffType = 'ACUVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.4, },
        HealthMax = { Mult = 0.4, },
        HealthRegen = { Mult = 1, },
    },
}

BuffBlueprint {
    Name = 'ACUVETERANCYLEVEL03',
    DisplayName = 'ACUVeterancyLevel03',
    BuffType = 'ACUVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.6 },
        HealthMax = { Mult = 0.6, },
        HealthRegen = { Mult = 1.5, },
    },
}

BuffBlueprint {
    Name = 'ACUVETERANCYLEVEL04',
    DisplayName = 'ACUVeterancyLevel04',
    BuffType = 'ACUVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.8, },
        HealthMax = { Mult = 0.8, },
        HealthRegen = { Mult = 2, },
    },
}

BuffBlueprint {
    Name = 'ACUVETERANCYLEVEL05',
    DisplayName = 'ACUVeterancyLevel05',
    BuffType = 'ACUVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 1, },
        HealthMax = { Mult = 1, },
        HealthRegen = { Mult = 2.5, },
    },
}

------------------------------------------------------------------
-- FACTORY VETERANCY BUFFS - BUILD RATE AND BUILD COSTS
------------------------------------------------------------------
BuffBlueprint {
    Name = 'FACTORYVETERANCYLEVEL01',
    DisplayName = 'FactoryVeterancyLevel01',
    BuffType = 'FACTORYVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        BuildTime = { Mult = -0.1, },
        BuildCostMass = { Mult = -0.1, },
        BuildCostEnergy = { Mult = -0.1, },
    },
}

BuffBlueprint {
    Name = 'FACTORYVETERANCYLEVEL02',
    DisplayName = 'FactoryVeterancyLevel02',
    BuffType = 'FACTORYVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        BuildTime = { Mult = -0.2, },
        BuildCostMass = { Mult = -0.2, },
        BuildCostEnergy = { Mult = -0.2, },
    },
}

BuffBlueprint {
    Name = 'FACTORYVETERANCYLEVEL03',
    DisplayName = 'FactoryVeterancyLevel03',
    BuffType = 'FACTORYVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        BuildTime = { Mult = -0.3, },
        BuildCostMass = { Mult = -0.3, },
        BuildCostEnergy = { Mult = -0.3, },
    },
}

BuffBlueprint {
    Name = 'FACTORYVETERANCYLEVEL04',
    DisplayName = 'FactoryVeterancyLevel04',
    BuffType = 'FACTORYVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        BuildTime = { Mult = -0.4, },
        BuildCostMass = { Mult = -0.4, },
        BuildCostEnergy = { Mult = -0.4, },
    },
}

BuffBlueprint {
    Name = 'FACTORYVETERANCYLEVEL05',
    DisplayName = 'FactoryVeterancyLevel05',
    BuffType = 'FACTORYVETERANCYLEVEL',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        BuildTime = { Mult = -0.5, },
        BuildCostMass = { Mult = -0.5, },
        BuildCostEnergy = { Mult = -0.5, },
    },
}

------------------------------------------------------------------
-- MISCELANEOUS BUFFS
------------------------------------------------------------------
BuffBlueprint {
    Name = 'Hunker',
    DisplayName = 'Hunker',
    BuffType = 'HUNKER',
    Stacks = 'NEVER',
    Duration = -1,
    Affects = {
        DamageReduction = {
            Mult = -0.40,
        },
    },
}

BuffBlueprint {
    Name = 'ACUHunker',
    DisplayName = 'ACUHunker',
    BuffType = 'ACUHUNKER',
    Stacks = 'NEVER',
    Duration = -1,
    Affects = {
        DamageReduction = {
            Mult = -0.40,
        },
    },
}

BuffBlueprint {
    Name = 'HardenArtillery',
    DisplayName = 'Harden Artillery',
    BuffType = 'HARDENARTILLERY',
    Stacks = 'NEVER',
    Duration = -1,
    Affects = {
    	Damage = { Mult = 0.5, },
        HealthMax = { Mult = 0.5, },
        HealthRegen = { Mult = 1.25, },
    },
}

BuffBlueprint {
    Name = 'DisruptorStation',
    DisplayName = 'Disruptor Station',
    BuffType = 'DISRUPTORSTATION',
    Stacks = 'NEVER',
    Duration = -1,
    Affects = {
    	StunChance = { Add = 37.5, },
        StunDuration = { Add = 5.0 },
    },
}

BuffBlueprint {
    Name = 'SpeedReducingMegaArmor',
    DisplayName = 'Speed Reducing Mega-Armor',
    BuffType = 'SPEEDREDUCINGMEGAARMOR',
    Stacks = 'NEVER',
    Duration = -1,
    Affects = {
    	MoveSpeed = { Mult = -0.8, },
        HealthMax = { Mult = 1.5, },
    },
}
-- prototype electroshock ability for AI by SoLjA
BuffBlueprint {
    Name = 'ElectroShockAbility',
    DisplayName = 'Electro Shock Ability',
    BuffType = 'ELECTROSHOCKABILITY',
    Stacks = 'NEVER',
    Duration = -1,
    Affects = {
    	StunChance = { Add = 37.5, },
        StunDuration = { Add = 5.0 },
    },
}

BuffBlueprint {
    Name = 'RadarOverdrive',
    DisplayName = 'Radar Overdrive',
    BuffType = 'RADAROVERDRIVE',
    Stacks = 'NEVER',
    Duration = -1,
    Affects = {
    	RadarRadius = { Mult = 0.75, },
        VisionRadius = { Mult = 10, },
    },
}

BuffBlueprint {
    Name = 'ProtobrainExperience',
    DisplayName = 'Increased Experience Gain',
    BuffType = 'PROTOBRAINEXPERIENCE',
    Stacks = 'REPLACE',
    Duration = 8,
    Affects = {
        ExperienceGain = {
            Mult = 3.0,
        },
    },
}

BuffBlueprint {
    Name = 'ArmorEnhancement',
    DisplayName = 'Increased Armor',
    BuffType = 'ARMORENHANCEMENT',
    Stacks = 'REFRESH',
    Duration = 4,
    Affects = {
        HealthMax = {
            Mult = 0.2,
        },
    },
}

BuffBlueprint {
    Name = 'ArmorEnhancementColossus',
    DisplayName = 'Increased Armor',
    BuffType = 'ARMORENHANCEMENTCOLOSSUS',
    Stacks = 'REFRESH',
    Duration = 4,
    Affects = {
        HealthMax = {
            Mult = 0.25,
        },
    },
}

-- Default jump movement speed increase buff
BuffBlueprint {
    Name = 'JumpMoveSpeedIncrease01',
    DisplayName = 'Increased Move Speed',
    BuffType = 'JUMPMOVESPEEDINCREASE01',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        MoveSpeed = {
            Mult = 1.0,
        },
    },
}

-- Commander jump movement speed increase buff
BuffBlueprint {
    Name = 'JumpMoveSpeedIncrease02',
    DisplayName = 'Increased Move Speed',
    BuffType = 'JUMPMOVESPEEDINCREASE02',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        MoveSpeed = {
            Mult = 1.0,
        },
    },
}

BuffBlueprint {
    Name = 'HealingNaniteCloudBuff',
    DisplayName = 'Increase Regeneration',
    BuffType = 'HEALINGNANITECLOUD',
    Stacks = 'REPLACE',
    Duration = 5,
    Affects = {
        HealthRegen = {
            Mult = 3,
        },
    },
}

-- Super smart proto brain buff
BuffBlueprint {
    Name = 'ProtoBrainSuperSmart01',
    DisplayName = 'Increased Research production.',
    BuffType = 'PROTOBRAINSUPERSMART01',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        ResearchProduction = {
            Mult = 1,
        },
    },
}

BuffBlueprint {
    Name = 'CybranLandMoveSpeedRedux01',
    DisplayName = 'Lowers Cybran Ship Movement on Land',
    BuffType = 'CYBRANLANDMOVESPEEDREDUX01',
    Stacks = 'REPLACE',
    Duration = -1,
    Affects = {
        MoveSpeed = {
            Mult = -0.5,
        },
    },
}
__moduleinfo.auto_reload = true