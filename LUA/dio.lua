-- dio
-- Author: Noxcaedibux
-- DateCreated: 2/27/2019 7:22:16 PM
--------------------------------------------------------------

local civilizationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
local GEPromotion = GameInfoTypes["PROMOTION_GRENZSCHUTZ"] --cache the ID of PROMOTION_GRENZSCHUTZ

local tCombatStrengths = {}
for unit in DB.Query("SELECT ID, Combat FROM Units WHERE Combat > 0 AND Cost > 0") do
    tCombatStrengths[unit.ID] = unit.Combat;
end

-- ne fonctionne pas car au passage de tour les updates sont perdues
-- j'ai l'impression qu'il n'y a qu'une unitée qui peut être améliorée
function GE_Test(playerID, unitID)
    local player = Players[playerID]
	local bonusPerPromotion = 1
    --you could remove the following if-statement so that the promotion also works if another player obtains the promotion/your UU (E.g. by City State-gift/when spawned in using Lua by another mod)
    if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
        unit = player:GetUnitByID(unitID) --we know which unit is upgraded, so we remove the loop over all units
        if unit:IsHasPromotion(GEPromotion) then --any unit that has the promotion should get a bonus (since the unit can be an upgrade from the UU)
            local baseCombatStrength = tCombatStrengths[unit:GetUnitType()] --obtain the cached combat strength of the unit
            if baseCombatStrength then --if the unit is not in the table, then it doesn't have a (melee) combat strength
                --unit has a melee combat strength; set it to the maximum of its base combat strength and the buff provided by the promotion
                unit:SetBaseCombatStrength(math.max(baseCombatStrength, baseCombatStrength + bonusPerPromotion*GE_GetNumPromotions(unit)));
            end
        end
    --note that all elseif's (for UNIT_MECHANIZED_INFNATRY and such) are removed; this code will work for any unit.
    end --if you choose to remove the first if-statement, also remove this end
end

