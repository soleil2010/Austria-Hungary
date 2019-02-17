--==================================
--count promotion
--==================================
/*
ALTER TABLE UnitPromotions ADD NumberPromotion SET DEFAULT 0

UPDATE TABLE UnitPromotions
			SELECT NumberPromotion
			CASE
			WHEN 'PromotionType.ID' then 'NumberPromotion' = 'NumberPromotion' + 1
			END;

UPDATE TABLE PROMOTION_VIRIBUS_UNITIS
			SELECT UnitType
			CASE
			WHEN UnitType = 'UNIT_PATHFINDER' THEN SET CombatPercent = 2*'NumberPromotion'
			END;

	
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_BARRACKS'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_ARMORY');
*/


--UPDATE Events SET EraScaling = 1, RequiredEra = 'ERA_RENAISSANCE', ObsoleteEra = 'ERA_MODERN', RequiresWar = 1, EventCooldown = 20 WHERE Type = 'PLAYER_EVENT_JFD_PRUSSIA_POTATO_WAR';

--UPDATE EventChoices SET EraScaling = 1, YieldBonusAllCities = 1 WHERE Type = 'PLAYER_EVENT_JFD_PRUSSIA_POTATO_WAR_CHOICE_2';

--=============================================
--Add boolean to CytyName
--=============================================




 