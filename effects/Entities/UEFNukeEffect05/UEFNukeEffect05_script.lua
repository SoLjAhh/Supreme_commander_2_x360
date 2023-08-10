--****************************************************************************
--**
--**  File     :  /effects/Entities/UEFNukeEffect02/UEFNukeEffect05_script.lua
--**  Author(s):  Gordon Duclos
--**
--**  Summary  :  Nuclear explosion script
--**
--**  Copyright © 2005,2006 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************

local Projectile = import('/lua/sim/Projectile.lua').Projectile

UEFNukeEffect05 = Class(Projectile) {
    
    OnCreate = function(self)
		Projectile.OnCreate(self)
		self:ForkThread(self.EffectThread)
    end,
    
    EffectThread = function(self)
		local army = -1
		
		for k, v in EffectTemplates.TNukeBaseEffects02 do
			CreateEmitterOnEntity(self, army, v ) 
		end	
    end,      
}
TypeClass = UEFNukeEffect05