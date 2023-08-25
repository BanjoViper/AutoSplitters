state("Shantae and the Pirate's Curse", "v1.04g (GOG)")
{
	int bossHealth: 0x2EAB30, 0x70, 0x5C, 0x48, 0x948;
	int finalBossHealth: 0x2EAB30, 0x18, 0x148, 0x948;
	long keyItems1_1stSave: 0x2EBD08;
	long keyItems2_1stSave: 0x2EBD0C;
	long keyItems1_2ndSave: 0x2ED730;
	long keyItems2_2ndSave: 0x2ED734;
	long keyItems1_3rdSave: 0x2EF158;
	long keyItems2_3rdSave: 0x2EF15C;
	int screenState: 0x2EAADC;
	int buttonInputs: 0x2F915C;
	int keyboardInputs: 0x2F03AC, 0x44;
	int cursorLocationDifficultyScreen: 0x2E6134, 0x30, 0x50, 0x0, 0x10, 0x8, 0x1C;
	int musicState: 0x2F0394, 0x2C;
}

state("ShantaeCurse", "v1.03 (Steam)")
{
	int bossHealth: 0x2F26D0, 0x18, 0x12C, 0x4, 0x948;
	int finalBossHealth: 0x2F26D0, 0x18, 0xCC, 0x48, 0xA0, 0x150, 0x948;
	long keyItems1_1stSave: 0x2F38A8;
	long keyItems2_1stSave: 0x2F38AC;
	long keyItems1_2ndSave: 0x2F52D0;
	long keyItems2_2ndSave: 0x2F52D4;
	long keyItems1_3rdSave: 0x2F6CF8;
	long keyItems2_3rdSave: 0x2F6CFC;
	int screenState: 0x2E5044, 0x4;
	int buttonInputs: 0x3022D8;
	int keyboardInputs: 0x2F88A0, 0x44;
	int cursorLocationDifficultyScreen: 0x2ECC40, 0x3C, 0x44, 0x4, 0xC, 0x18, 0x0, 0x38;
	int musicState: 0x2F8878, 0x2C;
}

startup
{
	vars.fightingBoss = false;
	vars.fightingAmmoBaron = false;
	vars.fightingFinalBoss = false;
	vars.finalBossMusicReady = false;
	
	vars.ammoBaronHealth = 110*65536;
	vars.cyclopsPlantPhase1Health = 30*65536;
	vars.empressSpiderHealth = 375*65536;
	vars.squidBaronHealth = 800*65536;
	vars.dagronHealth = 500*65536;
	vars.steelMaggotHealth = 400*65536;
	vars.pirateMasterHealth = 1000*65536;
	
	vars.musicNothing = -1;
	vars.musicBoss = 25;
	vars.musicFinalBoss = 34;
	vars.musicRunRun = 15;
	vars.musicRottytops = 21;
	
	vars.courtSummons = 4096;
	vars.libraryCard = 8192;
	vars.travelBrochure = 524288;
	vars.royalGateKey = 16384;
	vars.forbiddenIslandMap = 64;
	vars.squidOil = 1048576;
	
	vars.hamStink = 131072;
	vars.petrifySpell = 262144;
	vars.spiderwebIslandMap = 128;
	
	vars.fossil = 67108864;
	vars.shriveledThing = 2097152;
	vars.tanLineIslandMap = 256;
	
	vars.xraySpecs = 4194304;
	vars.sketchScuttle = 8388608;
	vars.sketchSaliva = 33554432;
	vars.enchantedBlade = 32;
	vars.sketchTanLine = 16777216;
	vars.templeCode = 2147483648;
	vars.goldenPickaxe = 2097152;
	vars.mudBogIslandMap = 512;
	
	vars.deathMask = 134217728;
	vars.blueCoin = 536870912;
	vars.greenCoin = 1073741824;
	vars.redCoin = 268435456;
	vars.locket = 2;
	vars.hopefulFlame = 4;
	vars.manlyMusk = 8;
	vars.frostbiteIslandMap = 1024;
	
	vars.lostSoul = 16;
	vars.targetingModule = 64;
	vars.spiritOfJoe = 128;
	vars.lonelyGraveMap = 2048;
	
	//The below variables are only used in Normal Mode runs.
	vars.metalRing = 65536;
	vars.riskyPistol = 2;
	vars.riskyHat = 8;
	vars.riskyScimitar = 4;
	vars.riskyBoots = 6;
	vars.riskyCannon = 32;
	
	
//Settings Options Declarations
	
	settings.Add("autoSplitterActive", true, "AutoSplitter Active - Mouse over for info");
	settings.SetToolTip("autoSplitterActive", "Turns the AutoSplitter on and off. Must be on to select anything else below.\nSelect which options you want handled automatically from the sub-categories,\nthen go set up your splits in Edit Splits to match the order in which they will happen.\nIf you select options that you do not do in the run, they will be safely ignored.\nIf the game is running, deactivate and activate the autosplitter from Edit Splits to have changes here take effect.");
	
	settings.Add("autoStart", true, "Auto-Start", "autoSplitterActive");
	settings.SetToolTip("autoStart", "Will automatically start the timer upon pressing A on Normal Mode or Pirate Mode.");
	
	settings.Add("itemSplits", true, "Item Splits", "autoSplitterActive");
	settings.SetToolTip("itemSplits", "Must be on to select any items below.\nItems checked will be split upon pick up.");
	
	settings.Add("bossSplits", true, "Boss Splits", "autoSplitterActive");
	settings.SetToolTip("bossSplits", "Must be on to select any bosses below.\nBosses checked will be split upon defeat.");
	
	settings.Add("otherSplits", true, "Other Splits", "autoSplitterActive");
	settings.SetToolTip("otherSplits", "Must be on to select any options below.\nMouse over options to see more details.");
	
	settings.Add("debugMode", false, "Debug Mode", "autoSplitterActive");
	settings.SetToolTip("debugMode", "Enable to print extra info to the console after the game is started. Viewable with the DebugView program or something like it.");
	
//Individual Item Options

	settings.Add("courtSummons", false, "Court Summons", "itemSplits");
	settings.Add("libraryCard", false, "Library Card", "itemSplits");
	settings.Add("royalGateKey", false, "Royal Gate Key", "itemSplits");
	settings.Add("forbiddenIslandMap", false, "Forbidden Island Map", "itemSplits");
	settings.Add("metalRing", false, "Metal Ring", "itemSplits");
	settings.Add("hamStink", false, "Ham Stink", "itemSplits");
	settings.Add("petrifySpell", false, "Petrify Spell", "itemSplits");
	settings.Add("riskyPistol", false, "Risky's Pistol", "itemSplits");
	settings.Add("spiderwebIslandMap", false, "Spiderweb Island Map", "itemSplits");
	settings.Add("travelBrochure", false, "Travel Brochure", "itemSplits");
	settings.Add("squidOil", false, "Squid Oil", "itemSplits");
	settings.Add("shriveledThing", false, "Shriveled Thing", "itemSplits");
	settings.Add("riskyHat", false, "Risky's Hat", "itemSplits");
	settings.Add("tanLineIslandMap", false, "Tan Line Island Map", "itemSplits");
	settings.Add("xraySpecs", false, "X-Ray Specs", "itemSplits");
	settings.Add("sketchScuttle", false, "Mummy Sketch - Scuttle Town", "itemSplits");
	settings.Add("sketchSaliva", false, "Mummy Sketch - Saliva Island", "itemSplits");
	settings.Add("sketchTanLine", false, "Mummy Sketch - Tan Line Island", "itemSplits");
	settings.Add("templeCode", false, "Tan Line Temple Code", "itemSplits");
	settings.Add("goldenPickaxe", false, "Golden Pickaxe", "itemSplits");
	settings.Add("riskyScimitar", false, "Risky's Scimitar", "itemSplits");
	settings.Add("mudBogIslandMap", false, "Mud Bog Island Map", "itemSplits");
	settings.Add("fossil", false, "Fossil", "itemSplits");
	settings.Add("deathMask", false, "Death Mask", "itemSplits");
	settings.Add("blueCoin", false, "Blue Coin", "itemSplits");
	settings.Add("greenCoin", false, "Green Coin", "itemSplits");
	settings.Add("redCoin", false, "Red Coin", "itemSplits");
	settings.Add("locket", false, "Locket", "itemSplits");
	settings.Add("hopefulFlame", false, "Hopeful Flame", "itemSplits");
	settings.Add("manlyMusk", false, "Manly Musk", "itemSplits");
	settings.Add("riskyBoots", false, "Risky's Boots", "itemSplits");
	settings.Add("frostbiteIslandMap", false, "Frostbite Island Map", "itemSplits");
	settings.Add("lostSoul", false, "Lost Soul", "itemSplits");
	settings.Add("targetingModule", false, "Targeting Module", "itemSplits");
	settings.Add("enchantedBlade", false, "Enchanted Blade", "itemSplits");
	settings.Add("spiritOfJoe", false, "Spirit of Joe", "itemSplits");
	settings.Add("riskyCannon", false, "Risky's Cannon", "itemSplits");
	settings.Add("lonelyGraveMap", false, "Lonely Grave Map", "itemSplits");
	
//Individual Boss Options

	settings.Add("ammoBaron", false, "Ammo Baron", "bossSplits");
	settings.Add("cyclopsPlant", false, "Cyclops Plant", "bossSplits");
	settings.Add("empressSpider", false, "Empress Spider", "bossSplits");
	settings.Add("squidBaron", false, "Squid Baron", "bossSplits");
	settings.Add("dagron", false, "Dagron", "bossSplits");
	settings.Add("steelMaggot", false, "Steel Maggot", "bossSplits");
	settings.Add("pirateMaster", false, "Pirate Master", "bossSplits");
	settings.Add("truePirateMaster", false, "Pirate Master's True Form", "bossSplits");
		
//Other Options
	
	settings.Add("runRunRottytops", false, "Run, Run, Rottytops!", "otherSplits");
	settings.SetToolTip("runRunRottytops", "Will split when the screen goes black after reaching Abner with Rottytops.");
}

init
{
//Populate the 1st hash with a list of runner selected items to be split automatically.
	
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Creating hash set for Key Items 1.");
	}
	
	vars.keyItems1Hash = new HashSet<long>{};
	
	if (settings["courtSummons"]){
		vars.keyItems1Hash.Add(vars.courtSummons);
	}
	if (settings["libraryCard"]){
		vars.keyItems1Hash.Add(vars.libraryCard);
	}
	if (settings["royalGateKey"]){
		vars.keyItems1Hash.Add(vars.royalGateKey);
	}
	if (settings["forbiddenIslandMap"]){
		vars.keyItems1Hash.Add(vars.forbiddenIslandMap);
	}
	if (settings["metalRing"]){
		vars.keyItems1Hash.Add(vars.metalRing);
	}
	if (settings["hamStink"]){
		vars.keyItems1Hash.Add(vars.hamStink);
	}
	if (settings["petrifySpell"]){
		vars.keyItems1Hash.Add(vars.petrifySpell);
	}
	if (settings["riskyPistol"]){
		vars.keyItems1Hash.Add(vars.riskyPistol);
	}
	if (settings["spiderwebIslandMap"]){
		vars.keyItems1Hash.Add(vars.spiderwebIslandMap);
	}
	if (settings["travelBrochure"]){
		vars.keyItems1Hash.Add(vars.travelBrochure);
	}
	if (settings["squidOil"]){
		vars.keyItems1Hash.Add(vars.squidOil);
	}
	if (settings["shriveledThing"]){
		vars.keyItems1Hash.Add(vars.shriveledThing);
	}
	if (settings["riskyHat"]){
		vars.keyItems1Hash.Add(vars.riskyHat);
	}
	if (settings["tanLineIslandMap"]){
		vars.keyItems1Hash.Add(vars.tanLineIslandMap);
	}
	if (settings["xraySpecs"]){
		vars.keyItems1Hash.Add(vars.xraySpecs);
	}
	if (settings["sketchScuttle"]){
		vars.keyItems1Hash.Add(vars.sketchScuttle);
	}
	if (settings["sketchSaliva"]){
		vars.keyItems1Hash.Add(vars.sketchSaliva);
	}
	if (settings["sketchTanLine"]){
		vars.keyItems1Hash.Add(vars.sketchTanLine);
	}
	if (settings["templeCode"]){
		vars.keyItems1Hash.Add(vars.templeCode);
	}
	if (settings["riskyScimitar"]){
		vars.keyItems1Hash.Add(vars.riskyScimitar);
	}
	if (settings["mudBogIslandMap"]){
		vars.keyItems1Hash.Add(vars.mudBogIslandMap);
	}
	if (settings["fossil"]){
		vars.keyItems1Hash.Add(vars.fossil);
	}
	if (settings["deathMask"]){
		vars.keyItems1Hash.Add(vars.deathMask);
	}
	if (settings["blueCoin"]){
		vars.keyItems1Hash.Add(vars.blueCoin);
	}
	if (settings["greenCoin"]){
		vars.keyItems1Hash.Add(vars.greenCoin);
	}
	if (settings["redCoin"]){
		vars.keyItems1Hash.Add(vars.redCoin);
	}
	if (settings["riskyBoots"]){
		vars.keyItems1Hash.Add(vars.riskyBoots);
	}
	if (settings["frostbiteIslandMap"]){
		vars.keyItems1Hash.Add(vars.frostbiteIslandMap);
	}
	if (settings["riskyCannon"]){
		vars.keyItems1Hash.Add(vars.riskyCannon);
	}
	if (settings["lonelyGraveMap"]){
		vars.keyItems1Hash.Add(vars.lonelyGraveMap);
	}
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Hash set for Key Items 1 created.");
	}

//Populate the 2nd hash with a list of runner selected items to be split automatically.
	
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Creating hash set for Key Items 2.");
	}
	
	vars.keyItems2Hash = new HashSet<long>{};
	
	if (settings["goldenPickaxe"]){
	vars.keyItems2Hash.Add(vars.goldenPickaxe);
	}
	if (settings["locket"]){
	vars.keyItems2Hash.Add(vars.locket);
	}
	if (settings["hopefulFlame"]){
		vars.keyItems2Hash.Add(vars.hopefulFlame);
	}
	if (settings["manlyMusk"]){
		vars.keyItems2Hash.Add(vars.manlyMusk);
	}
	if (settings["lostSoul"]){
	vars.keyItems2Hash.Add(vars.lostSoul);
	}
	if (settings["targetingModule"]){
		vars.keyItems2Hash.Add(vars.targetingModule);
	}
	if (settings["enchantedBlade"]){
		vars.keyItems2Hash.Add(vars.enchantedBlade);
	}
	if (settings["spiritOfJoe"]){
		vars.keyItems2Hash.Add(vars.spiritOfJoe);
	}
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Hash set for Key Items 2 created.");
	}
	
//Populate the hash with a list of runner selected bosses to split automatically.
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Creating hash set for Bosses.");
	}
	vars.bossHealthHash = new HashSet<int>{};
	if (settings["cyclopsPlant"]){
		vars.bossHealthHash.Add(vars.cyclopsPlantPhase1Health);
	}
	if (settings["empressSpider"]){
		vars.bossHealthHash.Add(vars.empressSpiderHealth);
	}
	if (settings["squidBaron"]){
		vars.bossHealthHash.Add(vars.squidBaronHealth);
	}
	if (settings["dagron"]){
		vars.bossHealthHash.Add(vars.dagronHealth);
	}
	if (settings["steelMaggot"]){
		vars.bossHealthHash.Add(vars.steelMaggotHealth);
	}
	if (settings["pirateMaster"]){
		vars.bossHealthHash.Add(vars.pirateMasterHealth);
	}
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Hash set for Bosses created.");
	}
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Init complete. Ret-2-Go!!");
	}
}

start
{
//Check if the runner has Auto Start enabled. If so, activate timer on mode selection.

	//For controller input
	if (settings["autoStart"] && current.screenState == 1819632489 && current.buttonInputs == 4096 && current.cursorLocationDifficultyScreen != 999999){
		return true;
	}
	//For keyboard input
	if (settings["autoStart"] && current.screenState == 1819632489 && current.keyboardInputs == 268435456 && current.cursorLocationDifficultyScreen != 999999){
		return true;
	}
}

split
{
//Logic for splitting on item pickup in keyItems1Hash.
	if (vars.keyItems1Hash.Contains(current.keyItems1_1stSave-old.keyItems1_1stSave) || vars.keyItems1Hash.Contains(current.keyItems1_2ndSave-old.keyItems1_2ndSave) || vars.keyItems1Hash.Contains(current.keyItems1_3rdSave-old.keyItems1_3rdSave)){
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Split! Picked up a Key Item in Key Items 1.");
		}
		return true;
	}
	
//Logic for splitting on item pickup in keyItems2Hash.	
	if (vars.keyItems2Hash.Contains(current.keyItems2_1stSave-old.keyItems2_1stSave) || vars.keyItems2Hash.Contains(current.keyItems2_2ndSave-old.keyItems2_2ndSave) || vars.keyItems2Hash.Contains(current.keyItems2_3rdSave-old.keyItems2_3rdSave)){
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Split! Picked up a Key Item in Key Items 2.");
		}
		return true;
	}
	
//Logic for splitting on bosses other than Ammo Baron and True Pirate Master.
	if (!vars.fightingBoss && !vars.fightingAmmoBaron && !vars.fightingFinalBoss  && vars.bossHealthHash.Contains(current.bossHealth)){
		vars.fightingBoss = true;
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Fighting a boss! Are you ready to tussle?");
		}
	}
	if (vars.fightingBoss && current.bossHealth == 0){
		vars.fightingBoss = false;
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Split! Defeated a boss.");
		}
		return true;
	}
	
//Logic for splitting on last hit of Ammo Baron.
	if (settings["ammoBaron"]){
		if (!vars.fightingBoss && !vars.fightingAmmoBaron && !vars.fightingFinalBoss && current.bossHealth == vars.ammoBaronHealth){
			vars.fightingAmmoBaron = true;
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Fighting Ammo Baron!");
			}
		}
		if (vars.fightingAmmoBaron && current.bossHealth == 65536 && current.musicState == vars.musicNothing){
			vars.fightingAmmoBaron = false;
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Split! Defeated Ammo Baron.");
			}
			return true;
		}
	}
	
//Logic for splitting on last hit of True Pirate Master.
	if (settings["truePirateMaster"]){
		if (!vars.fightingBoss && !vars.fightingAmmoBaron && !vars.fightingFinalBoss && current.finalBossHealth == vars.pirateMasterHealth && current.musicState == vars.musicFinalBoss){
			vars.fightingFinalBoss = true;
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Fighting the Pirate Master's true form!");
			}
		}
		if (vars.fightingFinalBoss && !vars.finalBossMusicReady && current.musicState == vars.musicNothing && old.musicState == vars.musicFinalBoss){
			vars.finalBossMusicReady = true;
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Ready to split on last hit.");
			}
			return false;
		}
		if (vars.fightingFinalBoss && vars.finalBossMusicReady && current.musicState == vars.musicNothing && old.musicState == vars.musicFinalBoss){
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Split! Pirate Master's true form defeated!");
			}
			return true;
		}
	}
	
//Logic for splitting at the end of Run, Run, Rottytops!
	if (settings["runRunRottytops"]){
		if (current.musicState == vars.musicRottytops && old.musicState == vars.musicRunRun){
			print("Shantae and the Pirate's Curse AutoSpltter: Split for Run, Run, Rottytops!");
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Split! Run, Run, Rottytops finished! Just in time!");
			}
			return true;
		}
	}
}

onReset
{
//Reset these variables here so back to back runs don't need a script reload and there's not an extra boss split triggered after Pirate Master's true form is defeated.

	vars.fightingFinalBoss = false;
	vars.finalBossMusicReady = false;
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Resetting variables fightingFinalBoss and finalBossMusicReady to false.");
	}
}