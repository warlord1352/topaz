---------------------------------------------------------------------------------------------------
-- func: Triple Attack
-- desc: Toggles Triple Attack mode on the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getVar("GodMode") == 0) then
        -- Toggle Triple Attack on..
        player:setVar("GodMode", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(EFFECT_ASSASSIN_S_CHARGE,merits-1,0,0);

    else
        -- Toggle Triple Attack off..
        player:setVar("GodMode", 0);

        player:delStatusEffect(EFFECT_ASSASSIN_S_CHARGE,merits);

    end
end