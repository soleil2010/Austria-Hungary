-- Dio_test
-- Author: Noxcaedibux
-- DateCreated: 2/19/2019 8:46:36 PM
-- --------------------------------------------------------------
-- -- OLD
-- --====
-- function DVA_CityConnectionBonus(playerID)
--     local player = Players[playerID]
--     local nbCityConnected=0
--     if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
--         for city in player:Cities() do
--             if player:IsCapitalConnectedToCity(city) then
--                 nbCityConnected = nbCityConnected + 1
--             end
--         end
--     end
--     return nbCityConnected
-- end







--26
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]

function NbVilles()
    local player = Players[Game.GetActivePlayer()]
	local nbvilles = player:GetNumCities()
	local isConnected=0
	print(nbvilles.." ville(s) construite(s)");
	for city in player:Cities() do
		if (player:IsCapitalConnectedToCity(city) and player:GetCivilizationType() == civilisationID ) then
			isConnected = isConnected+1
		end
	end
	return isConnected
end



function PRINT()
	print("i have "..NbVilles().." cities connected to capital!");
end
GameEvents.PlayerDoTurn.Add(PRINT)
