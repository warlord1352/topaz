-----------------------------------
-- Area: Garlaige Citadel
--  NPC: qm2 (???)
-- !pos -365.119 -5.5 299.986 200
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Garlaige_Citadel/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)


    if player:hasKeyItem(tpz.ki.POUCH_OF_WEIGHTED_STONES) then
		player:messageSpecial(ID.text.YOU_FIND_NOTHING);
    else
        player:addKeyItem(tpz.ki.POUCH_OF_WEIGHTED_STONES);
		player:PrintToPlayer( "You received Pouch of Weighted Stones.");
    end
end;