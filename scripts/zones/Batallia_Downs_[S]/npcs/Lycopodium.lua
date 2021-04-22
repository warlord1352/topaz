-----------------------------------
-- Area: Batallia Downs [S]
--  NPC: Lycopodium
-- !pos -366.425 -22.127 324.666 84
-----------------------------------
local ID = require("scripts/zones/Batallia_Downs_[S]/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.LYCOPODIUM_ENTRANCED)

    if not utils.mask.getBit(player:getCharVar("LycopodiumTeleport_Mask"), 1) then
        player:startEvent(202)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 202 then
        player:setCharVar("LycopodiumTeleport_Mask", utils.mask.setBit(player:getCharVar("LycopodiumTeleport_Mask"), 1, true))
    end
end
