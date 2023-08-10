--
-- Fire Test Projectile Script
--
DestructionFire01 = Class(import('/lua/sim/Projectile.lua').Projectile) {
    FxImpactUnit = {},
    FxImpactLand = {},
    FxImpactWater = {},
    FxImpactUnderWater = {},
    FxImpactNone = {},
}
TypeClass = DestructionFire01