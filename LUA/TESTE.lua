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


--===================================================================
--Building scaling with era
--===================================================================
--[[
--Events.PlayerEraChanged.Add(
function ERABuild(PlayerID)
	local player = Players[PlayerID]
	if (player:IsEverAlive() and player:GetCivilizationType() == civilizationID) then
		for city in player:Cities() do

			--if (city:IsHasBuilding(GameInfoTypes.BUILDING_DF_CONNECTED)) then

				if (player:GetCurrentEra() == GameInfoTypes.ERA_INFORMATION) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 16)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 16)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 8)
				elseif (player:GetCurrentEra() == GameInfoTypes.ERA_ATOMIC) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 14)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 14)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 7)
				elseif (player:GetCurrentEra() == GameInfoTypes.ERA_MODERN) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 12)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 12)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 6)
				elseif (player:GetCurrentEra() == GameInfoTypes.ERA_INDUSTRIAL) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 10)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 10)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 5)
				elseif (player:GetCurrentEra() == GameInfoTypes.ERA_RENAISSANCE) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 8)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 8)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 4)
				elseif (player:GetCurrentEra() == GameInfoTypes.ERA_MEDIEVAL) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 6)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 6)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 3)
				elseif (player:GetCurrentEra() == GameInfoTypes.ERA_CLASSICAL) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 4)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 4)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 2)
				elseif (player:GetCurrentEra() == GameInfo.Eras["ERA_ANCIENT"]) then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 2)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 2)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 1)
					print("ERA OK")
				else break end
			end
		end
	--end
end--)
GameEvents.PlayerDoTurn.Add(ERABuild)
]]
--=============================================================================================

function UAFranzCapital(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
		if city:IsCapital() then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		print("CAPITAL OK")
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 6)
		--print("change yield ok")
		end
	end
end
end
--GameEvents.PlayerDoTurn.Add(UAFranzCapital)
GameEvents.PlayerCityFounded.Add(UAFranzCapital)
--=============================================================================================
--Connection City
--=============================================================================================
function UAConnection(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
		if Player:IsCapitalConnectedToCity(city) and player:IsEverAlive() then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		print("connection ok")
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 6)
		--print("change yield ok")
		end
	end
end
end
--GameEvents.CityConnections.Add(UAConnection)
GameEvents.PlayerDoTurn.Add(UAConnection)






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

