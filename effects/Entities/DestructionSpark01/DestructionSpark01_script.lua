--
-- Fire Test Projectile Script
--
DestructionSpark01 = Class(import('/lua/sim/Projectile.lua').Projectile) {
    FxImpactUnit = {},
    FxImpactLand = {},
    FxImpactWater = {},
    FxImpactUnderWater = {},
    FxImpactNone = {},
}
TypeClass = DestructionSpark01