--****************************************************************************
--**
--**  File     :  /effects/Entities/UEFNukeEffect02/UEFNukeEffect04_script.lua
--**  Author(s):  Gordon Duclos
--**
--**  Summary  :  Nuclear explosion script
--**
--**  Copyright © 2005,2006 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************

local Projectile = import('/lua/sim/Projectile.lua').Projectile
local Util = import('/lua/system/utilities.lua')
local RandomFloat = Util.GetRandomFloat

UEFNukeEffect04 = Class(Projectile) {
    
    OnCreate = function(self)
		Projectile.OnCreate(self)
		self:ForkThread(self.EffectThread)
    end,
    
    EffectThread = function(self)
		local army = -1
		
		for k, v in EffectTemplates.Weapons.Generic_Nuke01_Inward01 do
			CreateEmitterOnEntity(self, army, v )
		end	
	
		--for k2, v2 in EffectTemplates.Weapons.Generic_Nuke01_Shockwave03 do
		--	CreateEmitterOnEntity(self, army, v2 ):OffsetEmitter( 0.0, 0.0, RandomFloat( -25, -50 ) )
		--end	
    end,       
}
TypeClass = UEFNukeEffect04