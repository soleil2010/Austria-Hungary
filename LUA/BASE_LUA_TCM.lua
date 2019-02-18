-- Lua Script1
-- Author: Florian
-- DateCreated: 2/14/2019 10:03:30 PM
--------------------------------------------------------------
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


