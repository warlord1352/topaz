-----------------------------------
--
--   tpz.effect.BEWILDERED_DAZE_2
--
-----------------------------------
function onEffectGain(target, effect)
    target:addMod(tpz.mod.CEVA, -7)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.CEVA, -7)
end
