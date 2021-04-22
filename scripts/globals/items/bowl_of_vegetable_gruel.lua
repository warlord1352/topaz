-----------------------------------------
-- ID: 4489
-- Item: bowl_of_vegetable_gruel
-- Food Effect: 3Hrs, All Races
-----------------------------------------
-- Vitality -1
-- Agility 2
-- Ranged Accuracy % 15 (cap 10)
-- HP Recovered While Healing 4
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 4489)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.VIT, -1)
    target:addMod(tpz.mod.AGI, 2)
    target:addMod(tpz.mod.FOOD_RACCP, 15)
    target:addMod(tpz.mod.FOOD_RACC_CAP, 10)
    target:addMod(tpz.mod.HPHEAL, 4)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.VIT, -1)
    target:delMod(tpz.mod.AGI, 2)
    target:delMod(tpz.mod.FOOD_RACCP, 15)
    target:delMod(tpz.mod.FOOD_RACC_CAP, 10)
    target:delMod(tpz.mod.HPHEAL, 4)
end
