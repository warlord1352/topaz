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
    if (player:getVar("Hundred_Fists") == 0) then
        -- Toggle Hundred Fists on..
        player:setVar("Hundred_Fists", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,0);

    else
        -- Toggle Hundred Fists off..
        player:setVar("Hundred_Fists", 0);

        player:delStatusEffect(EFFECT_HUNDRED_FISTS);

    end
end