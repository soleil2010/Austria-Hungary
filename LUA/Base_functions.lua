-- Base_functions
-- Authors: Florian & Diogo
-- DateCreated: 2/17/2019 12:51:16 PM
--------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
--=============================================================================================
-- UTILITY FUNCTIONS
--=============================================================================================


--=============================================================================================
-- Name:		JFD_IsCivilisationActive
-- Description:	Défini si la civ est en jeu
--=============================================================================================     
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

--=============================================================================================
-- Name:		NBConnectionCity
-- Description:	return number of cities connected to capital
--=============================================================================================
function NbCityConnected()
    local player = Players[Game.GetActivePlayer()]
	local nbvilles = player:GetNumCities()
	local isConnected=0
	for city in player:Cities() do
		if (player:IsCapitalConnectedToCity(city) and player:GetCivilizationType() == civilizationID ) then
			isConnected = isConnected+1
		end
	end
	return isConnected
end

--=============================================================================================
-- Name:		GE_Grenzer from TCM's Austria-Hungary
-- Description:	Return the number of units with Grenzschutz promotions
--=============================================================================================
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

--=============================================================================================
-- Name:		GE_Grenzer
-- Descripion:	Each unit with Grenzschutz's promotion have more 
--				power per number of promotion (+1 per promotion)
--=============================================================================================
function GE_Grenzer(playerID)
    local player = Players[playerID]
	local bonusPerPromotion = 1
	local unitGrenzerID = GameInfoTypes["UNIT_TCM_GRENZER"]
	local unitGWIID = GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"]
	local unitInfantryID = GameInfoTypes["UNIT_INFANTRY"]
	local unitMechInfantryID = GameInfoTypes["UNIT_MECHANIZED_INFANTRY"]
	local GEPromotion = GameInfoTypes["PROMOTION_GRENZSCHUTZ"]
	local UnitGun = GameInfoTypes["UNITCOMBAT_GUN"]
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

--=============================================================================================
-- Name:		UA(Unique ability) Scaling Era
-- Description:	Change la valeur des yields (chaques villes connectées à la capital +2Prod, +2Gold, +1faith)
--              avec cette fonction, ces valeurs augmentent avec les ères				
--=============================================================================================
function EraScaling(PlayerID)
	local player = Players[PlayerID]
	local DummyUA = GameInfoTypes.BUILDINGCLASS_DF_CONNECTED
	if player:GetCivilizationType() == civilizationID then
		for city in player:Cities() do
		if city:IsHasBuilding(GameInfoTypes.BUILDING_DF_CONNECTED) then
				if player:GetCurrentEra() == GameInfoTypes.ERA_FUTURE then

					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_PRODUCTION, 16)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_GOLD, 16)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_FAITH, 8)
				elseif player:GetCurrentEra() == GameInfoTypes.POSTMODERN then

					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_PRODUCTION, 14)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_GOLD, 14)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_FAITH, 7)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_MODERN then

					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_PRODUCTION, 12)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_GOLD, 12)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_FAITH, 6)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_INDUSTRIAL then

					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_PRODUCTION, 10)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_GOLD, 10)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_FAITH, 5)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_RENAISSANCE then

					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_PRODUCTION, 8)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_GOLD, 8)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_FAITH, 4)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_MEDIEVAL then

					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_PRODUCTION, 6)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_GOLD, 6)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_FAITH, 3)
				elseif player:GetCurrentEra() == GameInfoTypes.ERA_CLASSICAL then

					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_PRODUCTION, 4)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_GOLD, 4)
					city:SetBuildingYieldChange(DummyUA, YieldTypes.YIELD_FAITH, 2)
				end
			end
		end
	end
end

--=============================================================================================
-- Name:		UAConnectionCities
-- Description:	Quand une ville(non capital) est connectée à la capital, elle gagne un bâtiment dummy (fantôme)
--				qui va lui donner son bonus UA (unique ability " +2prod, +2gold, +1faith)
--=============================================================================================
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

--=============================================================================================
-- Name:		UAConnectionCapital
-- Description:	UB Capital gagne automatiquement le bonus (unique ability " +2prod, +2gold, +1faith)
--=============================================================================================
function UAFranzCapital(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

	if player:GetCivilizationType() == civilizationID then
		for city in player:Cities() do
			if city:IsCapital() then
				city:SetNumRealBuilding(BuildingDummyForConnected,1)
			end
		end
	end
end

--=============================================================================================
-- Name:		UB Kaiserliche Hofbibliothek Connection Capital
-- Description:	UB(Unique Building) Gagne +1 de culture par connection (capital uniquement)
--=============================================================================================
function UBKH(PlayerID)
	local player = Players[PlayerID]
	local KHBuilding = GameInfoTypes.BUILDING_TCM_CONCERT_HALL
	local KHBuildingClass = GameInfoTypes.BUILDINGCLASS_NATIONAL_COLLEGE

	if player:GetCivilizationType() == civilizationID then
		for city in player:Cities() do
			if city:IsHasBuilding(KHBuilding) then
				city:SetBuildingYieldChange(KHBuildingClass, YieldTypes.YIELD_CULTURE, NbCityConnected())
			end
		end
	end
end

--=============================================================================================
-- Name:		UB Kaiserliche Hofbibliothek_GG_GA
-- Description:	UB (Unique Building) gagne culture flat quand generel expend et science quand amiral expend (Dummy policy) (voir sql)
--=============================================================================================
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

--=============================================================================================
--Name:			ViribusUnitis
--Description:	Melee and Gun units have a strength bonus per city connected to capital.
--				Siege units have a ranged combat bonus per city connected to capital.
--=============================================================================================
function ViribusUnitis(PlayerID)
	-- local NBDummy = player:CountNumBuildings(GameInfoTypes.BUILDING_DF_CONNECTED)
    local player = Players[PlayerID]
	local NbConnect = NbCityConnected()

    if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
        for unit in player:Units() do
            if unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and (unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_GUN) then
				local baseCombatStrength = GameInfo.Units[unit:GetUnitType()].Combat;
				unit:SetBaseCombatStrength(baseCombatStrength + (0.15*NbConnect))

			elseif unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SIEGE then
				local baseCombatStrength = GameInfo.Units[unit:GetUnitType()].RangedCombat;
				unit:SetBaseRangedCombatStrength(baseCombatStrength + (0.15*NbConnect))
			end
		end
	end
end

-- if is a player, events are executed
if JFD_IsCivilisationActive(civilizationID) then
	GameEvents.UnitPromoted.Add(GE_Grenzer)
	GameEvents.UnitUpgraded.Add(GE_Grenzer)
	GameEvents.PlayerDoTurn.Add(GE_Grenzer)
	GameEvents.PlayerDoTurn.Add(EraScaling)
	GameEvents.PlayerDoTurn.Add(UAConnection)
	GameEvents.PlayerCityFounded.Add(UAFranzCapital)
	GameEvents.PlayerDoTurn.Add(UBKH)
	GameEvents.CityConstructed.Add(CheckTrading)
	GameEvents.PlayerDoTurn.Add(ViribusUnitis)
end