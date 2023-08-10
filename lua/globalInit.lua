-- Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
--
-- This is the top-level lua initialization file. It is run at initialization time
-- to set up all lua state.

-- Uncomment this to turn on allocation tracking, so that memreport() in /lua/system/profile.lua
-- does something useful.
-- debug.trackallocations(true)

-- Set up global diskwatch table (you can add callbacks to it to be notified of disk changes)
__diskwatch = {}

--====================================================================================
-- re-enable native mod support
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
			LOG("Active User mods globalinit:  ",repr(active_mod))
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

-- Set up custom Lua weirdness
doscript '/lua/system/config.lua'

-- Load system modules
doscript '/lua/system/import.lua'
doscript '/lua/system/utils.lua'
doscript '/lua/system/class.lua'
doscript '/lua/system/trashbag.lua'
doscript '/lua/system/Localization.lua'
doscript '/lua/system/callback.lua'

--
-- Classes exported from the engine are in the 'moho' table. But they aren't full
-- classes yet, just lists of exported methods and base classes. Turn them into
-- real classes.
--
for name,cclass in moho do
    --SPEW('C->lua ',name)
    ConvertCClassToLuaClass(cclass)
end

InitialRegistration = true

-- Load blueprint systems
doscript '/lua/system/BuffBlueprints.lua'

-- Load army bonus systems
doscript '/lua/system/ArmyBonusBlueprints.lua'

-- Load buff definitions
import( '/lua/sim/buffs/BuffDefinitions.lua')

-- Load army bonus definitions
import( '/lua/sim/buffs/ArmyBonusDefinitions.lua' )

-- Load Platoon Template systems
doscript '/lua/system/GlobalPlatoonTemplate.lua'

-- Load Builder system
doscript '/lua/system/GlobalBuilderTemplate.lua'

-- Load Builder Group systems
doscript '/lua/system/GlobalBuilderGroup.lua'

-- Load Global Base Templates
doscript '/lua/system/GlobalBaseTemplate.lua'

InitialRegistration = false