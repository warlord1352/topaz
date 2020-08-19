---------------------------------------------------------------------------------------------------
-- func: signet
-- desc: applied fresh signet
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = "ssssss"
}

function onTrigger(player, status)
	player:addStatusEffect(tpz.effect.SIGNET)
end