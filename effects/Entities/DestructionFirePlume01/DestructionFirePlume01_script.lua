--
-- Fire Plume Test Projectile Script
--
DestructionFirePlume01 = Class(import('/lua/sim/Projectile.lua').Projectile) {
    FxImpactUnit = {},
    FxImpactLand = {},
    FxImpactWater = {},
    FxImpactUnderWater = {},
    FxImpactNone = {},
}
TypeClass = DestructionFirePlume01