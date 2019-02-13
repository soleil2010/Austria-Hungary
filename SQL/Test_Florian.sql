--==================================
--count promotion
--==================================

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


--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);

--TESTATURE

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
SELECT	'UNIT_TCM_GRENZER',			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions
		(UnitType, 					PromotionType)
SELECT	'UNIT_PATHFINDER',			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions 
		(UnitType, 				PromotionType)
VALUES	('UNIT_TCM_GRENZER', 	'PROMOTION_VIRIBUS_UNITIS'),
		('UNIT_PATHFINDER', 	'PROMOTION_VIRIBUS_UNITIS'),
		('UNIT_TCM_GRENZER', 	'PROMOTION_DRILL_1');

--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_BARRACKS'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_ARMORY');

--==========================================================================================================================
-- Civilization_FreeUnits_FOR_TEST
--==========================================================================================================================	
--INSERT INTO Civilization_FreeUnits 
--			(CivilizationType, 						UnitClassType,		Count, UnitAIType)
--VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'UNIT_TCM_GRENZER', 2, UNITAI_ATTACK);
--==========================================================================================================================
--Promotion	
--==========================================================================================================================

INSERT INTO UnitPromotions 
		(Type, 										Description, 								Help, 											Sound, 		CannotBeChosen, 	IgnoreZOC,  LostWithUpgrade,	NearbyEnemyCombatMod,	NearbyEnemyCombatRange, MovesChange,	AoEDamageOnMove,	ExperiencePercent,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_VIRIBUS_UNITIS', 				'Viribus Unitis', 		'More Promotion = More power', 		'AS2D_IF_LEVELUP', 	1, 					0, 			0, 					0,					0,						0,				0,					0,					59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DEATHS_HEAD');
UPDATE UnitPromotions SET CombatPercent = 2 WHERE Type = 'PROMOTION_VIRIBUS_UNITIS';
--==========================================================================================================================