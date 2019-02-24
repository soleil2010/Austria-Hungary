 --===========================================
 --Teste Dummy BuildingClass
 --===========================================

INSERT INTO BuildingClasses
			(Type,						DefaultBuilding,	NoLimit)
VALUES		('BUILDINGCLASS_DF_LIBRARY', 'BUILDING_DF_LIBRARY', 1);

--Buildings

INSERT INTO Buildings
			(Type,				BuildingClass,				Description, GoldMaintenance, Cost, FaithCost, GreatWorkCount, NeverCapture, NukeImmune, ConquestProb, HurryCostModifier, IconAtlas,		PortraitIndex, IsDummy)
VALUES		('BUILDING_DF_LIBRARY','BUILDINGCLASS_DF_LIBRARY',	'Teste',	 0,					-1,		-1,			-1,				1,			1,			0,			-1,				'CIV_COLOR_ATLAS',		0,			1);



--Building_YieldFromGPExpend

INSERT INTO Building_YieldFromGPExpend
			(BuildingType, YieldType, Yield)
VALUES		('BUILDING_DF_LIBRARY', 'YIELD_GOLD', 1),
			('BUILDING_DF_LIBRARY', 'YIELD_PRODUCTION', 50);


--=============================================
--Teste Policy Dummy
--=============================================
INSERT INTO Policies
		(Type,			description,				IsDummy)
VALUES	('POLICY_D_UA','testPol',					1);

INSERT INTO Policy_CityYieldChanges
	(PolicyType, YieldType, Yield)
VALUES
	('POLICY_D_UA', 'YIELD_PRODUCTION', 2);

 --===========================================
 --Dummies
 --===========================================

INSERT INTO BuildingClasses
			(Type,							DefaultBuilding,		NoLimit)
VALUES		('BUILDINGCLASS_DF_CONNECTED', 'BUILDING_DF_CONNECTED',		 1);


--=============================================
--Buildings
--=============================================

INSERT INTO Buildings
			(Type,				BuildingClass,						Description,	GoldMaintenance,		Cost, FaithCost, GreatWorkCount, NeverCapture, NukeImmune, ConquestProb, HurryCostModifier, IconAtlas,		PortraitIndex, IsDummy)
VALUES		('BUILDING_DF_CONNECTED','BUILDINGCLASS_DF_CONNECTED',	'DummyConnector',	 0,					-1,		-1,			-1,				1,			1,			0,			-1,				'CIV_COLOR_ATLAS',		0,			1);


--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
VALUES		('BUILDING_DF_CONNECTED',		'YIELD_PRODUCTION',		2),
			('BUILDING_DF_CONNECTED',		'YIELD_GOLD',			2),
			('BUILDING_DF_CONNECTED',		'YIELD_SCIENCE',		500),
			('BUILDING_DF_CONNECTED',		'YIELD_FAITH',			1);

 
