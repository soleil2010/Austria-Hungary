-- Lua Script2
-- Author: Florian
-- DateCreated: 2/16/2019 10:07:24 AM
--------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]

--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------     
function JFD_IsCivilizationActive(civilizationID)
        for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
                local slotStatus = PreGame.GetSlotStatus(iSlot)
                if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
                        if PreGame.GetCivilization(iSlot) == civilizationID then
                                return true
                        end
                end
        end
     
        return false
end

function NbCityConnected()
    local player = Players[Game.GetActivePlayer()]
	local nbvilles = player:GetNumCities()
	local isConnected=0
	for city in player:Cities() do
		print(nbvilles.." ville(s) construite(s)")
		if (player:IsCapitalConnectedToCity(city) and player:GetCivilizationType() == civilizationID ) then
			isConnected = isConnected+1
		end
	end
	return isConnected
end

--===================================================================
function UBKH(PlayerID)
	local player = Players[PlayerID]
	local KHBuilding = GameInfoTypes.BUILDING_TCM_CONCERT_HALL
	local KHBuildingClass = GameInfoTypes.BUILDINGCLASS_NATIONAL_COLLEGE

	if player:GetCivilizationType() == civilizationID then
	print("ok")
		for city in player:Cities() do
		print("ok1")
			if city:IsHasBuilding(KHBuilding) then
			print("ok2")
			city:SetBuildingYieldChange(KHBuildingClass, YieldTypes.YIELD_CULTURE, NbCityConnected())
			--print(NbCityConnected.." on gagne normalement ca")
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(UBKH)

--=============================================================================================
--KH_GG_GA
--=============================================================================================







--NE PAS UTILISER LES PLOT: TROP GOURMAND!
--[[
local DumConnec = GameInfoTypes.BUILDING_DF_CONNECTED

function UAConnection(PlayerID, CityID, BuildingID)
	local player = Players[PlayerID]

	if not (player and player:GetCivilizationType() == civilizationID) then return end
	if eBuilding == DumConnec then
	for city in player:Cities() do

	if player:IsCapitalConnectedToCity(city) and not IsHasBuilding(DumConnec) then
		city:SetNumRealBuilding(DumConnec, 1)
		print("CONNECTION OK")
	end
	end
	end
end
GameEvents.PlayerDoTurn.Add(UAConnection)
]]

