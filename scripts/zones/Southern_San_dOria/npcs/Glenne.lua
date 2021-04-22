-------------------------------------
-- Area: Southern San d'Oria
--  NPC: Glenne
-- Starts and Finishes Quest: A Sentry's Peril
-- !pos -122 -2 15 230
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/npc_util")
-------------------------------------

require("scripts/globals/pathfind")

local path =
{
    -121.512833, -2.000000, 14.492509,
    -122.600044, -2.000000, 14.535807,
    -123.697128, -2.000000, 14.615446,
    -124.696846, -2.000000, 14.707844,
    -123.606018, -2.000000, 14.601295,
    -124.720863, -2.000000, 14.709210,
    -123.677681, -2.000000, 14.608237,
    -124.752579, -2.000000, 14.712106,
    -123.669525, -2.000000, 14.607473,
    -124.788277, -2.000000, 14.715488,
    -123.792847, -2.000000, 14.619405,
    -124.871826, -2.000000, 14.723736
}

function onSpawn(npc)
    npc:initNpcAi()
    npc:setPos(tpz.path.first(path))
    onPath(npc)
end

function onPath(npc)
    tpz.path.patrol(npc, path)
end

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 601) then -- Ointment Case
        player:startEvent(513) -- Complete "A Sentry's Peril"
        npc:wait()
    end
end

function onTrigger(player, npc)
    local sentrysPerilStatus = player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.A_SENTRY_S_PERIL)

    npc:wait()
    if sentrysPerilStatus == QUEST_AVAILABLE then
        player:startEvent(510) -- Starts "A Sentry's Peril"
    elseif sentrysPerilStatus == QUEST_ACCEPTED and (player:hasItem(600) or player:getCharVar("SentrysPerilTraded") == 1) then
        player:startEvent(520) -- Reminder to deliver the ointment to her husband.
    elseif sentrysPerilStatus == QUEST_ACCEPTED then
        player:startEvent(644) -- "So you lost the ointment! I suppose I can give you another."
    else
        player:startEvent(521) -- "Thank you again for your help!"
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option, npc)
    npc:wait(5000)
    if csid == 510 and option == 0 and npcUtil.giveItem(player, 600) then
        player:addQuest(SANDORIA, tpz.quest.id.sandoria.A_SENTRY_S_PERIL)
    elseif csid == 644 then
        npcUtil.giveItem(player, 600)
    elseif csid == 513 and npcUtil.completeQuest(player, SANDORIA, tpz.quest.id.sandoria.A_SENTRY_S_PERIL, {item = 12832, fame = 30, title = tpz.title.RONFAURIAN_RESCUER, var = "SentrysPerilTraded"}) then
        player:confirmTrade()
    end
end
