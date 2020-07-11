---------------------------------------------------------------------------------------------------
-- func: addweaponskill <weaponskillID> <player>
-- desc: adds the ability to use a weaponskill to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!addallweaponskill <weaponskillID> {player}");
end;

function onTrigger(player, weaponskillId, target)
    -- validate weaponskillId
    if (weaponskillId == nil) then
        error(player, "Invalid weaponskillID.");
        return;
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- add weaponskill
    targ:addweaponskill(weaponskillId);
    player:PrintToPlayer(string.format("Added weaponskill %i to %s.",weaponskillId,targ:getName()));
end;