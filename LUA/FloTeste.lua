-- Lua Script1
-- Author: Florian
-- DateCreated: 2/16/2019 8:40:45 PM
--------------------------------------------------------------
--[[
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
]]