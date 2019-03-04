-- Lua Script2
-- Author: Florian
-- DateCreated: 2/16/2019 10:07:24 AM
--------------------------------------------------------------
--local civilizationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
--[[
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------------------------------------     
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
--=============================================
--NBConnectionCity
--=============================================
function NbCityConnected()
    local player = Players[Game.GetActivePlayer()]
	local nbvilles = player:GetNumCities()
	local isConnected=0
	for city in player:Cities() do
		print(nbvilles.." ville(s) construite(s)")
		if (player:IsCapitalConnectedToCity(city) and player:GetCivilizationType() == civilizationID ) then
			isConnected = isConnected+1
		end
	end
	return isConnected
end


--[[
--=============================================================================================
--KH_Viribus Unitis
--=============================================================================================
local VUPromotion = GameInfoTypes.PROMOTION_VIRIBUS_UNITIS
local NbConnect = NbCityConnected()

local tCombatStrengths = {}
for row in DB.Query("SELECT ID, Combat FROM Units WHERE Combat > 0 AND Cost > 0") do
    tCombatStrengths[row.ID] = row.Combat;
end

function TViribusUnitis(PlayerID, unitID, VUPromotion)
local player = Players[PlayerID]
local bonusPerConnection = 1

if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
print("civok")
	unit = player:GetUnitByID(unitID)
	print("mon id est")
		if unit:IsHasPromotion(VUPromotion) then
		print("Promo verif ok")
			--local baseRangedCombatStrenght = rCombatStrenghts[unit:GetUnitType()]
			local baseCombatStrength = tCombatStrengths[unit:GetUnitType()]
				--if baseCombatStrength then
				print("melee1 ok")
					unit:SetBaseCombatStrength(math.max(baseCombatStrength, baseCombatStrength + 1000))
					print("melee ok")
				--elseif baseRangedCombatStrenght then
					--unit:SetBaseRangedCombatStrength(baseCombatStrength + (1.15*NbConnect))
					--print("melee ok" ..unit)
				--end
		end
end
end
if JFD_IsCivilizationActive(civilizationID) then
--GameEvents.PlayerDoTurn.Add(TViribusUnitis)
--GameEvents.CanHavePromotion.Add(TViribusUnitis)
end

--=============================================================================================
--KH_Viribus Unitis
--=============================================================================================
]]
--=============================================================================================
--KH_Gold_EXPEND
--=============================================================================================




