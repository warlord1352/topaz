---------------------------------------------------------------------------------------------------
-- func: regen
-- desc: Toggles refresh/regen mode on the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    if (player:getCharVar("Regen") == 0) then
        -- Toggle Regen on..
        player:setCharVar("Regen", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(tpz.effect.EFFECT_REFRESH,4,0,0);
        player:addStatusEffect(tpz.effect.EFFECT_REGEN,20,0,0);
		player:addStatusEffect(tpz.effect.EFFECT_REGAIN,1,0,0);

    else
        -- Toggle Regen off..
        player:setCharVar("Regen", 0);

        player:delStatusEffect(tpz.effect.EFFECT_REFRESH);
        player:delStatusEffect(tpz.effect.EFFECT_REGEN);
        player:delStatusEffect(tpz.effect.EFFECT_REGAIN);


    end
end