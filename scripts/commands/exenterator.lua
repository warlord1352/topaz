---------------------------------------------------------------------------------------------------
-- func: exenterator
-- desc: Toggles attack Hundred Fists mod on the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getVar("Exenterator") == 0) then
        -- Toggle Hundred Fists on..
        player:setVar("Exenterator", 1);

        -- Add bonus effects to the player..
        player:getMerit(MERIT_EXENTERATOR)

    else
        -- Toggle Hundred Fists off..
        player:setVar("Exenterator", 0);

        player:delMerit(MERIT_EXENTERATOR);

    end
end