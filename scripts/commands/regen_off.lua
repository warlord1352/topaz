---------------------------------------------------------------------------------------------------
-- func: regen/refresh server wide. 
-- auth: <Unknown> :: Modded by Tagban, Kyau
-- desc: Gives the players certain effects
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    
    
    -- remove current buff versions
    if (player:hasStatusEffect(tpz.effect.REGEN)) then
        player:delStatusEffect(tpz.effect.REGEN);
    end
    if (player:hasStatusEffect(tpz.effect.PROTECT)) then
        player:delStatusEffect(tpz.effect.PROTECT);
    end
    if (player:hasStatusEffect(tpz.effect.SHELL)) then
        player:delStatusEffect(tpz.effect.SHELL);
    end
    if (player:hasStatusEffect(tpz.effect.HASTE)) then
        player:delStatusEffect(tpz.effect.HASTE);
    end
    if (player:hasStatusEffect(tpz.effect.REGAIN)) then
        player:delStatusEffect(tpz.effect.REGAIN);
    end
    if (player:hasStatusEffect(tpz.effect.REFRESH)) then
        player:delStatusEffect(tpz.effect.REFRESH);
    end
    if (player:hasStatusEffect(tpz.effect.RERAISE)) then
        player:delStatusEffect(tpz.effect.RERAISE);
    end

     
end