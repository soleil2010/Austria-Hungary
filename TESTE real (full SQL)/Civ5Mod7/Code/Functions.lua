--========================================================================================================================
--========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Support functions for one of the Austro-Hungarian decisions.
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
local dummyCisleithania = GameInfoTypes["BUILDING_TCM_AUSTRIA_HUNGARY_1"]
local dummyTransleithania = GameInfoTypes["BUILDING_TCM_AUSTRIA_HUNGARY_2"]
--------------------------------------------------------------------------------------------------------------------------
function AH_Decision_Support_Function_1(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iNewOwner]
	if player:GetCivilizationType() == civilisationID then
		if player:HasPolicy(GameInfoTypes["POLICY_TCM_AUSTRIA_HUNGARY"]) then
			local plot = Map.GetPlot(iX, iY)
			local city = plot:GetPlotCity()

			local dummyVersion
			local num1 = player:CountNumBuildings(dummyCisleithania) 
			local num2 = player:CountNumBuildings(dummyTransleithania) 

			if num1 > num2 then
				dummyVersion = dummyTransleithania
			else
				dummyVersion = dummyCisleithania
			end

			if dummyVersion == dummyCisleithania then
				city:SetNumRealBuilding(dummyCisleithania, 1)
			elseif dummyVersion == dummyTransleithania then
				city:SetNumRealBuilding(dummyTransleithania, 1)
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(AH_Decision_Support_Function_1)
--------------------------------------------------------------------------------------------------------------------------
function AH_Decision_Support_Function_2(playerID, cityX, cityY)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilisationID then 
		if player:HasPolicy(GameInfoTypes["POLICY_TCM_AUSTRIA_HUNGARY"]) then
			local plot = Map.GetPlot(cityX, cityY)
			local city = plot:GetPlotCity()
			
			local dummyVersion
			local num1 = player:CountNumBuildings(dummyCisleithania) 
			local num2 = player:CountNumBuildings(dummyTransleithania) 

			if num1 > num2 then
				dummyVersion = dummyTransleithania
			else
				dummyVersion = dummyCisleithania
			end
			
			if dummyVersion == dummyCisleithania then
				city:SetNumRealBuilding(dummyCisleithania, 1)
			elseif dummyVersion == dummyTransleithania then
				city:SetNumRealBuilding(dummyTransleithania, 1)
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(AH_Decision_Support_Function_2)  
--------------------------------------------------------------------------------------------------------------------------
--========================================================================================================================
--========================================================================================================================
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------     
function JFD_IsCivilisationActive(civilisationID)
        for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
                local slotStatus = PreGame.GetSlotStatus(iSlot)
                if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
                        if PreGame.GetCivilization(iSlot) == civilisationID then
                                return true
                        end
                end
        end
     
        return false
end
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- buildingClassOperaHouseID
--------------------------------------------------------------
local buildingConcertHallID = GameInfoTypes["BUILDING_TCM_CONCERT_HALL"]
local buildingClassOperaHouseID = GameInfoTypes["BUILDINGCLASS_OPERA_HOUSE"]
function GE_ConcertHall(playerID)
        local player = Players[playerID]
        if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
                for city in player:Cities() do
                        if city:IsHasBuilding(buildingConcertHallID) and city:GetNumGreatWorksInBuilding(buildingClassOperaHouseID) > 0 then
                                player:ChangeGoldenAgeProgressMeter(2)
                        end
                end
        end
end
     
if JFD_IsCivilisationActive(civilisationID) then
        GameEvents.PlayerDoTurn.Add(GE_ConcertHall)
end
--------------------------------------------------------------
-- GE_Grenzer
--------------------------------------------------------------
function GE_GetNumPromotions(unit)
        local numPromotions = 0
        for promotion in GameInfo.UnitPromotions() do
                if unit:IsHasPromotion(promotion.ID) then
                        numPromotions = numPromotions + 1
                end
        end
     
        return numPromotions
end
     
local bonusPerPromotion = 1
local unitGrenzerID = GameInfoTypes["UNIT_TCM_GRENZER"]
function GE_Grenzer(playerID)
        local player = Players[playerID]
        if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
                for unit in player:Units() do
                        if unit:GetUnitType() == unitGrenzerID then
                                local baseCombatStrength = GameInfo.Units["UNIT_TCM_GRENZER"].Combat
								if baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
									unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
								end
								
                        end
                end
        end
end
     
if JFD_IsCivilisationActive(civilisationID) then
        GameEvents.PlayerDoTurn.Add(GE_Grenzer)
end
--------------------------------------------------------------
-- GE_WLTKDGreatPeople
--------------------------------------------------------------
local buildingGreatPersonGenID = GameInfoTypes["BUILDING_TCM_GREAT_PERSON_GEN"]
function GE_WLTKDGreatPeople(playerID)
        local player = Players[playerID]
        if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
                for city in player:Cities() do
                        if city:GetWeLoveTheKingDayCounter() > 0 then
                                if not city:IsHasBuilding(buildingGreatPersonGenID) then
                                        city:SetNumRealBuilding(buildingGreatPersonGenID, 1)
                                end
                        else
                                if city:IsHasBuilding(buildingGreatPersonGenID) then
                                        city:SetNumRealBuilding(buildingGreatPersonGenID, 0)
                                end
                        end
                end
        end
end
     
if JFD_IsCivilisationActive(civilisationID) then
        GameEvents.PlayerDoTurn.Add(GE_WLTKDGreatPeople)
end
--------------------------------------------------------------
-- GE_WLTKDAfterCourthouse
--------------------------------------------------------------
local buildingCourthouseID = GameInfoTypes["BUILDING_COURTHOUSE"]
function GE_WLTKDAfterCourthouse(playerID, cityID, buildingID)
        local player = Players[playerID]
        if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
                if buildingID == buildingCourthouseID then
                        for city in player:Cities() do
                                city:ChangeWeLoveTheKingDayCounter(10)
                        end
                end
        end
end
     
if JFD_IsCivilisationActive(civilisationID) then
        GameEvents.CityConstructed.Add(GE_WLTKDAfterCourthouse)
end