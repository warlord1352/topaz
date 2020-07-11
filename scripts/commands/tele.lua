---------------------------------------------------------------------------------------------------
-- func: tele
-- desc: Teleports a player to the given zone.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "ss"
};

local word  = "";
function onTrigger(player, word)
   if (word == "dem") then
       player:setPos(220,19,302,209,108);
   end
   if (word == "holla") then
      player:setPos(418,19,21,197,102);
   end
   if (word == "mea") then
       player:setPos(100,35.1506,340,0,0x75);
   end
   if (word == "altep") then
       player:setPos(-61.942,3.949,224.9,0,0x72);
   end
   if (word == "yhoat") then
       player:setPos(-280.942,0.596,-144.156,0,0x7c);
   end
   if (word == "vahzl") then
       player:setPos(150.258,-21.048,-37.256,94,0x70);
   end
   if (word == "jugner") then
       player:setPos(-122.862, 0, -163.154, 192, 0x52);
   end
   if (word == "meriph") then
       player:setPos(305.989, -14.978, 18.96, 192, 0x61);
   end
   if (word == "pashh") then
       player:setPos(345.472, 24.28, -114.731, 99, 0x5A);
   end	
    if (word == "azouph") then
		player:setPos(522.73, -28.009, -502.621, 161, 0x4f); -- to Caedarva Mire {R}
	end
	if (word == "mamool") then	
		player:setPos(-210.291, -11.5, -818.056, 255, 0x34); -- to Bhauflau Thickets {R}
	end
	if (word == "halvung") then	
		player:setPos(688.994, -23.96, 351.496, 191, 0x3d); -- to Mount Zhayolm {R}
	end
	if (word == "ilrusi") then	
		player:setPos(17.54, -7.25, 627.968, 254, 0x36); -- to Arrapago Reef {R}
	end
	if (word == "dvucca") then	
		player:setPos(-265.632, -6, -29.472, 94, 0x4f); -- to Caedarva Mire {R}
	end
	if (word == "nzyul") then	
		player:setPos(222.798, -0.5, 19.872, 0, 0x48); -- to Alzadaal Undersea Ruins {R}
	end
	if (word == "chamberleft") then	
		player:setPos(133.4, 1.485, 47.427, 96, 0x32);  -- Aht Urhgan Whitegate Chamber of Passage Left  {R}
	end
	if (word == "chamberright") then	
		player:setPos(116.67, 1.485, 47.427, 32, 0x32); -- Aht Urhgan Whitegate Chamber of Passage Right {R}
	end
end;