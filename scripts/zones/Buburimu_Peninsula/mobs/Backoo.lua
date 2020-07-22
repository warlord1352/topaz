-----------------------------------
-- Area:  Buburimu Peninsula (118)
-- NM:    Backoo
-- Notes: Spawns only from hours 06 to 16.
-----------------------------------
local ID = require("scripts/zones/Buburimu_Peninsula/IDs")
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.SLOW)
end

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 263)
end

function onMobDespawn(mob)
    tpz.hunts.checkHunt(mob, player, 263)
    GetMobByID(ID.mob.BACKOO):setRespawnTime(math.random(3600,5400), true) -- 60-90 minute respawn, depending on if it's daytime
end