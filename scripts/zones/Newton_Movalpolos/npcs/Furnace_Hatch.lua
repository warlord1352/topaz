-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Furnace_Hatch
-----------------------------------
local ID = require("scripts/zones/Newton_Movalpolos/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/status")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, 947) then
        local offset = npc:getID() - ID.npc.FURNACE_HATCH_OFFSET
        player:confirmTrade()
        player:startEvent(21 + offset) -- THUD!

        -- trading to any hatch toggles all doors zone-wide
        local doorOffset = ID.npc.DOOR_OFFSET
        for i = doorOffset, doorOffset + 11 do
            local door = GetNPCByID(i)
            door:setAnimation((door:getAnimation() == tpz.anim.OPEN_DOOR) and tpz.anim.CLOSE_DOOR or tpz.anim.OPEN_DOOR)
        end
    else
        player:startEvent(20) -- no firesand message
    end
end

function onTrigger(player, npc)
    player:startEvent(20) -- no firesand message
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
