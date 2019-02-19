-- Dio_test
-- Author: Noxcaedibux
-- DateCreated: 2/19/2019 8:46:36 PM
--------------------------------------------------------------

local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]

function NbVilles(PlayerID)
	local player = Players[PlayerID]
	local nbvilles = player:GetNumCities()
	print(nbvilles.."ville(s) construite(s)");
end

GameEvents.PlayerDoTurn.Add(NbVilles)
