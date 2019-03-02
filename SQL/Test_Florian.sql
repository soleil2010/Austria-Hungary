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
VALUES		('BUILDING_DF_LIBRARY', 'YIELD_GOLD', 50);


--=============================================
--Policy Dummy for KH
--=============================================
INSERT INTO Policies
		(Type,			description,				IsDummy)
VALUES	('POLICY_D_KH','testPol',					1);

INSERT INTO Policy_GreatPersonExpendedYield
		(PolicyType,	GreatPersonType,	YieldType,		Yield)
VALUES	('POLICY_D_KH',	'GREATPERSON_ADMIRAL'	,'YIELD_SCIENCE', 100),
		('POLICY_D_KH',	'GREATPERSON_GENERAL'	,'YIELD_CULTURE', 100);

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
			('BUILDING_DF_CONNECTED',		'YIELD_FAITH',			1);

 
