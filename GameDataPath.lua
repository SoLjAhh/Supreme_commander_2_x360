-- xbox 360 GameDataPath.lua Mod by SoLjA
-- useful functions: 
-- WaitTicks(1) --this function pauses a thread for the a specific amount of seconds
-- continue -- this function just continues what ever code is before it.
--import('/lua/system/config.lua').modsupport()
-- upvalued performance
__diskwatch = {}

local dofile = dofile

local StringFind = string.find 
local StringGsub = string.gsub
local StringSub = string.sub
local StringLower = string.lower

local IoDir = io.dir

local TableInsert = table.insert
local TableGetn = table.getn

-- read by the engine to determine where to find assets
path = { }

-- read by the engine to determine hook folders
hook = { 
}

-- read by the engine to determine supported protocols
protocols = {
    "http",
    "https",
    "mailto",
    "ventrilo",
    "teamspeak",
    "daap",
    "im"
}

-- read by the engine to determine cached scd files
cachedFiles = {
    "/gamedata/*.scd"
}

-- upvalued for performance
local OrigPath = path 
local NewPath = 1

-- Lowers the strings of a hash-based table, crashes when other type of keys are used (integers, for example)
local function LowerHashTable(t)
    local o = {}
    for k, v in t do 
        o[StringLower(k)] = v 
    end
    return o
end

local function FindFilesWithExtension(dir, extension, prepend, files)
    files = files or { }
    for k, file in IoDir(dir .. '\\*') do
        if not (file == '.' or file == '..') then
            if StringSub(file, -3) == extension then
                TableInsert(files, prepend .. '/' .. file)
            end
            FindFilesWithExtension(dir .. '\\' .. file, extension, prepend .. '/' .. file, files)
        end
    end
    return files
end

-- mods that have been integrated, based on folder name 
local integratedMods = { }
integratedMods["z_mod"] = true
integratedMods = LowerHashTable(integratedMods)

-- take care that the folder name is properly spelled and Capitalized
-- deprecatedMods["Mod Folder Name"] = deprecation status
--   true: deprecated regardless of mod version
--   versionstring: lower or equal version numbers are deprecated, eg: "3.10"
local deprecatedMods = { }
-- mods that are deprecated, based on mod folder name
-- convert all mod folder name keys to lower case to prevent typos
deprecatedMods = LowerHashTable(deprecatedMods)

-- sc2 vanilla scd files
local allowedModsScd = {}
allowedModsScd["units.scd"] = true
allowedModsScd["textures.scd"] = true
allowedModsScd["props.scd"] = true
allowedModsScd["projectiles.scd"] = true
allowedModsScd["mods.scd"] = true
allowedModsScd["meshes.scd"] = true
allowedModsScd["lua.scd"] = true
allowedModsScd["loc_us.scd"] = true
allowedModsScd["env.scd"] = true
allowedModsScd["effects.scd"] = true
allowedModsScd["bp.scd"] = true
allowedModsScd["ui.scd"] = true
allowedModsScd["maps.scd"] = true
allowedModsScd["env.scd"] = true
allowedModsScd["uncompiled_lua.scd"] = true
allowedModsScd = LowerHashTable(allowedModsScd)

-- default wave banks to prevent collisions
local soundsBlocked = {}
local sc2Sounds = IoDir(InitFileDir .. 'sounds\\*')
for k, v in sc2Sounds do 
    if v == '.' or v == '..' then 
        continue 
    end
    soundsBlocked[StringLower(v)] = "SC2 installation"
end

-- default movie files to prevent collisions
local moviesBlocked = {}
local sc2Movies = IoDir(InitFileDir .. 'movies\\*')
for k, v in sc2Movies do 
    if v == '.' or v == '..' then 
        continue 
    end
    moviesBlocked[StringLower(v)] = "SC2 installation"
end

--- Mounts a directory or scd / zip file.
-- @param dir The absolute path to the directory
-- @param mountpoint The path to use in the game (e.g., /maps/...)
local function MountDirectory(dir, mountpoint)
    OrigPath[NewPath] = { 
        dir = dir, 
        mountpoint = mountpoint 
    }
    NewPath = NewPath + 1
end

--- Mounts all allowed content in a directory, including scd and zip files, directly.
-- @param dir The absolute path to the directory
-- @param mountpoint The path to use in the game (e.g., /maps/...)
local function MountAllowedContent(dir, mountpoint, allowedMods)
    for _,entry in IoDir(dir .. '\\*') do
        if entry != '.' and entry != '..' then
            local mp = StringLower(entry)
            if allowedMods[mp] then 
                MountDirectory(dir .. "\\" .. entry, '/')
            else 
                LOG("Prevented loading content that is not allowed: " .. entry)
            end
        end
    end
end

-- setup vanilla directories here
local datadir = InitFileDir .. 'gamedata\\'
local sc2_root = InitFileDir .. ''

-- toggle on/off the stupid toc.bdf file.
-- while off the game will pretty much allow all modding, SC1/FA style
-- were as if turned on, modding will requiring vanilla file editing.
-- note that while off there is a bug that is introduced when ever pressing the RT
-- so by defaukt this is left true until a different work around is found.
TOC_ROOT = false
TOC_OPTION = true

TOC_ROOT = TOC_OPTION
if TOC_ROOT then
	toc_root = sc2_root .. ''
end

--- Keep track of what maps are loaded to prevent collisions
local loadedMaps = { }

--- A helper function that loads in additional content for maps.
-- @param mountpoint The root folder to look for content in.
local function MountMapContent(dir)
	-- look for all directories / maps at the mount point
    for _, map in IoDir(dir .. '\\*') do
		-- prevent capital letters messing things up
        map = StringLower(map)
		
		-- do not do anything with the current / previous directory
        if map == '.' or map == '..' then
            continue 
        end
		
		-- do not load archives as maps
        local extension = StringSub(map, -3)
        if extension == ".zip" or extension == ".scd" or extension == ".rar" then
            LOG("Prevented loading a map inside a zip / scd / rar file: " .. dir .. "/" .. map)
            continue 
        end

		-- check if the folder contains map required map files
        local scenarioFile = false 
        local scmapFile = false 
        local saveFile = false 
        local scriptFile = false 
        for _, file in IoDir(dir .. "\\" .. map .. "\\*") do 
            if StringSub(file, -3) == '_scenario.lua' then 
                scenarioFile = file 
            elseif StringSub(file, -3) == '_script.lua' then 
                scriptFile = file 
            elseif StringSub(file, -3) == '_save.lua' then 
                saveFile = file 
            elseif StringSub(file, -3) == '.scmap' then 
                scmapFile = file 
            end
        end

		-- check if it has a scenario file
        if not scenarioFile then 
            LOG("Prevented loading a map with no scenario file: " .. dir .. "/" .. map)
            continue 
        end

		-- check if it has a scmap file
        if not scmapFile then 
            LOG("Prevented loading a map with no scmap file: " .. dir .. "/" .. map)
            continue 
        end

		-- check if it has a save file
        if not saveFile then 
            LOG("Prevented loading a map with no save file: " .. dir .. "/" .. map)
            continue 
        end
		
		-- check if it has a script file
        if not scriptFile then 
            LOG("Prevented loading a map with no script file: " .. dir .. "/" .. map)
            continue 
        end

        -- tried to load in the scenario file, but in all cases it pollutes the global scope and we can't have that
        -- do not load maps twice
        if loadedMaps[map] then 
            LOG("Prevented loading a map twice: " .. map)
            continue
        end

		-- consider this one loaded
        loadedMaps[map] = true 

		-- mount the map
        MountDirectory(dir .. "\\" .. map, "maps\\" .. map)
	
		-- look at each directory inside this map
        for _, folder in IoDir(dir .. '\\' .. map .. '\\*') do
		
			-- do not do anything with the current / previous directory
            if folder == '.' or folder == '..' then
                continue 
            end

            if folder == 'movies' then
				-- find conflicting files
                local conflictingFiles = {}
                for _, file in IoDir(dir .. '\\' .. map .. 'movies\\*') do
                    if not (file == '.' or file == '..') then 
                        local identifier = StringLower(file) 
                        if moviesBlocked[identifier] then 
                            TableInsert(conflictingFiles, { file = file, conflict = moviesBlocked[identifier] })
                        else 
                            moviesBlocked[identifier] = StringLower(map)
                        end
                    end
                end
                    
				-- report them if they exist and do not mount	
                if TableGetn(conflictingFiles) > 0 then 
                    LOG("Found conflicting movie banks for map: '" .. map .. "', cannot mount the movie bank(s):")
                    for k, v in conflictingFiles do 
                        LOG(" - Conflicting movie bank: '" .. v.file .. "' of map '" .. map .. "' is conflicting with a movie bank from: '" .. v.conflict .. "'" )
                    end
				-- else, mount folder
                else
                    LOG("Mounting movies of map: " .. map )
                    MountDirectory(dir .. "\\" .. map .. 'movies\\', '/movies')
                end
            elseif folder == 'sounds' then
				 -- find conflicting files
                local conflictingFiles = {}
                for _, file in IoDir(dir .. '\\' .. map .. 'sounds\\*') do
                    if not (file == '.' or file == '..') then 
                        local identifier = StringLower(file) 
                        if soundsBlocked[identifier] then 
                            TableInsert(conflictingFiles, { file = file, conflict = soundsBlocked[identifier] })
                        else 
                            soundsBlocked[identifier] = StringLower(map)
                        end
                    end
                end
                -- report them if they exist and do not mount
                if TableGetn(conflictingFiles) > 0 then 
                    LOG("Found conflicting sound banks for map: '" .. map .. "', cannot mount the sound bank(s):")
                    for k, v in conflictingFiles do 
                        LOG(" - Conflicting sound bank: '" .. v.file .. "' of map '" .. map .. "' is conflicting with a sound bank from: '" .. v.conflict .. "'" )
                    end
				-- else, mount folder
                else
                    LOG("Mounting sounds of map: " .. map )
                    MountDirectory(dir.. "\\" .. map .. 'sounds\\', '/sounds')
                end
            end
        end
    end
end

--- Parses a `major.minor` string into its numeric parts, where the minor portion is optional
---@param version string
---@return number major
---@return number? minor
local function ParseVersion(version)
    local major, minor
    local dot_pos1 = version:find('.', 1, true)
    if dot_pos1 then
        major = tonumber(version:sub(1, dot_pos1 - 1))
		-- we aren't looking for the build number, but we still need to be able to parse
		-- the minor number properly if it does exist
		local dot_pos2 = version:find('.', dot_pos1 + 1, true)
		if dot_pos2 then
			minor = tonumber(version:sub(dot_pos1 + 1, dot_pos2 - 1))
		else
			minor = tonumber(version:sub(dot_pos1 + 1))
		end
    else
        major = tonumber(version)
    end
    return major, minor
end

---@param majorA number
---@param minorA number | nil
---@param majorB number
---@param minorB number | nil
---@return number
local function CompareVersions(majorA, minorA, majorB, minorB)
    if majorA ~= majorB then
        return majorA - majorB
    end
    minorA = minorA or 0
    minorB = minorB or 0
    return minorA - minorB
end

--- Returns the version string found in the mod info file (which can be `nil`), or `false` if the
--- file cannot be read
---@param modinfo FileName
---@return string|nil | false
local function GetModVersion(modinfo)
    local handle = io.open(modinfo, 'rb')
    if not handle then
        return false -- can't read file
    end

    local _,version
    for line in handle:lines() do
        -- find the version
        _,_,version = line:find("^%s*version%s*=%s*v?([%d.]*)")
		if version then
            break -- stop if found
        end
    end

    handle:close()
    return version
end

--- keep track of what mods are loaded to prevent collisions
local loadedMods = { }

--- A helper function that loads in additional content for mods.
-- @param mountpoint The root folder to look for content in.
local function MountModContent(dir)
	-- get all directories / mods at the mount point
    for _, mod in IoDir(dir..'\\*.*') do
	
		-- prevent capital letters messing things up
        mod = StringLower(mod)
		
		-- do not do anything with the current / previous directory
        if mod == '.' or mod == '..' then
            continue 
        end
		
		local moddir = sc2_root .. '/' .. mod
		
		-- do not load integrated mods
        if integratedMods[mod] then 
            LOG("Prevented loading a mod that is integrated: " .. mod )
            continue 
        end 

		-- do not load archives as mods
        local extension = StringSub(mod, -3)
        if extension == ".zip" or extension == ".scd" or extension == ".rar" then
            LOG("Prevented loading a mod inside a zip / scd / rar file: " .. dir .. "/" .. mod)
            continue 
        end

		-- check if the folder contains a `mod_info.lua` file
        local modinfo_file = IoDir(moddir .. "/mod_info.lua")[1]
		
		 -- check if it has a scenario file
        if not modinfo_file then
            LOG("Prevented loading an invalid mod: " .. mod .. " does not have an info file: " .. moddir)
            continue
        end
        modinfo_file = moddir .. '/' .. modinfo_file

		-- do not load deprecated mods
        local deprecation_status = deprecatedMods[mod]
        if deprecation_status then
            if deprecation_status == true then
                -- deprecated regardless of version
                LOG("Prevented loading a deprecated mod: " .. mod)
                continue
            elseif type(deprecation_status) == "string" then
                -- depcreated only when the mod version is less than or equal to the deprecation version
                local mod_version = GetModVersion(modinfo_file)
                if mod_version == false then
                    LOG("Prevented loading a deprecated mod: " .. mod .. " does not have readable mod info (" .. modinfo_file .. ')')
                    continue
                end
                if mod_version == nil then
                    LOG("Prevented loading a deprecated mod version: " .. mod .. " does not specify a version number (must be higher than version " .. deprecation_status .. ')')
                    continue
                end
                local mod_major, mod_minor = ParseVersion(mod_version)
                local dep_major, dep_minor = ParseVersion(deprecation_status)
                if not mod_major or CompareVersions(mod_major, mod_minor, dep_major, dep_minor) <= 0 then
                    LOG("Prevented loading a deprecated mod version: " .. mod .. " version " .. mod_version .. " (must be higher than version " .. deprecation_status .. ')')
                    continue
                end
            end
        end
	    
		-- do not load mods twice
        if loadedMods[mod] then 
            LOG("Prevented loading a mod twice: " .. mod)
            continue
        end

		-- consider this one loaded
        loadedMods[mod] = true 

		-- mount the mod
        MountDirectory(dir .. "\\" .. mod, "mods\\" .. mod)

		-- look at each directory inside this mod
        for _, folder in IoDir(dir .. '\\' .. mod .. '\\*') do
            
			-- if we found a directory named 'sounds' then we mount its content
            if folder == 'sounds' then
				-- find conflicting files
                local conflictingFiles = { }
                for _, file in IoDir(dir .. '\\' .. mod .. 'sounds\\*') do
                    if not (file == '.' or file == '..') then 
                        local identifier = StringLower(file) 
                        if soundsBlocked[identifier] then 
                            TableInsert(conflictingFiles, { file = file, conflict = soundsBlocked[identifier] })
                        else 
                            soundsBlocked[identifier] = StringLower(mod)
                        end
                    end
                end
                   
				-- report them if they exist and do not mount
                if TableGetn(conflictingFiles) > 0 then 
                    LOG("Found conflicting sound banks for mod: '" .. mod .. "', cannot mount the sound bank(s):")
                    for k, v in conflictingFiles do 
                        LOG(" - Conflicting sound bank: '" .. v.file .. "' of mod '" .. mod .. "' is conflicting with a sound bank from: '" .. v.conflict .. "'" )
                    end
				-- else, mount folder
                else
                    LOG("Mounting sounds in mod: " .. mod )
                    MountDirectory(dir .. "\\" .. mod .. 'sounds\\', '/sounds')
                end
            end

			-- if we found a directory named 'custom-strategic-icons' then we mount its content
            if folder == 'custom-strategic-icons' then
                local mountLocation = '/textures/ui/common/game/strategicicons/' .. mod
                LOG('Found mod icons in ' .. mod .. ', mounted at: ' .. mountLocation)
                MountDirectory(dir .. '\\' .. mod .. 'custom-strategic-icons\\', mountLocation) 
            end

			-- if we found a file named 'custom-strategic-icons.scd' then we mount its content - good for performance when the number of icons is high
            if folder == 'custom-strategic-icons.scd' then 
                local mountLocation = '/textures/ui/common/game/strategicicons/' .. mod
                LOG('Found mod icon package in ' .. mod .. ', mounted at: ' .. mountLocation)
                MountDirectory(dir .. '\\' .. mod .. 'custom-strategic-icons.scd', mountLocation) 
            end
        end
    end
end

-- Clears out the shader cache as it takes a release to reset the shaders
local dir = SHGetFolderPath('LOCAL_APPDATA') .. 'Cache\\'
LOG('Clearing cached shader files in: ' .. dir)
for k,file in IoDir(dir .. '\\*') do
	if file != '.' and file != '..' then 
        os.remove(dir .. '\\' .. file)
    end
end

--- A helper function to load in all maps and mods on a given location.
-- @param path The root folder for the maps and mods
local function LoadVaultContent(sc2_root)
    -- load in additional things, like sounds and 
    MountMapContent(sc2_root .. '/maps')
    MountModContent(sc2_root .. '/mods')
end

MountAllowedContent(datadir, '*.scd', allowedModsScd)
MountDirectory(sc2_root .. '535107E3\\00000001', '/Game_prefs')
MountDirectory(sc2_root .. "movies\\", '/')
MountDirectory(sc2_root .. "sounds\\", '/')
MountDirectory(sc2_root .. "mods\\", '/')
MountDirectory(sc2_root .. "maps\\", '/')
MountDirectory(sc2_root .. "fonts\\", '/')
MountDirectory(sc2_root .. '', '/')