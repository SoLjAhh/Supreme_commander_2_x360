--------------------------------------------------------------------------
-- WARNING: THIS IS A CUSTOM MODIFIED FILE FOR SC2 JTAG/RGH
-- Please note that this file was modified by Mithy/Overrated/SoLjA.
-- Only edit this file if you know what your doing,
-- otherwise your changes will be lost.BACK UP UR FILES!!
--------------------------------------------------------------------------
--
-- Blueprint loading
--
--   During preloading of the map, we run loadBlueprints() from this file. It scans
--   the game directories and runs all .bp files it finds.
--
--   The .bp files call UnitBlueprint(), PropBlueprint(), etc. to define a blueprint.
--   All those functions do is fill in a couple of default fields and store off the
--   table in 'original_blueprints'.
--
--   Once that scan is complete, ModBlueprints() is called. It can arbitrarily mess
--   with the data in original_blueprints.
--
--   Finally, the engine registers all blueprints in original_blueprints to define the
--   "real" blueprints used by the game. A separate copy of these blueprints is made
--   available to the sim-side and user-side scripts.
--
-- How mods can affect blueprints
--
--   First, a mod can simply add a new blueprint file that defines a new blueprint.
--
--   Second, a mod can contain a blueprint with the same ID as an existing blueprint.
--   In this case it will completely override the original blueprint. Note that in
--   order to replace an original non-unit blueprint, the mod must set the "BlueprintId"
--   field to name the blueprint to be replaced. Otherwise the BlueprintId is defaulted
--   off the source file name. (Units don't have this problem because the BlueprintId is
--   shortened and doesn't include the original path).
--
--   Third, a mod can can contain a blueprint with the same ID as an existing blueprint,
--   and with the special field "Merge = true". This causes the mod to be merged with,
--   rather than replace, the original blueprint.
--
--   Finally, a mod can hook the ModBlueprints() function which manipulates the
--   blueprints table in arbitrary ways.
--      1. create a file /mod/s.../hook/system/Blueprints.lua
--      2. override ModBlueprints('all_bps' for PC and 'all_blueprints' for 360) 
--      in that file to manipulate the blueprints
--
-- Reloading of changed blueprints
--
--   When the disk watcher notices that a .bp file has changed, it calls
--   ReloadBlueprint() on it. ReloadBlueprint() repeats the above steps, but with
--   original_blueprints containing just the one blueprint.
--
--   Changing an existing blueprint is not 100% reliable; some changes will be picked
--   up by existing units, some not until a new unit of that type is created, and some
--   not at all. Also, if you remove a field from a blueprint and then reload, it will
--   default to its old value, not to 0 or its normal default.
--
 
local sub = string.sub
local gsub = string.gsub
local lower = string.lower
local getinfo = debug.getinfo
local here = getinfo(1).source
 
local original_blueprints
 
local function InitOriginalBlueprints()
    original_blueprints = {
        Mesh = {},
        Unit = {},
        Ability = {},
        Prop = {},
        Projectile = {},
        TrailEmitter = {},
        Emitter = {},
        Beam = {},
        SkirmishEngineer = {},
        SkirmishFactory = {},
        SkirmishForm = {},
        PlatoonBlueprint = {},
        SkirmishResponse = {},
        SkirmishBase = {},
        SkirmishArchetype = {},
        AnimTree = {},
        RawAnim = {},
        AnimPack = {},
        Weapon = {},
        EntityCostume = {},
        EntityCostumeSet = {},
        Vendor = {},
        VendorCostumeItem = {},
        VendorWeaponItem = {},
    }
end
 
local function GetSource()
    -- Find the first calling function not in this source file
    local n = 2
    local there
    while true do
        there = getinfo(n).source
        if there!=here then break end
        n = n+1
    end
    if sub(there,1,1)=="@" then
        there = sub(there,2)
    end
    return DiskToLocal(there)
end
 
 
local function StoreBlueprint(group, bp)
    local id = bp.BlueprintId
    local t = original_blueprints[group]
 
    if t[id] and bp.Merge then
        bp.Merge = nil
        bp.Source = nil
        t[id] = table.merged(t[id], bp)
    else
        t[id] = bp
    end
end
 
 
--
-- Figure out what to name this blueprint based on the name of the file it came from.
-- Returns the entire filename. Either this or SetLongId() should really be got rid of.
--
local function SetBackwardsCompatId(bp)
    bp.Source = bp.Source or GetSource()
    bp.BlueprintId = lower(bp.Source)
end
 
 
--
-- Figure out what to name this blueprint based on the name of the file it came from.
-- Returns the full resource name except with ".bp" stripped off
--
local function SetLongId(bp)
    bp.Source = bp.Source or GetSource()
    if not bp.BlueprintId then
        local id = lower(bp.Source)
        id = gsub(id, "%.bp$", "")                          -- strip trailing .bp
        --id = gsub(id, "/([^/]+)/%1_([a-z]+)$", "/%1_%2")    -- strip redundant directory name
        bp.BlueprintId = id
    end
end
 
 
--
-- Figure out what to name this blueprint based on the name of the file it came from.
-- Returns just the base filename, without any blueprint type info or extension. Used
-- for units only.
--
local function SetShortId(bp)
    bp.Source = bp.Source or GetSource()
    bp.BlueprintId = bp.BlueprintId or
    gsub(lower(bp.Source), "^.*/([^/]+)_[a-z]+%.bp$", "%1")
end
 
 
--
-- If the bp contains a 'Mesh' section, move that over to a separate Mesh blueprint, and
-- point bp.MeshBlueprint at it.
--
-- Also fill in a default value for bp.MeshBlueprint if one was not given at all.
--
function ExtractMeshBlueprint(bp)
    local disp = bp.Display or {}
    bp.Display = disp
 
    if disp.MeshBlueprintVarieties then
        for k,mesh in disp.MeshBlueprintVarieties do
            if type(mesh)=='string' then
                if mesh!=lower(mesh) then
                    --Should we allow mixed-case blueprint names?
                    --LOG('Warning: ',bp.Source,' (MeshBlueprint): ','Blueprint IDs must be all lowercase')
                    mesh = lower(disp.MeshBlueprint)
                end
        
                -- strip trailing .bp
                disp.MeshBlueprintVarieties[k] = gsub(mesh, "%.bp$", "")
            end
        end
    end                    
 
    if disp.MeshBlueprint=='' then
        --LOG('Warning: ',bp.Source,': MeshBlueprint should not be an empty string')
        disp.MeshBlueprint = nil
    end
 
    if type(disp.MeshBlueprint)=='string' then
        if disp.MeshBlueprint!=lower(disp.MeshBlueprint) then
            --Should we allow mixed-case blueprint names?
            --LOG('Warning: ',bp.Source,' (MeshBlueprint): ','Blueprint IDs must be all lowercase')
            disp.MeshBlueprint = lower(disp.MeshBlueprint)
        end
 
        -- strip trailing .bp
        disp.MeshBlueprint = gsub(disp.MeshBlueprint, "%.bp$", "")
 
        if disp.Mesh then
            --LOG('Warning: ',bp.Source,' has mesh defined both inline and by reference')
        end
    end
 
    if disp.MeshBlueprint==nil then
        -- For a blueprint file "/units/uel0001/uel0001_unit.bp", the default
        -- mesh blueprint is "/units/uel0001/uel0001_mesh"
        if type(disp.Mesh)=='table' then
            local meshname, subcount = gsub(bp.Source, "_[a-z]+%.bp$", "_mesh")
            if subcount==1 then
                disp.MeshBlueprint = meshname
            end
            local meshbp = disp.Mesh
            meshbp.Source = meshbp.Source or bp.Source
            meshbp.BlueprintId = disp.MeshBlueprint
            -- roates:  Commented out so the info would stay in the unit BP and I could use it to precache by unit.
            -- disp.Mesh = nil
            MeshBlueprint(meshbp)
        end
    end
end
 
function ExtractWreckageBlueprint(bp)
    if not bp.Wreckage then 
		return 
	end
 
    if bp.Wreckage.UseCustomMesh then 
		return 
	end
 
    local meshid = bp.Display.MeshBlueprint
    if not meshid then return end
 
    local meshbp = original_blueprints.Mesh[meshid]
    if not meshbp then return end
 
    local wreckbp = table.deepcopy(meshbp)
    local sourceMeshBp = GetNonShadowedBlueprintSource(meshid)
		wreckbp.BlueprintId = sourceMeshBp .. '_wreck'    
		bp.Display.MeshBlueprintWrecked = wreckbp.BlueprintId
    for kLOD, vLOD in wreckbp.LODs do
        if vLOD.MaterialSets then
            for kSet, vSet in vLOD.MaterialSets do
                if vSet.Materials then
                    for kMat, vMat in vSet.Materials do
                        if (vMat.ShaderState != 'PortalCutoutState') and (vMat.ShaderState != 'PortalDepthState') then
                            vMat.ShaderMacros = ( vMat.ShaderMacros or 'ambient_lighting, glow, diffuse_lighting, specular_lighting, ambient_occlusion, environment_mapping' ) ..  ', wreckage, wreckage_edge_highlight'
                            vMat.EffectName = '/textures/Units/Shared/Wreckage.dds'
                        end
                    end
                else
                    vSet.Materials = { ShaderMacros = 'ambient_lighting, glow, diffuse_lighting, specular_lighting, ambient_occlusion, environment_mapping, wreckage, wreckage_edge_highlight', Effectname = '/textures/Units/Shared/Wreckage.dds' }
                end
            end
        end
    end
    MeshBlueprint(wreckbp)
end
 
--
-- If the bp contains a 'Weapons' section, move that over to a separate Weapon blueprint, and
-- point bp.MeshBlueprint at it.
--
--
function ExtractWeaponBlueprint(bp)
    if not bp.Weapons then
        return
    end
 
    local modifiedWeaponsTable = {} -- store actual weapons in table
    local weaponIndex = 1 -- used for weapons with labels as key
 
    for k, weapon in bp.Weapons do
        -- if the key is a string, then it's the label of the weapon, so we need to create a new BP
        local label =  type(k) == "string" and k or false
        
        -- Command action defined for unit as a reference to unit
        if type(weapon) == 'string' then
            -- Make lowercase
            weapon = lower(weapon)
            --LOG( 'Unit ability blueprint reference, ', repr(ability) )
            -- Search for currently stored blueprint reference
            for id, weaponbp in original_blueprints.Weapon do
                if weaponbp.Source == weapon then
                    if label then
                        -- if we have a new label, create a new blueprint
                        local newWeaponbp = table.copy(weaponbp)
                        newWeaponbp.Label = label
                        newWeaponbp.BlueprintId = newWeaponbp.BlueprintId .. "_" .. label
                        -- weapon should already have BlueprintId and Source
                        WeaponBlueprint(newWeaponbp)
                        modifiedWeaponsTable[weaponIndex] = newWeaponbp
                    else
                        modifiedWeaponsTable[weaponIndex] = weaponbp
                    end
						weaponIndex = weaponIndex + 1
                    --LOG( 'Remapping global weapon blueprint be inline in the unit bp ', repr(bp.Weapons[k]) )
                    break
                end
            end
        -- Command action defined inline with a unit blueprint
        elseif type(weapon) == 'table' then
            if label then
                weapon.Label = label
            end
 
            if not weapon.BlueprintId then
                -- For a blueprint file "/units/uul0001/uul0001_unit.bp", the default
                -- weapon blueprint is "/units/uul0001/uul0001_weapon_label"
                local weaponname,subcount = gsub(bp.Source, "_[a-z]+%.bp$", "_weapon_" .. weapon.Label)
                if subcount==1 then
                    weapon.BlueprintId = weaponname
                end
            end
            weapon.Source = weapon.Source or bp.Source
 
            --LOG( 'Unit Inline weapon blueprint defined, ', repr(weapon) )
            WeaponBlueprint(weapon)
            modifiedWeaponsTable[weaponIndex] = weapon
            weaponIndex = weaponIndex + 1
        end
    end
 
    local weaponsTableConvertedToResIds = {} -- store actual weapons in table
    for k, v in modifiedWeaponsTable do
        weaponsTableConvertedToResIds[k] = v.BlueprintId
    end
 
    --LOG( 'weaponsTableConvertedToResIds, ', repr(weaponsTableConvertedToResIds) )
    -- finally assigned fixed up weapons table
    bp.Weapons = weaponsTableConvertedToResIds
end
 
function ExtractCostStamp(bp)
    if not bp.Navigation.CostStamp then
        return
    end
 
    if type(bp.Navigation.CostStamp) == 'string' then 
        if bp.Navigation.CostStamp == '' then
            --LOG('Warning: ',bp.Source,': Navigation.CostStamp should not be an empty string. Required to be a table or a string path.')
            bp.Navigation.CostStamp = nil
            return
        end
 
        local importedCostStamp = {}
        local ok, msg = pcall(doscript, bp.Navigation.CostStamp, importedCostStamp )
        if not ok or table.empty(importedCostStamp) then
            --LOG( msg )
            --LOG('Warning: ',bp.Source,': Navigation.CostStamp of ', bp.Navigation.CostStamp, '. Unable to lookup cost stamp information.')
            bp.Navigation.CostStamp = nil
            return
        end
			bp.Navigation.CostStamp = table.copy(importedCostStamp.CostStamp)
    end
 
end
 
-- convert state names to ints
function GetStateEnum( enumTrans, stateName )
        -- if key doesn't exist, then increment size of num states, and add new entry
        local retVal = enumTrans[stateName]
        if not retVal then
            local newID = enumTrans._NumStates
            enumTrans[stateName]  = newID
            retVal = newID
            enumTrans._NumStates = enumTrans._NumStates + 1
        end
    return retVal
end
 
 
function GetAnimTreeState( childTable, parentID, flatList, enumTranslationTable )
	for childName, childData in childTable do
		local stateName = childName
		local stateId = GetStateEnum( enumTranslationTable, stateName )
		local type = childData.type
		local transitions = {}
		-- go through transitions and convert state names to values & prepare it to match blueprint spec
		if childData.transitions then
			table.resizeandclear(transitions, childData.transitions)
			local index = 1
			for k,v in childData.transitions do
				transitions[index] = {EventName = k, TargetStateID = GetStateEnum( enumTranslationTable, v.TargetStateID ) }
				index = index + 1
			end
		end
		local data = childData.data

		local newEntry = { 
			["StateName"] = stateName, 
			["StateID"] = stateId, 
			["ParentID"] = parentID,  
			["Transitions"] = transitions,
			["NodeType"] = type, 
			["NodeData"] = data,
		}
		-- add 1 here because this data needs to be a 1 based array, while the states need to be 0 based
		-- I hate you Lua.
		flatList[stateId+1] = newEntry

		if childData.children then
			GetAnimTreeState( childData.children, stateId, flatList, enumTranslationTable )
		end
	end	
end
 
 
function FlattenAnimTreeBlueprint(animTree, enumTrans)
    if not animTree then return end
    local flatListOfStates = {}
		GetAnimTreeState( animTree, -1, flatListOfStates, enumTrans )
    -- validate blueprint
    for stateName,stateId in enumTrans do
        if stateName == "_NumStates" then
                continue
        end
 
        -- again, StateId is actually 1 smaller than the index it's stored at
        if not flatListOfStates[stateId+1] or flatListOfStates[stateId+1].StateID ~= stateId then
            error("Declared state ".. stateName .." in a transition, but never actually found that state in the tree" )
        end
    end
 
    return flatListOfStates
end
 
 
--
-- If the bp contains a 'AnimTree' section, move that over to a separate AnimTree blueprint, and
-- point bp.AnimTree at it.
--
-- Also fill in a default value for bp.AnimTree if one was not given at all.
--
function ExtractAnimTreeBlueprint(bp)
    if not bp.AnimTree then
        return
    end
 
    local animtree = bp.AnimTree
 
	-- Command action defined for unit as a reference to unit
    if type(animtree) == 'string' then
        -- Make lowercase
        local animtree = lower(animtree)
 
        --LOG( 'Unit animtree blueprint reference, ', repr(ability) )
        -- Search for currently stored blueprint reference
        for id, animtreebp in original_blueprints.AnimTree do
            if animtreebp.Source == animtree then
                bp.AnimTree = animtreebp
                bp.AnimTree.Source = animtree
                --LOG( 'Remapping global animtree blueprint be inline in the unit bp ', repr(bp.AnimTree[k]) )
                continue
            end
        end
    -- Command action defined inline with a unit blueprint
    elseif type(animtree) == 'table' then
        if not animtree.BlueprintId then
            -- For a blueprint file "/units/uul0001/uul0001_unit.bp", the default
            -- ability blueprint is "/units/uul0001/uul0001_animtree"
            local animtreename,subcount = gsub(bp.Source, "_[a-z]+%.bp$", "_animtree")
            if subcount==1 then
                animtree.BlueprintId = animtreename
            end
        end
 
        if not animtree.Source then
            animtree.Source = bp.Source
        end
        --LOG( 'Unit Inline animtree blueprint defined, ', repr(animtree) )
        AnimTreeBlueprint(animtree)    
    end
end
 
function MeshBlueprint(bp)
    SetLongId(bp)
    StoreBlueprint('Mesh', bp)
end
 
function GetUnitIconFileNames(blueprint)
    local iconName = '/textures/ui/common/icons/units/' .. blueprint.Display.IconName .. '_icon.dds'
    local upIconName = '/textures/ui/common/icons/units/' .. blueprint.Display.IconName .. '_build_btn_up.dds'
    local downIconName = '/textures/ui/common/icons/units/' .. blueprint.Display.IconName .. '_build_btn_down.dds'
    local overIconName = '/textures/ui/common/icons/units/' .. blueprint.Display.IconName .. '_build_btn_over.dds'
   
    if DiskGetFileInfo(iconName) == false then
        iconName = '/textures/ui/common/icons/units/default_icon.dds'
    end
   
    if DiskGetFileInfo(upIconName) == false then
        upIconName = iconName
    end
 
    if DiskGetFileInfo(downIconName) == false then
        downIconName = iconName
    end
 
    if DiskGetFileInfo(overIconName) == false then
        overIconName = iconName
    end
   
    return iconName, upIconName, downIconName, overIconName
end
 
-- add the filenames of the icons to the blueprint, creating a new RuntimeData table in the process where runtime things
-- can be stored in blueprints for convenience
function SetUnitIconBitmapPath(bp)
    bp.RuntimeData = {}
    if bp.Display.IconName then -- filter for icon name
        bp.RuntimeData.IconFileName, bp.RuntimeData.UpIconFileName, bp.RuntimeData.DownIconFileName, bp.RuntimeData.OverIconFileName  = GetUnitIconFileNames(bp)
    end
end
 
 
function UnitBlueprint(bp)
    SetShortId(bp)
    SetUnitIconBitmapPath(bp)
    StoreBlueprint('Unit', bp)
end
 
function PropBlueprint(bp)
    SetBackwardsCompatId(bp)
    StoreBlueprint('Prop', bp)
end
 
function ProjectileBlueprint(bp)
    SetBackwardsCompatId(bp)
    StoreBlueprint('Projectile', bp)
end
 
function WeaponBlueprint(bp)
    SetLongId(bp)
    StoreBlueprint('Weapon', bp)
end
 
function TrailEmitterBlueprint(bp)
    SetBackwardsCompatId(bp)
    StoreBlueprint('TrailEmitter', bp)
end
 
function EmitterBlueprint(bp)
    SetBackwardsCompatId(bp)
    StoreBlueprint('Emitter', bp)
end
 
function BeamBlueprint(bp)
    SetBackwardsCompatId(bp)
    StoreBlueprint('Beam', bp)
end
 
function AbilityBlueprint(bp)
    SetShortId(bp)
    StoreBlueprint('Ability', bp)
    --LOG( 'Loading AbilityBlueprint ', bp.BlueprintId, ' ',  bp.Source )
end
 
function SkirmishEngineerBlueprint(bp)
    StoreBlueprint('SkirmishEngineer', bp)
end
 
function SkirmishFactoryBlueprint(bp)
    StoreBlueprint('SkirmishFactory', bp)
end
 
function SkirmishFormBlueprint(bp)
    StoreBlueprint('SkirmishForm', bp)
end
 
function PlatoonBlueprint(bp)
    StoreBlueprint('PlatoonBlueprint', bp)
end
 
function SkirmishResponseBlueprint(bp)
    StoreBlueprint('SkirmishResponse', bp)
end
 
function SkirmishBaseBlueprint(bp)
    StoreBlueprint('SkirmishBase', bp)
end
 
function SkirmishArchetypeBlueprint(bp)
    StoreBlueprint('SkirmishArchetype', bp)
end
 
 
function AnimTreeBlueprint(bp)
    SetShortId(bp)
    --LOG("Loading animtree: ", bp.BlueprintId )
    -- flatten anim tree
    -- if we don't have a translation table yet, make one.  This keeps us from
    -- having to define the enumeration in C++
    local enumTrans = {_NumStates = 0}
		bp.AnimTreeStates = FlattenAnimTreeBlueprint(bp.AnimTreeStates, enumTrans)
    local startState = enumTrans[bp.StartStateID]
    if not startState then
        error("Invalid Start State: " .. bp.StartStateID)
        return
    end
    -- this state's index in this tree is off by one due to Lua arrays starting at 1
    local children = bp.AnimTreeStates[startState+1].children
    if children and not table.empty(children) then
        error("Start state " .. bp.StartStateID .. " has children, needs to be leaf state!")
        return
    end
		bp.StartStateID = startState
		StoreBlueprint('AnimTree', bp)
end
 
 
function GetEventGroup( event )
    if event.Trigger == 'OnStart' then             
        return 1
    elseif event.Trigger == 'OnLoop' and event.Direction == 'Reverse' then
        return 2
    elseif event.Trigger == 'OnFrame' then
        return 3
    elseif event.Trigger == 'OnLoop' and eventDirection ~= 'Reverse' then
        return 4
    elseif event.Trigger == 'OnEnd' then
        return 5
    else
        WARN( "GetEventGroup could not determine a proper group for an event!" )
        return -1
    end
end
 
function RawAnimEventSorter( a, b )
    -- Proper sorting is: [ OnStart, OnLoop(Reverse), OnFrame(by frame--), OnLoop(Forward), OnEnd ]
    local groupA = GetEventGroup(a)
    local groupB = GetEventGroup(b)
    
    if groupA < groupB then
        return true
    elseif groupA > groupB then
        return false
    else
        if groupA == 3 then
            return a.Frame < b.Frame
        end
    end
 
    -- At this point it doesn't matter, they are in the same group and that group's sortings don't matter
    return true
end
 
function RawAnimBlueprint(bp)
    for rawAnimName, rawAnimBP in bp do
        rawAnimBP.Source = GetSource()
        rawAnimBP.BlueprintId = rawAnimName
        
        if original_blueprints.RawAnim[ rawAnimBP.BlueprintId ] ~= nil then
            WARN( "RawAnim blueprint [" .. rawAnimBP.BlueprintId .. "] was defined in multiple locations" )
        end
        
        -- Convert nice, clean, readable data from blueprint into the format needed by the engine
        -- class RRawAnimBlueprint { RAnimEventsBlueprint events, stuff }
        -- class RAnimEventsBlueprint { vector<RAnimEventBlueprint> events, stuff }
        -- class RAnimEventBlueprint { RAnimEventArgsBlueprint, stuff }
        
        -- Event args are stored in a flat list for clarity, but in engine RAnimEventArgsBlueprint
        -- is a member of RAnimEventBlueprint, so pull the appropriate args out into a subtable
        if rawAnimBP.Events then               
            for index, event in rawAnimBP.Events do
                event.Args = {}
                event.Args['StringArg1'] = event.SoundName or event.EffectTemplate or event.CallbackFunc or event.AnimCommand or event.StringArg1
                event.Args['StringArg2'] = event.LuaStrArg or event.AnimStateName or event.BoneName or event.StringArg2
                event.Args['IntArg1'] = event.AnimStartFrame or event.FxDuration or event.IntArg1
                event.Args['IntArg2'] = event.IntArg2
                event.Args['VectorArg1'] = event.Offset or event.VectorArg1
                
                -- Convert frame number into seconds for use by the engine
                -- Frame -- is assuming 30 frames per second, so frame 45 would be 45 * (1.0/30.0) = 1.5 seconds
                if event.Frame ~= nil then
                    event.Time = event.Frame * (1.0/30.0)
                end
            end
                   
            -- The list of events in engine is stored in a master RAnimEventsBlueprint, so we need
            -- to add the extra layer of indirection here
            local events = rawAnimBP.Events
            
            table.sort( events, RawAnimEventSorter )
            rawAnimBP.Events = { Events = events }
        end
			StoreBlueprint('RawAnim', rawAnimBP)
    end
end
       
function AnimPackBlueprint(bp)
    for animPackName, animPackBP in bp do
        animPackBP.Source = GetSource()
        animPackBP.BlueprintId = animPackName
        
        if original_blueprints.AnimPack[ animPackBP.BlueprintId ] then
            WARN( "AnimPack blueprint [" .. animPackBP.BlueprintId .. "] was defined in multiple locations" )
        end       
			StoreBlueprint('AnimPack', animPackBP)
    end
end
 
function EntityCostumeBlueprint(bp)
    for costumeName, costumeBP in bp do
        costumeBP.Source = GetSource()
        costumeBP.BlueprintId = costumeName
        
        if original_blueprints.EntityCostume[ costumeBP.BlueprintId ] then
            WARN( "Costume blueprint [" .. costumeBP.BlueprintId .. "] was defined in multiple locations" )
        end        
			StoreBlueprint( 'EntityCostume', costumeBP )
    end
end
 
function EntityCostumeSetBlueprint(bp)
    for costumeSetName, costumeSetBP in bp do
        costumeSetBP.Source = GetSource()
        costumeSetBP.BlueprintId = costumeSetName
        
        if original_blueprints.EntityCostumeSet[ costumeSetBP.BlueprintId ] then
            WARN( "CostumeSet blueprint [" .. costumeSetBP.BlueprintId .. "] was defined in multiple locations" )
        end        
			StoreBlueprint( 'EntityCostumeSet', costumeSetBP )
    end
end
 
function VendorBlueprint(bp)
    for vendorName, vendorBP in bp do
        vendorBP.Source = GetSource()
        vendorBP.BlueprintId = vendorName
        
        if original_blueprints.Vendor[ vendorBP.BlueprintId ] then
            WARN( "Vendor blueprint [" .. vendorBP.BlueprintId .. "] was defined in multiple locations" )
        end       
			StoreBlueprint( 'Vendor', vendorBP )
    end
end
 
function VendorCostumeItemBlueprint(bp)
    for costumeName, costumeBP in bp do
        costumeBP.Source = GetSource()
        costumeBP.BlueprintId = costumeName
        
        if original_blueprints.VendorCostumeItem[ costumeBP.BlueprintId ] then
            WARN( "Vendor Costume Item blueprint [" .. costumeBP.BlueprintId .. "] was defined in multiple locations" )
        end       
			StoreBlueprint( 'VendorCostumeItem', costumeBP )
    end
end
 
function VendorWeaponItemBlueprint(bp)
    for weaponName, weaponBP in bp do
        weaponBP.Source = GetSource()
        weaponBP.BlueprintId = weaponName
        
        if original_blueprints.VendorWeaponItem[ weaponBP.BlueprintId ] then
            WARN( "Vendor Weapon Item blueprint [" .. weaponBP.BlueprintId .. "] was defined in multiple locations" )
        end        
			StoreBlueprint( 'VendorWeaponItem', weaponBP ) 
    end
end
 
function ExtractBlueprints()
    for id,bp in original_blueprints.Unit do
        ExtractMeshBlueprint(bp)
        ExtractWeaponBlueprint(bp)
        ExtractWreckageBlueprint(bp)
        ExtractAnimTreeBlueprint(bp)
        ExtractCostStamp(bp)
    end
 
    for id,bp in original_blueprints.Prop do
        ExtractMeshBlueprint(bp)
        ExtractWreckageBlueprint(bp)
    end
 
    for id,bp in original_blueprints.Projectile do
        ExtractMeshBlueprint(bp)
    end
end
 
function RegisterAllBlueprints(blueprints)
 
    local function RegisterGroup(g, fun)
        for id,bp in sortedpairs(g) do
            fun(g[id])
        end
    end
 
    RegisterGroup(blueprints.AnimTree, RegisterAnimTreeBlueprint)
    RegisterGroup(blueprints.Ability, RegisterAbilityBlueprint)
    RegisterGroup(blueprints.Weapon, RegisterWeaponBlueprint)
    RegisterGroup(blueprints.Mesh, RegisterMeshBlueprint)
    RegisterGroup(blueprints.Unit, RegisterUnitBlueprint)
    RegisterGroup(blueprints.Prop, RegisterPropBlueprint)
    RegisterGroup(blueprints.Projectile, RegisterProjectileBlueprint)
    RegisterGroup(blueprints.TrailEmitter, RegisterTrailEmitterBlueprint)
    RegisterGroup(blueprints.Emitter, RegisterEmitterBlueprint)
    RegisterGroup(blueprints.Beam, RegisterBeamBlueprint)
    RegisterGroup(blueprints.RawAnim, RegisterRawAnimBlueprint)
    RegisterGroup(blueprints.AnimPack, RegisterAnimPackBlueprint)
    RegisterGroup(blueprints.EntityCostume, RegisterEntityCostumeBlueprint)
    RegisterGroup(blueprints.EntityCostumeSet, RegisterEntityCostumeSetBlueprint)
    RegisterGroup(blueprints.Vendor, RegisterVendorBlueprint)
    RegisterGroup(blueprints.VendorCostumeItem, RegisterVendorCostumeItemBlueprint)
    RegisterGroup(blueprints.VendorWeaponItem, RegisterVendorWeaponItemBlueprint)
    RegisterGroup(blueprints.Weapon, PostInitWeaponBlueprint)
       
    -- Skirmish blueprints must be initialized after categories. Therefore, they must be after
    -- units, props, projectiles, etc
    RegisterGroup(blueprints.SkirmishEngineer, RegisterAiSkirmishEngineerBlueprint)
    RegisterGroup(blueprints.SkirmishFactory, RegisterAiSkirmishFactoryBlueprint)
    RegisterGroup(blueprints.SkirmishForm, RegisterAiSkirmishFormBlueprint)
    RegisterGroup(blueprints.PlatoonBlueprint, RegisterPlatoonBlueprint)
    RegisterGroup(blueprints.SkirmishResponse, RegisterAiSkirmishResponseBlueprint)
    RegisterGroup(blueprints.SkirmishBase, RegisterAiSkirmishBaseBlueprint)
    RegisterGroup(blueprints.SkirmishArchetype, RegisterAiSkirmishArchetypeBlueprint)
end

--[[  
                                              BALANCE ENHANCEMENT MOD
                                                          +
                                                1.26 Update For xbox 360
   Paste .bp merges here. The file "toc.x360.bdf" will not allow any custom files, nor .scd's so this is a
   work-around 4 360, but only for existing .bp's. Most of the grunt work is done, give or take a few units, most if
   not all units and structures are listed below.5/6/2022 SoLjA UPDATE: Added Ability, effects & Projectile merges.
   Ability & effect merges follow the same principle as unit bp merges, and require "Merge = true,". Projectile merges
   are slightly different and use "Source" instead of "BlueprineId" and require "Merge = true,". 
   Example given on "Source"; Source = '/projectiles/uef/ucannonshe1105/ucannonshell05_proj.bp',". lower case.
   Keep merges in alphabetical order, cybran ability's, projectiles & units first, then Illuminate & then UEF.
]]--
--[[
   ABILITY BP MERGES
]]--
function DoBlueprintMerges()
AbilityBlueprint {  -- ACU Hunker Ability
    Merge = true,
	BlueprintId = "acu_hunker",
	AbilityStateChange = {
		OnActivate = {
			Disable = {
				'EscapePod',
				'KnockbackWeapon',
				'RogueNanites',
				'Overcharge',
			},
		},
		RestoreStatesOnDeactivate = true,
	},
	ActivationConditions = {
		{
			ConditionType = 'EAACT_CheckUnitState',	
			UnitStateRestrictions = {
				'Jumping',
			},
		},
	},
	ActivationRetriggerDelay = 3,
	AI = {
		DisableAttackOnActivate = true,
		EnableAttackOnDeactivate = true,
		IgnoreSteeringWhileActive = true,
	},
	Buffs = {
		'ACUHunker',
	},
	Commands = {
		OnActivate = {
			Disable = {
				RULEUCC_Attack = true,
				RULEUCC_CallTransport = true,
				RULEUCC_Capture = true,
				RULEUCC_Guard = true,
				RULEUCC_Jump = true,
				RULEUCC_Move = true,
				RULEUCC_Patrol = true,
				RULEUCC_Pause = true,
				RULEUCC_Reclaim = true,
				RULEUCC_Repair = true,
				RULEUCC_RetaliateToggle = true,
				RULEUCC_Stop = true,
				RULEUCC_Teleport = true,
			},
		},
		ClearCommandQueueOnActivate = true,
		RestoreCommandCapsOnDeactivate = true,
	},
	CommandType = 'EACT_Toggle',
    Cooldown = 5,
    CooldownOnDeactivation = true,
    DisplayName = '<LOC SC2_ABILITIES_0050>Hunker',
	Effects = {
		OnActivate = {
			{
				Emitters = {
					'/effects/emitters/ambient/units/unit_hunker_01_emit.bp',
					'/effects/emitters/ambient/units/unit_hunker_04_emit.bp',
				},
			},
		},
		RemoveEffectsOnDeactivate = true,
	},
    InitiallyEnabled = false,
    Navigation = {
		CollisionPushClassOverride = 10,
    },
	OrderBitmapId = 'hunker',
	RefreshUIOnActivate = true;
	RefreshUIOnDeactivate = true;
	RemoveBuffsOnDeactivate = true,	
	ScriptModule = '/abilities/ACU_Hunker_Ability.lua',
	UnitStates = {
		OnActivate = {
			Enable = {
				'Immobile',
				'Hunkered',
			},
		},
		OnDeactivate = {
			Disable = {
				'Immobile',
				'Hunkered',
			},
		},
	},
}
AbilityBlueprint {  -- Bomb Bouncer Charge Ability
    Merge = true,
	BlueprintId = "bombbouncercharge",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
    Cooldown = 15,
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0059>Mega Blast Manual Charge',
    InitiallyEnabled = true,
	RunScript = 'OnBombBounceChargeActivate',
	OrderBitmapId = 'bbouncecharge',
    Resource = {
        OnActivate = {
            SourceAmount = '250',
            SourceType = 'ENERGY',
        },
    },
	ShowCmdButtonWhenDisabled = true,
}
AbilityBlueprint { -- Bomb Bouncer Blast Ability
    Merge = true,
	BlueprintId = "bombbouncermegablast",
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0060>Activate Mega Blast',
    InitiallyEnabled = false,
	RunScript = 'OnMegaBlastActivate',
	OrderBitmapId = 'bbouncedamage',
	ShowCmdButtonWhenDisabled = true,
}
AbilityBlueprint { -- Mass Fab Ability
    Merge = true,
	BlueprintId = "convertenergy",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	Cooldown = 10,
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0040>Convert Energy to Mass',
	Resource = {
		OnActivate = {
			SourceType = 'Energy',
			SourceAmount = 1250,
			TargetType = 'Mass',
			TargetAmount = 125,
		},
	},
	RunScript = 'OnMassConvert',
	OrderBitmapId = 'massconv',
}
AbilityBlueprint {
	--This is the upgrade ability for Cybran power generators. it is no longer used in PC version, but xbox 360 still uses this for now.
	Merge = true,
	BlueprintId = "convertenergyid",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	Cooldown = 10,
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0040>Convert Energy to Mass',
	InitiallyEnabled = false,
	Resource = {
		OnActivate = {
			SourceType = 'Energy',
			SourceAmount = 1250,
			TargetType = 'Mass',
			TargetAmount = 125,
		},
	},
	RunScript = 'OnMassConvert',
	OrderBitmapId = 'massconv',
}
AbilityBlueprint { -- Disruptor Station Ability
    Merge = true,
	BlueprintId = "disruptorstation",
	ActivationRetriggerDelay = 30,
	Buffs = {
		'DisruptorStation',
	},
    Cooldown = 15,
    CooldownOnDeactivation = true,
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0058>Activate Disruptor Station',
	Duration = 30,
    InitiallyEnabled = true,
    Resource = {
        OnActivate = {
            SourceAmount = '1000',
            SourceType = 'ENERGY',
        },
    },
	RemoveBuffsOnDeactivate = true,
	RunScript = 'OnActivateDisrutorStation',
	OrderBitmapId = 'incdisruption',
}
AbilityBlueprint { -- Electroshock Ability
    Merge = true,
	BlueprintId = "electroshock",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	ActivationRetriggerDelay = 20,
	Buffs = {
		'ElectroShockAbility',
	},
    Cooldown = 30,
    CooldownOnDeactivation = true,
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0042>Electroshock',
	Duration = 20,
    InitiallyEnabled = false,
    OrderBitmapId = 'electroshock',
	RemoveBuffsOnDeactivate = true,
    Resource = {
        OnActivate = {
            SourceAmount = 150,
            SourceType = 'ENERGY',
        },
    },
    RunScript = 'OnElectroshock',
}
AbilityBlueprint { -- ACU Escape Pod Ability
    Merge = true,
	BlueprintId = "escapepod",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_CheckUnitState',	
			UnitStateRestrictions = {
				'Jumping',
				'Hunkered',
			},
		},
	},
	Commands = {
		OnActivate = {
			Disable = {
				RULEUCC_Attack = true,
				RULEUCC_CallTransport = true,
				RULEUCC_Capture = true,
				RULEUCC_Jump = true,
				RULEUCC_Move = true,
				RULEUCC_Patrol = true,
				RULEUCC_Pause = true,
				RULEUCC_Reclaim = true,
				RULEUCC_Repair = true,
				RULEUCC_RetaliateToggle = true,
				RULEUCC_Stop = true,
			},
		},
	},
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0044>Launch Escape Pod',
    InitiallyEnabled = false,
	RefreshUIOnActivate = true;
	ScriptModule = '/abilities/EscapePod_Ability.lua',
	OrderBitmapId = 'escapepod',
	UnitStates = {
		OnActivate = {
			Enable = {
				'UnSelectable',
			},
		},
	},
}
AbilityBlueprint { -- Half Bake Ability
    Merge = true,
	BlueprintId = "halfbake",
	ActivateOnBuildProgress = 0.5,
	ActivationConditions = {
		{
			ConditionType = 'EAACT_BuildProgress',
		},
	},
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0046>Launch Half-Baked',
	RunScript = 'OnBakeUnit',
	--ScriptModule = '/abilities/HalfBake_Ability.lua',
	OrderBitmapId = 'halfbaked',
}
AbilityBlueprint { -- Harden Artillery Ability
    Merge = true,
	BlueprintId = "hardenartillery",
    ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	ActivationRetriggerDelay = 15,
	Buffs = {
		'HardenArtillery',
	},
    Cooldown = 30,
    CooldownOnDeactivation = false,
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0048>Harden Mode',
	Duration = 20,
	Resource = {
		OnActivate = {
			SourceType = 'Energy',
			SourceAmount = 250,
		},
	},
    InitiallyEnabled = false,
	RemoveBuffsOnDeactivate = true,
    RunScript = 'OnHardenArtillery',
	OrderBitmapId = 'hartillery',
}
AbilityBlueprint { -- ACU Knock Back Weapon Ability
    Merge = true,
	BlueprintId = "knockbackweapon",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	ActivationRetriggerDelay = 15,
	CommandType = 'EACT_Immediate',
    Cooldown = 5,
    CooldownOnDeactivation = true,
    DisplayName = '<LOC SC2_ABILITIES_0063>Knockback',
    Duration = 15,
    InitiallyEnabled = false,
	Resource = {
		OnActivate = {
			SourceType = 'Energy',
			SourceAmount = 125,
		},
	},
	OrderBitmapId = 'knockback',
	ScriptModule = '/abilities/KnockbackWeapon_Ability.lua',
}
AbilityBlueprint { -- Magnet Pull Ability
    Merge = true,
	BlueprintId = "magnet",
	AbilityStateChange = {
		OnActivate = {
			Disable = {
				'MagnetPush',
			},
		},
		RestoreStatesOnDeactivate = true,
	},
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	CanUseDuringNoRush = false,
    CommandType = 'EACT_Immediate',
    Cooldown = 30,
    DisplayName = '<LOC SC2_ABILITIES_0061>Activate Attractor',
    Duration = 20,
    InitiallyEnabled = true,
    OrderBitmapId = 'magnetpull',
	RefreshUIOnActivate = true;
	RefreshUIOnDeactivate = true;
    Resource = {
        OnActivate = {
            SourceAmount = 500,
            SourceType = 'Energy',
        },
    },
    RunScript = 'OnMagnetActivate',
}
AbilityBlueprint { -- Magnet Push Ability
    Merge = true,
	BlueprintId = "magnetpush",
	AbilityStateChange = {
		OnActivate = {
			Disable = {
				'Magnet',
			},
		},
		RestoreStatesOnDeactivate = true,
	},
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	CanUseDuringNoRush = false,
    CommandType = 'EACT_Immediate',
    Cooldown = 30,
    DisplayName = '<LOC SC2_ABILITIES_0062>Activate Repulsor',
    Duration = 20,
    InitiallyEnabled = true,
    OrderBitmapId = 'magnetpush',
	RefreshUIOnActivate = true;
	RefreshUIOnDeactivate = true;
    Resource = {
        OnActivate = {
            SourceAmount = 500,
            SourceType = 'Energy',
        },
    },
    RunScript = 'OnMagnetPushActivate',
}
AbilityBlueprint { -- Cybran Mobile Hunker Ability
    Merge = true,
	BlueprintId = "mobile_hunker",
	AbilityStateChange = {
		OnActivate = {
			Disable = {
				'PowerDetonate',
				'TriArmorHalfSpeed',
			},
		},
		RestoreStatesOnDeactivate = true,
	},
	ActivationConditions = {
		{
			ConditionType = 'EAACT_CheckUnitState',	
			UnitStateRestrictions = {
				'Jumping',
			},
		},
	},	
	ActivationRetriggerDelay = 3,
	AI = {
		DisableAttackOnActivate = true,
		EnableAttackOnDeactivate = true,
		IgnoreSteeringWhileActive = true,
	},
	Buffs = {
		'Hunker',
	},
	Commands = {
		OnActivate = {
			Disable = {
				RULEUCC_Attack = true,
				RULEUCC_Guard = true,
				RULEUCC_Jump = true,
				RULEUCC_Move = true,
				RULEUCC_Patrol = true,
				RULEUCC_RetaliateToggle = true,
				RULEUCC_Stop = true,
			},
		},
		ClearCommandQueueOnActivate = true,
		RestoreCommandCapsOnDeactivate = true,
	},
	CommandType = 'EACT_Toggle',
    Cooldown = 5,
    CooldownOnDeactivation = true,
    DisplayName = '<LOC SC2_ABILITIES_0050>Hunker',
	Effects = {
		OnActivate = {
			{
				Emitters = {
					'/effects/emitters/ambient/units/unit_hunker_02_emit.bp',  -- rings
					'/effects/emitters/ambient/units/unit_hunker_05_emit.bp',  -- base glow
				},
			},
		},
		OnDeactivate = {},
		RemoveEffectsOnDeactivate = true,
	},
    InitiallyEnabled = false,
    Navigation = {
		CollisionPushClassOverride = 10,
    },    
	OrderBitmapId = 'hunker',
	RefreshUIOnActivate = true;
	RefreshUIOnDeactivate = true;
	RemoveBuffsOnDeactivate = true,	
	ScriptModule = '/abilities/Mobile_Hunker_Ability.lua',
	UnitStates = {
		OnActivate = {
			Enable = {
				'Immobile',
				'Hunkered',
			},
		},
		OnDeactivate = {
			Disable = {
				'Immobile',
				'Hunkered',
			},
		},
	},
}
AbilityBlueprint { -- ACU Overcharge Ability
    Merge = true,
	BlueprintId = "overcharge",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
		{
			ConditionType = 'EAACT_CheckUnitState',	
			UnitStateRestrictions = {
				'Jumping',
				'Hunkered',
			},
		},
	},
	CommandType = 'EACT_Immediate',
    Cooldown = 35,
    DisplayName = '<LOC SC2_ABILITIES_0070>Enter Overcharge Mode',
	Duration = 10.7,
    InitiallyEnabled = false,
    Resource = {
        OnActivate = {
            SourceAmount = 2000,
            SourceType = 'ENERGY',
        },
    },
	ScriptModule = '/abilities/Overcharge_Ability.lua',
	OrderBitmapId = 'overcharge',
}
AbilityBlueprint { -- Point Defense Hunker Ability
    Merge = true,
	BlueprintId = "point_defense_hunker",
	ActivationRetriggerDelay = 3,
	AI = {
		DisableAttackOnActivate = true,
		EnableAttackOnDeactivate = true,
	},
	Buffs = {
		'Hunker',
	},
	Commands = {
		OnActivate = {
			Disable = {
				RULEUCC_Attack = true,
				RULEUCC_Stop = true,
			},
		},
		RestoreCommandCapsOnDeactivate = true,
	},
	CommandType = 'EACT_Toggle',
    Cooldown = 30,
    CooldownOnDeactivation = true,
    DisplayName = '<LOC SC2_ABILITIES_0050>Hunker',
	Effects = {
		OnActivate = {
			{
				Emitters = {
					'/effects/emitters/ambient/units/unit_hunker_03_emit.bp', -- rings
					'/effects/emitters/ambient/units/unit_hunker_06_emit.bp', -- ground glow
				},
			},
		},
		RemoveEffectsOnDeactivate = true,
	},
    InitiallyEnabled = false,
	RefreshUIOnActivate = true;
	RefreshUIOnDeactivate = true;
	RemoveBuffsOnDeactivate = true,
	OrderBitmapId = 'hunker',
	ScriptModule = '/abilities/Point_Defense_Hunker_Ability.lua',
	UnitStates = {
		OnActivate = {
			Enable = {
				'Hunkered',
			},
		},
		OnDeactivate = {
			Disable = {
				'Hunkered',
			},
		},
	},
}
AbilityBlueprint { -- Power Detonate Ability
    Merge = true,
	BlueprintId = "powerdetonate",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_CheckUnitState',	
			UnitStateRestrictions = {
				'Jumping',
				'Hunkered',
			},
		},
	},
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0052>Detonate',
    InitiallyEnabled = false,
	ScriptModule = '/abilities/PowerDetonate_Ability.lua',
	OrderBitmapId = 'killself',
}
AbilityBlueprint { -- Puliinsmash Ability
    Merge = true,
	BlueprintId = "pullinsmash",
	ActivationRetriggerDelay = 3,
	AI = {
		IgnoreSteeringWhileActive = true,
	},
	Commands = {
		OnActivate = {
			Disable = {
				RULEUCC_Attack = true,
				RULEUCC_Guard = true,
				RULEUCC_Move = true,
				RULEUCC_Patrol = true,
				RULEUCC_Stop = true,
				RULEUCC_RetaliateToggle = true,
			},
		},
		RestoreCommandCapsOnDeactivate = true,
	},
	CanUseDuringNoRush = false,
	CommandType = 'EACT_Toggle',
    Cooldown = 5,
    CooldownOnDeactivation = true,
    DisplayName = '<LOC SC2_ABILITIES_0064>Activate/Deactivate Vortex',
    InitiallyEnabled = true,
	RefreshUIOnActivate = true;
	RefreshUIOnDeactivate = true;
	RunScript = 'OnPullinsmash',
	OrderBitmapId = 'pullinsmash',
	UnitStates = {
		OnActivate = {
			Enable = {
				'Immobile',
			},
		},
		OnDeactivate = {
			Disable = {
				'Immobile',
			},
		},
	},
}
AbilityBlueprint { -- Illuminate Radar Overdrive Ability
    Merge = true,
	BlueprintId = "radaroverdrive",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	ActivationRetriggerDelay = 15,
	Buffs = {
		'RadarOverdrive',
	},
    Cooldown = 30,
    CooldownOnDeactivation = true,
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0054>Overdrive',
	Duration = 15,
    InitiallyEnabled = false,
	RemoveBuffsOnDeactivate = true,
	Resource = {
        OnActivate = {
            SourceAmount = 200,
            SourceType = 'Energy',
        },
    },
	OrderBitmapId = 'radarovd',
}
AbilityBlueprint { -- Rogue Nanite Ability
    Merge = true,
	BlueprintId = "roguenanites",
    ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	CommandType = 'EACT_Immediate',
    DisplayName = '<LOC SC2_ABILITIES_0065>Rogue Nanites',
    Cooldown = 35,
    InitiallyEnabled = false,
	RemoveBuffsOnDeactivate = false,
	Resource = {
		OnActivate = {
			SourceType = 'Energy',
			SourceAmount = 375,
		},
	},
	RunScript = 'OnRogueNaniteActivate',
	OrderBitmapId = 'roguenanites',
}
AbilityBlueprint { -- Tri Armor Half Speed Ability
    Merge = true,
	BlueprintId = "triarmorhalfspeed",
	ActivationConditions = {
		{
			ConditionType = 'EAACT_Resource',
		},
	},
	Buffs = {
		'SpeedReducingMegaArmor',
	},
	CommandType = 'EACT_Immediate',
	Cooldown = 25,
    DisplayName = '<LOC SC2_ABILITIES_0056>Engage Mega Armor',
    OrderBitmapId = 'halftriarmor',
    Duration = 15,
    Effects = {
		OnActivate = {
			{
				Emitters = {
					'/effects/Emitters/ambient/units/unit_upgrade_ambient_01_emit.bp',
				},
			},
		},
		OnDeactivate = {},
		RemoveEffectsOnDeactivate = true,
	},
    InitiallyEnabled = false,
	RemoveBuffsOnDeactivate = true,
    Resource = {
        OnActivate = {
            SourceAmount = 20,
            SourceType = 'ENERGY',
        },
    },
}
--**********************************************
--* EFFECT BP MERGES
--**********************************************
-- TODO Put my Effect merges here.
--**********************************************
--* PROJECTILE BP MERGES 
--* projectile merges will require example;
--* "Source = '/projectiles/uef/uantiair01/uantiair01_proj.bp'," 
--**********************************************
--* PROP BP MERGES 
--* prop merges will require example;
--* "Source = '/props/wreckage/uef/uub0001_wreckage01_prop.bp'," 
--**********************************************
--**********************************************
--* UNIT BP MERGES
--**********************************************
--* Cybran
--**********************************************
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uca0103", -- Renegade Gunship
    AddCategories = {
        GUNSHIPSQUADS = true,
    },
    Air = {
        --AutoLandTime = 1,
        CirclingRadiusChangeMaxRatio = 0.98,
        CirclingRadiusChangeMinRatio = 0.85,
    },
    Defense = {
        Health = 1450, 
        MaxHealth = 1450, 
        Shield = {
            ShieldMaxHealth = 600,
            ShieldRechargeTime = 10,
            ShieldRegenRate = 6,
        },
    },
    Intel = {
        VisionRadius = 32, 
    },
    Navigation = {
        Radius = 3,
    },
    Physics = {
        CollisionPushClass = 2,
        Elevation = 10, 
    },
    Weapons = {
        {
            Damage = 44, 
            DamageRadius = 1,
            LeadTarget = false, 
            MaxRadius = 32,
            MuzzleVelocity = 80, 
        },
    },
}
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uca0104", -- Gemini Fighter/Bomber
    AddCategories = {
        AIRSQUADS = true,
    },
    Air = {
        --AutoLandTime = 1,
    },
    Defense = {
        Health = 900, 
        MaxHealth = 900, 
        Shield = {
            ShieldMaxHealth = 450,
            ShieldRechargeTime = 10,
            ShieldRegenRate = 2,
        },
    },
    Intel = {
        RadarRadius = 120, 
        VisionRadius = 64, 
    },
    Navigation = {
        Radius = 3,
    },
    Physics = {
        CollisionPushClass = 2,
        Elevation = 56, 
    },
    Weapons = {
        [1] = {
            Damage = 100, 
            MaxRadius = 32,
            MuzzleVelocity = 40, 
        },
        [2] = {
            Damage = 300, 
            DamageRadius = 3, 
            MaxRadius = 64, 
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uca0901", --Transport
    AddCategories = {
        TRANSPORTSQUADS = true,
    },
    Air ={
        --AutoLandTime = 1,
    },
    Defense = {
        Health = 5000,
        MaxHealth = 5000,
        RegenRate = 5,
    },
    Weapons = {
        {
            Damage = 4,
            RateOfFire = 3,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0001", -- Land Factory
    Defense = {
        Health = 7500,
        MaxHealth = 7500,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 50,
        EnergyValue = 1800,
        MassValue = 720,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0002", -- Air Factory
    Defense = {
        Health = 7500,
        MaxHealth = 7500,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 50,
        EnergyValue =1350,
        MassValue = 840,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0003", -- Naval Factory
    Defense = {
        Health = 10000,
        MaxHealth = 10000,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 50,
        EnergyValue = 1200,
        MassValue = 600,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0011", --Mobile Land Gantry
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 10,
        Health = 20000,
        MaxHealth = 20000,
        RegenRate = 100,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 120,
        EnergyValue = 62500,
        MassValue = 8350,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0012", --Mobile Air Gantry
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 10,
        Health = 20000,
        MaxHealth = 20000,
        RegenRate = 100,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 120,
        EnergyValue = 62000,
        MassValue = 8400,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0021", -- Factory Scaffold
    AddCategories = {
        SCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0024", -- Gantry Scaffold
    AddCategories = {
        XSCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0026", -- Naval Factory Scaffold
    AddCategories = {
        SCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0028", -- Experimental Sea Scaffold
    AddCategories = {
        XSCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0101", -- Point Defence
    AddCategories = {
        PDAADEFENSES = true,
    },   
    Economy = {
        BuildTime = 35,
        EnergyValue = 850,
        MassValue = 380,
    },
    Weapons = {
        [1] = {
            Damage = 300,
            DamageRadius = 1,
            MaxRadius = 80,
            MuzzleVelocity = 120,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0102", -- AA
    AddCategories = {
        PDAADEFENSES = true,
    }, 
    Defense = {
        Health = 3000,
        MaxHealth = 3000,
        RegenRate = 6,
    },
    Weapons = {
        [1] = {
            Damage = 238,
            DamageRadius = 1,
            MaxRadius = 88,
            MuzzleVelocity = 90,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0202", --Shield Generator
    Defense = {
        Health = 1500,
        MaxHealth = 1500,
        RegenRate = 4,
        Shield = {
            AllowPenetration = true,
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 20000,
            ShieldRechargeTime = 40,
            ShieldRegenRate = 150,
            ShieldSize = 65,
        },
    },
    Economy = {
        BuildTime = 40,
        CaptureTimeMult = 0.6,
        EnergyValue = 750,
        MassValue = 300,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0204", --Missile Launch/Defense Combo
    Defense = {
        EconomyThreatLevel = 30,
        SurfaceThreatLevel = 50,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 180,
        CaptureTimeMult = 0.6,
        EnergyValue = 3000,
        MassValue = 900,
    },
    Weapons = {
	    [1] = { -- Long Range Tactical Missile
		   Damage = 500,
		   RateOfFire = 0.1,
		},
        [2] = { -- EMP Flux Warhead
            Ammo = {
                BuildTime = 300,
                EnergyCost = 10500,
                InitialStored = 0,
                MassCost = 3000,
                MaxStorage = 3,
            },
            NukeData = {
                InnerDamage = 130000,
                InnerRadius = 30,
                InnerToOuterSegmentCount = 10,
                OuterDamage = 0,
                OuterRadius = 60,
                PulseCount = 20,
                PulseDamage = 1000,
                StunDuration = 5,
                TimeToOuterRadius = 10,
            },
        },
        [3] = { -- Anti Strategic Missile
            Ammo = {
                BuildTime = 180,
                EnergyCost = 4000,
                InitialStored = 0,
                MassCost = 1000,
                MaxStorage = 5,
            },
        },
		[4] = { -- Death Weapon
		    Damage = 10000,
		},
		[5] = { -- Power Detonate
		    Damage = 5000,
		},
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0303", --Radar/Sonar
    AddCategories = {
        INTELSQUAD = true,
    },
    Intel = {
	    --OmniRadius = 115,
        RadarRadius = 115,
		--RadarStealth = true,
		--RadarStealthFieldRadius = 115,
        SonarRadius = 115,
        VisionRadius = 20,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0701", --Mass Extractor
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 20,
        Health = 2000,
        MaxHealth = 2000,
        RegenRate = 10,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 25,
        EnergyValue = 500,
        MassValue = 50,
        ProductionPerSecondMass = 2,
    },
    Intel = {
        VisionRadius = 20,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0702", --Energy Production Facility
     Defense = {
        Health = 3000,
        MaxHealth = 3000,
        RegenRate = 3,
    },
    Description = '<LOC UNIT_DESCRIPTION_0015>Energy Genorating Mass Convertor',
    Display = {
       DisplayName = '<LOC UNIT_NAME_0030>EGMC',
    },
    Economy = {
        BuildTime = 24,
        EnergyValue = 0,
        MassValue = 155,
        ProductionPerSecondEnergy = 3,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucb0801", --Research Station
    Economy = {
        BuildTime = 42,
        EnergyValue = 750,
        MassValue = 375,
        ProductionPerSecondResearch = 0.0125,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucl0001", -- Cybran ACU
    Defense = {
        EconomyThreatLevel = 100,
        Health = 60000,
        MaxHealth = 60000,
        RegenRate = 75,
        SurfaceThreatLevel = 40,
    },
	Weapons = {
	    [1] = { -- Molecular Ripper Cannon
		    Damage = 800,
		},
		[2] = { -- UPGRADE - Overcharge Cannon
		    Damage = 1000,
		},
		[3] = { -- UPGRADE - Nanobot Weapon
		    Damage = 20,
		},
		[4] = { -- Death Nuke
		    NukeData = {
                InnerDamage = 3500,
                InnerRadius = 20,
                InnerToOuterSegmentCount = 10,
                OuterDamage = 500,
                OuterRadius = 40,
                PulseCount = 10,
                PulseDamage = 200,
                TimeToOuterRadius = 5,
            },
		},
		[5] = { -- UPGRADE - Linked Railgun
		    Damage = 75,
		},
		[6] = { -- UPGRADE - Short Range Tactical Missile
		    Damage = 200,
		},
	},
} 
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucl0002", --Engineer
    Build = {
        BuildArmManipulators = {
            {
                AutoInitiateRepairCommand = false,
            },
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucl0102", -- Brackman
    Defense = {
        Health = 800,
        MaxHealth = 800,
        Shield = {
            ShieldMaxHealth = 80,
            ShieldRechargeTime = 15,
            ShieldRegenRate = 8,
        },
    },    
    Intel = {
        VisionRadius = 44,
    },
    Weapons = {
        [1] = {
            Damage = 500,
            DamageRadius = 3.5,
            FiringRandomnessWhileMoving = 6,
            MaxRadius = 64,
            StunChance = 2,
            StunDuration = 0.5,
            TargetPriorities = {
                'MOBILE',
                'STRUCTURE',
                'ALLUNITS',
            },
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucl0103", -- Loyalist	
    AddCategories = {
        BOTSQUADS = true,
    },
    Defense = {
        Health = 1100,
        MaxHealth = 1100,
        RegenRate = 4,
        Shield = {
            ShieldMaxHealth = 150,
            ShieldRechargeTime = 15,
            ShieldRegenRate = 15,
        },
    },
    Intel = {
        --RadarStealth = true,
        --SonarStealth = true,        
        VisionRadius = 38,
    },
    Weapons = {
        [1] = {
            Damage = 34,
            MaxRadius = 38,
            MuzzleVelocity = 60,
        },
        [2] = {
            Damage = 34,
            MaxRadius = 38,
            MuzzleVelocity = 60,
        },
        [3] = {
            Damage = 34,
            MaxRadius = 34,
            MuzzleVelocity = 60,
        },
        [4] = { -- Power Detonate
            Damage = 500, 
            MaxRadius = 10, 
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucl0104",  -- Cobra
    Defense = {
        Health = 950,
        MaxHealth = 950,
        Shield = {
            ShieldMaxHealth = 95,
            ShieldRechargeTime = 15,
            ShieldRegenRate = 10,
        },
    },    
    Intel = {
        VisionRadius = 36,
    },
    Weapons = {
        [1] = { -- Main
            Damage = 200,
            MaxRadius = 72,
            MuzzleVelocity = 6,
        },
        [2] = { -- Power Detonate
            Damage = 500,
            DamageRadius = 10,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucl0204", -- Adaptor
    Defense = {
        Health = 700,
        MaxHealth = 700,
        RegenRate = 2,
        Shield = {
            AllowPenetration = true,
            ShieldDamageAbsorb = 0.85,
            ShieldEnergyDrainRechargeTime = 5,
            ShieldMaxHealth = 2000,
            ShieldRechargeTime = 10,
            ShieldRegenRate = 50,
            ShieldRegenStartTime = 0,
        },
    },
    Intel = {
        VisionRadius = 40,
    },
    Weapons = {
        [1] = {
            Damage = 28,
            MaxRadius = 64,
            MuzzleVelocity = 70,
        },
        [2] = {
            Damage = 28,
            MaxRadius = 64,
            MuzzleVelocity = 70,
        },
        [3] = { 
            Damage = 2,
            MaxRadius = 64,
        }, 
        [4] = { -- Power Detonate
            Damage = 500,
            MaxRadius = 10,
        }, 
    },        	
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucm0001", -- Escape Pod
    Air = {
        MaxAirspeed = 18,
        MinAirspeed = 6,
    },
    Defense = {
        Health = 30000,
        MaxHealth = 30000,
        RegenRate = 200,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucs0103", -- Destroyer
   AddCategories = {
        NAVALSQUADS = true,
    },
    Defense = {
        Health = 4500,
        MaxHealth = 4500,
    },
    Economy = {
        BuildTime = 90,
        EnergyValue = 1300,
        MassValue = 480,
    },
    Intel = {
        RadarRadius = 64,
        SonarRadius = 64,
        VisionRadius = 64,
        WaterVisionRadius = 64,
    },
    Weapons = {
        [1] = {--Main
            Damage = 110,
            MaxRadius = 80,
            MuzzleVelocity = 23,
        },
        [2] = { --AA
            Damage = 50,
            MaxRadius = 64,
            MuzzleVelocity = 60,
        },
        [3] = { --Torpedo
            Damage = 100,
            MaxRadius = 64,
            MuzzleVelocity = 5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucs0105", -- Battleship
   AddCategories = {
        NAVALSQUADS = true,
    },
    Defense = {
        Health = 9000,
        MaxHealth = 9000,
    },
    Economy = {
        BuildTime = 160,
        EnergyValue = 3000,
        MassValue = 900,
    },
    Intel = {
        RadarRadius = 75,
        SonarRadius = 75,
        VisionRadius = 75,
        WaterVisionRadius = 75,
    },
    Weapons = {
        [1] = { -- Proton Cannon 1
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29.5,
        },
        [2] = { -- Proton Cannon 2
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29.5,
        },
        [3] = { -- Proton Cannon 3
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29.5,
        },
        [4] = { -- AA Electron Autocannon 1
            Damage = 60,
            MaxRadius = 64,
            MuzzleVelocity = 90,
        },
        [5] = { -- AA Electron Autocannon 2
            Damage = 60,
            MaxRadius = 64,
            MuzzleVelocity = 90,
        },
        [6] = { -- Nanite Torpedo
            Damage = 150,
            MaxRadius = 64,
            MuzzleVelocity = 5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucs0901", -- Carrier
   AddCategories = {
        NAVALSQUADS = true,
    },
    Defense = {
        Health = 7000,
        MaxHealth = 7000,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 120,
        BuildableCategory = {
            'BUILTBYCARRIER CYBRAN MOBILE AIR',
        },
		EnergyValue = 1800,
        MassValue = 800,
    },
    Intel = {
        RadarRadius = 64,
        SonarRadius = 64,
        VisionRadius = 42,
        WaterVisionRadius = 64,
    },
    Weapons = {
        [1] = { -- Disintegrator Pulse Laser 1
            Damage = 150,
            MaxRadius = 50,
            MuzzleVelocity = 18.5,
        },
        [2] = { -- Disintegrator Pulse Laser 2
            Damage = 150,
            MaxRadius = 50,
            MuzzleVelocity = 18.5,
        },
        [3] = { -- Disintegrator Pulse Laser 3
            Damage = 150,
            MaxRadius = 50,
            MuzzleVelocity = 18.5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0101", -- Megalith II
    Audio = {
        ShieldOff = 'SC2/SC2/Buildings/CYBRAN/UCB0202/snd_UCB0202_ShieldGen_Activate',
        ShieldOn = 'SC2/SC2/Buildings/CYBRAN/UCB0202/snd_UCB0202_ShieldGen_Activate',
    },
    Defense = {
        Health = 9350,
        MaxHealth = 9350,
		RegenRate = 260,
        Shield = {
            AllowPenetration = true,
            CollisionOffsetY = -4, 
            CollisionShape = 'Sphere', 
            ImpactEffects = 'ShieldHit01', 
            Mesh = '/meshes/Shield/Shield01_mesh', 
            PanelArray = {
                Panel_1 = '/meshes/Shield/ShieldDomeSection01_mesh', 
                Panel_2 = '/meshes/Shield/ShieldDomeSection02_mesh', 
            },
            ShieldDamageAbsorb = 0.85,
            ShieldRechargeTime = 20, 
            ShieldMaxHealth = 9350,
            ShieldRegenRate = 80,
            ShieldSize = 32, 
            ShieldType = 'Panel', 
            StartOn = true, 
        },
		SurfaceThreatLevel = 100,
    },
	Display = {
        AnimationWalkRate = 0.66,
    },
    Economy = {
        BuildTime = 125,
        EnergyValue = 2300,
        MassValue = 525,
    },
    Intel = {
        RadarStealth = true,
        RadarRadius = 10,
        SonarRadius = 38,
    },
    Physics = {
        BackUpDistance = 12,
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 2,
        MaxSpeedReverse = 1,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 30,
        TeleportTime = 5,
    },
    Weapons = {
        [1] = { -- Proton Cannon
            Damage = 400,
            DamageRadius = 4.5,
            FiringRandomnessWhileMoving = 3,
        },
        [2] = { -- Disintegrator Pulse Laser 1
            Damage = 14,
            DamageRadius = 1,
            HeadingArcCenter = 82,
            HeadingArcRange = 80,
            MinRadius = 10,
            PrefersUniqueTarget = true,
            TurretYaw = 75,
            TurretYawRange = 85,
            TurretYawSpeed = 180, 
        },
        [3] = { -- Disintegrator Pulse Laser 2
            Damage = 14,
            DamageRadius = 1,
            HeadingArcCenter = 278,
            HeadingArcRange = 80,
            MinRadius = 10,
            PrefersUniqueTarget = true,
            TurretYaw = 285,
            TurretYawRange = 85,
            TurretYawSpeed = 180, 
        },
        [4] = { -- Linked Railgun 1
            Damage = 15,
            TargetPriorities = {
                'HIGHALTAIR',
                'AIR MOBILE',
                'ALLUNITS',
            },
            TrackingRadius = 1.05,
        },
        [5] = { -- Linked Railgun 2
            Damage = 15,
            TargetPriorities = {
                'HIGHALTAIR',
                'AIR MOBILE',
                'ALLUNITS',
            },
            TrackingRadius = 1.05,
        },
        [6] = { -- Linked Railgun 3
           Damage = 15,
		   TargetPriorities = {
                'HIGHALTAIR',
                'AIR MOBILE',
                'ALLUNITS',
            },
            TrackingRadius = 1.05,
        },
        [7] = { -- Linked Railgun 4
            Damage = 15,
            TargetPriorities = {
                'HIGHALTAIR',
                'AIR MOBILE',
                'ALLUNITS',
            },
            TrackingRadius = 1.05,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0102", -- Giant Transport
    Air = {
        --AutoLandTime = 1,
        MaxAirspeed = 15,
    },
    CollisionOffsetY = 5,
    CollisionOffsetZ = 5,
    Defense = {
        AirThreatLevel = 60,
        Health = 4500,
        MaxHealth = 4500,
        RegenRate = 250,
    },
    Economy = {
        BuildTime = 180,
        EnergyValue = 1180,
        MassValue = 237,
    },
    Intel = {
        RadarStealth = true,
        VisionRadius = 85,
    },
    Navigation = {
        Radius = 10,
    },
    Physics = {
        Elevation = 25,
    },
    Transport = {
        StorageRange = 10,
        StorageSlots = 75,
    },
    Weapons = {
        [1] = { -- Iridium Rocket Pack 1
            Damage = 125,
            DamageRadius = 1.5,
        },
        [2] = { -- Iridium Rocket Pack 2
            Damage = 125,
            DamageRadius = 1.5,
        },
        [3] = { -- Nanite Missile System 1
            Damage = 7,
        },
        [4] = { -- Nanite Missile System 2
            Damage = 7,
        },
		[5] = { -- Air Crash
            Damage = 2500,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0103", -- Bomb Bouncer
    Defense = {
        Health = 3000,
        MaxHealth = 3000,
        RegenRate = 100,
        Shield = {
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 3000,
            ShieldRechargeTime = 20,
            ShieldReflectChance = 1,
            ShieldRegenRate = 1000,
            ShieldSize = 0.25,
            SizeX = 16,
            SizeY = 0.5,
            SizeZ = 16,
        },
        SurfaceThreatLevel = 50,
    },
    Display = {
        AnimationWalkRate = 0.64,
    },
    Economy = {
        BuildTime = 100,
        EnergyValue = 2375,
        MassValue = 475,
    },
    Physics = {
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 2,
        MaxSpeedReverse = 0,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 20,
        TeleportTime = 5,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0111", -- CRex
    Defense = {
        Health = 51300,
        MaxHealth = 51300,
        RegenRate = 500,
        SurfaceThreatLevel = 200,
    },
    Display = {
        AnimationWalkRate = 0.64,
    },
    Economy = {
        BuildTime = 300,
        EnergyValue = 4900,
        MassValue = 1525,
    },
    Physics = {
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 1.75,
        MaxSpeedReverse = 0,
        MaxSteerForce = 10,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 40,
        TeleportTime = 5,
    },
    Weapons = {
        [1] = { -- C-Rex Flamethrower of Death
            Damage = 220,
            FiringTolerance = 15,
            HeadingArcRange = 60, 
            SlavedToBodyArcRange = 40, 
            ValidateFiringTrajectory = false,
        },
        [2] = { -- Frag Missile
            Damage = 32,
            DamageRadius = 2,
        },
        [3] = { -- Short Range Tactical Missile 1
            Damage = 300,
            FiringRandomness = 0,
            FiringRandomnessWhileMoving = 0,
            TargetPriorities = {
                'STRUCTURE',
                'ALLUNITS',
            },
        },
        [4] = { -- Short Range Tactical Missile 2
            Damage = 300,
            FiringRandomness = 0,
            FiringRandomnessWhileMoving = 0,
            TargetPriorities = {
                'STRUCTURE',
                'ALLUNITS',
            },
        },
		[5] = { -- Death Weapon
            Damage = 3750,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0112", -- Soul Ripper II
    Air = {
        --AutoLandTime = 1,
        MaxAirspeed = 7,
        MinAirspeed = 3,
        StartTurnDistance = 5,
    },
    Defense = {
        AirThreatLevel = 5,
        EconomyThreatLevel = 0,
        Health = 8250,
        MaxHealth = 8250,
        RegenRate = 420,
        SurfaceThreatLevel = 100,
    },
    Economy = {
        BuildTime = 240,
        EnergyValue = 5625,
        MassValue = 1200,
    },
    Intel = {
        VisionRadius = 90,
    },
    Navigation = {
        Radius = 10,
    },
    Physics = {
        Elevation = 25,
    },
    Weapons = {
        [1] = { -- Laser 1
            Damage = 67,
        },
        [2] = { -- Laser 2
            Damage = 67,
        },
        [3] = { -- Laser 3
            Damage = 67,
        },
        [4] = { -- Missile 1
            Damage = 6,
        },
        [5] = { -- Missle 2
            Damage = 6,
        },
        [6] = { -- Missile 3
            Damage = 6,
        },
        [7] = { -- AntiAir 1
            Damage = 82,
        },
        [8] = { -- AntiAir 2
            Damage = 82,
        },
		[9] = { -- Air Crash
            Damage = 2500,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0113", -- Kraken
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 15000,
        MaxHealth = 15000,
        RegenRate = 350,
        SurfaceThreatLevel = 70,
    },
    Economy = {
        BuildTime = 120,
        EnergyValue = 1675,
        MassValue = 455,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0114", -- Magnetron
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 10,
        Health = 16500,
        MaxHealth = 16500,
        RegenRate = 160,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 150,
        EnergyValue = 3600,
        MassValue = 700,
    },
	Weapons = {
        {
            MaxRadius = 125,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0115", -- Proto-Brain Complex
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 70,
        Health = 1350,
        MaxHealth = 1350,
        RegenRate = 48,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 330,
        EnergyValue = 3900,
        MassValue = 2000,
        ProductionPerSecondResearch = 0.12,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "ucx0116", -- Proto-Brain
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 50,
        Health = 1500,
        MaxHealth = 1500,
        RegenRate = 60,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 60,
        EnergyValue = 0,
        MassValue = 0,
    },
    Weapons = {
        [1] = {
            Damage = 70,
            RateOfFire = 1,
        },
        [2] = {
            Damage = 70,
            RateOfFire = 1,
        },
        [3] = {
            Damage = 70,
            RateOfFire = 1,
        },
        [4] = {
            Damage = 70,
            RateOfFire = 1,
        },
        [5] = {
            Damage = 70,
            RateOfFire = 1,
        },
        [6] = {
            Damage = 70,
            RateOfFire = 1,
        },
        [7] = {
            Damage = 70,
            RateOfFire = 1,
        },
        [8] = {
            Damage = 70,
            RateOfFire = 1,
        },
    },
}
--**********************************************
--* Illuminate
--**********************************************
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uia0103", -- Vulthoo Gunship
    AddCategories = {
        GUNSHIPSQUADS = true,
		GUNSHIP = true,
    },
    Air = {
        --AutoLandTime = 1,
    },
    Defense = {
        Health = 1450,
        MaxHealth = 1450,
        RegenRate = 4,
        Shield = {
            ShieldReflectChance = 0.2,            
            ShieldMaxHealth = 1000,
            ShieldRechargeTime = 30,
            ShieldRegenRate = 10,
        },
    },
	Display = {
        DisplayName = 'Specter',
    },
    General = {
        UnitName = 'Specter',
    },
    Intel = {
        VisionRadius = 32,
    },
    Navigation = {
        Radius = 1.5,
    },
    Physics = {
        CollisionPushClass = 2,
        Elevation = 10,
    },
    Weapons = {
        [1] = {
            Damage = 104,
            MaxRadius = 26,
            MuzzleVelocity = 80,
        },
    },
}
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uia0104", -- WeDooBoth Fighter/Bomber
    AddCategories = {
        AIRSQUADS = true,
    },
    Air = {
        --AutoLandTime = 1,
    },
	Display = {
        DisplayName = 'Corona',
    },
    General = {
        UnitName = 'Corona',
    },
    Intel = {
        RadarRadius = 120,
        VisionRadius = 64,
    },
    Navigation = {
        Radius = 3,
    },
    Physics = {
        CollisionPushClass = 2,
        Elevation = 36,
    },
    Weapons = {
        [1] = {  -- AutoCannon
            Damage = 100,
            MaxRadius = 50,
            MuzzleVelocity = 40,
        },
        [2] = { -- Stock Bomb
            Damage = 300,
            MaxRadius = 64,
        },
        [3] = { -- Scorch Bomb
            Damage = 30,
            MaxRadius = 64,  
        },
    },                      
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uia0901", -- HeeHola Air Transport
    AddCategories = {
        TRANSPORTSQUADS = true,
    },
     Air = {
        --AutoLandTime = 1,
    },
    Defense = {
        Health = 5000,
        MaxHealth = 5000,
        RegenRate = 5,
        Shield = {
            AllowPenetration = true,
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 5000,
            ShieldRechargeTime = 10,
            ShieldReflectChance = 0.5,
            ShieldReflectRandomVector = true,
            ShieldRegenRate = 4,
        },
    },
	Display = {
        DisplayName = 'Aluminar',
    },
    General = {
        UnitName = 'Aluminar',
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0001", -- Land Factory
    Defense = {
        Health = 7500,
        MaxHealth = 7500,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 50,
        EnergyValue = 1800,
        MassValue = 720,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0002", -- Air Factory
    Defense = {
        Health = 7500,
        MaxHealth = 7500,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 50,
        EnergyValue = 1350,
        MassValue = 840,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0011", --Mobile Experimental Gantry
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 10,
        Health = 20000,
        MaxHealth = 20000,
        RegenRate = 100,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 120,
        EnergyValue = 62500,
        MassValue = 8350,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0101", -- Point Defense
    AddCategories = {
        PDAADEFENSES = true,
    }, 
    Defense = {
        Health = 4000,
        MaxHealth = 4000,
        RegenRate = 10,
    },		
    Economy = {
        BuildTime = 35,
        EnergyValue = 475,
        MassValue = 210,
    },
    Weapons = {
        {
            Damage = 300,
            MaxRadius = 100,
            MuzzleVelocity = 120,
        }, 
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0102", -- AA
    AddCategories = {
        PDAADEFENSES = true,
    },    
    Weapons = {
        {
            Damage = 192,
            MaxRadius = 88,
            MuzzleVelocity = 90,
        }, 
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0106", -- Illuminate TML
    AddCategories = {
        TMLSQUAD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0107", -- ICBM Launch Facility
    Economy = {
        EconomyThreatLevel = 30,
        SurfaceThreatLevel = 50,
    },
	General = {
        CommandCaps = {
            RULEUCC_Attack = true,
            RULEUCC_Nuke = true,
            RULEUCC_RetaliateToggle = true,
            RULEUCC_SiloBuildNuke = true,
            RULEUCC_Stop = true,
        },
    },
    Weapons = {
        [1] = { -- Inaino Strategic Missile Launcher
            Ammo = {
                BuildTime = 300,
                EnergyCost = 10500,
                InitialStored = 0,
                MassCost = 3000,
                MaxStorage = 3,
            },
            NukeData = {
                InnerDamage = 130000,
                InnerRadius = 30,
                InnerToOuterSegmentCount = 10,
                OuterDamage = 0,
                OuterRadius = 60,
                PulseCount = 20,
                PulseDamage = 1000,
                StunDuration = 5,
                TimeToOuterRadius = 10,
            },
        },
		[2] = { -- Death Weapon
		    Damage = 10000,
		},
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0021", -- Factory Scaffold
    AddCategories = {
        SCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0024", -- Gantry Scaffold
    AddCategories = {
        XSCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0202", --Shield Structure
    Defense = {
        Health = 1500,
        MaxHealth = 1500,
        RegenRate = 4,
        Shield = {
            AllowPenetration = true,
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 20000,
            ShieldRechargeTime = 40,
            ShieldReflectChance = 0.5,
            ShieldReflectRandomVector = true,
            ShieldRegenRate = 150,
            ShieldSize = 65,
        },
    },
    Economy = {
        BuildTime = 40,
        EnergyValue = 750,
        MassValue = 300,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0203", -- Anti-Tactical/ICBM Combo Defense
    Economy = {
        BuildTime = 120,
        EnergyValue = 1000,
        MassValue = 450,
    },
    Weapons = { 
        [1] = { -- Anti Tactical Missile 
            Damage = 4,
        },
        [2] = { -- Anti Strategic Missile
            Ammo = {
                BuildTime = 180,
                EnergyCost = 4000,
                InitialStored = 0,
                MassCost = 1000,
                MaxStorage = 5,
            },
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0301", --Radar/Sonar
    AddCategories = {
        INTELSQUAD = true,
    },
    Intel = {
	    --OmniRadius = 80,
        RadarRadius = 115,
		--RadarStealth = true,
		--RadarStealthFieldRadius = 40,
        SonarRadius = 115,
        VisionRadius = 20,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0701", --Mass Extractor
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 20,
        Health = 2000,
        MaxHealth = 2000,
        RegenRate = 10,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 25,
        CaptureTimeMult = 0.6,
        EnergyValue = 500,
        MassValue = 50,
        ProductionPerSecondMass = 1.2,
        RebuildBonusIds = {
            'UIB0701',
        },
        SacrificeCaptureTimeMult = 0.2,
    },
    Intel = {
        VisionRadius = 20,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0702", --Energy Production Facility
    Economy = {
        BuildTime = 24,
        EnergyValue = 0,
        MassValue = 155,
        ProductionPerSecondEnergy = 3,
    },
    Weapons = { 
        [1] = { --Electroshock
            Damage = 120,
        },
        [2] = { --Death Weapon
            Damage = 900,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0704", --Mass Converter
    Economy = {
        BuildTime = 30,
        EnergyValue = 1500,
        MassValue = 200,
        ProductionPerSecondMass = 0.25,
        ProductionPerSecondEnergy = -5,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uib0801", --Research Station
    Economy = {
        BuildTime = 42,
        EnergyValue = 750,
        MassValue = 375,
        ProductionPerSecondResearch = 0.0125,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uil0001", -- Aeon ACU
    Defense = {
        EconomyThreatLevel = 100,
        Health = 60000,
        MaxHealth = 60000,
        RegenRate = 36,
        Shield = {
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 11250,
            ShieldRechargeTime = 45,
            ShieldReflectChance = 0.5,
            ShieldReflectRandomVector = true,
            ShieldRegenRate = 225,
        },
        SurfaceThreatLevel = 40,
    },
    Transport = {
        StorageSize = 15,
        TeleportTime = 6,
    },
	Weapons = {
	    [1] = { -- Chronotron Cannon
		    Damgage = 800,
		},
		[2] = { -- UPGRADE - Chronotron Overcharge Cannon
		    Damgage = 1000,
		},
		[3] = { -- Death Nuke
		    NukeData = {
                InnerDamage = 3500,
                InnerRadius = 20,
                InnerToOuterSegmentCount = 10,
                OuterDamage = 500,
                OuterRadius = 40,
                PulseCount = 10,
                PulseDamage = 200,
                TimeToOuterRadius = 5,
            },
		},
		[4] = { -- UPGRADE - Linked Railgun
		    Damgage = 125,
		},
	},
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uil0002", --Engineer
    Build = {
        BuildArmManipulators = {
            {
                AutoInitiateRepairCommand = false,
            },
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uil0101", -- Yenzoo
    AddCategories = {
        TANKSQUADS = true,
    },
    Defense = {
        Health = 1500,
        MaxHealth = 1500,
        RegenRate = 8,
        Shield = {
            ShieldMaxHealth = 150,
            ShieldRechargeTime = 15,
            ShieldReflectChance = 0.2,
            ShieldRegenRate = 10,
        },
    },
	Display = {
        DisplayName = 'Obsidian',
    },
    General = {
        UnitName = 'Obsidian',
    },
    Intel = {
        VisionRadius = 48,
    },
    Physics = {
        Elevation = 0.15, 
        --TurnRate = 40,
    },
    Weapons = {
        [1] = {
            Damage = 120,
            MaxRadius = 40,
            MuzzleVelocity = 60,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uil0103", -- Harvog
    AddCategories = {
        BOTSQUADS = true,
    },
    Defense = {
        Health = 1200,
        MaxHealth = 1200,
        RegenRate = 4,
        Shield = {
            ShieldMaxHealth = 120,
            ShieldRechargeTime = 15,
            ShieldReflectChance = 0.2,
            ShieldRegenRate = 8,
        },
    },
	Display = {
        DisplayName = 'Flare',
    },
    General = {
        UnitName = 'Flare',
    },
    Intel = {
        VisionRadius = 38,
    },
    Weapons = {
        [1] = { -- Main
            Damage = 50,
            MaxRadius = 34,
            MuzzleVelocity = 80,
        }, 
        [2] = { -- AA
            Damage = 20,
            MaxRadius = 64,
            MuzzleVelocity = 90,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uil0104",  -- Fistoosh
    Defense = {
        Health = 950,
        MaxHealth = 950,
        Shield = {
            ShieldMaxHealth = 95,
            ShieldRechargeTime = 15,
            ShieldReflectChance = 0.2,
            ShieldRegenRate = 10,
        },
    },
    Display = {
        DisplayName = 'Evensong',
    },
    General = {
        UnitName = 'Evensong',
    },    
    Intel = {
        RadarRadius = 50,
        VisionRadius = 36,
    },
    Weapons = {
        [1] = {
            Damage = 600,
            MaxRadius = 100,
            MuzzleVelocity = 6,
        },
    },
}
UnitBlueprint {
    BlueprintId = 'uil0105', -- Crahdow
    Merge = true,
    Display = {
        DisplayName = 'Thistle',
    },
    General = {
        UnitName = 'Thistle',
    },
}
UnitBlueprint {
    BlueprintId = 'uil0202', -- Bodaboom
    Merge = true,
    Display = {
        DisplayName = 'Restorer',
    },
    General = {
        UnitName = 'Restorer',
    },
}
UnitBlueprint {
    BlueprintId = 'uil0203', -- Sliptack
    Merge = true,
    Display = {
        DisplayName = 'Asylum',
    },
    General = {
        UnitName = 'Asylum',
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uim0001", -- Escape Pod
    Air = {
        MaxAirspeed = 18,
        MinAirspeed = 6,
    },
    Defense = {
        Health = 30000,
        MaxHealth = 30000,
        RegenRate = 200,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0101", -- Urchinow
    Audio = {
        ShieldOff = 'SC2/SC2/Buildings/ILLUMINATE/UIB0202/snd_UIB0202_ShieldGen_On_Off',
        ShieldOn = 'SC2/SC2/Buildings/ILLUMINATE/UIB0202/snd_UIB0202_ShieldGen_On_Off',
    },
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 16000,
        MaxHealth = 16000,
		RegenRate = 360,
        Shield = {
            AllowPenetration = true,
            CollisionOffsetY = 0, 
            CollisionShape = 'Sphere', 
            ImpactEffects = 'ShieldHit01', 
            Mesh = '/meshes/Shield/Shield01_mesh', 
            PanelArray = {
                Panel_1 = '/meshes/Shield/ShieldDomeSection01_mesh', 
                Panel_2 = '/meshes/Shield/ShieldDomeSection02_mesh', 
            },
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 16000,
            ShieldRechargeTime = 20,
            ShieldReflectChance = 0.5,
            ShieldReflectRandomVector = true,
            ShieldRegenRate = 50,
            ShieldSize = 23,
            ShieldType = 'Panel',
            StartOn = true, 
        },
		SurfaceThreatLevel = 100,
    },
    Display = {
	    AnimationWalkRate = 8,
        Mesh = {
            LODs = {
                [1] = {
                    LODCutoff = 200,				
                },
                [2] = {
                    LODCutoff = 400,
                },
            },
        },
		DisplayName = 'Eliminator',
    },
    Economy = {
        BuildTime = 150,
        EnergyValue = 2100,
        MassValue = 490,
    },
	General = {
        UnitName = 'Eliminator',
    },
    Intel = {
        RadarRadius = 65,
        SonarRadius = 40,
        VisionRadius = 50,
        WaterVisionRadius = 50,
    },
    Physics = {
        BackupDistance = 5,
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 2.3,
        MaxSpeedReverse = 2.5,
        MaxSteerForce = 10,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 35,
        TeleportTime = 5,
    },
    Weapons = {
        [1] = {
            DamageRadius = 4,
            TurretYawSpeed = 90, 
        },
        [2] = {
            Damage = 50,
            DamageRadius = 1.5,
            HeadingArcCenter = 303,
            HeadingArcRange = 65,			
            MaxRadius = 65,
            TurretYawSpeed = 75, 
        },
        [3] = {
            Damage = 50,
            DamageRadius = 1.5,
            HeadingArcCenter = 57,
            HeadingArcRange = 65,			
            TurretYawSpeed = 75, 
        },
        [4] = {
            TurretPitch = -15,	
        },
        [5] = {
            TurretPitch = -15,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0102", -- Wilfindja
    Audio = {
        ShieldOff = 'SC2/SC2/Buildings/ILLUMINATE/UIB0202/snd_UIB0202_ShieldGen_On_Off',
        ShieldOn = 'SC2/SC2/Buildings/ILLUMINATE/UIB0202/snd_UIB0202_ShieldGen_On_Off',
    },
    Defense = {
        AirThreatLevel = 5,
        EconomyThreatLevel = 0,
        Health = 8000,
        MaxHealth = 8000,
        RegenRate = 280,
        Shield = {
            AllowPenetration = true,
            CollisionOffsetY = -1,
            CollisionShape = 'Sphere',
            ImpactEffects = 'ShieldHit01',
            Mesh = '/meshes/Shield/Shield01_mesh',
            PanelArray = {
                Panel_1 = '/meshes/Shield/ShieldDomeSection01_mesh',
                Panel_2 = '/meshes/Shield/ShieldDomeSection02_mesh',
            },
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 8000,
            ShieldRechargeTime = 60,
            ShieldReflectChance = 0.5,
            ShieldReflectRandomVector = true,
            ShieldRegenRate = 100,
            ShieldSize = 25,
            ShieldType = 'Panel',
            StartOn = true,
        },
		SurfaceThreatLevel = 100,
    },
	Display = {
        DisplayName = 'Silencer',
    },
    Economy = {
        BuildTime = 150,
        EnergyValue = 2360,
        MassValue = 460,
    },
    General = {
        CommandCaps = {
            RULEUCC_Attack = true,
            RULEUCC_Guard = true,
            RULEUCC_Move = true,
            RULEUCC_Patrol = true,
            RULEUCC_RetaliateToggle = true,
            RULEUCC_Stop = true,
            RULEUCC_Teleport = true,
        },
        MoveEnergyCost = 3000,
        TeleportCooldown = 60, 
        TeleportRange = 100,
		UnitName = 'Silencer',
    },
    Intel = {
        RadarRadius = 125,
        SonarRadius = 156,
        VisionRadius = 100,
        WaterVisionRadius = 100,
    },   
    Navigation = {
        Radius = 4, 
    },	
    Physics = {
        Elevation = 0.25,
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 4.6,
        MaxSpeedReverse = 0,
        MaxSteerForce = 1000,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 35,
        TeleportTime = 5,
    },    
    Weapons = {
        {
            MaxRadius = 40,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0103", -- Airnomo
   Audio = {
        ShieldOff = 'SC2/SC2/Buildings/ILLUMINATE/UIB0202/snd_UIB0202_ShieldGen_On_Off',
        ShieldOn = 'SC2/SC2/Buildings/ILLUMINATE/UIB0202/snd_UIB0202_ShieldGen_On_Off',
   },
   Defense = {
        AirThreatLevel = 140,
        EconomyThreatLevel = 0,
        Health = 13000,
        MaxHealth = 13000,
        RegenRate = 360,
        SurfaceThreatLevel = 40,
        Shield = {
            AllowPenetration = true,
            CollisionOffsetY = 0, 
            CollisionShape = 'Sphere', 
            ImpactEffects = 'ShieldHit01', 
            Mesh = '/meshes/Shield/Shield01_mesh', 
            PanelArray = {
                Panel_1 = '/meshes/Shield/ShieldDomeSection01_mesh', 
                Panel_2 = '/meshes/Shield/ShieldDomeSection02_mesh', 
            },
            ShieldDamageAbsorb = 0.85,
            ShieldMaxHealth = 13000,
            ShieldRechargeTime = 20,
            ShieldReflectChance = 0.5,
            ShieldReflectRandomVector = true,
            ShieldRegenRate = 50,
            ShieldSize = 23,
            ShieldType = 'Panel',
            StartOn = true, 
        },
    },
    Display = {
        AnimationWalkRate = 0.83,
		DisplayName = 'Ascendant',
    },
    Economy = {
        BuildTime = 140,
        EnergyValue = 3815,
        MassValue = 720,
    },
	General = {
        UnitName = 'Ascendant',
    },
    Intel = {
        RadarRadius = 150,
        VisionRadius = 100,
    },
    Physics = {
        BackUpDistance = 12,
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 2,
        MaxSpeedReverse = 1,
        MaxSteerForce = 0,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 35,
        TeleportTime = 5,
    },
    Weapons = {
        [1] = {
            Damage = 200,
            --RateOfFire = 6,
        },
        [2] = {
            Damage = 200,
            --RateOfFire = 6,
        },
        [3] = {
            Damage = 200,
            --RateOfFire = 6,
        },
        [4] = {
            Damage = 200,
            --RateOfFire = 6,
        },
        [5] = {
            Damage = 200,
            --RateOfFire = 6,
        },
        [6] = {
            Damage = 200,
            --RateOfFire = 6,
        },
        [7] = {
            Damage = 200,
            --RateOfFire = 6,
        },
        [8] = {
            Damage = 300,
            --RateOfFire = 5,
        },
        [9] = {
            Damage = 300,
            --RateOfFire = 5,
        },
        [10] = {
            Damage = 300,
            --RateOfFire = 5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0111", -- Colossus
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 67500,
        MaxHealth = 67500,
        RegenRate = 1500,
        SurfaceThreatLevel = 200,
    },
	Display = {
        AnimationWalkRate = 0.62,
    },
    Economy = {
        BuildTime = 300,
        EnergyValue = 6250,
        MassValue = 1675,
    },
    Weapons = {
        [1] = { -- Body Yaw
            Damage = 0,
        },
		[2] = { -- Eye Lazer
            Damage = 100,
        },
        [3] = { -- Right Death Claw
            Damage = 0,
        },
        [4] = { -- Right Unit Launcher
            Damage = 6,
        },
		[5] = { -- Left Death Claw
            Damage = 0,
        },
		[6] = { -- Left Unit Launcher
            Damage = 6,
        },
		[7] = { -- Death Weapon
            Damage = 1000,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0112", -- Darkenoid
    Air = {
        --AutoLandTime = 1,
        MaxAirspeed = 4,
        MinAirspeed = 0,
        StartTurnDistance = 50,
    },
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 13750,
        MaxHealth = 13750,
        RegenRate = 420,
        SurfaceThreatLevel = 160,
    },
	Display = {
        DisplayName = 'Czar',
    },
    Economy = {
        BuildTime = 240,
        EnergyValue = 5000,
        MassValue = 1500,
    },
	General = {
        UnitName = 'Czar',
    },
    Intel = {
        VisionRadius = 90,
    },
    Navigation = {
        Radius = 15,
    },
    Physics = {
        Elevation = 40,
    },
    Weapons = {
        [1] = {
            AboveWaterFireOnly = false,
            AboveWaterTargetsOnly = false,
            Damage = 150,
            FireTargetLayerCaps = {
                Air = 'Land|Water|Seabed|Sub',
            },
        },
        [2] = {
            DamageRadius = 1,
            FireTargetLayerCaps = {
                Air = 'Air|Land|Water|Seabed',
            },
        },
        [3] = {
            DamageRadius = 1,
            FireTargetLayerCaps = {
                Air = 'Air|Land|Water|Seabed',
            },
        },
        [4] = {
            DamageRadius = 1,
            FireTargetLayerCaps = {
                Air = 'Air|Land|Water|Seabed',
            },
        },
        [5] = {
            DamageRadius = 2.5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0113", -- Space Temple
    AddCategories = {
        SPACETEMPLE = true,
    },
	Build = {
        BuildScaffoldUnit = 'uib0021',
    },
	Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 40,
        Health = 1800,
        MaxHealth = 1800,
        RegenRate = 29,
        SurfaceThreatLevel = 0,
    },
	Display = {
        DisplayName = 'Portal',
    },
	Economy = {
        BuildTime = 115,
        EnergyValue = 1417,
        MassValue = 546,
    },
	Footprint = {
        SizeX = 12,
        SizeZ = 12,
    },
	General = {
        UnitName = 'Portal',
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0114", -- Loyalty Gun
   AddCategories = {
        LOYALTYGUN = true,
    },
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 20,
        Health = 1850,
        MaxHealth = 1850,
        RegenRate = 60,
        SurfaceThreatLevel = 0,
    },
	Display = {
        DisplayName = 'The Way',
    },
    Economy = {
        BuildTime = 190,
        CaptureRate = 2,
        CaptureTimeMult = 0.6,
        EnergyValue = 4810,
        MassValue = 1400,
        MaxCaptureDistance = 50,
    },
	Footprint = {
        SizeX = 12,
        SizeZ = 12,
    },
	General = {
        UnitName = 'The Way',
    },
    Navigation = {
        CostStamp = '/coststamps/Custom/UIX0114_coststamp.lua',
    },
    Weapons = {
        {
            MaxRadius = 50, -- Change to what MaxCaptureDistance is
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0115", -- Pulinsmash
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 3000,
        MaxHealth = 3000,
        RegenRate = 100,
        SurfaceThreatLevel = 80,
    },
	Display = {
        DisplayName = 'Siren',
    },
    Economy = {
        BuildTime = 120,
        EnergyValue = 2500,
        MassValue = 750,
    },
	General = {
        UnitName = 'Siren',
    },
    Physics = {
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 2,
        MaxSpeedReverse = 0,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 25,
        TeleportTime = 5,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uix0116",  -- Wilfindja Probes
    Air = {
        MaxAirspeed = 5,
        MinAirspeed = 3,
    },
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 350,
        MaxHealth = 350,
        RegenRate = 1,
    },
    Physics = {
        MaxAcceleration = 5,
        MaxBrake = 10,
        MaxSpeed = 6,
        MaxSteerForce = 5,
        TurnRate = 180,
    },
    Weapons = {
        {
            Damage = 650,
            --RateOfFire = 0.9,
        },
    },
}
--**********************************************
--* UEF
--**********************************************
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uua0101", -- Wasp
    AddCategories = {
        AIRSQUADS = true,
    },
    Air = {
        --AutoLandTime = 1,
        CombatTurnSpeed = 2.5,
    },
    Defense = {
        Health = 900,
        MaxHealth = 900,
        Shield = {
            ShieldMaxHealth = 200,
            ShieldRechargeTime = 10,
            ShieldRegenRate = 2,
        },
    },
    Intel = {
        RadarRadius = 120,
        VisionRadius = 64,
    },
    Navigation = {
        Radius = 3,
    },
    Physics = {
        CollisionPushClass = 2,
        Elevation = 48,
    },
    Weapons = {
        {
            Damage = 50,
            MaxRadius = 50,
            MuzzleVelocity = 40,
        },
    },
}
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uua0102", -- Eagle Eye
    AddCategories = {
        BOMBERSQUADS = true,
    },
    Air = {
        --AutoLandTime = 1,
    },
    Defense = {
        Health = 900,
        MaxHealth = 900,
        RegenRate = 3,
        Shield = {
            ShieldMaxHealth = 200,
            ShieldRechargeTime = 15,
            ShieldRegenRate = 18,
        },
    },
    Intel = {
        RadarRadius = 115,
        VisionRadius = 64,
    },
    Navigation = {
        Radius = 3,
    },
    Physics = {
        CollisionPushClass = 2,
        Elevation = 64,
    },
    Weapons = {
        [1] = {
            Damage = 15, 
            MaxRadius = 64,
        },
        [2] = { -- Cluster Bombs
            Damage = 30, 
            DamageRadius = 3.5, 
            MaxRadius = 64,
        },
        [3] = { -- Angler torpedo
            Damage = 250,
            MaxRadius = 64,
        },
    },
}
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uua0103", -- Broadsword
    AddCategories = {
        GUNSHIPSQUADS = true,
		GUNSHIP = true,
    },
    Air = {
        --AutoLandTime = 1,
        CirclingRadiusChangeMaxRatio = 0.98,
        CirclingRadiusChangeMinRatio = 0.85,
    },
    Defense = {
        Health = 1450,
        MaxHealth = 1450,
        Shield = {
            ShieldMaxHealth = 600,
            ShieldRechargeTime = 10,
            ShieldRegenRate = 6,
        },
    },
    Intel = {
        VisionRadius = 32,
    },
    Navigation = {
        Radius = 3,
    },
    Physics = {
        CollisionPushClass = 2,
         Elevation = 10,
    },
    Weapons = {
        {
            Damage = 220,
            MaxRadius = 26,
            MuzzleVelocity = 80, 
        },
    },
}
UnitBlueprint { 
   Merge = true,
   BlueprintId = "uua0901", -- Transport
    AddCategories = {
        TRANSPORTSQUADS = true,
    },
    Air = {
        --AutoLandTime = 1,
    },
	Defense = {
        Health = 5000,
        MaxHealth = 5000,
        RegenRate = 5,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0001", -- Land Factory
    Defense = {
        Health = 7500,
        MaxHealth = 7500,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 71,
        EnergyValue = 1800,
        MassValue = 740,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0002", -- Air Factory
    Defense = {
        Health = 7500,
        MaxHealth = 7500,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 72,
        EnergyValue = 1350,
        MassValue = 860,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0003", -- Naval Factory
    Defense = {
        Health = 10000,
        MaxHealth = 10000,
        RegenRate = 18,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 66,
        EnergyValue = 1200,
        MassValue = 600,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0011", --Eperimental Land Gantry
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 10,
        Health = 20000,
        MaxHealth = 20000,
        RegenRate = 100,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 120,
        EnergyValue = 62500,
        MassValue = 8350,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0012", --Experimental Air Gantry
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 10,
        Health = 20000,
        MaxHealth = 20000,
        RegenRate = 100,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildRate = 1,
        BuildTime = 120,
        EnergyValue = 62000,
        MassValue = 8400,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0021", -- Factory Scaffold
    AddCategories = {
        SCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0024", -- Gantry Scaffold
    AddCategories = {
        XSCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0026", -- Experimental Sea Scaffold
    AddCategories = {
        XSCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0027", -- Naval Factory Scaffold
    AddCategories = {
        SCAFFOLD = true,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0101", -- Point Defense
    AddCategories = {
        PDAADEFENSES = true,
    }, 
    Defense = {
        Health = 5000,
        MaxHealth = 5000,
    },
    Economy = {
        BuildTime = 53,
        EnergyValue = 1500,
        MassValue = 190,
    },
    Physics = {
        Elevation = 15,
    },
    Weapons = {
        {
            Damage = 400,
            MaxRadius = 80,
            MuzzleVelocity = 60,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0102", -- AA
    AddCategories = {
        PDAADEFENSES = true,
    }, 
	Economy = {
        BuildTime = 18,
        EnergyValue = 900,
        MassValue = 80,
    },
    Weapons = {
        {
            Damage = 44,
            MaxRadius = 88,
            MuzzleVelocity = 90,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0107", --ICBM Launch Facility
    Economy = {
        EconomyThreatLevel = 30,
        SurfaceThreatLevel = 50,
    },
    Weapons = {
	    [1] = { -- Long Range Cruise Missile
		    Damage = 500,
		},
        [2] = { -- Nuclear Warhead
            Ammo = {
                BuildTime = 300,
                EnergyCost = 10500,
                InitialStored = 0,
                MassCost = 3000,
                MaxStorage = 3,
            },
            NukeData = {
                InnerDamage = 130000,
                InnerRadius = 30,
                InnerToOuterSegmentCount = 10,
                OuterDamage = 0,
                OuterRadius = 60,
                PulseCount = 20,
                PulseDamage = 1000,
                StunDuration = 5,
                TimeToOuterRadius = 10,
            },
        },
		[3] = { -- Death Weapon
		    Damage = 10000,
		},
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0202", --Sheild Generator
    Defense = {
        Health = 1500,
        MaxHealth = 1500,
        RegenRate = 4,
        Shield = {
            AllowPenetration = false,
            ShieldMaxHealth = 20000,
            ShieldRechargeTime = 20,
            ShieldRegenRate = 200,
            ShieldSize = 65,
        },
    },
    Economy = {
        BuildTime = 40,
        EnergyValue = 750,
        MassValue = 300,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0203", --Tactical/ICBM Combo Defense
    Economy = {
        BuildTime = 120,
        EnergyValue = 1000,
        MassValue = 450,
    },
    Weapons = { 
        [1] = { -- Anti Tactical Missile 
            Damage = 4,
        },
        [2] = { -- Anti Strategic Missile
            Ammo = {
                BuildTime = 180,
                EnergyCost = 4000,
                InitialStored = 0,
                MassCost = 1000,
                MaxStorage = 5,
            },
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0301", -- UEF Radar
    AddCategories = {
        INTELSQUAD = true,
    },
    Intel = {
	    --OmniRadius = 325,
        RadarRadius = 115,
		--RadarStealth = true,
		--RadarStealthFieldRadius = 150,
        --SonarRadius = 325,
        VisionRadius = 20,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0302", -- UEF Sonar
    AddCategories = {
        INTELSQUAD = true,
    },
    Intel = {
	    --OmniRadius = 325,
        --RadarRadius = 325,
		--RadarStealth = true,
		--RadarStealthFieldRadius = 150,
        SonarRadius = 115,
        VisionRadius = 20,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0701", --Mass Extractor
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 20,
        Health = 2000,
        MaxHealth = 2000,
        RegenRate = 10,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 25,
        CaptureTimeMult = 0.6,
        EnergyValue = 500,
        MassValue = 50,
        ProductionPerSecondMass = 2,
        RebuildBonusIds = {
            'UUB0701',
        },
        SacrificeCaptureTimeMult = 0.2,
    },
    Intel = {
        VisionRadius = 20,
    },
    Weapons = {
        [1] = { -- Linked Rail Gun AA
            Damage = 22,
			MaxRadius = 88,
            RateOfFire = 1.5,
        },
        [2] = { -- Heavy Plasma Cannon PD
            Damage = 200,
			MaxRadius = 80,
            RateOfFire = 1.5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0702", --Energy Production Facility
    Economy = {
        BuildTime = 24,
        EnergyValue = 0,
        MassValue = 155,
        ProductionPerSecondEnergy = 3,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0704", --Mass Convertor
    Economy = {
        BuildTime = 30,
        EnergyValue = 1500,
        MassValue = 200,
        ProductionPerSecondMass = 0.25,
        ProductionPerSecondEnergy = -5,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uub0801", --Research Station
    Economy = {
        BuildRate = 1,
        BuildTime = 42,
        EnergyValue = 750,
        MassValue = 375,
        ProductionPerSecondResearch = 0.0125,
    },
    Weapons = {
        [1] = { -- Linked Rail Gun AA
            Damage = 14,
			MaxRadius = 88,
            RateOfFire = 1.5,
        },
        [2] = { -- Heavy Plasma Cannon PD
            Damage = 130,
			MaxRadius = 80,
            RateOfFire = 1.5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uul0001", -- UEF ACU
    Defense = {
        EconomyThreatLevel = 100,
        Health = 60000,
        MaxHealth = 60000,
        RegenRate = 36,
        SurfaceThreatLevel = 50,
    },
	Display = {
        AnimationWalkRate = 0.57,
    },
    Intel = {
        VisionRadius = 45,
    },
    Weapons = { 
	    [1] = { -- Build Stream
		    Damage = 0,
		},
        [2] = { -- Zephyr Anti Matter Cannon
            Damage = 800,
        },
        [3] = { -- UPGRADE - Overcharge Cannon
            Damage = 1000,
        },
		[4] = { -- Death Nuke
		    NukeData = {
                InnerDamage = 3500,
                InnerRadius = 20,
                InnerToOuterSegmentCount = 10,
                OuterDamage = 500,
                OuterRadius = 40,
                PulseCount = 10,
                PulseDamage = 200,
                TimeToOuterRadius = 5,
            },
        },
		[5] = { -- UPGRADE - Linked Railgun
            Damage = 74,
        },
		[6] = { -- UPGRADE - APDS Artillery
            Damage = 600,
        },
		[7] = { -- UPGRADE - Laanse Tactical Missile Launcher
            Damage = 220,
        },
		[8] = { -- Angler Torpedo
            Damage = 150,
        },
    },		
} 
UnitBlueprint {
   Merge = true,
   BlueprintId = "uul0002", --Engineer
    Build = {
        BuildArmManipulators = {
            {
                AutoInitiateRepairCommand = false,
            },
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId =  "uul0101", -- Rock Head
    AddCategories = {
        TANKSQUADS = true,
    },
    Defense = {
        Health = 1500,
        MaxHealth = 1500, 
    },
    Intel = {
        VisionRadius = 48,
    },
    Physics = {
        MotionType = 'RULEUMT_Amphibious', -- Makes the rockhead more like the old TA amphibious tank.
    },
    Weapons = {
        [1] = { -- Main
            Damage = 100,
            MaxRadius = 48,
            MuzzleVelocity = 60,
        },
        [2] = { -- Upgraded barrels
            Damage = 150,
            MaxRadius = 48,
            MuzzleVelocity = 60,
        },
        [3] = { -- AA
            Damage = 34,
            MaxRadius = 64,
            MuzzleVelocity = 60,
        },
    },
} 
UnitBlueprint {
   Merge = true,
   BlueprintId = "uul0102", -- Demolisher
    Defense = {
        Health = 750,
        MaxHealth = 750,
        Shield = {
            ShieldMaxHealth = 75, 
            ShieldRechargeTime = 15,
            ShieldRegenRate = 8,
        },
    },    
    Intel = {
        VisionRadius = 44,
    },
    Weapons = {
        [1] = { -- Main
            Damage = 100, 
            DamageRadius = 3.5,
            MaxRadius = 64,
            TargetPriorities = {
                'MOBILE',
                'STRUCTURE',
                'ALLUNITS',
            },
            TurretPitch = -5,
        },
        [2] = { -- Upgrade
            Damage = 60,
            DamageRadius = 3.5,
            MaxRadius = 64,
            TargetPriorities = {
                'MOBILE',
                'STRUCTURE',
                'ALLUNITS',
            },
            TurretPitch = -5,	
        },
        [3] = { -- AA upgrade
            Damage = 30,
            MaxRadius = 64,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uul0103", -- Titan
    AddCategories = {
        BOTSQUADS = true,
    },
    Defense = {
        Health = 1100,
        MaxHealth = 1100,
        RegenRate = 5,
        Shield = {
            ShieldMaxHealth = 175, 
            ShieldRechargeTime = 15,
            ShieldRegenRate = 17,
        },
    },
    Intel = {
        VisionRadius = 38,
    },
    Weapons = {	
        [1] = { -- Main
            DamageRadius = 1,
            Damage = 100,
            MaxRadius = 34,
            MuzzleVelocity = 80,
        },
        [2] = { -- AA
            Damage = 44,
            MaxRadius = 64,
            MuzzleVelocity = 60,
        },
    },
} 
UnitBlueprint {
   Merge = true,
   BlueprintId = "uul0104",  -- Meteor
    Defense = {
        Health = 950,
        MaxHealth = 950,
        Shield = {
            ShieldMaxHealth = 95, 
            ShieldRechargeTime = 20,
            ShieldRegenRate = 6,
        },
    },    
    Intel = {
        VisionRadius = 36,
    },
    Weapons = {
        [1] = {
            Damage = 200,
            MaxRadius = 100,
            MuzzleVelocity = 6,
        },
        [2] = {
            Damage = 46,
            MaxRadius = 64,
            MuzzleVelocity = 60,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uum0001", -- Escape Pod
    Air = {
        MaxAirspeed = 18,
        MinAirspeed = 6,
    },
    Defense = {
        Health = 30000,
        MaxHealth = 30000,
        RegenRate = 200,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uus0102", -- Cruiser
   AddCategories = {
        NAVALSQUADS = true,
    },
    Defense = {
        Health = 3500,
        MaxHealth = 3500,
    },
    Economy = {
        BuildTime = 55,
        CaptureTimeMult = 0.6,
        EnergyValue = 1000,
        MassValue = 480,
        SacrificeCaptureTimeMult = 0.2,
    },
    Intel = {
        RadarRadius = 64,
        SonarRadius = 64,
        VisionRadius = 64,
        WaterVisionRadius = 64,
    },
    Weapons = {
        [1] = { -- Long Range Cruise Missile
            Damage = 180,
            MaxRadius = 128,
            MuzzleVelocity = 6,
        },
        [2] = { -- Gauss Cannon
            Damage = 120,
            MaxRadius = 128,
            MuzzleVelocity = 18.5,
        },
        [3] = { -- Upgraded Gauss Cannons 
            Damage = 120,
            MaxRadius = 128,
            MuzzleVelocity = 18.5,
        },
        [4] = { -- AA Flayer SAM Launcher 1
            Damage = 130,
            MaxRadius = 64,
            MuzzleVelocity = 30,
        },
        [5] = { -- AA Flayer SAM Launcher 2
            Damage = 130,
            MaxRadius = 64,
            MuzzleVelocity = 30,
        },
        [6] = { -- Upgrade Zapper Anti Missile
            Damage = 4,
            MaxRadius = 64,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uus0104", -- Attack Submarine
   AddCategories = {
        NAVALSQUADS = true,
    },
    Defense = {
        Health = 2200,
        MaxHealth = 2200,
    },
    Economy = {
        BuildTime = 55,
        EnergyValue = 1000,
        MassValue = 400,
    },
    General = {
        ExperienceValue = 150,
    },
    Intel = {
        RadarRadius = 64,
        SonarRadius = 64,
        VisionRadius = 64,
        WaterVisionRadius = 64,
    },
    Physics = {
        MaxSpeed = 5.25,
    },
    Weapons = {
        [1] = { -- Angler Torpedo
            AlwaysRecheckTarget = false,
            Damage = 200,
            MaxRadius = 64,
            MuzzleVelocity = 5,
            TargetPriorities = {
                'SPECIALHIGHPRI',
                'NAVAL MOBILE',
                'SPECIALLOWPRI',
                'ALLUNITS',
            },
        },
        [2] = { -- Light Plasma Cannon
            AlwaysRecheckTarget = false,
            Damage = 200,
            MaxRadius = 64,
            MuzzleVelocity = 14,
            --MuzzleVelocityReduceDistance = 32,
            TargetPriorities = {
                'SPECIALHIGHPRI',
                'NAVAL MOBILE',
                'SPECIALLOWPRI',
                'ALLUNITS',
            },
        },
    },
    Wreckage = {
        MassMult = 0.2,
        ReclaimTimeMultiplier = 0.1,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uus0105", -- Battleship
   AddCategories = {
        NAVALSQUADS = true,
    },
    Defense = {
        Health = 10000,
        MaxHealth = 10000,
    },
    Economy = {
        BuildTime = 190,
        EnergyValue = 5000,
        MassValue = 1700,
    },
    Intel = {
        RadarRadius = 75,
        SonarRadius = 75,
        VisionRadius = 75,
        WaterVisionRadius = 75,
    },
    Weapons = {
        [1] = { -- Gauss Cannon 1
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29,
        },
        [2] = { -- Gauss Cannon 2
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29,
        },
        [3] = { -- Gauss Cannon 3
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29,
        },
        [4] = { -- Gauss Cannon 4
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29,
        },
        [5] = { -- Gauss Cannon 5
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29,
        },
        [6] = { -- Gauss Cannon 6
            Damage = 75,
            MaxRadius = 128,
            MuzzleVelocity = 29,
        },
        [7] = { -- Nanodart Launcher 1
            Damage = 10,
            MaxRadius = 64,
            MuzzleVelocity = 15,
        },
        [8] = { -- Nanodart Launcher 2
            Damage = 10,
            MaxRadius = 64,
            MuzzleVelocity = 15,
        },
        [9] = { -- Nanodart Launcher 3
            Damage = 10,
            MaxRadius = 64,
            MuzzleVelocity = 15,
        },
        [10] = { -- Nanodart Launcher 4
            Damage = 10,
            MaxRadius = 64,
            MuzzleVelocity = 15,
        }, 
        [11] = { -- Upgrade Zapper Anti Missile
            Damage = 4,
            MaxRadius = 64,
        },
    },
}  
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0101", -- FatBoy II
    Audio = {
        ShieldOff = 'SC2/SC2/Buildings/UEF/UUB0202/snd_UUB0202_ShieldGen_Shieldoff',
        ShieldOn = 'SC2/SC2/Buildings/UEF/UUB0202/snd_UUB0202_ShieldGen_ShieldOn',
    },
    Defense = {
        AirThreatLevel = 5,
        EconomyThreatLevel = 0,
        Health = 10000,
        MaxHealth = 10000,
        RegenRate = 220,
        Shield = {
            AllowPenetration = true,
            CollisionOffsetY = 0, 
            CollisionShape = 'Sphere', 
            ImpactEffects = 'ShieldHit01', 
            Mesh = '/meshes/Shield/Shield01_mesh', 
            PanelArray = {
                Panel_1 = '/meshes/Shield/ShieldDomeSection01_mesh', 
                Panel_2 = '/meshes/Shield/ShieldDomeSection02_mesh', 
            },
            ShieldMaxHealth = 10000,
            ShieldRechargeTime = 20,
            ShieldRegenRate = 100,
            ShieldSize = 21,
            ShieldType = 'Panel',
            StartOn = true, 
        },
		SurfaceThreatLevel = 100,
    },
    Economy = {
        BuildTime = 175,
        EnergyValue = 2350,
        MassValue = 600,
    },
    Intel = {
        RadarRadius = 40,
        SonarRadius = 10,
        VisionRadius = 80,
        WaterVisionRadius = 80,
    },
    Physics = {
        BackUpDistance = 15,
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 1.5,
        MaxSpeedReverse = 1.75,
        MaxSteerForce = 1000,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 35,
        TeleportTime = 5,
    },
    Weapons = {
        [1] = { -- Main Turret
            Damage = 300,
            DamageRadius = 2.5,
            FiringTolerance = 2,
        },
        [2] = {
            Damage = 65,
            DamageRadius = 1.5,
        },
        [3] = {
            Damage = 65,
            DamageRadius = 1.5,
        },
        [4] = {
            Damage = 65,
            DamageRadius = 0.5,
        },
        [5] = {
            Damage = 65,
            DamageRadius = 1.5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0102", -- AC1000
    Air = {
        --AutoLandTime = 1,
        CirclingAirSpeed = 8,
        CirclingElevationChangeRatio = 0.5,
        CirclingRadiusVsAirMult = 0.5,
        MaxAirspeed = 13,
        MinAirspeed = 3,
    },
	Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 5675,
        MaxHealth = 5675,
        RegenRate = 290,
        SurfaceThreatLevel = 100,
    },
    Economy = {
        BuildTime = 150,
        EnergyValue = 2500,
        MassValue = 470,
    },
    Intel = {
        RadarRadius = 0,
        VisionRadius = 100,
    },
    Navigation = {
        Radius = 5,
    },
    Physics = {
        Elevation = 50,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0103", -- UEF Giant Transport
    Air = {
        --AutoLandTime = 1,
    },
	Defense = {
        AirThreatLevel = 50,
        EconomyThreatLevel = 0,
        Health = 5000,
        MaxHealth = 5000,
        RegenRate = 250,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 120,
        EnergyValue = 1925,
        MassValue = 375,
    },
    Intel = {
        VisionRadius = 90,
    },
    Navigation = {
        Radius = 10,
    },
    Physics = {
        Elevation = 25,
    },
    Transport = {
        StorageRange = 65,
        StorageSlots = 75,
    },	
    Weapons = {
        [1] = {
            DamageRadius = 1,
        },
        [2] = {
            DamageRadius = 1,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0104", -- Atlantis II
    Defense = {
        AirThreatLevel = 10,
        EconomyThreatLevel = 0,
        Health = 16500,
        MaxHealth = 16500,
        RegenRate = 200,
        SurfaceThreatLevel = 60,
    },
    Economy = {
        BuildEnergyCostMultiplier = 0.33,
        BuildMassCostMultiplier = 0.33,
        BuildRate = 1,
        BuildTime = 240,
        EnergyValue = 2575,
        MassValue = 500,
    },
    Physics = {
        BackUpDistance = 15,
        DiveSurfaceSpeed = 1.33,
        Elevation = -5.3,
        MaxAcceleration = 1.5,
        MaxBrake = 10,
        MaxSpeed = 2.5,
        MaxSpeedReverse = 2.5,
        MaxSteerForce = 5,
        TurnRate = 24,
    },
    Weapons = {
        {
            Damage = 1150,
            RateOfFire = 0.75,
        },
        {
            Damage = 1150,
            RateOfFire = 0.75,
        },
        {
            Damage = 500,
            RateOfFire = 0.2,
        },
        {
            Damage = 500,
            RateOfFire = 0.2,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0111", -- King Kriptor
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 0,
        Health = 50625,
        MaxHealth = 50625,
        RegenRate = 1430,
        SurfaceThreatLevel = 200,
    },
    Display = {
        AnimationWalkRate = 0.57,
    },
    Economy = {
        BuildTime = 300,
        EnergyValue = 5210,
        MassValue = 1325,
    },
    Physics = {
        MaxBrake = 10,
        MaxSpeed = 1.5,
        MaxSpeedReverse = 0,
        MaxSteerForce = 10,
        TurnRate = 45,
    },
    Transport = {
        StorageSize = 40,
        TeleportTime = 5,
    },
    Weapons = {
        {
       -- BodyYaw
        },
        {
            Damage = 4800,
            MaxRadius = 70,
            RateOfFire = 0.8,
        },
        {
            Damage = 4800,
            MaxRadius = 70,
            RateOfFire = 0.8,
        },
        {
            Damage = 700,
            RateOfFire = 0.75,
        },
        {
            Damage = 700,
            RateOfFire = 0.75,
        },
        {
            Damage = 700,
            RateOfFire = 0.75,
        },
        {
            Damage = 2300,
            RateOfFire = 0.5,
        },
        {
            Damage = 2300,
            RateOfFire = 0.5,
        },
        {
            Damage = 2300,
            RateOfFire = 0.5,
        },
        {
            Damage = 2300,
            RateOfFire = 0.5,
        },
        {
            Damage = 2300,
            RateOfFire = 0.5,
        },
        {
            Damage = 2300,
            RateOfFire = 0.5,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0112", -- Mega Fortress
    Air = {
	    --AutoLandTime = 1,
        MaxAirspeed = 4,
        MinAirspeed = 0,
        StartTurnDistance = 10,
        TurnSpeed = 3,
    },
    Defense = {
        AirThreatLevel = 150,
        EconomyThreatLevel = 0,
        Health = 20000,
        MaxHealth = 20000,
        RegenRate = 700,
        SurfaceThreatLevel = 60,
    },
    Economy = {
        BuildEnergyCostMultiplier = 0.33,
        BuildMassCostMultiplier = 0.33,
        BuildRate = 3,
        BuildTime = 300,
        EnergyValue = 4700,
        MassValue = 2000,
    },
    Weapons = {
        {
            Damage = 200,
            RateOfFire = 2.5,
        },
        {
            Damage = 200,
            RateOfFire = 2.5,
        },
        {
            Damage = 200,
            RateOfFire = 2.5,
        },
        {
            Damage = 200,
            RateOfFire = 2.5,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
        {
            Damage = 1300,
            RateOfFire = 2,
        },
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0114", -- Noah Unit Cannon
   AddCategories = {
        EXPERIMENTALUNITLAUNCHER = true,
    },
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 65,
        Health = 10000,
        MaxHealth = 10000,
        RegenRate = 36,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildEnergyCostMultiplier = 0.33,
        BuildMassCostMultiplier = 0.33,
        BuildRate = 7,
        BuildTime = 140,
        EnergyValue = 3045,
        MassValue = 500,
    },
}
UnitBlueprint {
   Merge = true,
   BlueprintId = "uux0115", -- Disruptor Station
   AddCategories = {
        EXPERIMENTALARTILLERY = true,
    },
    Defense = {
        AirThreatLevel = 0,
        EconomyThreatLevel = 50,
        Health = 11350,
        MaxHealth = 11350,
        RegenRate = 29,
        SurfaceThreatLevel = 0,
    },
    Economy = {
        BuildTime = 160,
        EnergyValue = 5770,
        MassValue = 648,
    },
	Navigation = {
        CostStamp = '/coststamps/Default/Default7x7_coststamp.lua',
    },
    Weapons = {
        {
            Damage = 2500,
            --RateOfFire = 0.1,
            StunChance = 0.125,
            StunDuration = 2.5,
        },
    },
}
end

--[[
	File: Blueprints.lua
	Author(s): Mithy/Overrated/SoLjA
	Summary  : Unit Scaling/Merges For Console version 
	Copyright (c)2022.  All rights reserved.
]]--

--[[
	Default scale
]]--
DefaultScale = 0.4 --0.4
 
--[[ 
	Category-specific scale
	Subtables are numbered in order of priority - in the case of a unit that matches more than one of these
	scale category patterns, the earliest numeric index will be the scale that is applied.
	Units must match ALL of the Categories specified, and have NONE of the Exceptions specified.
	Keep in mind that this scale is applied to the unit's projectiles as well, and the first unit of multiple
	that share a projectile will determine that projectile's scale for all units.
	
	EmitterStrings is a table of strings to match against emitter blueprintids
	If any of these are found in an emitter bpid, that entry's scale is used instead of normal scale
	This is necessary because it is not possible to automatically associate emitter blueprintids to
	a specific weapon/projectile and thus to a unit using the category matches.
	As with unit scaling, the first match sets scale for that emitter. (I took the time to add most if not all units
	to this table for easy modding purposes on console. Also added custom scale to each unit, so there is some variety. 
	Experimental units, Experimental buildings/factorys have been left to the vanilla SC2 scale. SoLjA)
]]--
ScaleCategories = {
    [1] = { -- ACU'S
        Categories = {
            'COMMAND',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'uul0001', -- UEF ACU
            'ucl0001', -- CYBRAN ACU
            'uil0001', -- ILLUMINATE ACU
        },
		PropStrings = {},
        EmitterStrings = {
		    'uul0001', 
            'ucl0001', 
            'uil0001',  
		},
        Scale = 0.7,
    },
	[2] = { -- Engineers
        Categories = {
            'ENGINEER',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'uul0002', -- UEF Engineer
            'ucl0002', -- CYBRAN Engineer
            'uil0002', -- ILLUMINATE Engineer
        },
		PropStrings = {},
        EmitterStrings = {
		    'uul0002', 
            'ucl0002', 
            'uil0002', 
		},
        Scale = 0.35,
    },
    [3] = { -- Mobile Experimental
        Categories = {
            'EXPERIMENTAL',
        },
        Exceptions = {
            'STRUCTURE',
            'POD',
        },
        Strings = {
            'ucx0101', -- Cybran Megalith
            'ucx0102', -- Cybran Giant Transport
            'ucx0103', -- Cybran Experimental Bomb Bouncer			
            'ucx0111', -- Cybran Experimental Lizardbot
            'ucx0112', -- Cybran Soul Ripper II
            'uix0101', -- Illuminate Experimental Assault Block
			'uix0102', -- Illuminate Experimental Air Defense
            'uix0111', -- Illuminate Experimental Assault Bot
            'uix0112', -- Illuminate Experimental Giant Saucer
            'uix0115', -- Illuminate Experimental Pulinsmash
            'uux0101', -- UEF Experimental Tank 
            'uux0102', -- UEF Experimental Assault Plane
            'uux0103', -- UEF Experimental Transport
            'uux0104', -- UEF Experimental Aircraft Carrier
            'uux0111', -- UEF Experimental Assault Bot
            'uux0112', -- UEF Experimental Air Fortress
        },
		PropStrings = {},
        EmitterStrings = {
            'ucx0101',
            'ucx0102',
            'ucx0103',	
            'ucx0111',
            'ucx0112',
            'uix0101',
			'uix0102',
            'uix0111',
            'uix0112',
            'uix0115',
            'uux0101',
            'uux0102',
            'uux0103',
            'uux0104',
            'uux0111',
            'uux0112',
        },
        Scale = 1.0,
    },
    [4] = { -- Naval
        Categories = {
            'NAVALSQUADS',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'ucs0103', -- Cybran Destroyer
            'ucs0105', -- Cybran Battleship
            'ucs0901', -- Cybran Aircraft Carrier
            'uus0102', -- UEF Cruiser
            'uus0104', -- UEF Attack Submarine
            'uus0105', -- UEF Battleship
        },
		PropStrings = {},
        EmitterStrings = {
		    'ucs0103',
            'ucs0105',
            'ucs0901',
            'uus0102',
            'uus0104',
            'uus0105',
		},
        Scale = 0.65,
    },
	[5] = { -- Assault Bots
        Categories = {
            'BOTSQUADS',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'ucl0103', -- Cybran Assault Bot
            'uil0103', -- Illuminate Assault Bot
            'uul0103', -- UEF Assault Bot
        },
		PropStrings = {},
        EmitterStrings = {
		    'ucl0103', 
            'uil0103', 
            'uul0103',  
		},
        Scale = 0.4,
    },
    [6] = { --Land
        Categories = {
            'MOBILE',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'ucl0102', -- Cybran Artillery Bot
            'ucl0104', -- Cybran Mobile Missile Launcher
            'ucl0204', -- Cybran Combo Defense
            'uil0104', -- Illuminate Mobile Missile Launcher
            'uil0105', -- Illuminate Mobile Anti-Air Gun
            'uil0202', -- Illuminate Armor Booster
            'uil0203', -- Illuminate Anti-Missile
            'uul0102', -- UEF Mobile Artillery
            'uul0104', -- UEF Mobile Missile Launcher
            'uul0105', -- UEF Mobile Anti-Air Gun
            'uul0201', -- UEF Mobile Shield Generator
            'uul0203', -- UEF Mobile Anti-Missile Defense
        },
		PropStrings = {},
        EmitterStrings = {
		    'ucl0102',
            'ucl0104',
            'ucl0204',
            'uil0104',
            'uil0105',
            'uil0202',
            'uil0203',
            'uul0102',
            'uul0104',
            'uul0105',
            'uul0201',
            'uul0203',
		},
        Scale = 0.45,
    },
	[7] = { --Air
        Categories = {
            'AIRSQUADS',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'uca0104', -- Cybran Fighter/Bomber
            'uia0104', -- Illuminate Fighter/Bomber
            'uua0101', -- UEF Fighter
        },
		PropStrings = {},
        EmitterStrings = {
            'uca0104',
            'uia0104',
            'uua0101',
		},
        Scale = 0.65,
    },
    [8] = { --Factorys
        Categories = {
            'FACTORY',
            'UIBASICSORTCATEGORY',
        },
        Exceptions = {
		    'AIRSQUADS',
			'BOTSQUADS',
			'BOMBERSQUADS',
            'COMMAND',
			'GUNSHIPSQUADS',
            'MOBILE',
            'NAVALSQUADS',
			'ENGINEER',
            'EXPERIMENTAL',
            'EXPERIMENTALFACTORY',
			'TANKSQUADS',
			'TRANSPORTSQUADS',
        },
        Strings = {
            'ucb0001', -- Cybran Land Factory
            'ucb0002', -- Cybran Air Factory
			'ucb0003', -- Cybran Naval Factory
            'cybran_build',
            'uib0001', -- Illuminate Land Factory
            'uib0002', -- Illuminate Air Factory
            'illuminate_build',
            'illuminate_airfactory',
            'uub0001', -- UEF Land Factory
            'uub0002', -- UEF Air Factory
			'uub0003', -- UEF Naval Factory
            'uef_landfactory',
            'uef_airfactory',
            'uef_seafactory',
        },
		PropStrings = {},
        EmitterStrings = {
		    'ucb0001',
            'ucb0002',
			'ucb0003',
            'cybran_build',
            'uib0001',
            'uib0002',
            'illuminate_build',
            'illuminate_airfactory',
            'uub0001',
            'uub0002',
			'uub0003',
            'uef_landfactory',
            'uef_airfactory',
            'uef_seafactory',
		},
        Scale = 0.5,
    },
    [9] = { -- SCAFFOLD
        Categories = {
            'SCAFFOLD',
        },
        Exceptions = {},
        Strings = {},
		PropStrings = {},
        EmitterStrings = {},
        Scale = 0.5,
    },
	[10] = { -- noah unit cannon
        Categories = {
            'EXPERIMENTALUNITLAUNCHER',
        },
        Exceptions = {},
        Strings = {
		    'uux0114', -- UEF Experimental Unit Cannon
		},
		PropStrings = {},
        EmitterStrings = {
		    'uux0114',
		},
        Scale = 0.5,
    },
	[11] = { -- Expermental Artillery
        Categories = {
            'EXPERIMENTALARTILLERY',
        },
        Exceptions = {},
        Strings = {
		    'uux0115', -- UEF Experimental Artillery
		},
		PropStrings = {},
        EmitterStrings = {
		    'uux0115',
		},
        Scale = 0.5,
    },
	[12] = { -- Air Transport Units
        Categories = {
            'TRANSPORTSQUADS',
        },
        Exceptions = {
		    'STRUCTURE',
		},
        Strings = {
            'uca0901', -- Cybran Transport
            'uia0901', -- Illuminate Transport
            'uua0901', -- UEF Transport
		},
		PropStrings = {},
        EmitterStrings = {
		    'uca0901',
			'uia0901',
			'uua0901',
		}, 
        Scale = 0.65,
    },
	[13] = { -- Tank Squads
        Categories = {
            'TANKSQUADS',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'uil0101', -- Illuminate Tank
            'uul0101', -- UEF Tank
        },
		PropStrings = {},
        EmitterStrings = { 
            'uil0101', 
            'uul0101',  
		},
        Scale = 0.45,
    },
	[14] = { -- Bomber Squads
        Categories = {
            'BOMBERSQUADS',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'uua0102', -- UEF Bomber
        },
		PropStrings = {},
        EmitterStrings = { 
            'uul0102',  
		},
        Scale = 0.7,
    },
	[15] = { -- Gunship Squads
        Categories = {
            'GUNSHIPSQUADS',
        },
        Exceptions = {
            'STRUCTURE',
        },
        Strings = {
            'uca0103', -- Cybran Gunship
			'uia0103', -- Illuminate Gunship
			'uua0103', -- UEF Gunship
        },
		PropStrings = {},
        EmitterStrings = { 
            'uca0103',
            'uia0103', 
			'uua0103',
		},
        Scale = 0.6,
    },
	[16] = { -- Radar/Sonar Structures
        Categories = {
            'INTELSQUAD',
        },
        Exceptions = {},
        Strings = {
            'ucb0303', -- Cybran Dual-Intel Station
			'uib0102', -- Illuminate Radar System
			'uub0301', -- UEF Radar Station
			'uub0302', -- UEF Sonar Station
        },
		PropStrings = {},
        EmitterStrings = { 
            'ucb0303', -- Cybran Dual-Intel Station
			'uib0102', -- Illuminate Radar System
			'uub0301', -- UEF Radar Station
			'uub0302', -- UEF Sonar Station 
		},
        Scale = 0.5,
    },
	[17] = { -- Point Defense & Anti-Air Towers
        Categories = {
            'PDAADEFENSES',
        },
        Exceptions = {},
        Strings = {
			'ucb0102', -- Cybran Anti-Air
            'ucb0101', -- Cybran Point Defense
			'ucb2301', -- Cybran Heavy Point Defnese
			'ucb5101', -- Cybran wall
            'uib0101', -- Illuminate Point Defense
			'uib0102', -- Illuminate Anti-Air
			'uib2301', -- Illuminate Heavy Point Defnese
			'uib5101', -- Illuminate Wall
			'uub0101', -- UEF Point Defense
			'uub0102', -- UEF Anti-Air
			'uub2301', -- UEF Triad
			'uub2306', -- UEF Heavy Point Defense
			'uub5101', -- UEF Wall
        },
		PropStrings = {},
        EmitterStrings = { 
            'ucb0101',
			'ucb0102',
			'ucb2301', 
			'ucb5101', 
            'uib0101', 
			'uib0102',
			'uib2301', 
			'uib5101', 
			'uub0101',
			'uub0102',
			'uub2301', 
			'uub2306', 
			'uub5101', 
		},
        Scale = 0.5,
    },
	[18] = { -- Illuminate Experimental Teleporter
        Categories = {
            'SPACETEMPLE',
        },
        Exceptions = {},
        Strings = {
            'uix0113', -- Space Temple
        },
		PropStrings = {},
        EmitterStrings = { 
            'uix0113',
		},
        Scale = 0.5,
    },
	[19] = { -- Illuminate Experimental Conversion Ray
        Categories = {
            'LOYALTYGUN',
        },
        Exceptions = {},
        Strings = {
            'uix0114', -- Loyalty Gun
        },
		PropStrings = {},
        EmitterStrings = { 
            'uix0114',
		},
        Scale = 0.5,
    },
	[20] = { -- Illuminate TML
		Categories = {
			'TMLSQUAD',
		},
		Exceptions = {},
        Strings = {
            'uib0106', -- Illuminate TML
        },
		PropStrings = {},
        EmitterStrings = { 
            'uib0106',
		},
        Scale = 0.5,
	}
}
--[[
	Any units containing these categories will not be scaled at all, nor will their weapons or projectiles.
	If they share weapons and projectiles with a unit that does get scaled, those weapons/projectiles will
	still be scaled according to the second unit's categories.
]]--

SkipCategories = {
    'EXPERIMENTALFACTORY',
    'XSCAFFOLD',
}
 
SkipStrings = {}

-- As above, but for emitter ids containing these strings
SkipEmitterStrings = {
-- Weapon Emitters v
    'w_c',
    'w_i',
    'w_u',
    'w_g',
    'nuke',
    'emp01',
    'ucb0011',
    'ucb0012',
    'uib0011',
    'expfactory',
    'expairfactory',
}

-- As above, but for props
SkipPropStrings = {}

--[[
	Blueprint scaling maps and template subtables - use the same structure as a blueprint
	True values indicate default scaling
	Numeric values multiply default scaling (e.g. 1.5 times default 0.5 scaling would equal 0.75 scale for that blueprint value)
	
	For un-named / numeric keys, providing only one subtable and/or one value as in the effectsTemplate Offset table will cause
	all numerically-keyed subtables/values in that table in the actual blueprint to be scaled (in this case, all Offset values)
]]--

-- Template subtable for effects offset scaling
local effectsTemplate = {
    Effects = {
        {
            Offset = {
                true,
            },
            Scale = true,
        },
    },
    Footfall = {
        Bones = {
            {
                Scale = true,
            },
        },
    },
    Treads = { 
        ScrollMultiplier = true, -- Default is 0.9. Matched with MaxSpeed
    },
}

-- Unit blueprint scale map - these values will be scaled if present in each blueprint
ScaleMap_Unit = {
    Air = {
	    --SPEED HACK!! comment out to let the game engine set the Min/Max Air speed.
        --AutoLandTime = false,
        --MaxAirspeed = true, -- "0.8" is the default. Comment out or set to "true".
        --MinAirspeed = true,
        --TurnSpeed = true,		
    },
    CollisionDetectors = {
        SecondPylon = {
            SizeX = true,
            SizeY = true,
            SizeZ = true,
            OffsetY = true,
        },
    },
    CollisionOffsetX = true,
    CollisionOffsetY = true,
    CollisionOffsetZ = true,
    Death = {
        ExplosionEffectScale = true,
    },
    Defense = {
        Shield = {
            SizeX = true,
            SizeY = true,
            SizeZ = true,
            CollisionOffsetY = true,
            ShieldSize = true,
        },
    },
    Display = {
        BuildEffectsScale = true,
        BuildEffectSphereHeight = true,
        BlinkingLights = {
            {
                BLOffsetX = true,
                BLOffsetY = true,
                BLOffsetZ = true,
                BLScale = true,
            },
        },
        EmitterScale = true,
        IdleEffects = {
            Land = effectsTemplate,
            Water = effectsTemplate,
            Air = effectsTemplate,
        },
		Mesh = {
            CastShadow = true,
            LODs = {
                [1] = {
                    LODCutoff = 75,
				},
				[2] = {
                    LODCutoff = 150,
				},
				[3] = {
                    LODCutoff = 300,
				},
			},
        },
        MovementEffects = {
            Land = effectsTemplate,
            Water = effectsTemplate,
            Air = effectsTemplate,
            BeamExhaust = effectsTemplate,
        },
        Tarmacs = {
            {
                Width = true,
                Length = true,
            },
        },
        UniformScale = true,
    },
    Footprint = {
        SizeX = '=1',
        SizeZ = '=1',
    },
	General = {
        ExperienceValue = true,
		JumpRange = true,
		TeleportRange = true,
        UnitWeight = true,
    },
    Intel = {
        --RadarRadius = true,
        --SonarRadius = true,
        VisionRadius = true,
        WaterVisionRadius = true,
    },
    LifeBarHeight = true,
    LifeBarOffset = true,
    LifeBarSize = true,
    Navigation = {
        Radius = true,
    },
    Physics = {
        Footprint = {
            SizeX = true,
            SizeY = true,
            SizeZ = true,
        },
		-- SPEED HACK!! comment out to let the game engine set the Min/Max acceleration, speed, brake, turn rate & steer force.
        --MaxAcceleration = true, -- "1.4" is default scale. comment out or set to "true"
        --MaxBrake = true,
        --MaxSpeed = true,
        --MaxSpeedReverse = true,
        TurnRate = true, 
		MaxSteerForce = true,
        RaisedPlatforms = {
            true,
        },
        RollOffPoints = {
            {
                X = true,
                Y = true,
                Z = true,
            },
        },
    },
    SelectionCenterOffsetZ = true,
    SelectionMeshOffsetX = true,
    SelectionMeshOffsetY = true,
    SelectionMeshOffsetZ = true,
    SelectionSizeX = true,
    SelectionSizeZ = true,
    SelectionThickness = true,
    SizeX = true,
    SizeY = true,
    SizeZ = true,
}

ScaleMap_Weapon = { --1.4*0.5 = 0.7 default scale,  1.4*0.7 = 0.98 experimental scale
    CameraShakeMax = true,
    CameraShakeMin = true,
    CameraShakeRadius = true,
    DamageRadius = true, --a decrease for DamageRadius buffs should probably accompany this
    FiringRandomness = true, --reduce FiringRandomness slightly to compensate for smaller unit hitboxes
    MinRadius = true,
    WeaponEffectScale = {
        Primary = true,
    },
}

ScaleMap_Proj = {
    CollisionOffsetX = true,
    CollisionOffsetZ = true,
    Display = {
        Mesh = {
            LODs = {
                [1] = {
                    LODCutoff = 75,
				},
				[2] = {
                    LODCutoff = 150,
				},
				[3] = {
                    LODCutoff = 300,
				},
			},
		},
        UniformScale = true,
    },
}

ScaleMap_Prop = {
    Display = {
        Mesh = {
            LODs = {
                [1] = {
                    LODCutoff = 75,
				},
				[2] = {
                    LODCutoff = 150,
				},
				[3] = {
                    LODCutoff = 300,
				},
			},
		},
        UniformScale = true,
    },
    Footprint = {
        SizeX = true,
        SizeZ = true,
    },
	Physics = {
        BlockPath = true,
    },
    SizeX = true,
    SizeY = true,
    SizeZ = true,
}

-- All emitter blueprint subtables use the same format, so a template
-- will allow for more editable and readable batching
local emitTemplate = { Keys = { {x = true, y = true, z = true} } }
ScaleMap_Emitter = {
    Thickness = true,
    XAccelCurve = emitTemplate,
    YAccelCurve = emitTemplate,
    ZAccelCurve = emitTemplate,
    SizeCurve = emitTemplate,
    XPosCurve = emitTemplate,
    YPosCurve = emitTemplate,
    ZPosCurve = emitTemplate,
    StartSizeCurve = emitTemplate,
    EndSizeCurve = emitTemplate,
	LODCutoff = 150, -- FA Mod
}

--[[
	Traverse a blueprint table via a map table, scaling specified keys (if present) with optional scale adjustments
	Will only attempt to scale numeric blueprint values using numeric or boolean map values; e.g. map-table values
	true or 1 for a corresponding numeric blueprint value will cause default scaling to be used, while a numeric
	map-table value < or > 1 will be used to multiply the default scaling (e.g. 1.5 map * 0.5 default = 0.75 scaling)
]]--
function ScaleBlueprint(scale, bp, map)
    for k, v in map do
        local numeric = type(k) == 'number'
        if bp[k] then
            if type(map[k]) == 'table' and type(bp[k]) == 'table' then
                if numeric then --Special exception for numeric indexes
                    for bk, bv in bp do
                        ScaleBlueprint(scale, bp[bk], map[k])
                    end
                else
                    ScaleBlueprint(scale, bp[k], map[k])
                end
            elseif type(bp[k]) == 'number' then
                if numeric then --Special exception for numeric indexes
                    for bk, bv in bp do
                        bp[bk] = ScaleValue(scale, bp[bk], map[k])
                    end
                else
                    bp[k] = ScaleValue(scale, bp[k], map[k])
                end
            else
                --LOG("WARNING: ScaleBlueprint - Failure to scale key '"..k.."': Value type mismatch or non-numeric blueprint value")
            end
        end
    end
end

-- Used by ScaleBlueprint to handle blueprint value scaling based on scale map
function ScaleValue(scale, bpVal, mapVal)
    if type(mapVal) == 'number' then --Map scale
        bpVal = bpVal * (scale * mapVal)
    elseif type(mapVal) == 'string' then --Modified map scale
        local mapscale = tonumber(string.sub(mapVal, 2)) or 1
        local operation = string.sub(mapVal, 1, 1)
        if operation == '<' then --Round down
            bpVal = math.floor(bpVal * (scale * mapscale))
        elseif operation == '>' then --Round up
            bpVal = math.floor(bpVal * (scale * mapscale) + 0.99)
        elseif operation == '=' then --Round nearest non-zero
            bpVal = math.max(math.floor(bpVal * (scale * mapscale) + 0.5), 1)
        end
    elseif mapVal == true then --Default scale
        bpVal = bpVal * scale
    end
    return bpVal
end

--[[
	Utility function for matching t2's values within t1
	if any is true, returns true on any match, otherwise only returns true if all of t2's values are found in t1
	comp is an optional comparator function (for e.g. string searching), otherwise a direct v == v1 compare is used.
]]--
function table.match(t1, t2, any, comp)
    comp = comp or function(a, b) return a == b end
    local matches, num = 0, table.getn(t2)
    for k2, v2 in t2 do
        for k1, v1 in t1 do
            if comp(v2, v1) then
                if any then
                    return true
                else
                    matches = matches + 1
                    break
                end
            end
        end
    end
    return num > 0 and matches == num
end

--[[
	String-search compare function for table.match above
	searches string a (t2 values) for string b (t1 values)
]]--
function stringsearch_t2(a, b)
    if type(a) == 'string' and type(b) == 'string' then
        return string.find(a, b)
    end
    return false
end

-- Returns a table of available default coststamp sizes, as well as min and max values
function GetCostStampSizes()
    --LOG("Getting default CostStamp sizes...")
    local costStampSizes = {}
    local minCostStampSize, maxCostStampSize = 2, 2
    for k, file in DiskFindFiles('/coststamps/default', '*.lua') do
        local stampSize = string.gsub(string.lower(file), '^/coststamps/default/default(%d+)x%d+_coststamp.lua$', '%1')
        stampSize = tonumber(stampSize)
        --LOG("\t"..file..": "..stampSize)
        if stampSize and stampSize > 0 then
            maxCostStampSize = math.max(maxCostStampSize, stampSize)
            minCostStampSize = math.min(minCostStampSize, stampSize)
            costStampSizes[stampSize] = stampSize
        else
            --This means I screwed up something in the pattern matching above, or a user-added default
            --coststamp filename significantly differs from the GPG default filenames
            --LOG("WARNING: ScaleBlueprints - Could not extract CostStamp size from default stamp filename '"..file.."'")
        end
    end
    --LOG("\tDone - Min / Max stamp sizes: "..minCostStampSize.." / "..maxCostStampSize)
    costStampSizes.Min = minCostStampSize
    costStampSizes.Max = maxCostStampSize
    return costStampSizes
end

-- Find a new default CostStamp based on scale
function ScaleCostStamp(bp, scale, costStampSizes)
    if bp.Navigation and bp.Navigation.CostStamp then
        if type(bp.Navigation.CostStamp) ~= 'string' then
            --LOG("WARNING: ScaleCostStamp - ["..bp.BlueprintId.."] CostStamp entry not a string!")
        elseif string.find(string.lower(bp.Navigation.CostStamp), 'default') then
            local stampSize = string.gsub(string.lower(bp.Navigation.CostStamp), '^/coststamps/default/default(%d+)x%d+_coststamp.lua$', '%1')
            stampSize = tonumber(stampSize)
            if stampSize and stampSize > 0 then
                --Calculate new stamp size from the larger of both direct scaling of existing stamp size and the re-scaled footprint size
                local newStampSize = math.floor(0.5 + math.max(stampSize * scale, math.max(bp.Footprint.SizeX or 1, bp.FootprintSizeZ or 1)))
                --If this isn't a valid size, increment by 1 until it is (this should only happen for very odd scaling sizes on large structures)
                local firstStampSize = newStampSize
                while not costStampSizes[newStampSize] and newStampSize < costStampSizes.Max do
                    newStampSize = newStampSize + 1
                end
                if firstStampSize < newStampSize then
                    --LOG("ScaleCostStamp - ["..bp.BlueprintId.."] Increased scaled CostStamp size from "..firstStampSize.." to "..newStampSize.." to match available stamp sizes")
                end

                --Set the new stamp string
                local newStampString = '/coststamps/default/default'..newStampSize..'x'..newStampSize..'_coststamp.lua'
                if DiskGetFileInfo(newStampString) then
                    --LOG("ScaleCostStamp - ["..bp.BlueprintId.."] Successfully set new cost stamp string: "..newStampString.."(scaled to size "..newStampSize.." from "..stampSize..")")
                    bp.Navigation.CostStamp = newStampString
                else
                    --LOG("WARNING: ScaleCostStamp - ["..bp.BlueprintId.."] No default cost stamp found for size "..newStampSize.." ("..newStampString..")")
                end
            else
                --LOG("WARNING: ScaleCostStamp - ["..bp.BlueprintId.."] Could not extract CostStamp size from default stamp string '"..bp.Navigation.CostStamp.."'")
            end
        end
    end
end

-- ModBlueprints
function ModBlueprints(all_blueprints)
    -- For testing, place "DEBUGTEST = true" without the quotes in config.lua and uncomment this to use.
	--[[if rawget(_G, 'DEBUGTEST') then
		for id,bp in all_blueprints.Unit do
			if bp and bp.Economy then
				if bp.Economy.BuildTime then
					bp.Economy.BuildTime = 2
					bp.Economy.EnergyValue = 0
					bp.Economy.MassValue = 0
				end
			end
		end
	end]]--
    --LOG("ModBlueprints: ScaleBlueprints")
    local id = all_blueprints.Unit
        for k, bp in {id.ucb0021,id.ucb0027,id.uib0021,id.uub0021,id.ucb0026} do

            if bp.Categories then
                table.insert(bp.Categories, 'SCAFFOLD')
                --LOG("UNIT: "..repr(bp.BlueprintId)..", after: Categories = "..repr(bp.Categories))
            end 
        end 

        for k, bp in {id.ucb0024,id.ucb0028,id.uib0024,id.uub0024,id.uub0026} do

            if bp.Categories then
                table.insert(bp.Categories, 'XSCAFFOLD')
                --LOG("UNIT: "..repr(bp.BlueprintId)..", after: Categories = "..repr(bp.Categories))
            end 
        end	
	
	-- Removes Structures from the unit cap. works fine on 360 or PC.
	--[[for id,bp in all_blueprints.Unit do
        if bp.Categories and table.find(bp.Categories,'STRUCTURE') then
            if bp.General then
                bp.General.CapCost = 0
	        end
	    end
    end]]--

    --Get a table of valid default cost stamp sizes
    local costStampSizes = GetCostStampSizes()
	
	--Non-destructive add/remove for numerically-keyed blueprint tables
    for id, bp in all_blueprints.Unit do
        --AddCategories
        if bp.AddCategories and bp.Categories then
            --LOG("\t"..bp.BlueprintId..": AddCategories:")
            for cat, val in bp.AddCategories do
                if val and not table.find(bp.Categories, cat) then
                    --LOG("\t\t"..cat)
                    table.insert(bp.Categories, cat)
                end
            end
            bp.AddCategories = nil
        end
        --RemoveCategories
        if bp.RemoveCategories and bp.Categories then
            --LOG("\t"..bp.BlueprintId..": RemoveCategories:")
            for cat, val in bp.RemoveCategories do
                if val and table.find(bp.Categories, cat) then
                    --LOG("\t\t"..cat)
                    table.removeByValue(bp.Categories, cat)
                end
            end
            bp.RemoveCategories = nil
        end
        --AddBuildableCategory
        if bp.AddBuildableCategory and bp.Economy and bp.Economy.BuildableCategory then
            --LOG("\t"..bp.BlueprintId..": AddBuildableCategory:")
            for cat, val in bp.AddBuildableCategory do
                if val and not table.find(bp.Economy.BuildableCategory, cat) then
                    --LOG("\t\t"..cat)
                    table.insert(bp.Economy.BuildableCategory, cat)
                end
            end
            bp.AddBuildableCategory = nil
        end
        --RemoveBuildableCategory
        if bp.RemoveBuildableCategory and bp.Economy and bp.Economy.BuildableCategory then
            --LOG("\t"..bp.BlueprintId..": RemoveBuildableCategory:")
            for cat, val in bp.RemoveBuildableCategory do
                if val and table.find(bp.Economy.BuildableCategory, cat) then
                    --LOG("\t\t"..cat)
                    table.removeByValue(bp.Economy.BuildableCategory, cat)
                end
            end
            bp.RemoveBuildableCategory = nil
        end
    end
    --Projectiles
    for id, bp in all_blueprints.Projectile do
        --AddCategories
        if bp.AddCategories and bp.Categories then
            --LOG("\t"..bp.Source..": AddCategories:")
            for cat, val in bp.AddCategories do
                if val and not table.find(bp.Categories, cat) then
                    LOG("\t\t"..cat)
                    table.insert(bp.Categories, cat)
                end
            end
            bp.AddCategories = nil
        end
        --RemoveCategories
        if bp.RemoveCategories and bp.Categories then
            --LOG("\t"..bp.Source..": RemoveCategories:")
            for cat, val in bp.RemoveCategories do
                if val and table.find(bp.Categories, cat) then
                    LOG("\t\t"..cat)
                    table.removeByValue(bp.Categories, cat)
                end
            end
            bp.RemoveCategories = nil
        end
    end

    --Keep track of projectiles and weapons scaled via unit blueprints
    local scaledProjectiles = {}
    local scaledWeapons = {}

    --Scale units, projectiles, and weapons
    --LOG("ModBlueprints: ScaleBlueprints: Scaling units, weapons, projectiles...")
    for id, bp in all_blueprints.Unit do
            --bp.Wreckage = nil
        --Define default unit script effect scale for all units scaled or not
        if bp.Display and not bp.Display.EmitterScale then
            bp.Display.EmitterScale = 1
        end
        -- if DefaultScale set to true then scaling is skipped 
        if not bp.Physics.DefaultScale == true then

           if (SkipStrings and table.match(SkipStrings, {id}, true, stringsearch_t2))
           or (not bp.Categories or table.match(bp.Categories, SkipCategories, true)) then
               if bp.Weapons then
                   for _, weapid in bp.Weapons do
                       local weapbp = all_blueprints.Weapon[weapid]
                       if weapbp and not scaledWeapons[weapid] then
                           if not weapbp.WeaponEffectScale then
                               weapbp.WeaponEffectScale = {}
                           end
                           weapbp.WeaponEffectScale.Primary = DefaultScale
                       end
                   end
               end
           else
               scale = DefaultScale
               --Set category-specific scale
               for num, catTable in ScaleCategories do
                   if (catTable.Categories and table.match(bp.Categories, catTable.Categories))
                   and (not catTable.Exceptions or not table.match(bp.Categories, catTable.Exceptions, true)) then
                       scale = catTable.Scale or DefaultScale
                       break
                   elseif (catTable.Strings and table.match(catTable.Strings, {id}, true, stringsearch_t2))
                   and (not catTable.StringsExceptions or not table.match(catTable.StringsExceptions, {id}, true, stringsearch_t2)) then
                       scale = catTable.Scale or DefaultScale
                       break
                   end
               end

               --Scale all lifebars to the same Height, 
               --I used 0.12 because for some reason not all units have he same lifebar height
               if bp.LifeBarHeight then
                   bp.LifeBarHeight = 0.12 * DefaultScale
               end 

               --Define default explosion effect scale for all units
               if bp.Death and not bp.Death.ExplosionEffectScale then
                   bp.Death.ExplosionEffectScale = 1
               end

               --Define default scaffold effect scale
               if bp.Display and not bp.Display.BuildEffectsScale then
                   bp.Display.BuildEffectsScale = 1
               end

               --Check for relative speed change, and define/adjust AnimationWalkRate
               if (bp.Display and bp.Display.AnimationWalk) or bp.AnimSet then
                   local speedScale = 1 / scale
                   if ScaleMap_Unit.Physics and ScaleMap_Unit.Physics.MaxSpeed then
                       --Use ScaleValue to get the speed multiplier
                       speedScale = ScaleValue(1, 1, ScaleMap_Unit.Physics.MaxSpeed)
                   end
                   if speedScale and speedScale ~= 1 then
                       if bp.Display and bp.Display.AnimationWalk then
                           bp.Display.AnimationWalkRate = (bp.Display.AnimationWalkRate or 1) * speedScale
                       elseif bp.AnimSet then
                           --LOG("ScaleBlueprint: AnimSet unit: "..bp.BlueprintId)
                           local animId = bp.AnimSet.walk or bp.AnimSet.move
                           local walkAnim = all_blueprints.RawAnim[animId]
                           if walkAnim then
                               --LOG("\tMovement animation found: "..animId.."\n\tExisting PlaybackSpeed: "..repr(walkAnim.PlaybackSpeed))
                               walkAnim.PlaybackSpeed = (walkAnim.PlaybackSpeed or 1) * speedScale
                               --LOG("\tScaling PlaybackSpeed to "..walkAnim.PlaybackSpeed)
                           else
                               --LOG("\tNo scaling done: could not find raw walk/move anim blueprint")
                           end
                       end
                   end
               end

               --Define default effects scale for this unit
               if bp.Display and (bp.Display.IdleEffects or bp.Display.MovementEffects) then
                   for k, effectType in {bp.Display.IdleEffects, bp.Display.MovementEffects} do
                       if effectType then
                           for layer, layerTable in effectType do
                               if layerTable.Effects then
                                   for _, effectTable in layerTable.Effects do
                                       effectTable.Scale = effectTable.Scale or 1
                                   end
                               end
                               if layerTable.Footfall and layerTable.Footfall.Bones then
                                   for _, boneTable in layerTable.Footfall.Bones do
                                       boneTable.Scale = boneTable.Scale or 1
                                   end
                               end
                           end
                       end
                   end
               end

               --Scale unit
			   ScaleBlueprint(scale, bp, ScaleMap_Unit)
			   
               if table.find(bp.Categories, 'MASSEXTRACTION') and bp.BlueprintId ~= 'dev0000' then
                  --LOG("Mass Extractor: "..repr(bp.BlueprintId)..", before: Footprint = "..repr(bp.Footprint)..", SizeX/SizeZ = "..repr(bp.SizeX).."/"..repr(bp.SizeZ))
               end
               if table.find(bp.Categories, 'MASSEXTRACTION') and bp.BlueprintId ~= 'dev0000' then
                  --LOG("Mass Extractor: "..repr(bp.BlueprintId)..", after: Footprint = "..repr(bp.Footprint)..", SizeX/SizeZ = "..repr(bp.SizeX).."/"..repr(bp.SizeZ))
               end

               --Set scaffold footprints to 0
               if bp.Display and bp.Display.BuildPointBones then 
                   bp.Footprint.SizeX = 0
                   bp.Footprint.SizeZ = 0
               end

               --Set scaffold footprints to 0
               if bp.Navigation and bp.Navigation.Radius then 
                   if bp.SelectionSizeZ then
                      -- bp.Navigation.Radius = bp.SelectionSizeZ 
                   end
               end

               --Scale each weapon
               if bp.Weapons then
                   for _, weapid in bp.Weapons do
                       local weapbp = all_blueprints.Weapon[weapid]
                       if weapbp and not scaledWeapons[weapid] then
                           scaledWeapons[weapid] = true
                           if not weapbp.WeaponEffectScale then
                               weapbp.WeaponEffectScale = {}
                           end
                           weapbp.WeaponEffectScale.Primary = weapbp.WeaponEffectScale.Primary or 1
                           ScaleBlueprint(scale, weapbp, ScaleMap_Weapon)
                           --Scale projectile for each weapon
                           if weapbp.ProjectileId then
                               local projid = string.lower(weapbp.ProjectileId)
                               local projbp = all_blueprints.Projectile[projid]
                               if projbp and not scaledProjectiles[projid] then
                                   scaledProjectiles[projid] = true
                                   ScaleBlueprint(scale, projbp, ScaleMap_Proj)
                               end
                           end
                       end
                   end
               end
               ScaleCostStamp(bp, scale, costStampSizes)
           end   
           -- Set new Scaffold units to the set units footprints
           if bp.Build and bp.Build.BuildScaffoldUnit and bp.Footprint and bp.General and bp.General.FactionName then
                local buildScaffoldFootprints = {
                   Cybran = {
                       ucb0022 = {Min = 3, Max = 3},
                       ucb0027 = {Min = 2, Max = 2},
                       --ucb0029 = {Min = 6, Max = 6},
                       --ucb0030 = {Min = 10, Max = 11},
                       --ucb0031 = {Min = 4, Max = 4},
                   },
                   Illuminate = {
                       uib0022 = {Min = 3, Max = 3},
                       uib0023 = {Min = 2, Max = 2},
                       --uib0030 = {Min = 10, Max = 11},
                       --uib0031 = {Min = 4, Max = 4},
                   },
                   UEF = {
                       uub0022 = {Min = 3, Max = 3},
                       uub0028 = {Min = 2, Max = 2},
                       --uub0029 = {Min = 6, Max = 6},
                       --uub0030 = {Min = 10, Max = 11},
                       --uub0031 = {Min = 4, Max = 4},
                   },
                }
                local factionScaffolds = buildScaffoldFootprints[bp.General.FactionName] or {}
                local footprint = math.floor( (bp.Footprint.SizeX + bp.Footprint.SizeZ) / 2 )
                for k, v in factionScaffolds do
                    if (v.Min and footprint >= v.Min) and (not v.Max or footprint <= v.Max) then
                        bp.Build.BuildScaffoldUnit = k
                        break
                    end
                end
            end
        end
    end
    --Scale leftover projectiles that don't belong to weapons
    --LOG("ModBlueprints: ScaleBlueprints: Scaling projectiles...")
    for id, bp in all_blueprints.Projectile do
        if not scaledProjectiles[id] then
            ScaleBlueprint(DefaultScale, bp, ScaleMap_Proj)
        end
        -- Fix CollisionDetectors impact effects for impact class air
        if bp.Effects and bp.Effects.Impacts then
            if bp.Effects.Impacts.Unit and not bp.Effects.Impacts.Air then
                bp.Effects.Impacts.Air = bp.Effects.Impacts.Unit
            end
        end
    end

    --Scale props
    --LOG("ModBlueprints: ScaleBlueprints: Scaling props...")
    for id, bp in all_blueprints.Prop do		
        local scale = DefaultScale
        if SkipPropStrings and table.match(SkipPropStrings, {id}, true, stringsearch_t2) then
           scale = 1
        elseif bp.Categories then
		    --bp.Physics.BlockPath = true -- Prop collisions enabled, does not work
            --Set category-specific scale
            for num, catTable in ScaleCategories do
                if (catTable.PropCategories and table.match(bp.Categories, catTable.PropCategories))
                and (not catTable.PropExceptions or not table.match(bp.Categories, catTable.PropExceptions, true)) then
                    scale = catTable.Scale or DefaultScale
                    break
                elseif (catTable.PropStrings and table.match(catTable.PropStrings, {id}, true, stringsearch_t2)) then
                    scale = catTable.Scale or DefaultScale
                    break
                elseif (catTable.Strings and table.match(catTable.Strings, {id}, true, stringsearch_t2))
                and (not catTable.StringsExceptions or not table.match(catTable.StringsExceptions, {id}, true, stringsearch_t2)) then
                    scale = catTable.Scale or DefaultScale
                    break
                end
            end
        end
        ScaleBlueprint(scale, bp, ScaleMap_Prop)
    end

    --Scale emitters
    --LOG("ModBlueprints: ScaleBlueprints: Scaling emitters...")
    for k, group in {'Emitter', 'TrailEmitter', 'Beam'} do
        for id, bp in all_blueprints[group] do
            --Start at default scale
            local scale =  1  -- DefaultScale changed to one so bp effects dont get scaled twice
            if SkipEmitterStrings and table.match(SkipEmitterStrings, {id}, true, stringsearch_t2) then
                --Skip specified emitter id strings
                scale = 1
            else
                --Adjust scale based on first match of ScaleCategories EmitterStrings
                for num, catTable in ScaleCategories do
                    if catTable.EmitterStrings and table.match(catTable.EmitterStrings, {id}, true, stringsearch_t2) then
                        scale = catTable.Scale or 1 -- DefaultScale changed to one so bp effects dont get scaled twice
                        break
                    end
                end
            end
            ScaleBlueprint(scale, bp, ScaleMap_Emitter)
        end
    end
end
 
-- Load all blueprints
function LoadBlueprints()
    --LOG('Loading blueprints...')
    InitOriginalBlueprints()
	-- added mods folder for MIL (solja)
    for i,dir in {'/effects', '/env', '/meshes', '/projectiles', '/props', '/lua/sim/abilities', '/abilities', '/anims', '/weapons', '/units', '/lua/ai', '/costumes', '/vendor' } do
        for k,file in DiskFindFiles(dir, '*.bp') do
            BlueprintLoaderUpdateProgress()
			safecall("loading blueprint "..file, doscript, file)
        end
    end
 
	-- for skirmish mods
	for i,dir in {'/mods/effects', '/mods/env', '/mods/meshes', '/mods/projectiles', '/mods/props', '/mods/lua/sim/abilities', '/mods/abilities', '/mods/anims', '/mods/weapons', '/mods/units', '/mods/lua/ai' } do
        for k,file in DiskFindFiles(dir, '*.bp') do
            BlueprintLoaderUpdateProgress()
            safecall("loading User mod blueprint "..file, doscript, file)
        end
    end
 
    for i,m in __active_mods do
        for k,file in DiskFindFiles(m.location, '*.bp') do
            BlueprintLoaderUpdateProgress()
			safecall("loading vanilla mod blueprint "..file, doscript, file)
        end
    end
	
	-- calls DoBlueprintMerges to load all bp merges from this file, exclusive to xbox 360
	BlueprintLoaderUpdateProgress()
	--LOG('Performing blueprint merges.')
	DoBlueprintMerges()
	
    BlueprintLoaderUpdateProgress()
    --LOG('Extracting mesh blueprints.')
    ExtractBlueprints()
 
    BlueprintLoaderUpdateProgress()
    --LOG('Modding blueprints.')
    ModBlueprints(original_blueprints)
 
    BlueprintLoaderUpdateProgress()
    --LOG('Registering blueprints...')
    RegisterAllBlueprints(original_blueprints)
    original_blueprints = nil
 
    --LOG('Blueprints loaded')
end
 
-- Reload a single blueprint
function ReloadBlueprint(file)
    InitOriginalBlueprints()
 
	pcall(doscript, file)
 
    ExtractBlueprints()
    ModBlueprints(original_blueprints)
    RegisterAllBlueprints(original_blueprints)
    original_blueprints = nil
end
