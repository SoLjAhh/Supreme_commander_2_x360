--****************************************************************************
--**
--**  File     :  /effects/Entities/UEFNukeEffect03/UEFNukeEffect03_script.lua
--**  Author(s):  Gordon Duclos
--**
--**  Summary  :  Nuclear explosion script
--**
--**  Copyright © 2005,2006 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************

local Projectile = import('/lua/sim/Projectile.lua').Projectile

UEFNukeEffect03 = Class(Projectile) {
    
    OnCreate = function(self)
		Projectile.OnCreate(self)
		self:ForkThread(self.EffectThread)
    end,
    
    EffectThread = function(self)
		local army = -1
		
		for k, v in EffectTemplates.Weapons.Generic_Nuke01_Rolls01 do
			CreateEmitterOnEntity(self, army, v ) 
		end	
		
		self:SetVelocity(0,7,0)		
		self:SetBallisticAcceleration( -0.5)
		
		WaitSeconds(8)
		
		self:SetVelocity(0,2,0)		
		self:SetBallisticAcceleration( 0.0)
    end,      
}
TypeClass = UEFNukeEffect03