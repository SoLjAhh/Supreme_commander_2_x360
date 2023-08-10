-- Note that the order here will determine the faction index
-- (it is the automatically assigned array index)
Factions = {
    {
        Key = 'uef',
        Category = 'United Earth Federation', --'UEF',
        DisplayName = "(SC2) United Earth Federation",
        SoundPrefix = 'UEF',
        InitialUnit = 'UUL0001',
        --AdditionalInitialUnits = { 'UUL0002', 'UUL0002',},
        CampaignFileDesignator = 'E',
        TransmissionLogColor = 'ff00c1ff',
        Icon = "/widgets/faction-icons-alpha_bmp/uef_ico.dds",
        VeteranIcon = "/game/veteran-logo_bmp/uef-veteran_bmp.dds",
        SmallIcon = "/faction_icon-sm/uef_ico.dds",
        LargeIcon = "/faction_icon-lg/uef_ico.dds",
        TooltipID = 'lob_uef',
        DefaultSkin = 'uef',
        loadingMovie = '/movies/UEF_Campaign.sfd',
        loadingColor = 'FFbadbdb',
        loadingTexture = '/UEF_load.dds',
        IdleEngTextures = {
            T1 = '/icons/units/uul0002_icon.dds',
            T2 = '/icons/units/uul0002_icon.dds',
            T2F = '/icons/units/uul0002_icon.dds',
            T3 = '/icons/units/uul0002_icon.dds',
            SCU = '/icons/units/uul0001_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/icons/units/uub0001_icon.dds',
                '/icons/units/uub0001_icon.dds',
                '/icons/units/uub0001_icon.dds',
            },
            AIR = {
                '/icons/units/uub0002_icon.dds',
                '/icons/units/uub0002_icon.dds',
                '/icons/units/uub0002_icon.dds',
            },
            NAVAL = {
                '/icons/units/uub0003_icon.dds',
                '/icons/units/uub0003_icon.dds',
                '/icons/units/uub0003_icon.dds',
            },
        },
    },
    {
        Key = 'cybran',
        Category = 'CYBRAN',
        DisplayName = "(SC2) Cybran Nation",
        SoundPrefix = 'Cybran',
        InitialUnit = 'UCL0001',
        --AdditionalInitialUnits = { 'UCL0002', 'UCL0002',},
        CampaignFileDesignator = 'R',
        TransmissionLogColor = 'ff89d300',
        Icon = "/widgets/faction-icons-alpha_bmp/cybran_ico.dds",
        VeteranIcon = "/game/veteran-logo_bmp/cybran-veteran_bmp.dds",
        SmallIcon = "/faction_icon-sm/cybran_ico.dds",
        LargeIcon = "/faction_icon-lg/cybran_ico.dds",
        TooltipID = 'lob_cybran',
        DefaultSkin = 'cybran',
        loadingMovie = '/movies/Cybran_Campaign.sfd',
        loadingColor = 'FFe24f2d',
        loadingTexture = '/cybran_load.dds',
        IdleEngTextures = {
            T1 = '/icons/units/ucl0002_icon.dds',
            T2 = '/icons/units/ucl0002_icon.dds',
            T3 = '/icons/units/ucl0002_icon.dds',
            SCU = '/icons/units/ucl0001_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/icons/units/ucb0001_icon.dds',
                '/icons/units/ucb0001_icon.dds',
                '/icons/units/ucb0001_icon.dds',
            },
            AIR = {
                '/icons/units/ucb0002_icon.dds',
                '/icons/units/ucb0002_icon.dds',
                '/icons/units/ucb0002_icon.dds',
            },
            NAVAL = {
                '/icons/units/ucb0003_icon.dds',
                '/icons/units/ucb0003_icon.dds',
                '/icons/units/ucb0003_icon.dds',
            },
        },
    },
    {
        Key = 'illuminate',
        Category = 'ILLUMINATE',
        DisplayName = "(SC2) Aeon Illuminate",
        SoundPrefix = 'Illuminate',
        InitialUnit = 'UIL0001',
        --AdditionalInitialUnits = { 'UIL0002', 'UIL0002',},
        CampaignFileDesignator = 'S',
        TransmissionLogColor = 'ff00FF00',
        Icon = "/widgets/faction-icons-alpha_bmp/illuminate_ico.dds",
        VeteranIcon = "/game/veteran-logo_bmp/illuminate-veteran_bmp.dds",
        SmallIcon = "/faction_icon-sm/illuminate_ico.dds",
        LargeIcon = "/faction_icon-lg/illuminate_ico.dds",
        TooltipID = 'lob_illuminate',
        DefaultSkin = 'illuminate',
        loadingMovie = '/movies/Ill_Campaign.sfd',
        loadingColor = 'FFffd700',
        loadingTexture = '/illuminate_load.dds',
        IdleEngTextures = {
            T1 = '/icons/units/uil0002_icon.dds',
            T2 = '/icons/units/uil0002_icon.dds',
            T3 = '/icons/units/uil0002_icon.dds',
            SCU = '/icons/units/uil0001_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/icons/units/uib0001_icon.dds',
                '/icons/units/uib0001_icon.dds',
                '/icons/units/uib0001_icon.dds',
            },
            AIR = {
                '/icons/units/uib0002_icon.dds',
                '/icons/units/uib0002_icon.dds',
                '/icons/units/uib0002_icon.dds',
            },
            NAVAL = {
                '/icons/units/uib0003_icon.dds',
                '/icons/units/uib0003_icon.dds',
                '/icons/units/uib0003_icon.dds',
            },
        },
    },
}

-- map faction key to index, as this lookup is done frequently
FactionIndexMap = {}

-- file designator to faction key
FactionDesToKey = {}

for index, value in Factions do
    FactionIndexMap[value.Key] = index
    FactionDesToKey[value.CampaignFileDesignator] = value.Key
end