-- Lua Script2
-- Author: Florian
-- DateCreated: 2/16/2019 10:59:23 AM
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
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
--------------------------------------------------------------
-- GE_Grenzer
--------------------------------------------------------------
function GE_GetNumPromotions(unit)
        local numPromotions = 0
		if unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
        for promotion in GameInfo.UnitPromotions() do
                if unit:IsHasPromotion(promotion.ID) then
                        numPromotions = numPromotions + 1
                end
        end
     
        return numPromotions
end
end

local bonusPerPromotion = 1
local unitGrenzerID = GameInfoTypes["UNIT_TCM_GRENZER"]
local GEPromotion = GameInfoTypes["PROMOTION_GRENZSCHUTZ"]
local UnitGun = GameInfoTypes["UNITCOMBAT_GUN"]

function GE_Grenzer(playerID)
        local player = Players[playerID]
        if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
                for unit in player:Units() do
                        if unit:GetUnitCombatType() == UnitGun and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
                                local baseCombatStrength = unit:GetBaseCombatStrength()
								if baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
									unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
								end
								
                        end
                end
        end
end
     
if JFD_IsCivilisationActive(civilisationID) then
GameEvents.UnitPromoted.Add(GE_Grenzer)
GameEvents.UnitUpgraded.Add(GE_Grenzer)
        --GameEvents.PlayerDoTurn.Add(GE_Grenzer)
end

--====

local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
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
--------------------------------------------------------------
-- GE_Grenzer from TCM's Austria-Hungary(OLD)
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
        if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
                for unit in player:Units() do
                        if unit:GetUnitType() == unitGrenzerID then
								local baseCombatStrength = GameInfo.Units["UNIT_TCM_GRENZER"].Combat
								if baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
									unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
									end
							elseif unit:GetUnitType() == unitGWIID and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
									local baseCombatStrength = GameInfo.Units["UNIT_GREAT_WAR_INFANTRY"].Combat
									if baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
										unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
										end
									elseif unit:GetUnitType() == unitInfantryID and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
									local baseCombatStrength = GameInfo.Units["UNIT_INFANTRY"].Combat 
											if baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
												unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
												end
												elseif unit:GetUnitType() == unitMechInfantryID and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
													local baseCombatStrength = GameInfo.Units["UNIT_MECHANIZED_INFANTRY"].Combat 
														if baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
														unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
														end
								
								
                        end
				end
			end
end
     
if JFD_IsCivilisationActive(civilisationID) then
GameEvents.UnitPromoted.Add(GE_Grenzer)
GameEvents.UnitUpgraded.Add(GE_Grenzer)
GameEvents.PlayerDoTurn.Add(GE_Grenzer)
end

--===== Versions épurée
function GE_Grenzer(playerID)
    local player = Players[playerID]
    local baseCombatStrength

    if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
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
                    if (unit:GetUnitType() == unitGrenzerID or unit:GetUnitType() == unitGWIID or unit:GetUnitType() == unitInfantryID or unit:GetUnitType() == unitMechInfantryID) and baseCombatStrength < (baseCombatStrength + bonusPerPromotionGE_GetNumPromotions(unit)) then
                        unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotionGE_GetNumPromotions(unit))
                    end
            end
        end
end

--====
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
--====================================================================
local iPolicy = GameInfoTypes["POLICY_D_UA"]

function CheckTrading(PlayerID,CityID)
    local player = Players[PlayerID]
	for city in player:Cities() do
    if player:GetCivilizationType() == civilisationID and player:IsAlive() then
	player:SetNumFreePolicies(1)
	player:SetNumFreePolicies(0)
	player:SetHasPolicy(iPolicy, true)
	end
    end
end
GameEvents.PlayerCityFounded.Add(CheckTrading)
GameEvents.PlayerDoTurn.Add(CheckTrading)

--=======================================================================
local eBuildingTeutonicOrder = GameInfoTypes.BUILDING_TCM_CONCERT_HALL
	local eBuildingDummyForTeutonicOrder = GameInfoTypes.BUILDING_DF_LIBRARY
	local eBuildingBarracks = GameInfoTypes.BUILDING_LIBRARY
	local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
	local pPlayer = Players[iPlayer]
-- adds bonus to barracks if TO is built
function OnCityConstructionAddDummyForTO(iPlayer, iCity, eBuilding)
	
	if not (pPlayer and pPlayer:GetCivilizationType() == civilisationID) then return end

	if eBuilding == eBuildingTeutonicOrder then
		local iNumberOfBarracks = pPlayer:CountNumBuildings(eBuildingBarracks)

		if iNumberOfBarracks > 0 then
			for city in pPlayer:Cities() do
				local iCurrentBarracks = 0

				if city:IsHasBuilding(eBuildingBarracks) then
					city:SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
					iCurrentBarracks = iCurrentBarracks + 1

					if iCurrentBarracks == iNumberOfBarracks then
						break
					end
				end
			end
		end
	elseif eBuilding == eBuildingBarracks then
		local iNumberOfTeutonicOrders = pPlayer:CountNumBuildings(eBuildingTeutonicOrder)

		if iNumberOfTeutonicOrders > 0 then
			pPlayer:GetCityByID(iCity):SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
		end
	end
end

function OnFoundAddDummyForTO(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == civilisationID) then return end

	if pPlayer:CountNumBuildings(eBuildingTeutonicOrder) > 0 then

		local pFoundCity = Map.GetPlot(iX, iY):GetWorkingCity()
		if pFoundCity:IsHasBuilding(eBuildingBarracks) then

			pFoundCity:SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.CityConstructed.Add(OnCityConstructionAddDummyForTO)
	--GameEvents.PlayerDoTurn.Add(OnCityConstructionAddDummyForTO)
	GameEvents.PlayerCityFounded.Add(OnFoundAddDummyForTO)
end

function NbVilles(PlayerID, CityID)
    local player = Players[PlayerID]
	for city in player:Cities() do
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
    nbvilles = player:GetNumCities()
	player:ChangeGold(10)
    print(nbvilles);
	break
	end
	end
end

GameEvents.PlayerDoTurn.Add(NbVilles)


Events.PlayerEraChanged.Add(
function(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:IsAlive()) then
		for pCity in pPlayer:Cities() do
			local pBuilding = GameInfoTypes.BUILDING_IGLOO
			local pBuildClass = GameInfoTypes.BUILDINGCLASS_GRANARY
			local culture = GameInfoTypes.YIELD_CULTURE
			if (pCity:IsHasBuilding(pBuilding)) then

				if (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_INFORMATION) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 8)
				elseif (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_ATOMIC) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 7)
				elseif (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_MODERN) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 6)
				elseif (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_INDUSTRIAL) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 5)
				elseif (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_RENAISSANCE) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 4)
				elseif (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_MEDIEVAL) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 3)
				elseif (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_CLASSICAL) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 2)
				elseif (pPlayer:GetCurrentEra() == GameInfoTypes.ERA_ANCIENT) then
					pCity:SetBuildingYieldChange(pBuildClass, culture, 1)
				else break end
			end
		end
	end
end)

Events.PlayerEraChanged.Add(fnQuo_FreeCivicBoostOnEraChange);
--[[
--== compte ville
function NbVilles(PlayerID)
    local player = Players[PlayerID]
	print("NB OK1")
	if(player:GetCivilizationType() == civilisationID ) then
        local nbvilles = player:GetNumCities()
        local isConnected=0
		print("NB OK2")
        --print(nbvilles.." ville(s) construite(s)");
        for city in player:Cities() do
            if (player:IsCapitalConnectedToCity(city) and player:GetCivilizationType() == civilisationID ) then
                isConnected = isConnected+1
				print(isConnected.."NB OK2")
            end
        end
		end
	return isConnected
end
GameEvents.PlayerDoTurn.Add(NbVilles)
--[[
function EraScaling(PlayerID)
local player = Players[PlayerID]
--local eraID = player:GetCurrentEra()
	if player:GetCivilizationType() == civilizationID then
		for city in player:Cities() do
		if city:IsHasBuilding(GameInfoTypes.BUILDING_DF_CONNECTED) then
		print("hasBuild ok")
			--if player:GetCurrentEra() == GameInfoTypes.ERA_ANCIENT then
					--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 4)
					--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 4)
					--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 4)
					--print("ERA OK")
				if player:GetCurrentEra() == GameInfoTypes.ERA_INFORMATION then
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 16)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 16)
					city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 8)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_ATOMIC then
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
				--elseif player:GetCurrentEra() == GameInfoTypes.ERA_ANCIENT then
					--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 2)
					--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 2)
					--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 1)
					print("ERA OK")
					else
					break
			end
		end
		end
	end
end
GameEvents.PlayerDoTurn.Add(EraScaling)
GameEvents.PlayerEnteredNewEra.Add(EraScaling)

--=========================================================
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


