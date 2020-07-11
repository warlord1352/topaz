-----------------------------------------
-- Trust: Maat
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell, 1006)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end
