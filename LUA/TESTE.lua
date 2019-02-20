-- Lua Script2
-- Author: Florian
-- DateCreated: 2/16/2019 10:07:24 AM
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
--====================================================================
local iPolicy = GameInfoTypes["POLICY_D_UA"]

function CheckTrading(PlayerID,CityID)
    local player = Players[PlayerID]
	for city in player:Cities() do
		if player:GetCivilizationType() == civilisationID and player:IsAlive() then
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(iPolicy, true)
		end
    end
end
GameEvents.PlayerCityFounded.Add(CheckTrading)
GameEvents.PlayerDoTurn.Add(CheckTrading)

--=======================================================================

-- adds bonus to barracks if TO is built
function OnCityConstructionAddDummyForTO(iPlayer, iCity, eBuilding)
	local eBuildingTeutonicOrder = GameInfoTypes.BUILDING_TCM_CONCERT_HALL
	local eBuildingDummyForTeutonicOrder = GameInfoTypes.BUILDING_DF_LIBRARY
	local eBuildingBarracks = GameInfoTypes.BUILDING_LIBRARY
	local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == civilisationID) then return end

	if eBuilding == eBuildingTeutonicOrder then
		local iNumberOfBarracks = pPlayer:CountNumBuildings(eBuildingBarracks)

		if iNumberOfBarracks > 0 then
			for city in pPlayer:Cities() do
				local iCurrentBarracks = 0

				if city:IsHasBuilding(eBuildingBarracks) then
					city:SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
					iCurrentBarracks = iCurrentBarracks + 1

					if iCurrentBarracks == iNumberOfBarracks then
						break
					end
				end
			end
		end
	elseif eBuilding == eBuildingBarracks then
		local iNumberOfTeutonicOrders = pPlayer:CountNumBuildings(eBuildingTeutonicOrder)

		if iNumberOfTeutonicOrders > 0 then
			pPlayer:GetCityByID(iCity):SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
		end
	end
end

function OnFoundAddDummyForTO(iPlayer, iX, iY)
	local pPlayer = Players[iPlayer]
	
	if not (pPlayer and pPlayer:GetCivilizationType() == civilisationID) then return end

	if pPlayer:CountNumBuildings(eBuildingTeutonicOrder) > 0 then

		local pFoundCity = Map.GetPlot(iX, iY):GetWorkingCity()
		if pFoundCity:IsHasBuilding(eBuildingBarracks) then

			pFoundCity:SetNumRealBuilding(eBuildingDummyForTeutonicOrder, 1)
		end
	end
end

if JFD_IsCivilisationActive(civilisationID) then
	GameEvents.CityConstructed.Add(OnCityConstructionAddDummyForTO)
	--GameEvents.PlayerDoTurn.Add(OnCityConstructionAddDummyForTO)
	GameEvents.PlayerCityFounded.Add(OnFoundAddDummyForTO)
end
