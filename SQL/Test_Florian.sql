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

--=============================
--UPDATE Civilization_FreeBuildingClasses
--SET FreeBuilding = 'BUILDING_BARRACKS',
--SET FreeBuilding = 'BUILDING_ARMORY';
*/

--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);

--TESTATURE
/*
--=================================
--Pour test VIRIBUS UNITIS
--=================================
INSERT INTO Trait_DomainFreeExperienceModifier 
		(TraitType, 								DomainType, 	Modifier)
VALUES	('TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY', 	'DOMAIN_LAND', 	600),
		('TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY', 	'DOMAIN_SEA', 	600),
		('TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY', 	'DOMAIN_AIR', 	600);
--=================================
--Pour test Promotions gratuites
--=================================


INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
SELECT	'UNIT_PATHFINDER',			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';


*/
/*
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_BARRACKS'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_ARMORY');
*/
--==========================================================================================================================
-- Civilization_FreeUnits_FOR_TEST
--==========================================================================================================================	
--INSERT INTO Civilization_FreeUnits 
--			(CivilizationType, 						UnitClassType,		Count, UnitAIType)
--VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'UNIT_TCM_GRENZER', 2, UNITAI_ATTACK);

--==========================================================================================================================

--UPDATE Events SET EraScaling = 1, RequiredEra = 'ERA_RENAISSANCE', ObsoleteEra = 'ERA_MODERN', RequiresWar = 1, EventCooldown = 20 WHERE Type = 'PLAYER_EVENT_JFD_PRUSSIA_POTATO_WAR';

--UPDATE EventChoices SET EraScaling = 1, YieldBonusAllCities = 1 WHERE Type = 'PLAYER_EVENT_JFD_PRUSSIA_POTATO_WAR_CHOICE_2';