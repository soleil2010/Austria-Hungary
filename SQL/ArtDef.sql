--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GRENZER'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GRENZER'),			('ART_DEF_UNIT_MEMBER_GRENZER'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GRENZER'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GRENZER'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GRENZER'),		Scale,	ZOffset, Domain, ('civ5_ausrm3.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY');

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_GRENZER', 'Unit', 'sv_Jaeger.dds');
--=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_JAEGER_ATLAS', 						256, 		'JFD_Jaeger_256.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						128, 		'JFD_Jaeger_128.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						80, 		'JFD_Jaeger_80.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						45, 		'JFD_Jaeger_45.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						64, 		'JFD_Jaeger_64.dds',					1, 				1),
			('JFD_JAEGER_ATLAS', 						32, 		'JFD_Jaeger_32.dds',					1, 				1),
			('UNITS_JFD_JAEGER_FLAG_ATLAS', 			32, 		'Unit_Jaeger_Flag_32.dds',				1, 				1),
			('TCM_AUSTRIA_HUNGARY_ATLAS', 			256, 		'TCM_AustriaHungaryAtlas_256.dds',			2,				3),
			('TCM_AUSTRIA_HUNGARY_ATLAS', 			128, 		'TCM_AustriaHungaryAtlas_128.dds',			2, 				3),
			('TCM_AUSTRIA_HUNGARY_ATLAS', 			80, 		'TCM_AustriaHungaryAtlas_80.dds',			2, 				3),
			('TCM_AUSTRIA_HUNGARY_ATLAS', 			64, 		'TCM_AustriaHungaryAtlas_64.dds',			2, 				3),
			('TCM_AUSTRIA_HUNGARY_ATLAS', 			45, 		'TCM_AustriaHungaryAtlas_45.dds',			2, 				3),
			('TCM_AUSTRIA_HUNGARY_ATLAS', 			32, 		'TCM_AustriaHungaryAtlas_32.dds',			2, 				3),
			('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS',		128, 		'TCM_AustriaHungaryAlphaAtlas_128.dds',		1,				1),
			('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS',		80, 		'TCM_AustriaHungaryAlphaAtlas_80.dds',		1, 				1),
			('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS',		64, 		'TCM_AustriaHungaryAlphaAtlas_64.dds',		1, 				1),
			('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS',		48, 		'TCM_AustriaHungaryAlphaAtlas_48.dds',		1, 				1),
			('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS',		32, 		'TCM_AustriaHungaryAlphaAtlas_32.dds',		1, 				1),
			('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS',		24, 		'TCM_AustriaHungaryAlphaAtlas_24.dds',		1, 				1),
			('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS',		16, 		'TCM_AustriaHungaryAlphaAtlas_16.dds',		1, 				1);
			--('TCM_UNIT_FLAG_TCM_GRENZER_ATLAS',		32,			'TCM_GRENZER_FLAG_32.dds',					1, 				1);
--==========================================================================================================================
--==========================================================================================================================
