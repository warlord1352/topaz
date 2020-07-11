--------------------------------------------------------------
-- func: !shop
-- auth: forgottenandlost
-- desc: opens a custom shop anywhere in the world
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player,page)
    if (page == 0 or page == nil) then
        player:PrintToPlayer( "1: goldfishing stuff, 2: summer stuff");
    elseif (page == 1) then -- Summer Stuff!!!!
		local stock_1 =
		{
			11318,	12500,		-- Otokoeshi Yukata
			11319,	12500,		-- Ominaeshi Yukata
			11861,	15000,		-- Hikogami Yukata
			11862,	15000,		-- Himegami Yukata
			13821,	3750,		-- Lord's Yukata
			13822,	3750,		-- Lady's Yukata
			14532,	5000,		-- Otoko Yukata
			14533,	5000,		-- Onago Yukata
			14534,	7500,		-- Otokogimi Yukata
			14535,	7500,		-- Onnagimi Yukata
			28149,	15000,		-- Kengyu Hanmomohiki
			28150,	15000,		-- Shokujo Hanmomohiki
			
			14457,	7500,		-- Hume Gilet +1
			15415,	7500, 		-- Hume Trunks +1
			14458,	7500,		-- hume top +1
			15416,	7500,		-- hume shorts +1
			14459,	7500, 		-- elvaan gilet +1
			15417,	7500, 		-- elvaan trunks +1
			14460,	7500, 		-- elvaan top +1
			15418,	7500, 		-- elvaan shorts +1
			14462,	7500, 		-- mithra top +1
			15420,	7500, 		-- mithra shorts +1
			14463,	7500,		-- galka gilet +1
			15421,	7500,		-- galka trunks +1
			14461,	7500,		-- tarutaru maillot +1
			15419,	7500,		-- tarutaru trunks +1
			14472,	7500,		-- tarutaru top +1
			15424,	7500,		-- tarutaru shorts +1
			
			11273,	7500,		-- custom Gilet +1
			16329,	7500,		-- custom Trunks +1
			11274,	7500,		-- custom top +1
			16330,	7500,		-- custom shorts +1
			11275,	7500,		-- magna gilet +1
			16331,	7500,		-- magna trunks +1
			11276,	7500,		-- magna top +1
			16332,	7500,		-- magna shorts +1
			11279,	7500,		-- savage top +1
			16335,	7500,		-- savage shorts +1
			11280,	7500,		-- elder gilet +1
			16336,	7500,		-- elder trunks +1
			11277,	7500,		-- wonder maillot +1
			16333,	7500,		-- wonder trunks +1
			11278,	7500,		-- wonder top +1
			16334,	7500,		-- wonder shorts +1
			
			10264,	7500,		-- marine Gilet +1
			10338,	7500,		-- marine boxers +1
			10265,	7500,		-- marine top +1
			10339,	7500,		-- marine shorts +1
			10266,	7500,		-- woodsy gilet +1
			10340,	7500,		-- woodsy boxers +1
			10267,	7500,		-- woodsy top +1
			10341,	7500,		-- woodsy shorts +1
			10270,	7500,		-- river top +1
			10344,	7500,		-- river shorts +1
			10271,	7500,		-- dune gilet +1
			10345,	7500,		-- dune boxers +1
			10268,	7500,		-- creek maillot +1
			10342,	7500,		-- creek boxers +1
			10269,	7500,		-- creek top +1
			10343,	7500,		-- creek shorts +1
			
			27805,	7500,		-- rustic maillot +1
			28088,	7500,		-- rustic trunks +1
			27806,	7500,		-- shoal maillot +1
			28089,	7500		-- shoal trunks +1
		};
		showShop(player, STATIC, stock_1);

    else
        player:PrintToPlayer( string.format( "Page %i not found.", page ) );
    end
end;