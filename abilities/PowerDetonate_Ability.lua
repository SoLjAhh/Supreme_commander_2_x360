-----------------------------------------------------------------------------
--  File     : /abilities/PowerDetonate_Ability.lua
--  Author(s): Gordon Duclos
--  Summary  : Power Detonate ability script
--  Copyright © 2010 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------------------

OnAbility = function( unit, abilityBp, state )
	if state == 'activate' then
		local bp = unit:GetUnitWeaponBlueprint( 'PowerDetonate' )
		if bp then
			DamageArea(unit, unit:GetPosition(), bp.DamageRadius or 1, bp.Damage or 1, 'Normal', bp.DamageFriendly or false)
			unit:SetDeathWeaponEnabled(false)
			unit.ForceNoWreckage = true
			unit:Kill()

			local effects = EffectTemplates[bp.ExplosionEffect] or {}
			local army = unit:GetArmy()

			for kEffect, vEffect in effects do
				CreateEmitterAtEntity( unit, army, vEffect )
			end
		end
	end
end