------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_AUSTRIA_HUNGARY"]
local dummyHappiness = GameInfoTypes["BUILDING_TCM_AUSTRIA_HUNGARY_HAPPINESS_DUMMY"]
--=======================================================================================================================
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Event_TCM_AUSTRIA_HUNGARY_MARRIAGE
--------------------------------------------------------------------------------------------------------------------------
local Event_TCM_AUSTRIA_HUNGARY_MARRIAGE = {}
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE"
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_DESC"
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Weight = 5
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.CanFunc = (
		function(player)			
			if load(player, "Event_TCM_AUSTRIA_HUNGARY_MARRIAGE") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < 3 then return false end
			if player:GetCurrentEra() > 5 then return false end
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[1] = {}
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_OUTCOME_1"
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_OUTCOME_RESULT_1"
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[1].CanFunc = (
		function(player)
			local iReward = math.ceil((player:GetJONSCulturePerTurnFromCities() + 100) * iMod)
			Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_OUTCOME_RESULT_1", iReward)
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local iReward = math.ceil((player:GetJONSCulturePerTurnFromCities() + 100) * iMod)
			player:ChangeJONSCulture(iReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_1")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_MARRIAGE", true)	
		end)

	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[2] = {}
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_OUTCOME_2"
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_OUTCOME_RESULT_2"
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[2].CanFunc = (
		function(player)	
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_MARRIAGE.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(8)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_MARRIAGE_2")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_MARRIAGE", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_TCM_AUSTRIA_HUNGARY_MARRIAGE", Event_TCM_AUSTRIA_HUNGARY_MARRIAGE)	
--=======================================================================================================================
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION
--------------------------------------------------------------------------------------------------------------------------
local Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION = {}
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_DESC"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Weight = 4
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.CanFunc = (
		function(player)			
			if load(player, "Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			if player:GetCurrentEra() < 3 then return false end
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[1] = {}
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_1"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_1"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[1].CanFunc = (
		function(player)
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_1")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[2] = {}
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_2"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_2"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[2].CanFunc = (
		function(player)	
			local cost = math.ceil(0.10 * player:GetNextPolicyCost()) + 100
			Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_2", cost)
			if player:GetJONSCulture() < cost then return false end
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			capital:SetNumRealBuilding(dummyHappiness, 3)

			local cost = math.ceil(0.10 * player:GetNextPolicyCost()) + 100
			player:ChangeJONSCulture(-cost)

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_2")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[3] = {}
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[3].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_3"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[3].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_3"
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[3].CanFunc = (
		function(player)	
			local cost = math.ceil(550 * iMod)
			Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_3", cost)
			if player:GetGold() < cost then return false end
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()

			local capital = player:GetCapitalCity()
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_CATHEDRAL"], 1)

			local cost = math.ceil(550 * iMod)
			player:ChangeGold(-cost)
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_ASSASSINATION_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_ASSASSINATION_3")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION", Event_TCM_AUSTRIA_HUNGARY_ASSASSINATION)	
--=======================================================================================================================
--=======================================================================================================================
--=======================================================================================================================
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Event_TCM_AUSTRIA_HUNGARY_INVENTOR
--------------------------------------------------------------------------------------------------------------------------
local Event_TCM_AUSTRIA_HUNGARY_INVENTOR = {}
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_DESC"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Weight = 4
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.CanFunc = (
		function(player)			
			if load(player, "Event_TCM_AUSTRIA_HUNGARY_INVENTOR") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end 
			if not(player:GetCurrentEra() == GameInfoTypes.ERA_INDUSTRIAL) then 
				if not(player:GetCurrentEra() == GameInfoTypes.ERA_EE_ENLIGHTENMENT) then
					if not(player:GetCurrentEra() == GameInfoTypes.ERA_MODERN) then 
						return false
					end
				end
			end
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[1] = {}
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_1"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_1"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[1].CanFunc = (
		function(player)
			local reward = math.ceil(400 * iMod)
			local cost = math.ceil(200 * iMod)

			if player:GetJONSCulture() < cost then return false end

			Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_1", reward, cost)

			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[1].DoFunc = (
		function(player) 
			local reward = math.ceil(400 * iMod)
			local cost = math.ceil(200 * iMod)
			player:ChangeJONSCulture(-cost)
			player:ChangeGold(reward)

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_1")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_INVENTOR", true)	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[2] = {}
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_2"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_2"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[2].CanFunc = (
		function(player)
			local cost = math.ceil(500 * iMod)
			if player:GetGold() < cost then return false end

			Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_2", cost)

			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[2].DoFunc = (
		function(player) 
			local cost = math.ceil(500 * iMod)
			player:ChangeGold(-cost)

			for unit in player:Units() do
				if unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_GUN"] then
					unit:ChangeExperience(15)
				end
			end

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_2")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_INVENTOR", true)	
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[3] = {}
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[3].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_3"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[3].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_3"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[3].CanFunc = (
		function(player)
			local capital = player:GetCapitalCity()
			local cost = math.ceil(800 * iMod)

			if player:GetCurrentEra() ~= GameInfoTypes.ERA_MODERN then return false end
			if player:GetGold() < cost then return false end
			if capital:IsHasBuilding(GameInfoTypes["BUILDING_BROADCAST_TOWER"]) then return false end
			
			Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_3", cost)

			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[3].DoFunc = (
		function(player)
			local capital = player:GetCapitalCity()
			local cost = math.ceil(800 * iMod)

			player:ChangeGold(-cost)
			capital:SetNumRealBuilding(GameInfoTypes["BUILDING_BROADCAST_TOWER"], 1)

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_3")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_INVENTOR", true)	
		end)
	--=========================================================
	-- Outcome 4
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[4] = {}
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[4].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_4"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[4].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_4"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[4].CanFunc = (
		function(player)
			local cost = math.ceil(400 * iMod)
			if not(player:HasAvailableGreatWorkSlot(GameInfoTypes["GREAT_WORK_SLOT_ART_ARTIFACT"])) then return false end
			if player:GetGold() < cost then return false end

			Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[4].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_4", cost)

			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[4].DoFunc = (
		function(player) 
			local cost = math.ceil(400 * iMod)
			player:ChangeGold(-cost)
			
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			player:InitUnit(GameInfoTypes["UNIT_ARTIST"], capitalX, capitalY):PushMission(GameInfoTypes["MISSION_CREATE_GREAT_WORK"])

			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_4_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_4")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_INVENTOR", true)	
		end)
	--=========================================================
	-- Outcome 5
	--=========================================================
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[5] = {}
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[5].Name = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_5"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[5].Desc = "TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_5"
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[5].CanFunc = (
		function(player)
			return true
		end
		)
	Event_TCM_AUSTRIA_HUNGARY_INVENTOR.Outcomes[5].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_AUSTRIA_HUNGARY_INVENTOR_OUTCOME_RESULT_5_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_AUSTRIA_HUNGARY_INVENTOR_5")) 
			save(player, "Event_TCM_AUSTRIA_HUNGARY_INVENTOR", true)	
		end)


	
Events_AddCivilisationSpecific(civilisationID, "Event_TCM_AUSTRIA_HUNGARY_INVENTOR", Event_TCM_AUSTRIA_HUNGARY_INVENTOR)	
--=======================================================================================================================
--=======================================================================================================================