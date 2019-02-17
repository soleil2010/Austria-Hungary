-- Lua Script1
-- Author: Noxcaedibux
-- DateCreated: 2/14/2019 9:42:35 PM
--------------------------------------------------------------
print("HELLO WORLD\n\n\n\n\n\n\n\n\n\n\n")

 
local pPlayer = Players[Game.GetActivePlayer()]
for pCity in pPlayer:Cities() do
	if Player:IsCapitalConnectedToCity(pCity)
		local cityName = pCity:pCity:GetName()
		local quey = "UPDATE Civilization_CityNames SET Connected = 1 WHERE Civilization_CityNames LIKE " .. cityName .. ";" 
		modDb.Query(query)
		print(cityName)		
		print("Voici la ville" .. cityName)
		local pPlayer2 = Players[iPlayer]
		pPlayer:ChangeGold(900)
	end
end


-------------------------------------------------------
-- test de modifs db
-- met à 1 le champ "connected" pour la villes Steyr de la table Civilization_CityNames
function DVA_cityconnected() 
	local db = Modding.OpenSaveData()
	local query="UPDATE Civilization_CityNames SET CONNECTED = 1 WHERE CityName LIKE 'Steyr'; "
	db.Query(query)
end

-- call DVA_cityconnected after user pass turn 
GameEvents.PlayerDoTurn.Add(DVA_cityconnected)

--------------------------------