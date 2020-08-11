-----------------------------------
-- Area: Misareaux_Coast
-- NPC:  ??? (Spawn Ziphius)
-- !pos 184.5 -16 517.5 25
-----------------------------------
local MISAREAUX_COAST = require("scripts/zones/Misareaux_Coast/globals")

function onTrade(player, npc, trade)
    MISAREAUX_COAST.ziphiusOnTrade(player, npc, trade)
end

function onTrigger(player, npc)
    MISAREAUX_COAST.ziphiusOnTrigger(player, npc)
end