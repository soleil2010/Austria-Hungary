-- Base_functions
-- Author: Florian
-- DateCreated: 2/17/2019 12:51:16 PM
--------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------     
function JFD_IsCivilisationActive(civilizationID)
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
--------------------------------------------------------------
-- GE_Grenzer from TCM's Austria-Hungary
--------------------------------------------------------------
function GE_GetNumPromotions(unit)
        local numPromotions = 0
			if unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
				for promotion in GameInfo.UnitPromotions() do
						if unit:IsHasPromotion(promotion.ID) then
							numPromotions = numPromotions + 1
						end
				end
			end
		return numPromotions
end

local bonusPerPromotion = 1
local unitGrenzerID = GameInfoTypes["UNIT_TCM_GRENZER"]
local unitGWIID = GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"]
local unitInfantryID = GameInfoTypes["UNIT_INFANTRY"]
local unitMechInfantryID = GameInfoTypes["UNIT_MECHANIZED_INFANTRY"]
local GEPromotion = GameInfoTypes["PROMOTION_GRENZSCHUTZ"]
local UnitGun = GameInfoTypes["UNITCOMBAT_GUN"]


function GE_Grenzer(playerID)
    local player = Players[playerID]
    local baseCombatStrength

    if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
            for unit in player:Units() do
                    if unit:GetUnitType() == unitGrenzerID then
                            baseCombatStrength = GameInfo.Units["UNIT_TCM_GRENZER"].Combat
                    elseif unit:GetUnitType() == unitGWIID and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
                            baseCombatStrength = GameInfo.Units["UNIT_GREAT_WAR_INFANTRY"].Combat
                    elseif unit:GetUnitType() == unitInfantryID and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
                            baseCombatStrength = GameInfo.Units["UNIT_INFANTRY"].Combat
                    elseif unit:GetUnitType() == unitMechInfantryID and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
                            baseCombatStrength = GameInfo.Units["UNIT_MECHANIZED_INFANTRY"].Combat
                    end
                    if (unit:GetUnitType() == unitGrenzerID or unit:GetUnitType() == unitGWIID or unit:GetUnitType() == unitInfantryID or unit:GetUnitType() == unitMechInfantryID) and baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
                        unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
                    end
            end
        end
end
     
if JFD_IsCivilisationActive(civilizationID) then
GameEvents.UnitPromoted.Add(GE_Grenzer)
GameEvents.UnitUpgraded.Add(GE_Grenzer)
GameEvents.PlayerDoTurn.Add(GE_Grenzer)
end

--================================================
--UA Scaling Era
--================================================

function EraScaling(PlayerID)
local player = Players[PlayerID]
	if player:GetCivilizationType() == civilizationID then
		for city in player:Cities() do
		if city:IsHasBuilding(GameInfoTypes.BUILDING_DF_CONNECTED) then

				if player:GetCurrentEra() == GameInfoTypes.ERA_FUTURE then

					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 16)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 16)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 8)
				elseif player:GetCurrentEra() == GameInfoTypes.POSTMODERN then

					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 14)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 14)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 7)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_MODERN then

					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 12)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 12)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 6)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_INDUSTRIAL then

					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 10)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 10)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 5)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_RENAISSANCE then

					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 8)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 8)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 4)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_MEDIEVAL then

					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 6)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 6)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 3)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_CLASSICAL then

					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 4)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 4)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 2)
					else
			end
		end
		end
	end
end
GameEvents.PlayerDoTurn.Add(EraScaling)
--=====================================================
--UAConnectionCities
--=====================================================
function UAConnection(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
		if Player:IsCapitalConnectedToCity(city) and player:IsEverAlive() and not city:IsCapital() then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		end
	end
end
end
GameEvents.PlayerDoTurn.Add(UAConnection)
--=====================================================
--UAConnectionCapital
--=====================================================
function UAFranzCapital(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
		if city:IsCapital() then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		end
	end
end
end
GameEvents.PlayerCityFounded.Add(UAFranzCapital)
--=====================================================
--UB Kaiserliche Hofbibliothek Connection Capital
--=====================================================
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
--======================================================================
--UB Kaiserliche Hofbibliothek_GG_GA
--======================================================================
function CheckTrading(PlayerID,CityID)
    local player = Players[PlayerID]
		for city in player:Cities() do
			if player:GetCivilizationType() == civilizationID and city:IsHasBuilding(GameInfoTypes.BUILDING_TCM_CONCERT_HALL) then
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(iPolicy, true)
			end
		end
end
GameEvents.CityConstructed.Add(CheckTrading)
--=============================================================================================
--KH_Viribus Unitis
--=============================================================================================
function ViribusUnitis(PlayerID)
    local player = Players[PlayerID]
    local baseCombatStrength
	local i=0
	local NBDummy = player:CountNumBuildings(GameInfoTypes.BUILDING_DF_CONNECTED)
	local NbConnect = NbCityConnected()

    if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
        for unit in player:Units() do
            if unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_GUN then
				local sUnit = unit:GetBaseCombatStrength()

				i = i+1

				local unitType = unit:GetUnitType();
				
				local force = GameInfo.Units[unit:GetUnitType()].Combat;

				unit:SetBaseCombatStrength(force + (0.15*(NbCityConnected())))

				elseif unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SIEGE then
						local rUnitType = unit:GetUnitType();

						local rForce = GameInfo.Units[unit:GetUnitType()].RangedCombat;

						unit:SetBaseRangedCombatStrength(rForce + (0.15*(NbCityConnected())))
				end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ViribusUnitis)