---------------------------------------------------------------------------------------------------
-- func: invincible
-- desc: Toggles invincible mode on the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getVar("Invincible") == 0) then
        -- Toggle Invincible on..
        player:setVar("Invincible", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(EFFECT_INVINCIBLE,1,0,0);

    else
        -- Toggle Invincible off..
        player:setVar("Invincible", 0);

        player:delStatusEffect(EFFECT_INVINCIBLE);

    end
end