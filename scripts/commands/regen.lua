---------------------------------------------------------------------------------------------------
-- func: !regen
-- desc: Toggles regen and refresh and regain on the player, granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    if (player:getCharVar("Regen") == 0) then
        -- Toggle GodMode on..
        player:setCharVar("Regen", 1)

        -- Add bonus effects to the player..
        player:addMod(tpz.mod.REGAIN,25,0,0)
        player:addMod(tpz.mod.REFRESH,2,0,0)
        player:addMod(tpz.mod.REGEN,5,0,0)

        -- Add bonus mods to the player..
		--player.addMod(tpz.mod.STR,99)

    else
        -- Toggle GodMode off..
        player:setCharVar("Regen", 0)

        -- Remove bonus effects..
        player:delMod(tpz.mod.REGAIN)
        player:delMod(tpz.mod.REFRESH)
        player:delMod(tpz.mod.REGEN)

    end
end
