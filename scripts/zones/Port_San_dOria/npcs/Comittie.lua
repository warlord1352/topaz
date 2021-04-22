-----------------------------------
-- Area: Port San d'Oria
--  NPC: Comittie
-- !pos -6.570 -9.8 -147.952 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local pickpocketMask = player:getCharVar("thePickpocketSkipNPC")

    if player:getCharVar("thePickpocket") == 1 and not utils.mask.getBit(pickpocketMask, 1) then
        player:showText(npc, ID.text.PICKPOCKET_COMITTIE)
        player:setCharVar("thePickpocketSkipNPC", utils.mask.setBit(pickpocketMask, 1, true))
    else
        player:showText(npc, ID.text.ITEM_DELIVERY_DIALOG)
        player:openSendBox()
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
