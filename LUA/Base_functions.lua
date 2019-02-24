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
                        if PreGame.GetCivilization(iSlot) == civilisationID then
                                return true
                        end
                end
        end
     
        return false
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
		print("Scaleok1 ok")
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
				print("Scaleok2 ok")

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
		print("Scaleok3 ok")
	end
end
GameEvents.PlayerDoTurn.Add(EraScaling)
--GameEvent.TeamSetEra.Add(EraScaling)