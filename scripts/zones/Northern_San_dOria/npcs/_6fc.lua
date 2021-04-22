-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Papal Chambers
--  Finish Mission: The Davoi Report
-- !pos 131 -11 122 231
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    -- This NPC is relevant only to San d'Orians on missions and has no default
    if player:getNation() == tpz.nation.SANDORIA and player:getRank() ~= 10 then
        local missions = tpz.mission.id.sandoria
        local currentMission = player:getCurrentMission(SANDORIA)
        local missionStatus = player:getCharVar("MissionStatus")

        -- San d'Oria 9-2 "The Heir to the Light" (optional dialogue)
        if
            currentMission == missions.THE_HEIR_TO_THE_LIGHT and missionStatus > 5 or
            player:getCharVar("SandoEpilogue") == 1
        then
            player:startEvent(50)

        -- San d'Oria 7-1 "Prestige of the Papsque"
        elseif currentMission == missions.PRESTIGE_OF_THE_PAPSQUE then
            if player:hasKeyItem(tpz.ki.ANCIENT_SANDORIAN_TABLET) then
                player:startEvent(8)
            elseif missionStatus == 1 then
                player:startEvent(9)
            elseif missionStatus == 0 then
                player:startEvent(7) -- Start
            end

        -- San d'Oria 2-2 "The Davoi Report"
        elseif currentMission == missions.THE_DAVOI_REPORT and
            player:hasKeyItem(tpz.ki.TEMPLE_KNIGHTS_DAVOI_REPORT)
        then
            player:startEvent(695)
        end
    end
    return 1

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if csid == 695 or csid == 7 or csid == 8 then
        finishMissionTimeline(player, 3, csid, option)
    end

end
