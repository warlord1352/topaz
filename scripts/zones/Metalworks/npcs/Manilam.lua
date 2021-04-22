-----------------------------------
-- Area: Metalworks
--  NPC: Manilam
-- Type: Quest NPC
-- !pos -57.300 -11 22.332 237
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    local WildcatBastok = player:getCharVar("WildcatBastok")

    if (player:getQuestStatus(BASTOK, tpz.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatBastok, 7)) then
        player:startEvent(931)
    else
        player:startEvent(401)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 931) then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 7, true))
    end

end
