--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);

--Dummy Policies
UPDATE CustomModOptions	SET Value = 1 WHERE Name = 'BUGFIX_DUMMY_POLICIES';

--==========================================================================================================================
-- MORE UNIQUE COMPONENTS FOR VP (NEW)
--==========================================================================================================================
-- Units
------------------------------
UPDATE Units SET MinorCivGift = 0 WHERE Type = 'UNIT_AUSTRIAN_HUSSAR' AND EXISTS (SELECT * FROM Buildings WHERE Type ='BUILDING_AUSTRIA_STANDSCHUTZEN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, UnitClassType, UnitType)
SELECT	'CIVILIZATION_TCM_AUSTRIA_HUNGARY', 'UNITCLASS_CUIRASSIER', 'UNIT_AUSTRIAN_HUSSAR'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN');
--------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, BuildingClassType, BuildingType)
SELECT	'CIVILIZATION_TCM_AUSTRIA_HUNGARY', 'BUILDINGCLASS_ARSENAL', 'BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN'
WHERE EXISTS (SELECT * FROM Buildings WHERE Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN');
--------------------------------	
-- Trigger for the above three (mysterious load order issues)
--------------------------------	
CREATE TRIGGER JFDPrussiaForVP_4UC
AFTER INSERT ON Buildings 
WHEN NEW.Type = 'BUILDING_AUSTRIA_STANDSCHUTZEN'
BEGIN
	UPDATE Units SET MinorCivGift = 0 WHERE Type = 'UNIT_AUSTRIAN_HUSSAR';
	
	INSERT INTO Civilization_UnitClassOverrides
			(CivilizationType, UnitClassType, UnitType)
	VALUES	('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 'UNITCLASS_CUIRASSIER', 'UNIT_AUSTRIAN_HUSSAR');
	
	INSERT INTO Civilization_BuildingClassOverrides
			(CivilizationType, BuildingClassType, BuildingType)
	VALUES	('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 'BUILDINGCLASS_ARSENAL', 'BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN');
END;
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,			BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_AUSTRIA',	'BUILDINGCLASS_ARSENAL',	'BUILDING_AUSTRIA_STANDSCHUTZEN');
--==========================================================================================================================	

--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------	
-- Buildings
--------------------------------	
INSERT INTO	Buildings
			(Type,											Description,								Civilopedia,									Strategy,											Help,											GoldMaintenance, Cost,		HurryCostModifier, MinAreaSize, HealRateChange, CityRangedStrikeRange, CityIndirectFire, ConquestProb, 	BuildingClass, ArtDefineTag, PrereqTech, PortraitIndex, IconAtlas,					GreatWorkYieldType,	NeverCapture, AllowsRangeStrike, Defense,		ExtraCityHitPoints,		CitySupplyModifier)
SELECT		'BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'Standschutzen',	'TXT_KEY_BUILDING_AUSTRIA_STANDSCHUTZEN_TEXT',	'TXT_KEY_BUILDING_AUSTRIA_STANDSCHUTZEN_STRATEGY',	'TXT_KEY_BUILDING_AUSTRIA_STANDSCHUTZEN_HELP',	GoldMaintenance, Cost-150,	HurryCostModifier, MinAreaSize, HealRateChange, CityRangedStrikeRange, CityIndirectFire, ConquestProb, 	BuildingClass, ArtDefineTag, PrereqTech, 0,				'BUILDING_APIG4UC_ATLAS',	GreatWorkYieldType,	NeverCapture, AllowsRangeStrike, Defense+500,	ExtraCityHitPoints+50,	CitySupplyModifier
FROM Buildings WHERE Type = 'BUILDING_ARSENAL';
--------------------------------
-- Building_ClassesNeededInCity
--------------------------------
INSERT INTO Building_ClassesNeededInCity
			(BuildingType,									BuildingClassType)
SELECT		'BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_ARSENAL';
--------------------------------	
-- Building_Flavors
--------------------------------	
INSERT INTO	Building_Flavors
			(BuildingType,									FlavorType,				Flavor)
VALUES		('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'FLAVOR_CITY_DEFENSE',	50),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'FLAVOR_DIPLOMACY',		30),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'FLAVOR_GOLD',			10),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'FLAVOR_CULTURE',		6);

--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
			(BuildingType,									YieldType,		Yield)
VALUES		('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'YIELD_CULTURE',	3),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'YIELD_PRODUCTION',	3);
--------------------------------	
-- Building_YieldFromVictoryGlobal
--------------------------------	
INSERT INTO Building_YieldFromVictoryGlobal
			(BuildingType,						YieldType,			Yield)
VALUES		('BUILDING_AUSTRIA_STANDSCHUTZEN',	'YIELD_PRODUCTION',			50),
			('BUILDING_AUSTRIA_STANDSCHUTZEN',	'YIELD_GOLDEN_AGE_POINTS',	10);
--------------------------------	
-- Building_UnitCombatProductionModifiers
--------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers
			(BuildingType,									UnitCombatType,			Modifier)
VALUES		('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_RECON',		15),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_ARCHER',	15),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_MOUNTED',	15),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_MELEE',		15),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_SIEGE',		15),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_GUN',		30),
			('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_ARMOR',		15);
--------------------------------	
-- Building_UnitCombatProductionModifiers
--------------------------------
INSERT INTO Building_UnitCombatFreeExperiences
			(BuildingType,									UnitCombatType,			Experience)
VALUES		('BUILDING_TCM_AUSTRIA_HUNGARY_STANDSCHUTZEN',	'UNITCOMBAT_GUN',		15);

--==========================================================================================================================
--==========================================================================================================================
