-----------------------------------
-- Geomancer helpers
-----------------------------------
require("scripts/globals/pets")
require("scripts/globals/status")
-----------------------------------

tpz = tpz or {}
tpz.geo = tpz.geo or {}

-- TODO: After elements are aligned in the codebase, this should become:
-- tpz.geo.spawnLuopan = function(player, target, spell, tick_effect, tick_power, target_type)
tpz.geo.spawnLuopan = function(player, target, modelID, tick_effect, tick_power, target_type, spell)

    tpz.pet.spawnPet(player, tpz.pet.id.LUOPAN)
    local luopan = player:getPet()

    -- Attach effect
    luopan:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 0, 3, 0, tick_effect, tick_power, target_type, tpz.effectFlag.AURA)

    -- Save the mp cost for use with Full Circle
    luopan:setLocalVar("MP_COST", spell:getMPCost())

    -- Change the luopans appearance to match the effect
    -- TODO: This is should be the element of the spell being cast added as an offset
    --       on top of a base model ID in core.
    luopan:setModelId(modelID)

    -- Set HP loss over time
    luopan:addMod(tpz.mod.REGEN_DOWN, luopan:getMainLvl() / 4)

    -- Innate Damage Taken -50%
    luopan:addMod(tpz.mod.DMG, -50)
end
