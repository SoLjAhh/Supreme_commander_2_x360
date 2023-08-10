-- Copyright © 2023 Gas Powered Games, Inc.  All rights reserved.
-- Modified by SOLJA

-- This is the user-side session specific top-level lua initialization
-- file.  It is loaded into a fresh lua state when a new session is
-- initialized.

-- Do global init
doscript '/lua/userInit.lua'

-- Add UI-only mods to the list of mods to use
for i,m in ipairs(import('/lua/system/Mods.lua').GetUiMods()) do
    table.insert(__active_mods, m)
end

LOG('Active mods in session: ',repr(__active_mods))

doscript '/lua/UserSync.lua'

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
			LOG("Active User mods for Session:  ",repr(active_mod))
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