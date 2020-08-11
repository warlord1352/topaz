-----------------------------------
-- !summershop cmd
--command for summer clothing shopping!
-- !pos -305.775 -10.319 -152.173 235
-----------------------------------
require("scripts/globals/shop")

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function onTrigger(player, shop)
    local stock =
    {
        ["crystals"] =
        {
            4238,   5000,   -- HQ Fire Crystal
            4239,   5000,   -- HQ Ice Crystal
            4240,   5000,   -- HQ Wind Crystal
            4241,   5000,   -- HQ Earth Crystal
            4242,   5000,   -- HQ Lightning Crystal
            4243,   5000,   -- HQ Water Crystal
            4244,   5000,   -- HQ Light Crystal
            4245,   5000    -- HQ Dark Crystal
        },
        ["potions"] =
        {
            4148,   450,     -- Antidote
            4154,   1000,    -- Holy Water
            4150,   2000,    -- Eye Drops
            4151,   2000,    -- Echo Drops
            4153,   2000,    -- Bottle of Antacid
            5418,   2000,    -- Tincture
            5328,   2000,    -- Hi-Potion Drop
            5358,   2000,    -- Hi-Ether Drop
            5356,   5000,    -- Remedy Ointment
            4202,   25000,   -- Daedalus Wing
            5876,   25000,   -- Petrify Screen
            5877,   25000,   -- Terror Screen
            5878,   25000,   -- Amnesia Screen
            5879,   25000,   -- Doom Screen
            5880,   25000    -- Poison Screen
        },
        ["food"] =
        {
            4271,   2499,   -- Rice Dumpling
            4381,   2100,   -- Meat Mithkabob
            4398,   2100,   -- Fish Mithkabob
            4457,   2100,   -- Eel Kabob
            5166,   2100,   -- Coeurl Sub Sandwich
            4355,   1450,   -- Salmon Sub Sandwich
            5686,   799,    -- Cheese Sandwich
            5561,   799,    -- Moogle Pie
            4270,   999,    -- Sweet Rice Cake
            5944,   2000,   -- Frontier Soda
            5932,   1600,   -- Kitron Juice
            4424,   1100,   -- Melon Juice
            4422,   499,    -- Orange Juice
			6465,   9999    -- Behemoth Steak+1
        },
        ["tools"] =
        {
            605,    499,     -- Pickaxe
            1021,   499,     -- Hatchet
            1020,   499,     -- Sickle
            4165,   1000,    -- Silent Oil
            4164,   1000,    -- Prism Powder
            5362,   2000,    -- Rainbow Powder
            5417,   9999,    -- Toolbag (Sanjaku-Tenugui)
            5319,   9999,    -- Toolbag (Shinobi-Tabi)
            5314,   5000,    -- Toolbag (Shihei)
            5867,   20000,   -- Toolbag (Inoshishinofuda)
            5868,   25000,   -- Toolbag (Shikanofuda)
            5869,   25000,   -- Toolbag (Chonofuda)
            1022,   5000     -- Thief's Tools
        },
        ["specials"] =
        {
				5717,   1,        -- M&P Doner Kebab
                5639,   5000,     -- M&P Chicken
                5640,   5000,     -- M&P Cracker
                5641,   5000,     -- M&P Dumpling
                265,    10000,    -- Adamantoise Statue
                266,    10000,    -- Behemoth Statue
                267,    10000,    -- Fafnir Statue
                268,    10000,    -- Nomad Moogle Statue
                269,    10000,    -- Shadow Lord Statue
                1255,   500000,   -- Fire Ore
                1256,   500000,   -- Ice Ore
                1257,   500000,   -- Wind Ore
                1258,   500000,   -- Earth Ore
                1259,   500000,   -- Lightning Ore
                1260,   500000,   -- Water Ore
        },
		["zilart"] = 
		{
				272,    20000,    -- Ark Angel HM. Statue
                273,    20000,    -- Ark Angel EV. Statue
                274,    20000,    -- Ark Angel TT. Statue
                275,    20000,    -- Ark Angel MR. Statue
                276,    20000,    -- Ark Angel GK. Statue
                18912,  20000,    -- Ark Saber
                18913,  20000,    -- Ark Sword
                18563,  20000,    -- Ark Scythe
                18545,  20000,    -- Ark Tabar
                18464,  20000,    -- Ark Tachi
                1550,   50000,    -- Ark Pentasphere
                1261,   500000    -- Light Ore
		},
		["earrings"] = 
		{
				14739,  500000,   -- suppanomimi
				14740,  500000,   -- knights earring
				14741,  500000,   -- abyssal earring
				14742,  500000,   -- beastly earring
				14743,  500000,   -- bushinomimi
		},
		["cop"] = 
		{
                14657,  20000,    -- Ducal Guard's Ring
                1262,   500000,   -- Dark Ore
        },
    }

    tpz.shop.general(player, stock[shop])
end
