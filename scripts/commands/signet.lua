cmdprops =
{
    permission = 1,
    parameters = ""
};

local word  = "";
function onTrigger(player, word)

if (word == "signet") then
	player:addStatusEffect(tpz.effect.SIGNET)
end
