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
function GE_Grenzer(PlayerID, unitID)

    local player = Players[PlayerID]
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
--==========================================================================================

--[[
local VUPromotion = GameInfoTypes.PROMOTION_VIRIBUS_UNITIS
local NbConnect = NbCityConnected()

local tCombatStrengths = {}
for row in DB.Query("SELECT ID, Combat FROM Units WHERE Combat > 0 AND Cost > 0") do
    tCombatStrengths[row.ID] = row.Combat;
	rCombatStrenghts[row.ID] = rox.RangedCombat;

end

function ViribusUnitis(PlayerID)
local player = Players[PlayerID]

if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
	unit = player:GetUnitByID(unitID)
		if unit:IsHasPromotion(VUPromotion) then
			local baseRangedCombatStrenght = rCombatStrenghts[unit:GetUnitType()]
			local baseCombatStrength = tCombatStrengths[unit:GetUnitType()]
				if baseRangedCombatStrenght then
					unit:SetBaseRangedCombatStrength(baseCombatStrength + (1.15*NbConnect))
				elseif baseCombatStrength then
					unit:SetBaseCombatStrength(baseCombatStrength + (1.15*NbConnect))
				end
		end
end
end
]]
