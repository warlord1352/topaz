-----------------------------------
-- Area: Carpenters' Landing
--  NPC: Anguenet
-- Type: Adventurer's Assistant
-- !pos 214.672 -3.013 -527.561 2
-----------------------------------
local ID = require("scripts/zones/Carpenters_Landing/IDs")
require("scripts/globals/npc_util")

function onTrade(player, npc, trade)
    if 
        player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.TEA_WITH_A_TONBERRY) == QUEST_ACCEPTED and
        player:getCharVar('TEA_WITH_A_TONBERRY_PROG') == 1 and
        npcUtil.tradeHas(trade, 1683)
    then
        player:startEvent(29)
    end
end

function onTrigger(player, npc)
    local teaGinseng = player:getCharVar('TEA_WITH_A_TONBERRY_PROG')

    if player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.TEA_WITH_A_TONBERRY) == QUEST_ACCEPTED then
        if teaGinseng == 0 then
            player:startEvent(27, 0, 1683)
        elseif teaGinseng == 1 then
            player:startEvent(28, 0, 1683)
        else
            player:startEvent(21)
        end
    else
        player:startEvent(21)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 27 then
        player:setCharVar('TEA_WITH_A_TONBERRY_PROG', 1)
    elseif csid == 29 then
        player:tradeComplete()
        player:addKeyItem(tpz.keyItem.TONBERRY_BLACKBOARD)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.keyItem.TONBERRY_BLACKBOARD)
        player:setCharVar('TEA_WITH_A_TONBERRY_PROG', 2)
    end
end
