-- Lua Script1
-- Author: Florian
-- DateCreated: 2/16/2019 8:40:45 PM
--------------------------------------------------------------
--Fonction : city:IsCapital()
--if (not city:IsCapital() and player:IsCapitalConnectedToCity(city) and not city:IsBlockaded()) then
--local isCapital = pCity:IsCapital();

function DVA_CityConnectionBonus(playerID,cityID)
    local player = Players[playerID]
	local NBCityConnected = 0
    if player:GetCivilizationType() == civilisationID and player:IsEverAlive() then
        for city in player:Cities() do
		pCity:GetID()
            if player:IsCapitalConnectedToCity(pCity) then
			player:ChangeGold (500)
                NBCityConnected = NBCityConnected + 1
                    
                    end
                end
            end
			return player:ChangeGold (500*NBCityConnected)
        end
