--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
local dummyCisleithania = GameInfoTypes["BUILDING_TCM_AUSTRIA_HUNGARY_1"]
local dummyTransleithania = GameInfoTypes["BUILDING_TCM_AUSTRIA_HUNGARY_2"]
--=======================================================================================================================
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Decisions_TCM_Austria_Hungary_Establish_Grenz
--------------------------------------------------------------------------------------------------------------------------
local Decisions_TCM_Austria_Hungary_Establish_Grenz = {}
	Decisions_TCM_Austria_Hungary_Establish_Grenz.Name = "TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_ESTABLISH_GRENZ"
	Decisions_TCM_Austria_Hungary_Establish_Grenz.Desc = "TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_ESTABLISH_GRENZ_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Austria_Hungary_Establish_Grenz, civilisationID)
	Decisions_TCM_Austria_Hungary_Establish_Grenz.CanFunc = (
	function(player)
		if (player:GetCivilizationType() ~= civilisationID) then return false, false end
		if load(player, "Decisions_TCM_Austria_Hungary_Establish_Grenz") == true then
			Decisions_TCM_Austria_Hungary_Establish_Grenz.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_ESTABLISH_GRENZ_ENACTED_DESC")
			return false, false, true
		end
		Decisions_TCM_Austria_Hungary_Establish_Grenz.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_ESTABLISH_GRENZ_DESC")
		if not(player:GetCurrentEra() >= GameInfoTypes.ERA_INDUSTRIAL) then return true, false end
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Austria_Hungary_Establish_Grenz.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)

		local Unit6 = GameInfoTypes["UNIT_RIFLEMAN"]
		local Unit5 = GameInfoTypes["UNIT_EE_LINE_INFANTRY"]
		local Unit4 = GameInfoTypes["UNIT_TCM_GRENZER"]
		local Unit3 = GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"]
		local Unit2 = GameInfoTypes["UNIT_INFANTRY"]
		local Unit1 = GameInfoTypes["UNIT_MECHANIZED_INFANTRY"]

		local UnitPool = {
			Unit1,
			Unit2,
			Unit3,
			Unit4,
			Unit5,
			Unit6
		}

		local militaryUnit
		for _, unitID in ipairs(UnitPool) do
			if player:CanTrain(unitID) then
				militaryUnit = unitID
				break
			end
		end
		if militaryUnit == nil then
			militaryUnit = Unit6
		end

		for city in player:Cities() do
			city:ChangePopulation(-1, true)
			player:InitUnit(militaryUnit, city:GetX(), city:GetY())
		end

		save(player, "Decisions_TCM_Austria_Hungary_Establish_Grenz", true)
	end
	)
       
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_TCM_Austria_Hungary_Establish_Grenz", Decisions_TCM_Austria_Hungary_Establish_Grenz)
--------------------------------------------------------------------------------------------------------------------------
-- Decisions_TCM_Austria_Hungary_Compromise
--------------------------------------------------------------------------------------------------------------------------
local Decisions_TCM_Austria_Hungary_Compromise = {}
	Decisions_TCM_Austria_Hungary_Compromise.Name = "TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_COMPROMISE"
	Decisions_TCM_Austria_Hungary_Compromise.Desc = "TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_COMPROMISE_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Austria_Hungary_Compromise, civilisationID)
	Decisions_TCM_Austria_Hungary_Compromise.CanFunc = (
	function(player)
		if (player:GetCivilizationType() ~= civilisationID) then return false, false end
		if load(player, "Decisions_TCM_Austria_Hungary_Compromise") == true then
			Decisions_TCM_Austria_Hungary_Compromise.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_COMPROMISE_ENACTED_DESC")
			return false, false, true
		end
		local cost = math.ceil((300 + player:GetJONSCulturePerTurnFromCities() * 6) * iMod)
		Decisions_TCM_Austria_Hungary_Compromise.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_AUSTRIA_HUNGARY_COMPROMISE_DESC", cost)
		if not(player:GetCurrentEra() >= GameInfoTypes.ERA_INDUSTRIAL) then return true, false end
		if (player:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if player:GetNumCities() < 2 then return true, false end
		if player:GetJONSCulture() < cost then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Austria_Hungary_Compromise.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		local cost = math.ceil((300 + player:GetJONSCulturePerTurnFromCities() * 6) * iMod)
		player:ChangeJONSCulture(-cost)

		local dummyVersion = dummyCisleithania
		for city in player:Cities() do
			if dummyVersion == dummyCisleithania then
				city:SetNumRealBuilding(dummyCisleithania, 1)
				dummyVersion = dummyTransleithania
			elseif dummyVersion == dummyTransleithania then
				city:SetNumRealBuilding(dummyTransleithania, 1)
				dummyVersion = dummyCisleithania
			end
		end
		
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes["POLICY_TCM_AUSTRIA_HUNGARY"], true)

		save(player, "Decisions_TCM_Austria_Hungary_Compromise", true)
	end
	)
       
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_TCM_Austria_Hungary_Compromise", Decisions_TCM_Austria_Hungary_Compromise)