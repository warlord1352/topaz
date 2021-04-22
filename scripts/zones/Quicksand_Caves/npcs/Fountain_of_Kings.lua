-----------------------------------
-- Area: Quicksand Caves
--  NPC: Fountain of Kings
-- Involved in Mission: San d'Oria 8-1
-- !pos 567 18 -939 208
-----------------------------------
local ID = require("scripts/zones/Quicksand_Caves/IDs")
require("scripts/globals/missions")
require("scripts/globals/keyitems")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    -- Player is on San d'Oria mission 8-1 "Coming of Age":
    if player:getCurrentMission(SANDORIA) == tpz.mission.id.sandoria.COMING_OF_AGE then
        local missionStatus = player:getCharVar("MissionStatus")
        local mob1 = GetMobByID(ID.mob.VALOR):isSpawned()
        local mob2 = GetMobByID(ID.mob.HONOR):isSpawned()

        if missionStatus == 2 and not mob1 and not mob2 then
            SpawnMob(ID.mob.VALOR)
            SpawnMob(ID.mob.HONOR)
        elseif missionStatus == 3 and not mob1 and not mob2 and not player:hasKeyItem(tpz.ki.DROPS_OF_AMNIO) then
            player:addKeyItem(tpz.ki.DROPS_OF_AMNIO)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.DROPS_OF_AMNIO)
        end
    -- Default
    else
        player:messageSpecial(ID.text.POOL_OF_WATER)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
