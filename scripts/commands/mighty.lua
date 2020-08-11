---------------------------------------------------------------------------------------------------
-- func: godmode
-- desc: Toggles god mode on the player, granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    if (player:getCharVar("GodMode") == 0) then
        -- Toggle GodMode on..
        player:setCharVar("GodMode", 1)

        -- Add bonus effects to the player..
        player:addStatusEffect(tpz.effect.MIGHTY_STRIKES,1,0,0)

        -- Add bonus mods to the player..
		--player.addMod(tpz.mod.STR,99)

    else
        -- Toggle GodMode off..
        player:setCharVar("GodMode", 0)

        -- Remove bonus effects..
        player:delStatusEffect(tpz.effect.MIGHTY_STRIKES)
    end
end
