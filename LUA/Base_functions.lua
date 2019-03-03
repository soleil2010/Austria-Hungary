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
--[[
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
local bonusPerPromotion = 1
local GEPromotion = GameInfoTypes.PROMOTION_GRENZSCHUTZ --cache the ID of PROMOTION_GRENZSCHUTZ

local tCombatStrengths = {}
for row in DB.Query("SELECT ID, Combat FROM Units WHERE Combat > 0 AND Cost > 0") do
    tCombatStrengths[row.ID] = row.Combat;
end
--function GE_GetNumPromotions is defined here somewhere


function GE_Grenzer(PlayerID, unitID)

    local player = Players[PlayerID]
    --you could remove the following if-statement so that the promotion also works if another player obtains the promotion/your UU (E.g. by City State-gift/when spawned in using Lua by another mod)
    if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
	print("ok1")
        unit = player:GetUnitByID(unitID) --we know which unit is upgraded, so we remove the loop over all units
        if unit:IsHasPromotion(GEPromotion) then --any unit that has the promotion should get a bonus (since the unit can be an upgrade from the UU)
		print("ok2")
            local baseCombatStrength = tCombatStrengths[unit:GetUnitType()] --obtain the cached combat strength of the unit
            if baseCombatStrength then --if the unit is not in the table, then it doesn't have a (melee) combat strength
                --unit has a melee combat strength; set it to the maximum of its base combat strength and the buff provided by the promotion
                unit:SetBaseCombatStrength(math.max(baseCombatStrength, baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)));
				print("ok3")
            end
        end
    --note that all elseif's (for UNIT_MECHANIZED_INFNATRY and such) are removed; this code will work for any unit.
    end --if you choose to remove the first if-statement, also remove this end
end

]]
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
				if city:GetWeLoveTheKingDayCounter() > 0 then
				city:SetNumRealBuilding(BuildingDummyForConnected,2)
				else 
				city:SetNumRealBuilding(BuildingDummyForConnected,1)
				end
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
				if city:GetWeLoveTheKingDayCounter() > 0 then
				city:SetNumRealBuilding(BuildingDummyForConnected,2)
				else
				city:SetNumRealBuilding(BuildingDummyForConnected,1)
				end
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
local iPolicy = GameInfoTypes.POLICY_D_KH
local eBuilding =  GameInfoTypes.BUILDING_TCM_CONCERT_HALL

function CheckTrading(PlayerID,CityID,eBuilding)
    local player = Players[PlayerID]
	for city in player:Cities() do
		if player:GetCivilizationType() == civilizationID and city:IsHasBuilding(eBuilding) then
			--player:SetNumFreePolicies(1)
			--player:SetNumFreePolicies(0)
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
--=============================================================================================
--KH_Gold_EXPEND
--=============================================================================================
local eBuildingKH = GameInfoTypes.BUILDING_TCM_CONCERT_HALL
local eBuildingDummyKH = GameInfoTypes.BUILDING_DF_LIBRARY
local eBuildingLibrary = GameInfoTypes.BUILDING_LIBRARY


-- adds bonus to barracks if TO is built
function OnCityConstructionAddDummyForKH(iPlayer, iCity, eBuilding)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == civilizationID) then return end

	if eBuilding == eBuildingKH then
		local iNumberOfLibrary = pPlayer:CountNumBuildings(eBuildingLibrary)

		if iNumberOfLibrary > 0 then
			for city in pPlayer:Cities() do
				local iCurrentLibrary = 0

				if city:IsHasBuilding(eBuildingLibrary) then
					city:SetNumRealBuilding(eBuildingDummyKH, 1)
					iCurrentLibrary = iCurrentLibrary + 1

					if iCurrentLibrary == iNumberOfLibrary then
						break
					end
				end
			end
		end
	elseif eBuilding == eBuildingLibrary then
		local iNumberOfKH = pPlayer:CountNumBuildings(eBuildingKH)

		if iNumberOfKH > 0 then
			pPlayer:GetCityByID(iCity):SetNumRealBuilding(eBuildingDummyKH, 1)
		end
	end
end

function OnFoundAddDummyForKH(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == civilizationID) then return end

	if pPlayer:CountNumBuildings(eBuildingKH) > 0 then

		local pFoundCity = Map.GetPlot(iX, iY):GetWorkingCity()
		if pFoundCity:IsHasBuilding(eBuildingLibrary) then

			pFoundCity:SetNumRealBuilding(eBuildingDummyKH, 1)
		end
	end
end

-- if is a player, events are executed
if JFD_IsCivilizationActive(civilizationID) then
	--GameEvents.UnitPromoted.Add(GE_Grenzer)
	--GameEvents.UnitUpgraded.Add(GE_Grenzer)
	--GameEvents.PlayerDoTurn.Add(GE_Grenzer)
	GameEvents.CityConstructed.Add(OnCityConstructionAddDummyForKH)
	GameEvents.PlayerCityFounded.Add(OnFoundAddDummyForKH)
	GameEvents.PlayerDoTurn.Add(EraScaling)
	GameEvents.PlayerDoTurn.Add(UAConnection)
	GameEvents.PlayerCityFounded.Add(UAFranzCapital)
	GameEvents.PlayerDoTurn.Add(UBKH)
	GameEvents.CityConstructed.Add(CheckTrading)
	--GameEvents.PlayerDoTurn.Add(ViribusUnitis)
end