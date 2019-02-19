-- Dio_test
-- Author: Noxcaedibux
-- DateCreated: 2/19/2019 8:46:36 PM
--------------------------------------------------------------

local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]

function NbVilles(PlayerID)
	local player = Players[Game.GetActivePlayer()]
	if( player == Game.GetActivePlayer) then
		local nbvilles = player:GetNumCities()
		local isConnected=0
		print(nbvilles.." ville(s) construite(s)");
		for city in player:Cities() do
			if (player:IsCapitalConnectedToCity(city) ) then
				isConnected = isConnected+1
			end
		end
		print(isConnected.." ville(s) connectée(s)");
	end
end

GameEvents.PlayerDoTurn.Add(NbVilles)
