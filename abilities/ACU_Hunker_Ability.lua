-----------------------------------------------------------------------------
--  File     : /abilities/ACU_Hunker_Ability.lua
--  Author(s): Gordon Duclos
--  Summary  : Commander Hunker ability script
--  Copyright © 2009 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------

-- Leaving this hunker shield off, until we get decent art for it.
local function CreateHunkerShieldOrnament( unit )
	WaitSeconds( 1.5 )
	if not unit.HunkerShieldOrnamentId then
		unit.HunkerShieldOrnamentId = unit:AttachOrnament( '/effects/Entities/HunkerShield/HunkerShield_mesh', -1, 0.11 )
	end

	unit.HunkerShieldThreadId = nil
end

OnAbility = function( unit, abilityBp, state )
	if state == 'activate' then
        unit:SendAnimEvent( 'OnHunker' )
		unit:PlayUnitSound('Hunker')
		unit:SetRepairable(false)
		unit:SetBuildDisabled(true)
		unit.Hunkered = true
		if unit.HunkerEffectiveness then 
			ApplyBuff(unit, 'RB_UCB_HUNKEREFFECTIVENESS')
		end

		--unit.HunkerShieldThreadId = unit:ForkThread( CreateHunkerShieldOrnament, unit )
	else
        unit:SendAnimEvent('OnHunkerEnd')
		unit:PlayUnitSound('UnHunker')
		unit:SetRepairable(true)
		unit:SetBuildDisabled(false)
		unit.Hunkered = false
		if unit.HunkerEffectiveness then
			RemoveBuff(unit, 'RB_UCB_HUNKEREFFECTIVENESS')
		end

		--[[
		if unit.HunkerShieldThreadId then
			KillThread( unit.HunkerShieldThreadId )
		end

		if unit.HunkerShieldOrnamentId then
			unit:RemoveOrnament( unit.HunkerShieldOrnamentId )
			unit.HunkerShieldOrnamentId = nil
		end
		]]--
	end
end