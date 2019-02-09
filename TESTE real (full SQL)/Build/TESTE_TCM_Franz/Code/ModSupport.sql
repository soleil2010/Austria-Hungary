--==========================================================================================================================
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcmAustriaHungaryDecisions.lua');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('tcmAustriaHungaryEvents.lua');
--==========================================================================================================================
-- Bingle's Civ IV Traits
--==========================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
      
INSERT INTO Leader_SharedTraits
        (LeaderType,             	TraitOne,                   TraitTwo)
VALUES  ('LEADER_TCM_FRANZ_JOSEPH', 'POLICY_IMPERIALISTIC_X',   'POLICY_PHILOSOPHICAL_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders 
SET Description = 'Franz Joseph [ICON_CITY_STATE][ICON_GREAT_PEOPLE]'
WHERE Type = 'LEADER_TCM_FRANZ_JOSEPH'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');	
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations 
SET ArtStyleSuffix = '_AUSTRIA'
WHERE Type = 'CIVILIZATION_TCM_AUSTRIA_HUNGARY'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_AUSTRIA');
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',						24,		65,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',						64,		59,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',						40,		28,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',						40,		41,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',						54,		49,		null,	null);
--==========================================================================================================================
-- Civilizations_NorthAtlanticStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',						95,		33,		null,	null);
--==========================================================================================================================
-- Civilizations_NorthWestEuropeStartPosition 
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
			(Type,														X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',						45,		6,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_AUSTRIA_HUNGARY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_AUSTRIA_HUNGARY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_AUSTRIA_HUNGARY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 														Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_AUSTRIA_HUNGARY'),						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_AUSTRIA';
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,								CultureType,		CultureEra)
VALUES		('CIVILIZATION_TCM_AUSTRIA_HUNGARY',	'GERMAN',			'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                            text                                        default null,
    Value                                           integer                                     default 1);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(Type)          default null,
    CultureType                                 text                                            default null,
    ArtDefineTag                                text                                            default null,
    SplashScreenTag                             text                                            default null,
    SoundtrackTag                               text                                            default null,
    UnitDialogueTag                             text                                            default null);
 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,                    ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_TCM_AUSTRIA_HUNGARY',   ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
------------------------------  
-- Civilizations
------------------------------  
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Central'
WHERE Type = 'CIVILIZATION_TCM_AUSTRIA_HUNGARY'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD EXPLORATION CONTINUED EXPANDED
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
 
INSERT INTO Civilization_JFD_ColonialCityNames
        (CivilizationType,                      LinguisticType, ColonyName)
SELECT  'CIVILIZATION_TCM_AUSTRIA_HUNGARY',   LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_AUSTRIA';
------------------------------  
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------  
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    RevolutionaryCivilizationType               text    REFERENCES Civilizations(Type)      default null);
     
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
        (CivilizationType,                    RevolutionaryCivilizationType)
VALUES  ('CIVILIZATION_AUSTRIA',              'CIVILIZATION_TCM_AUSTRIA_HUNGARY'),
        ('CIVILIZATION_TCM_AUSTRIA_HUNGARY',  'CIVILIZATION_AUSTRIA');
 
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
        (CivilizationType,                    RevolutionaryCivilizationType)
SELECT  'CIVILIZATION_TCM_AUSTRIA_HUNGARY',   'CIVILIZATION_TCM_AUSTRIA_HUNGARY'
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_TCM_AUSTRIA_HUNGARY');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
        (CivilizationType,                    RevolutionaryCivilizationType)
SELECT  'CIVILIZATION_TCM_AUSTRIA_HUNGARY',   'CIVILIZATION_JFD_HUNGARY'
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_HUNGARY');
--==========================================================================================================================    
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
INSERT INTO Leader_Flavors
        (LeaderType,                FlavorType,                 Flavor)
VALUES  ('LEADER_TCM_FRANZ_JOSEPH', 'FLAVOR_JFD_MERCENARY',     3);
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
------------------------------					
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,				FlavorType,								Flavor)
VALUES		('LEADER_TCM_FRANZ_JOSEPH',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2);
