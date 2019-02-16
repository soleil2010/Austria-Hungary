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