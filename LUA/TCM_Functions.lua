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
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
--------------------------------------------------------------------------
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
local GEPromotion = GameInfoTypes["PROMOTION_GRENZSCHUTZ"]
function GE_Grenzer(playerID)
    local player = Players[playerID]
    if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
        for unit in player:Units() do
            if unit:GetUnitType() == unitGrenzerID and unit:IsHasPromotion(GameInfoTypes.PROMOTION_GRENZSCHUTZ) then
                local baseCombatStrength = GameInfo.Units["UNIT_TCM_GRENZER"].Combat
				if baseCombatStrength < (baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)) then
					unit:SetBaseCombatStrength(baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit))
				end		
            end
        end
    end
end


function DVA_cityconnected() 
	local pPlayer = Players[Game.GetActivePlayer()]
	pPlayer:ChangeGold(900)
	local quey = " UPDATE Civilization_CityNames SET Connected = 1 WHERE Civilization_CityNames LIKE 'Steyr'; " 
	DB.Query(query)
end

if JFD_IsCivilisationActive(civilisationID) then
        GameEvents.PlayerDoTurn.Add(GE_Grenzer)
        GameEvents.PlayerDoTurn.Add(DVA_cityconnected)
end
