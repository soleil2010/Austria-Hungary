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
--=============================================
--NBConnectionCity
--=============================================
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
	--print("ok")
		for city in player:Cities() do
		--print("ok1")
			if city:IsHasBuilding(KHBuilding) then
			--print("ok2")
			city:SetBuildingYieldChange(KHBuildingClass, YieldTypes.YIELD_CULTURE, NbCityConnected())
			--print(NbCityConnected.." on gagne normalement ca")
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(UBKH)

--=============================================================================================
--KH_Viribus Unitis
--=============================================================================================
--=====================================================
--UAConnectionCities
--=====================================================
function UAConnectionT(PlayerID,iCityX, iCityY, iToCityX, iToCityY, bDirect)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then

	for city in player:Cities() do
	print("true ok2")
		if Player:IsCapitalConnectedToCity(city) and player:IsEverAlive() and not city:IsCapital() and ((not bDirect) or bDirect) then
		local pCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
		local pToCity = Map.GetPlot(iToCityX, iToCityY):GetPlotCity()
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		print("true ok3")
		end
	end
end
return false
end
--GameEvents.CityConnections.Add(UAConnectionT) 
GameEvents.CityConnected.Add(UAConnectionT)
--GameEvents.PlayerDoTurn.Add(UAConnection)

--=============================================================================================
--KH_Viribus Unitis
--=============================================================================================
function ViribusUnitisT(PlayerID,iCityX, iCityY, iToCityX, iToCityY,bDirect)
    local player = Players[PlayerID]
    local baseCombatStrength
	local NBDummy = player:CountNumBuildings(GameInfoTypes.BUILDING_DF_CONNECTED)
	local NbConnect = NbCityConnected()

    if player:GetCivilizationType() == civilizationID and (not bDirect) then
        for unit in player:Units() do
            if unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_GUN then
				local sUnit = unit:GetBaseCombatStrength()

				local unitType = unit:GetUnitType();
				
				local force = GameInfo.Units[unit:GetUnitType()].Combat;

				unit:SetBaseCombatStrength(force + (1*(NbCityConnected())))
				print("trueVU ok1")
				return bDirect
				elseif unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SIEGE then
						local rUnitType = unit:GetUnitType();

						local rForce = GameInfo.Units[unit:GetUnitType()].RangedCombat;

						unit:SetBaseRangedCombatStrength(rForce + (1*(NbCityConnected())))
						print("trueVU ok2")
						return bDirect
				end
		end
	end
	return false
end
GameEvents.CityConnections.Add(ViribusUnitisT)
GameEvents.CityConnected.Add(ViribusUnitisT)
--GameEvents.PlayerDoTurn.Add(ViribusUnitis)

function OnCityConnections(PlayerID, bDirect)
local player = Players[PlayerID]
  -- Only interested in indirect city connection events for the civ with the river expansion trait and the sailing tech
    print("ITWORKS1")
  return bDirect > 0
end
GameEvents.CityConnections.Add(OnCityConnections)

function OnCityConnected(PlayerID, iCityX, iCityY, iToCityX, iToCityY, bDirect)
local player = Players[PlayerID]
  -- No need to test that the plots contain cities or that both cities belong to iPlayer as the DLL guarantees this
  if  bDirect then -- another mod could be listening for these events
    local pCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
    local pToCity = Map.GetPlot(iToCityX, iToCityY):GetPlotCity()
	    print("ITWORKS2")
	return (pCity and pToCity > 0)
  end

  return false
end
GameEvents.CityConnected.Add(OnCityConnected)






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

