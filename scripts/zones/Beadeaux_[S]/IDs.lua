-----------------------------------
-- Area: Beadeaux_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[tpz.zone.BEADEAUX_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CARRIED_OVER_POINTS     = 6999, -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY = 7000, -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!<space>
        LOGIN_NUMBER            = 7001, -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
    },
    mob =
    {
        EATHO_CRUELHEART_PH =
        {
            [17154068] = 17154069,
        },
        BATHO_MERCIFULHEART_PH =
        {
            [17154147] = 17154148,
        },
        DA_DHA_HUNDREDMASK_PH =
        {
            [17154095] = 17154195, -- -37.741 0.344 -127.037
        },
    },
    npc =
    {
    },
}

return zones[tpz.zone.BEADEAUX_S]
