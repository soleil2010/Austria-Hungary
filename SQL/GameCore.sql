/*
______________________________________________________________________________________________________________

										Civilization Austria-Hungary's Creation
______________________________________________________________________________________________________________
*/

-- création de la civ sans reférences

INSERT INTO Civilizations (Type, DerivativeCiv)
Values ('CIVILIZATION_TCM_AUSTRIA_HUNGARY', 'CIVILIZATION_AUSTRIA');

INSERT INTO Civilizations (Description,	ShortDescription)
Values ('Austro-Hungarian Empire', 'Austria-Hungary');

INSERT INTO Civilizations (Adjective,Civilopedia,CivilopediaTag)
Values ('Austro-Hungarian',
		'Austria-Hungary was a state in central Europe that aimed to continue the Habsburg Empire in this new form. Owing to the vast amount of cultures within it, Austria-Hungary was often unstable politically, and had ethnic infighting for much of its existence. Founded as a result of the Compromise of 1867, unity in the region was fragile. Austria and Hungary remained distinct entities within the state, each having their own passports despite being legally part of the same country. The union was far more a personal monarchical union than a full-scale political one, as most regions had a significant degree of autonomy, with centralised matters only being to do with defence and the like. Throughout the 19th century, Austria-Hungary prospered, as a cultural capital of the world. However, due to the close alliance with the upstart German Empire, Austria-Hungary found itself isolated from many other countries around it. In the south, the Serbs were desperate to regain lands incorporated into Austria-Hungary, despite them having only got independence a few years beforehand. As an ally of Russia, Serbia was able to push these claims. In 1914, Austria-Hungary sent an ultimatum to Serbia, stating that if they did not agree with all of the points, then they would be in a state of war. The points were so power-taking that the Austro-Hungarian Empire did not think they could possibly agree, thus giving them a casus belli; however, much to their surprise and disappointment, the Serbs agreed with everything aside from one clause in point six of the ultimatum. Angered, Austria-Hungary invaded anyway. However, with incredibly outdated military not ready to even fight against the upstart Serbian nation, Austria-Hungary succumed to its weakness in having too many ethnicities held in the one state against their will. Though Austria tried to incorporate itself into the remnants of the German Empire, the newfound League of Nations denied this, instead splitting Central Europe into more or less what it is today.',
		'History');

INSERT INTO Civilizations (DawnOfManQuote)
Values ('Great Franz Joseph of the Austro-Hungarian Empire, people far and wide throughout the lands cry for you to become their leader once more! Owing to your establishment of a state right in the heart of Europe, you were noted as a ruler of one of the so-called "Great Powers" of the day. Able to unite your people against foes that could crush the empire, forming a stable alliance with the new state of Germany in the process, your wisdom managed to save people that would have otherwise been subject to far harsher foreign domination. However, with the advent of war in 1914 and your death two years later, the empire that you had so carefuly crafted collapsed, but your legacy lives on today.[NEWLINE][NEWLINE]Oh strong and mighty Kaiser Franz Joseph, your former realm needs you to reassume control. Can you creat a new state to empower your people''s will? Can you fend off all enemies of the state to preserve the peace? Can you build a civilisation to stand the test of time?');

-- ---------------------

INSERT INTO Civilizations	(DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix)
SELECT						(('PLAYERCOLOR_TCM_AUSTRIA_HUNGARY'),ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix)
FROM Civilizations
WHERE Type = 'CIVILIZATION_AUSTRIA';

INSERT INTO Civilizations 
		( IconAtlas,					AlphaIconAtlas, 					 PortraitIndex,	SoundtrackTag,		MapImage, 					DawnOfManImage)
SELECT	(('TCM_AUSTRIA_HUNGARY_ATLAS'),	('TCM_AUSTRIA_HUNGARY_ALPHA_ATLAS'), 0,				('AUSTRIA'),	('DF_AUSTRIA_HUNGARY_MAP.dds'),	('DF_AUSTRIA_HUNGARY_DOM.dds')
FROM Civilizations 
WHERE Type = 'CIVILIZATION_AUSTRIA';
