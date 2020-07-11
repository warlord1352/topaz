---------------------------------------------------------------------------------------------------
-- func: setcruor
-- desc: Sets the players cruor.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!setcruor <amount>");
end;

function onTrigger(player, amount)
    -- validate amount
    if (amount == nil or amount < 0) then
        error(player, "Invalid amount.");
        return;
    end

    player:addCurrency("Cruor", amount );
	player:PrintToPlayer("Cruor obtained" );
end;