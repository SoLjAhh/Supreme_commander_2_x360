-----------------------------------------------------------------------------
--  File     : /abilities/HalfBake_Ability.lua
--  Author(s): Mike Robins
--  Summary  : Half Bake ability script
--  Copyright © 2009 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------

local FAIL_CHANCE_INTERVAL = 5
local STUN_DURATION = 5

local function HalfBakedThread( unit, failPercentage )
	local bpDisplay = unit:GetBlueprint().Display
	local effects = EffectTemplates[bpDisplay.HalfBakedShutdownEffect] or {}
	local bone = bpDisplay.HalfBakedShutdownEffectBone or 0

	while not unit:IsDead() do
		WaitSeconds( FAIL_CHANCE_INTERVAL )
		if Random() < failPercentage and not unit:IsBeingBuilt() then
			unit:SetStunned( STUN_DURATION )
			local emitters = {}

			for k, v in effects do
				table.insert( emitters, CreateAttachedEmitter( unit, bone, unit:GetArmy(), v ) )
			end				
			
			WaitSeconds( STUN_DURATION )
			
			for k, v in emitters do
				v:Destroy()
			end
		end
	end
end

OnAbility = function(unit, abilityBP, state)
	if state == 'activate' and unit.BakedUnitPercentage == 0 then
		if unit.BuildingUnit then
			unit.BakedUnitPercentage = unit:GetWorkProgress()
			unit.BuildingUnit:SetFractionComplete(unit.ProgressToRelease or 1)
			unit.BuildingUnit.HalfBakeThread = unit.BuildingUnit:ForkThread( HalfBakedThread, 1 - unit.BakedUnitPercentage )
		end
	end
end