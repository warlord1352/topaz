-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Bertenont
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- !pos -165 0.1 226 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    local WildcatSandy = player:getCharVar("WildcatSandy")

    if (player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatSandy, 9)) then
        player:startEvent(809)
    else
        player:showText(npc, ID.text.BERTENONT_DIALOG)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 809) then
        player:setCharVar("WildcatSandy", utils.mask.setBit(player:getCharVar("WildcatSandy"), 9, true))
    end

end
