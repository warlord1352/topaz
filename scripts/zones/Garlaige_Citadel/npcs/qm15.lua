-----------------------------------
-- Area: Garlaige Citadel
--  NPC: qm15 (???)
-- Involved in Quest: Hitting the Marquisate (THF AF3)
-- !pos 19.893 -5.500 325.767 200
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Garlaige_Citadel/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if
        player:getCharVar("hittingTheMarquisateHagainCS") == 8 and
        os.time() < GetNPCByID(ID.npc.CHANDELIER_QM):getLocalVar("chandelierCooldown")
    then
        player:messageSpecial(ID.text.THE_PRESENCE_MOVES + 7) -- You sense a presence from the ceiling, but nothing seems to happen.
    elseif
        not GetMobByID(ID.mob.CHANDELIER):isSpawned() and
        player:hasKeyItem(tpz.ki.BOMB_INCENSE) and
        player:getCharVar("hittingTheMarquisateHagainCS") == 8 and
        os.time() > GetNPCByID(ID.npc.CHANDELIER_QM):getLocalVar("chandelierCooldown")
    then
        player:messageSpecial(ID.text.HEAT_FROM_CEILING)
        player:startEvent(56, tpz.keyItem.BOMB_INCENSE)
    else
        player:messageSpecial(ID.text.HOLE_IN_THE_CEILING) -- Default
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 56 then
        if option == 1 then
            player:messageSpecial(ID.text.THE_PRESENCE_MOVES + 5) -- Something flies out from the ceiling!
            GetMobByID(ID.mob.CHANDELIER):setRespawnTime(5) -- Pop with delay
        else
            player:messageSpecial(ID.text.THE_PRESENCE_MOVES + 6) -- The presence in the ceiling still lingers...
        end
    end
end
