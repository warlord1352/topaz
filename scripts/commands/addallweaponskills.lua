---------------------------------------------------------------------------------------------------
-- func: addallweaponskills
-- desc: Adds all valid 357 weaponskills to the given target. If no target; then to the current player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!addallweaponskills {player}");
end;

function onTrigger(player, target)
    local ValidWeaponskills = {
        15,224,226,60,77,93,109,125,141,157,174,191,203,221
    };

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

    -- add all weaponskills
    local save = true;
    local silent = true;    -- prevent packet spam
    for i = 1, #Validweaponskills do
        if i == #Validweaponskills then
            silent = false;
        end
        targ:addWeaponskill(Validweaponskills[i], silent, save);
    end
    player:PrintToPlayer(string.format("%s now has all weaponskills.",targ:getName()));
end
