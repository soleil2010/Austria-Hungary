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


-- annonce le nombre de villes et de villes connectées à la capitale

function PrintNbVilles(PlayerID)
	local player = Players[Game.GetActivePlayer()]
	local nbvilles = player:GetNumCities()
	local isConnected=0
	print(nbvilles.." ville(s) construite(s)");
	for city in player:Cities() do
		if (player:IsCapitalConnectedToCity(city) ) then
			isConnected = isConnected+1
		end
	end
	print(isConnected.." ville(s) connectée(s)");
end