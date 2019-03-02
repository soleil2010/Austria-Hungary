-- Lua Script2
-- Author: Florian
-- DateCreated: 2/16/2019 10:59:23 AM
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]

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
local eBuildingTeutonicOrder = GameInfoTypes.BUILDING_TCM_CONCERT_HALL
	local eBuildingDummyForTeutonicOrder = GameInfoTypes.BUILDING_DF_LIBRARY
	local eBuildingBarracks = GameInfoTypes.BUILDING_LIBRARY
	local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
	local pPlayer = Players[iPlayer]
-- adds bonus to barracks if TO is built
function OnCityConstructionAddDummyForTO(iPlayer, iCity, eBuilding)
	
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

function NbVilles(PlayerID, CityID)
    local player = Players[PlayerID]
	for city in player:Cities() do
	if (player:GetCivilizationType() == civilisationID and player:IsEverAlive()) then
    nbvilles = player:GetNumCities()
	player:ChangeGold(10)
    print(nbvilles);
	break
	end
	end
end

GameEvents.PlayerDoTurn.Add(NbVilles)



--[[
--== compte ville
function NbVilles(PlayerID)
    local player = Players[PlayerID]
	print("NB OK1")
	if(player:GetCivilizationType() == civilisationID ) then
        local nbvilles = player:GetNumCities()
        local isConnected=0
		print("NB OK2")
        --print(nbvilles.." ville(s) construite(s)");
        for city in player:Cities() do
            if (player:IsCapitalConnectedToCity(city) and player:GetCivilizationType() == civilisationID ) then
                isConnected = isConnected+1
				print(isConnected.."NB OK2")
            end
        end
		end
	return isConnected
end
GameEvents.PlayerDoTurn.Add(NbVilles)
--[[


--=========================================================
function UAConnection(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
		if Player:IsCapitalConnectedToCity(city) and player:IsEverAlive() then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		print("connection ok")
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 6)
		--print("change yield ok")
		end
	end
end
end
--GameEvents.CityConnections.Add(UAConnection)
GameEvents.PlayerDoTurn.Add(UAConnection)

--=============================================================================================

function UAFranzCapital(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
		if city:IsCapital() then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		print("CAPITAL OK")
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 6)
		--print("change yield ok")
		end
	end
end
end
--GameEvents.PlayerDoTurn.Add(UAFranzCapital)
GameEvents.PlayerCityFounded.Add(UAFranzCapital)
--=============================================================================================
--Connection City
--=============================================================================================
function UAConnection(PlayerID)
	local BuildingDummyForConnected = GameInfoTypes.BUILDING_DF_CONNECTED
	local player = Players[PlayerID]

if player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
		if Player:IsCapitalConnectedToCity(city) and player:IsEverAlive() then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_DF_CONNECTED,1)
		print("connection ok")
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_PRODUCTION, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_GOLD, 12)
		--city:SetBuildingYieldChange(GameInfoTypes.BUILDINGCLASS_DF_CONNECTED, YieldTypes.YIELD_FAITH, 6)
		--print("change yield ok")
		end
	end
end
end
--GameEvents.CityConnections.Add(UAConnection)
GameEvents.PlayerDoTurn.Add(UAConnection)
--=======
local tGunUnits = {}
for row in GameInfo.Units("CombatClass='UNITCOMBAT_GUN'") do
     tGunUnits[row.ID] = row.ID
     print("blah and blah and more blah")
endand another example:
Code:
----------------------------------------------------------------------------------------------------------------------------------------
-- Get correct UnitID for the player from within a UnitClass
-- the UnitID for the default unit within the UnitClass and the player object is passed to the function
-- so you would use as like: "local iUnitID = GetCivSpecificUnitForDefaultUnit(pPlayer, GameInfoTypes.UNIT_MUSKETMAN)"
----------------------------------------------------------------------------------------------------------------------------------------

function GetCivSpecificUnitForDefaultUnit(pPlayer, iDefaultUnitLoaded)
     local sUnitClass = GameInfo.Units[iDefaultUnitLoaded].Class
     local sCivilizationName = GameInfo.Civilizations[pPlayer:GetCivilizationType()].Type
     local sDefaultUnit = GameInfo.Units[iDefaultUnitLoaded].Type
     for row in GameInfo.UnitClasses("Type='" .. sUnitClass .. "'") do
          if row.DefaultUnit ~= "NULL" and row.DefaultUnit ~= "null" and row.DefaultUnit ~= "NONE" and row.DefaultUnit ~= -1 and row.DefaultUnit ~= nil then
               sDefaultUnit = row.DefaultUnit
          end
     end
     for row in GameInfo.Civilization_UnitClassOverrides("CivilizationType='" .. sCivilizationName .. "'") do
          if row.UnitClassType == sUnitClass then
               if row.UnitType ~= "NULL" and row.UnitType ~= "null" and row.UnitType ~= "NONE" and row.UnitType ~= -1 and row.UnitType ~= nil then
                    return GameInfoTypes[row.UnitType]
               end
          end
     end
     return GameInfoTypes[sDefaultUnit]
end
--[[

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
	local player = Players[PlayerID]
 	print("VIri 1")
	if player:GetCivilizationType() == civilizationID then
	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) then
	local Vunit = player:GetUnitByID()
	local unitCombat = GameInfo.Units[Vunit:GetUnitType()].Combat
	print(unitCombat.."cette unité a")
	local StrenghtUnit = Vunit:GetBaseCombatStrength()
	print(StrenghtUnit.."cette unité a")
	print("VIri 2")
	unit:SetBaseCombatStrength(StrenghtUnit + (1.02*(NbCityConnected()+1)))
	--*(1.02*NbCityConnected()
	print("VIri 3")
	end
	end
	end
end
GameEvents.PlayerDoTurn.Add(ViribusUnitis)

--=============================================================================================
--KH_Viribus Unitis
--=============================================================================================
function ViribusUnitis(PlayerID)
    local player = Players[PlayerID]
    local baseCombatStrength
	local i=0

    if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
        for unit in player:Units() do
            if (unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS)) then

			local sUnit = unit:GetBaseCombatStrength()
			print("ma New force est de "..sUnit)
				i = i+1
				print(i.." virivus UNITIS!!!!")

				local unitType = unit:GetUnitType();
				print("mon unite est "..unit:GetName().." et son id est "..unitType);
				
				local force=GameInfo.Units[unit:GetUnitType()].Combat;
				print("mon ancienne force est de "..force)

				unit:SetBaseCombatStrength(force + (1.02*(NbCityConnected()+1)))

				local forces=GameInfo.Units[unit:GetUnitType()].Combat+100;
				print("ma nouvelle force est de "..forces)
				print("Connection = " ..  NbCityConnected())  
				end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ViribusUnitis)

--=============================================================================================
--KH_Viribus Unitis
--=============================================================================================
function ViribusUnitis(PlayerID)
    local player = Players[PlayerID]
    local baseCombatStrength
	local i=0

    if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
        for unit in player:Units() do
            if unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_MELEE or unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_GUN then
				local sUnit = unit:GetBaseCombatStrength()
				print("ma New force est de "..sUnit)
				i = i+1
				print(i.." virivus UNITIS!!!!")

				local unitType = unit:GetUnitType();
				print("mon unite est "..unit:GetName().." et son id est "..unitType);
				
				local force = GameInfo.Units[unit:GetUnitType()].Combat;
				print("mon ancienne force est de "..force)

				unit:SetBaseCombatStrength(force + (0.5*(NbCityConnected())))

				--local forces=GameInfo.Units[unit:GetUnitType()].Combat+100;
				print("ma nouvelle force est de "..force)
				print("Connection = " ..  NbCityConnected())
				elseif unit:IsHasPromotion(GameInfoTypes.PROMOTION_VIRIBUS_UNITIS) and unit:GetUnitCombatType() == GameInfoTypes.UNITCOMBAT_SIEGE then
						local rUnitType = unit:GetUnitType();
						print("mon unite est "..unit:GetName().." et son id est "..rUnitType);
						local rForce = GameInfo.Units[unit:GetUnitType()].RangedCombat;
						unit:SetBaseRangedCombatStrength(rForce + (0.5*(NbCityConnected())))
						print("ma nouvelle force est de "..rForce) 
				end
		end
	end
end
GameEvents.PlayerDoTurn.Add(ViribusUnitis)
]]