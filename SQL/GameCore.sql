--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 									DerivativeCiv,				Description, 				ShortDescription, 	Adjective, 			Civilopedia, 																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							CivilopediaTag, 						DefaultPlayerColor,		 			 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						AlphaIconAtlas, 			 		PortraitIndex,	SoundtrackTag, 	MapImage, 							DawnOfManQuote, 					  																																																																																																																																																																																																																																													DawnOfManImage)
SELECT		('CIVILIZATION_TCM_AUSTRIA_HUNGARY'), 	('CIVILIZATION_AUSTRIA'),	'Austro-Hungarian Empire', 	'Austria-Hungary', 'Austro-Hungarian', 	'Austria-Hungary was a state in central Europe that aimed to continue the Habsburg Empire in this new form. Owing to the vast amount of cultures within it, Austria-Hungary was often unstable politically, and had ethnic infighting for much of its existence. Founded as a result of the Compromise of 1867, unity in the region was fragile. Austria and Hungary remained distinct entities within the state, each having their own passports despite being legally part of the same country. The union was far more a personal monarchical union than a full-scale political one, as most regions had a significant degree of autonomy, with centralised matters only being to do with defence and the like. Throughout the 19th century, Austria-Hungary prospered, as a cultural capital of the world. However, due to the close alliance with the upstart German Empire, Austria-Hungary found itself isolated from many other countries around it. In the south, the Serbs were desperate to regain lands incorporated into Austria-Hungary, despite them having only got independence a few years beforehand. As an ally of Russia, Serbia was able to push these claims. In 1914, Austria-Hungary sent an ultimatum to Serbia, stating that if they did not agree with all of the points, then they would be in a state of war. The points were so power-taking that the Austro-Hungarian Empire did not think they could possibly agree, thus giving them a casus belli; however, much to their surprise and disappointment, the Serbs agreed with everything aside from one clause in point six of the ultimatum. Angered, Austria-Hungary invaded anyway. However, with incredibly outdated military not ready to even fight against the upstart Serbian nation, Austria-Hungary succumed to its weakness in having too many ethnicities held in the one state against their will. Though Austria tried to incorporate itself into the remnants of the German Empire, the newfound League of Nations denied this, instead splitting Central Europe into more or less what it is today.',	('TXT_KEY_CIV5_TCM_AUSTRIA_HUNGARY'), 	('PLAYERCOLOR_TCM_AUSTRIA_HUNGARY'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_AUSTRIA_HUNGARY_ATLAS'), ('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS'), 0, 			('AUSTRIA'),	('TCM_AUSTRIA_HUNGARY_MAP.dds'), 	'Great Franz Joseph of the Austro-Hungarian Empire, people far and wide throughout the lands cry for you to become their leader once more! Owing to your establishment of a state right in the heart of Europe, you were noted as a ruler of one of the so-called "Great Powers" of the day. Able to unite your people against foes that could crush the empire, forming a stable alliance with the new state of Germany in the process, your wisdom managed to save people that would have otherwise been subject to far harsher foreign domination. However, with the advent of war in 1914 and your death two years later, the empire that you had so carefuly crafted collapsed, but your legacy lives on today.[NEWLINE][NEWLINE]Oh strong and mighty Kaiser Franz Joseph, your former realm needs you to reassume control. Can you creat a new state to empower your people''s will? Can you fend off all enemies of the state to preserve the peace? Can you build a civilisation to stand the test of time?',	('TCM_AUSTRIA_HUNGARY_DOM.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_AUSTRIA';

--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 							CityName)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Vienna'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Steyr'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Eisenstadt'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Kapfenberg'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Feldkirchen'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Bregenz'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Amstetten'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Klostern'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Kufstein'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Saalfelden'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Ansfelden'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Lustenau'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Schwechat'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Stockerau'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Salzburg'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Bad Ischl'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Graz'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Linz'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Innsbruck'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Wels'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Wiener Neustadt'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Leonding'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Wolfsberg'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Modling'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Hallein'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Traiskirchen'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Hohenems'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'V�lkermarkt'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Sankt Andr�-H�ch'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Bischofshofen'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Ebreichsdorf'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'G�nserndorf'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'G�tzis'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Trofaiach'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Knittelfeld'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Waidhofen'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Ried im Innkreis'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 		'Marchtrenk');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 						BuildingClassType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 						TechType)
SELECT		('CIVILIZATION_TCM_AUSTRIA_HUNGARY'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_AUSTRIA_HUNGARY'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 						LeaderheadType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'LEADER_TCM_FRANZ_JOSEPH');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 						UnitClassType, 						UnitType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'UNITCLASS_GREAT_WAR_INFANTRY', 	'UNIT_TCM_GRENZER');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'BUILDINGCLASS_OPERA_HOUSE', 	'BUILDING_TCM_CONCERT_HALL');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 						ReligionType)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'RELIGION_CHRISTIANITY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 						SpyName)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Felix'),	
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Kristina'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Jakub'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Anna'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Jan'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Adele'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Sophia'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Sivejik'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Bence'),
			('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 	'Julia');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_AUSTRIA_HUNGARY_ICON',			0.451,	0.000,	0.000,	1),
			('COLOR_PLAYER_TCM_AUSTRIA_HUNGARY_BACKGROUND',		0.608,	0.529,	0.243,	1);  
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							 SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_TCM_AUSTRIA_HUNGARY',	'COLOR_PLAYER_TCM_AUSTRIA_HUNGARY_ICON', 'COLOR_PLAYER_TCM_AUSTRIA_HUNGARY_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- A FAIRE
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 						ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_TCM_FRANZ_JOSEPH', 	'TXT_KEY_LEADER_TCM_FRANZ_JOSEPH', 	'TXT_KEY_LEADER_TCM_FRANZ_JOSEPH_PEDIA_TEXT',  'TXT_KEY_LEADER_TCM_FRANZ_JOSEPH_PEDIA', 'TCM_FRANZ_JOSEPH_SCENE.xml',	8, 						7, 						9, 							10, 		5, 				3, 				6, 					 4, 			 8, 		3, 			4, 			 8, 			8, 		'TCM_AUSTRIA_HUNGARY_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_FRANZ_JOSEPH', 	'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_FRANZ_JOSEPH', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
			('LEADER_TCM_FRANZ_JOSEPH', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType, 						Flavor)
VALUES		('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_RECON', 					4),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_RANGED', 					5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_MOBILE', 					5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_NAVAL', 					3),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_AIR', 						6),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_GROWTH', 					6),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_GOLD', 						6),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_CULTURE', 					7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_HAPPINESS', 				8),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_WONDER', 					7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_RELIGION', 					6),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_DIPLOMACY', 				7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_NUKE', 						4),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_FRANZ_JOSEPH', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 					TraitType)
VALUES		('LEADER_TCM_FRANZ_JOSEPH', 	'TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY');
--==========================================================================================================================	
-- A FAIRE
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 										Description, 										ShortDescription)
VALUES		('TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY', 	'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY', 	'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_SHORT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 										Filename, 				LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_FRANZ_JOSEPH_PEACE', 	'tcmFranzJosephPeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_FRANZ_JOSEPH_WAR',		'tcmFranzJosephWar', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_FRANZ_JOSEPH_PEACE', 	'SND_LEADER_MUSIC_TCM_FRANZ_JOSEPH_PEACE', 	'GAME_MUSIC', 	80, 		80, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_FRANZ_JOSEPH_WAR', 		'SND_LEADER_MUSIC_TCM_FRANZ_JOSEPH_WAR', 	'GAME_MUSIC', 	80, 		80, 		1,			0);
--==========================================================================================================================	
-- A FAIRE
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 			DefaultBuilding, 					Description,											MaxPlayerInstances)
VALUES		('BUILDINGCLASS_TCM_GREAT_PERSON_GEN', 	'BUILDING_TCM_GREAT_PERSON_GEN', 	'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_SHORT',	-1),
			('BUILDINGCLASS_TCM_AUSTRIA_HUNGARY', 	null,								'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_SHORT',	1);
--==========================================================================================================================	
-- A FAIRE
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 					    	BuildingClass, Cost, GoldMaintenance, PrereqTech,	Description,							Help,										Civilopedia,							Strategy,										ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, GreatWorkSlotType, GreatWorkCount, Happiness, IconAtlas,						PortraitIndex)
SELECT		('BUILDING_TCM_CONCERT_HALL'),	BuildingClass, Cost, GoldMaintenance, PrereqTech,	('TXT_KEY_BUILDING_TCM_CONCERT_HALL'),	('TXT_KEY_BUILDING_TCM_CONCERT_HALL_HELP'),	('TXT_KEY_CIV5_TCM_CONCERT_HALL_TEXT'),	('TXT_KEY_BUILDING_TCM_CONCERT_HALL_STRATEGY'),	ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, GreatWorkSlotType, GreatWorkCount, 2,		  ('TCM_AUSTRIA_HUNGARY_ATLAS'), 	3
FROM Buildings WHERE Type = 'BUILDING_OPERA_HOUSE';		

INSERT INTO Buildings 	
			(Type, 												BuildingClass, 							UnmoddedHappiness,  Happiness,  GreatPeopleRateModifier, GreatWorkCount, Cost, FaithCost, NukeImmune,   ConquestProb,  PrereqTech,	Description, 												Help,													PortraitIndex, 	IconAtlas)
VALUES		('BUILDING_TCM_GREAT_PERSON_GEN',					'BUILDINGCLASS_TCM_GREAT_PERSON_GEN',	0,					0,		    25,						 -1, 			-1,    -1, 		  1,		    0,				NULL, 		'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_SHORT', 	'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_SHORT',	0, 				'TCM_AUSTRIA_HUNGARY_ATLAS'),
			('BUILDING_TCM_AUSTRIA_HUNGARY_1',					'BUILDINGCLASS_TCM_AUSTRIA_HUNGARY', 	0,					0,			15,						  0, 			 1,     0, 		  1,		 	0,				NULL, 		'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_DUMMY1', 	'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_HELP1',	4, 				'TCM_AUSTRIA_HUNGARY_ATLAS'),
			('BUILDING_TCM_AUSTRIA_HUNGARY_2',					'BUILDINGCLASS_TCM_AUSTRIA_HUNGARY',	0,					2,			0,						  0, 			 1,     0, 		  1,		 	0,				NULL, 		'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_DUMMY2', 	NULL,													5, 				'TCM_AUSTRIA_HUNGARY_ATLAS'),
			('BUILDING_TCM_AUSTRIA_HUNGARY_HAPPINESS_DUMMY',	'BUILDINGCLASS_TCM_GREAT_PERSON_GEN', 	1,					0,			0,						 -1, 			-1,    -1, 		  1,			0,				NULL, 		'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_SHORT', 	'TXT_KEY_TRAIT_TCM_FRANZ_JOSEPH_AUSTRIA_HUNGARY_SHORT',	0, 				'TCM_AUSTRIA_HUNGARY_ATLAS');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,				Yield)
VALUES		('BUILDING_TCM_CONCERT_HALL', 	'YIELD_CULTURE',		1);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 					FlavorType,				Flavor)
VALUES		('BUILDING_TCM_CONCERT_HALL', 	'FLAVOR_CULTURE',		15),
			('BUILDING_TCM_CONCERT_HALL', 	'FLAVOR_HAPPINESS',		15);
--==========================================================================================================================
--==========================================================================================================================	
-- A FAIRE
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 					PrereqTech, 		 Combat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 									 Strategy, 								Help, 							 MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,						 PortraitIndex, IconAtlas,					 	MoveRate)
SELECT		Class,		('UNIT_TCM_GRENZER'),   ('TECH_STEAM_POWER'), 47, 	 250,  ObsoleteTech, 500, 		RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_GRENZER'), ('TXT_KEY_CIVILOPEDIA_UNITS_TCM_GRENZER_TEXT'), ('TXT_KEY_UNIT_TCM_GRENZER_STRATEGY'), ('TXT_KEY_UNIT_HELP_TCM_GRENZER'), MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueDefense, Conscription, ('ART_DEF_UNIT_GRENZER'),	0,					('TCM_UNIT_FLAG_TCM_GRENZER_ATLAS'), 2, 			 ('TCM_AUSTRIA_HUNGARY_ATLAS'), MoveRate
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_GRENZER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');		
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_TCM_GRENZER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
VALUES		('UNIT_TCM_GRENZER', 	'UNITCLASS_INFANTRY');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,				Flavor)
VALUES		('UNIT_TCM_GRENZER', 	'FLAVOR_OFFENSE',		12),
			('UNIT_TCM_GRENZER', 	'FLAVOR_DEFENSE',		12);
--==========================================================================================================================	
--==========================================================================================================================
--==========================================================================================================================	
-- A FAIRE
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_FRANZ_JOSEPH','RESPONSE_FIRST_GREETING', 'TXT_KEY_LEADER_TCM_FRANZ_JOSEPH_FIRSTGREETING%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_FRANZ_JOSEPH','RESPONSE_DEFEATED',		'TXT_KEY_LEADER_TCM_FRANZ_JOSEPH_DEFEATED%','1'),
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_FRANZ_JOSEPH','RESPONSE_DECLARE_WAR',	'TXT_KEY_LEADER_TCM_FRANZ_JOSEPH_DECLARE_WAR%','1'),
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_FRANZ_JOSEPH','RESPONSE_ATTACKED',		'TXT_KEY_LEADER_TCM_FRANZ_JOSEPH_ATTACKED%','1');
--==========================================================================================================================	
--==========================================================================================================================	
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
        (Type,                          Description)
VALUES  ('POLICY_TCM_AUSTRIA_HUNGARY',  'Ratify the Austro-Hungarian Compromise.');