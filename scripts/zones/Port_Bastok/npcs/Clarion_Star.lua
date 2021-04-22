-----------------------------------
-- Area: Port Bastok
-- NPC: Clarion Star
-- Trust NPC
-- !pos 81.478 7.500 -24.169 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/globals/trust")
-----------------------------------

function onTrade(player, npc, trade)
    tpz.trust.onTradeCipher(player, trade, 437, 457, 458)
end

function onTrigger(player, npc)
    local TrustSandoria = player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.TRUST_SANDORIA)
    local TrustBastok   = player:getQuestStatus(BASTOK, tpz.quest.id.bastok.TRUST_BASTOK)
    local TrustWindurst = player:getQuestStatus(WINDURST, tpz.quest.id.windurst.TRUST_WINDURST)

    if player:getMainLvl() >= 5 and ENABLE_TRUST_QUESTS == 1 then
        if TrustBastok == QUEST_AVAILABLE and (TrustWindurst == QUEST_COMPLETED or TrustSandoria == QUEST_COMPLETED) then
            player:startEvent(438)
        elseif TrustBastok == QUEST_AVAILABLE and TrustWindurst == QUEST_AVAILABLE and TrustSandoria == QUEST_AVAILABLE then
            player:startEvent(434)
        end
    elseif player:hasKeyItem(tpz.ki.BLUE_INSTITUTE_CARD) then
        player:startEvent(435)
    elseif TrustBastok == QUEST_COMPLETED then
        player:startEvent(436)
    else
        player:startEvent(442)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 434 or csid == 438) and option == 2 then
        player:addQuest(BASTOK, tpz.quest.id.bastok.TRUST_BASTOK)
        npcUtil.giveKeyItem(player, tpz.ki.BLUE_INSTITUTE_CARD)
    elseif csid == 437 or csid == 458 then
        local spellID = player:getLocalVar("TradingTrustCipher")
        player:setLocalVar("TradingTrustCipher", 0)
        player:addSpell(spellID, false, true)
        player:messageSpecial(ID.text.YOU_LEARNED_TRUST, 0, spellID)
        player:tradeComplete()
    end
end
