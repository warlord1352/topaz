---------------------------------------------------------------------------------------------------
-- func: hundred
-- desc: Toggles attack Hundred Fists mod on the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getCharVar("GodMode") == 0) then
        -- Toggle Hundred Fists on..
        player:setCharVar("GodMode", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(tpz.effect.HUNDRED_FISTS,1,0,0);

    else
        -- Toggle Hundred Fists off..
        player:setCharVar("GodMode", 0);

        player:delStatusEffect(tpz.effect.HUNDRED_FISTS);

    end
end