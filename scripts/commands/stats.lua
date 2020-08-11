---------------------------------------------------------------------------------------------------
-- func: @stats
-- desc: Prints current Player stats to the in game chatlog.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getCharVar("SoftBan") > 0) then
        player:PrintToPlayer("Error.");
        return;
    end

    require("scripts/globals/status");
    require("scripts/globals/msg");

    player:PrintToPlayer(string.format("Treasure Hunter base bonus: %s", player:getMod(tpz.mod.TREASURE_HUNTER)));
    if (player:getMod(tpz.mod.CRITHITRATE) > 0 or player:getMod(tpz.mod.CRIT_DMG_INCREASE) > 0 or player:getMod(tpz.mod.ENEMYCRITRATE) ~= 0) then
        if (player:getMod(tpz.mod.CRITHITRATE) > 0) then
            player:PrintToPlayer(string.format("Crit Rate bonus: %s%%", player:getMod(tpz.mod.CRITHITRATE)));
        end
        if (player:getMod(tpz.mod.CRIT_DMG_INCREASE) > 0) then
            player:PrintToPlayer(string.format("Crit Damage bonus: %s%%", player:getMod(tpz.mod.CRITHITRATE)));
        end
        if (player:getMod(tpz.mod.ENEMYCRITRATE) < 0) then
            player:PrintToPlayer(string.format("Crit Evasion bonus: %s%%", -player:getMod(tpz.mod.ENEMYCRITRATE)));
        elseif (player:getMod(tpz.mod.ENEMYCRITRATE) > 0) then
            player:PrintToPlayer(string.format("Crit Evasion penalty: %s%%", player:getMod(tpz.mod.ENEMYCRITRATE)));
        end
    else
        player:PrintToPlayer("No Critical Hit Rate, Crit Damage, or Crit Evasion bonus. ");
    end
    if (player:getMod(tpz.mod.DOUBLE_ATTACK) > 0 or player:getMod(tpz.mod.TRIPLE_ATTACK) > 0 or player:getMod(tpz.mod.QUAD_ATTACK) > 0) then
        if (player:getMod(tpz.mod.DOUBLE_ATTACK) > 0) then
            player:PrintToPlayer(string.format("Double Attack rate: %s%%", player:getMod(tpz.mod.DOUBLE_ATTACK)));
        end
        if (player:getMod(tpz.mod.TRIPLE_ATTACK) > 0) then
            player:PrintToPlayer(string.format("Triple Attack rate: %s%%", player:getMod(tpz.mod.TRIPLE_ATTACK)));
        end
        if (player:getMod(tpz.mod.QUAD_ATTACK) > 0) then
            player:PrintToPlayer(string.format("Quadruple Attack rate: %s%%", player:getMod(tpz.mod.QUAD_ATTACK)));
        end
    else
        player:PrintToPlayer("No bonus to Double, Triple, or Quadruple attack. ");
    end
    if (player:getMod(tpz.mod.HASTE_GEAR) > 0 or player:getMod(tpz.mod.HASTE_ABILITY) > 0 or player:getMod(tpz.mod.HASTE_MAGIC) > 0) then
        if (player:getMod(tpz.mod.HASTE_GEAR) > 0) then
            player:PrintToPlayer(string.format("Haste from equipment: %s%%", (player:getMod(tpz.mod.HASTE_GEAR)/1024)*100));
        end
        if (player:getMod(tpz.mod.HASTE_ABILITY) > 0) then
            player:PrintToPlayer(string.format("Haste from ability: %s%%", (player:getMod(tpz.mod.HASTE_ABILITY)/1024)*100));
        end
        if (player:getMod(tpz.mod.HASTE_MAGIC) > 0) then
            player:PrintToPlayer(string.format("Haste from magic: %s%%", (player:getMod(tpz.mod.HASTE_MAGIC)/1024)*100));
        end
    else
        player:PrintToPlayer("No Haste bonus from gear, ability, or magic ");
    end
    if (player:getMod(tpz.mod.MDEF) > 0 or player:getMod(tpz.mod.MATT) > 0 or player:getMod(tpz.mod.MACC) > 0) then
    -- if (player:getMod(tpz.mod.MDEF) > 0 or player:getMod(tpz.mod.MATT) > 0 or player:getMod(tpz.mod.MACC) > 0 or player:getMod(tpz.mod.MEVA) > 0) then
        if (player:getMod(tpz.mod.MDEF) > 0) then
            player:PrintToPlayer(string.format("Magic Defense bonus: %s", player:getMod(tpz.mod.MDEF)));
        end
        if (player:getMod(tpz.mod.MATT) > 0) then
            player:PrintToPlayer(string.format("Magic Attack bonus: %s", player:getMod(tpz.mod.MATT)));
        end
        if (player:getMod(tpz.mod.MACC) > 0) then
            player:PrintToPlayer(string.format("Magic Accuracy bonus: %s", player:getMod(tpz.mod.MACC)));
        end
        -- Cannot accurately get Magic Evasion yet..Darkstar does it stupidly.
        -- if (player:getMod(tpz.mod.MEVA) > 0) then
            -- player:PrintToPlayer(string.format("Magic Evasion bonus: %s", player:getMod(tpz.mod.MEVA)));
        -- end
    else
        -- player:PrintToPlayer("No bonus to Magic Defense, Magic Attack, Magic Accuracy, or Magic Evasion. ");
        player:PrintToPlayer("No bonus to Magic Defense, Magic Attack, or Magic Accuracy. ");
    end
	if (player:getMod(tpz.mod.ACC) > 0 or player:getMod(tpz.mod.EVA) > 0) then
        if (player:getMod(tpz.mod.ACC) > 0) then
            player:PrintToPlayer(string.format("ACC from equipment: %s%%", (player:getMod(tpz.mod.ACC))));
        end
        if (player:getMod(tpz.mod.EVA) > 0) then
            player:PrintToPlayer(string.format("EVA from equipment: %s%%", (player:getMod(tpz.mod.EVA))));
        end
        --if (player:getMod(tpz.mod.HASTE_MAGIC) > 0) then
            --player:PrintToPlayer(string.format("Haste from magic: %s%%", (player:getMod(tpz.mod.HASTE_MAGIC));
        --end
    else
        player:PrintToPlayer("No ACC or EVA bonus from gear, ability, or magic ");
	end
    player:PrintToPlayer("Get additional info from: /checkparam ");
end;