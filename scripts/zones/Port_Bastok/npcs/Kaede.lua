-----------------------------------
-- Area: Port Bastok
--  NPC: Kaede
-- Start Quest: Ayame and Kaede
-- Involved in Quests: Riding on the Clouds
-- !pos 48 -6 67 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)

    if (player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getCharVar("ridingOnTheClouds_2") == 4) then
        if (trade:hasItemQty(1127, 1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setCharVar("ridingOnTheClouds_2", 0)
            player:tradeComplete()
            player:addKeyItem(tpz.ki.SMILING_STONE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.SMILING_STONE)
        end
    end

end

function onTrigger(player, npc)

    local ayameKaede = player:getQuestStatus(BASTOK, tpz.quest.id.bastok.AYAME_AND_KAEDE)
    local WildcatBastok = player:getCharVar("WildcatBastok")

    if (player:getQuestStatus(BASTOK, tpz.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatBastok, 0)) then
        player:startEvent(352)
    elseif (ayameKaede == QUEST_AVAILABLE and player:getMainLvl() >= 30) then
        player:startEvent(240)
    elseif (ayameKaede == QUEST_ACCEPTED) then
        player:startEvent(26)
    elseif (ayameKaede == QUEST_COMPLETED) then
        player:startEvent(248)
    else
        player:startEvent(26)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 240) then
        if (player:getQuestStatus(BASTOK, tpz.quest.id.bastok.AYAME_AND_KAEDE) == QUEST_AVAILABLE) then
            player:addQuest(BASTOK, tpz.quest.id.bastok.AYAME_AND_KAEDE)
        end
    elseif (csid == 352) then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 0, true))
    end

end
