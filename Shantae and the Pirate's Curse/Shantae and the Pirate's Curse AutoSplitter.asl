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
	int screenState: 0x2F26E0;
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
	int screenState: 0x2FAA64;
	int buttonInputs: 0x3022D8;
	int keyboardInputs: 0x2F88A0, 0x44;
	int cursorLocationDifficultyScreen: 0x2ECC40, 0x3C, 0x44, 0x4, 0xC, 0x18, 0x0, 0x38;
	int musicState: 0x2F8878, 0x2C;
}

startup
{
	vars.fightingBoss = false;
	vars.fightingAmmoBaron = false;
	vars.fightingSquidBaron = false;
	vars.fightingFinalBoss = false;
	vars.squidBaronMusicReady = false;
	vars.finalBossMusicReady = false;
	
	vars.ammoBaronHealth = 110*65536;
	vars.cackleBatHealth = 40*65536;
	vars.cyclopsPlantPhase2Health = 150*65536;
	vars.empressSpiderHealth = 375*65536;
	vars.squidBaronHealth = 800*65536;
	vars.dagronAndSteelMaggotHealth = 400*65536;
	vars.pirateMasterHealth = 1000*65536;
	
	vars.dagronAndSteelMaggotChecker = 0;
	vars.dagronAndSteelMaggotValue = 0;
	
	vars.musicNothing = -1;
	vars.musicBoss = 25;
	vars.musicSquidBaron = 43;
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
	settings.Add("cackleBat", false, "Cackle Bat", "bossSplits");
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
	
//Check if Dagron and Steel Maggot are selected with special logic since they have the same health.
	if (settings["dagron"] && settings["steelMaggot"]){
		vars.dagronAndSteelMaggotChecker = 3;
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: \nDagron and Steel Maggot both selected.");
		}
	}
	else if (settings["dagron"] && !settings["steelMaggot"]){
		vars.dagronAndSteelMaggotChecker = 1;
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: \nDagron only selected.");
		}
	}
	else if (!settings["dagron"] && settings["steelMaggot"]){
		vars.dagronAndSteelMaggotChecker = 2;
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: \nSteel Maggot only selected.");
		}
	}
	else{
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: \nNeither Dagron or Steel Maggot selected.");
		}
	}
	
//Copy the value of the selected settings for Dagron and Steel Maggot so it can be reset in onReset.
	vars.dagronAndSteelMaggotValue = vars.dagronAndSteelMaggotChecker;
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: \ndagronAndSteelMaggotValue set to value of Checker.");
	}
	
//Populate the hash with a list of runner selected bosses to split automatically.
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Creating hash set for Bosses.");
		vars.selectedBosses = new Dictionary<int, string>();
	}
	vars.bossHealthHash = new HashSet<int>{};
	if (settings["ammoBaron"]){
		vars.bossHealthHash.Add(vars.ammoBaronHealth);
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Added Ammo Baron Health to hash - "+vars.ammoBaronHealth.ToString());
			vars.selectedBosses.Add(vars.ammoBaronHealth, "Ammo Baron");
		}
	}
	if (settings["cackleBat"]){
		vars.bossHealthHash.Add(vars.cackleBatHealth);
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Added Cackle Bat Health to hash - "+vars.cackleBatHealth.ToString());
			vars.selectedBosses.Add(vars.cackleBatHealth, "Cackle Bat");
		}
	}
	if (settings["cyclopsPlant"]){
		vars.bossHealthHash.Add(vars.cyclopsPlantPhase2Health);
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Added Cyclops Plant Health to hash - "+vars.cyclopsPlantPhase2Health.ToString());
			vars.selectedBosses.Add(vars.cyclopsPlantPhase2Health, "Cyclops Plant");
		}
	}
	if (settings["empressSpider"]){
		vars.bossHealthHash.Add(vars.empressSpiderHealth);
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Added Empress Spider Health to hash - "+vars.empressSpiderHealth.ToString());
			vars.selectedBosses.Add(vars.empressSpiderHealth, "Empress Spider");
		}
	}
	if (settings["squidBaron"]){
		vars.bossHealthHash.Add(vars.squidBaronHealth);
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Added Squid Baron Health to hash - "+vars.squidBaronHealth.ToString());
			vars.selectedBosses.Add(vars.squidBaronHealth, "Squid Baron");
		}
	}
	if (vars.dagronAndSteelMaggotChecker > 0){
		vars.bossHealthHash.Add(vars.dagronAndSteelMaggotHealth);
		if (settings["debugMode"]){
			if (vars.dagronAndSteelMaggotChecker == 1){
				print("Shantae and the Pirate's Curse AutoSplitter: Added Dagron Health to hash - "+vars.dagronAndSteelMaggotHealth.ToString());
				vars.selectedBosses.Add(vars.dagronAndSteelMaggotHealth, "Dagron");
			}
			else if (vars.dagronAndSteelMaggotChecker == 2){
				print("Shantae and the Pirate's Curse AutoSplitter: Added Steel Maggot Health to hash - "+vars.dagronAndSteelMaggotHealth.ToString());
				vars.selectedBosses.Add(vars.dagronAndSteelMaggotHealth, "Steel Maggot");
			}
			else if (vars.dagronAndSteelMaggotChecker == 3){
				print("Shantae and the Pirate's Curse AutoSplitter: Added Dagron and Steel Maggot Health to hash - "+vars.dagronAndSteelMaggotHealth.ToString());
				vars.selectedBosses.Add(vars.dagronAndSteelMaggotHealth, "Dagron & Steel Maggot");
			}
		}
	}
	if (settings["pirateMaster"]){
		vars.bossHealthHash.Add(vars.pirateMasterHealth);
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Added Pirate Master Health to hash - "+vars.pirateMasterHealth.ToString());
			vars.selectedBosses.Add(vars.pirateMasterHealth, "Pirate Master");
		}
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
	if (settings["autoStart"]){
		if (current.screenState == 29 || current.screenState == 30 || current.screenState == 31){
			if (current.buttonInputs == 4096 && current.cursorLocationDifficultyScreen != 999999 && current.musicState == 53){
				if (settings["debugMode"]){
					print("Shantae and the Pirate's Curse AutoSplitter: Start! Pressed A on Difficulty screen.");
				}
				return true;
			}

			if (current.keyboardInputs == 268435456 && current.cursorLocationDifficultyScreen != 999999 && current.musicState == 53){
				if (settings["debugMode"]){
					print("Shantae and the Pirate's Curse AutoSplitter: Start! Pressed Enter on Difficulty screen.");
				}
				return true;
			}
		}
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

//Logic for splitting on bosses other than Squid Baron and True Pirate Master.
	if (current.musicState == vars.musicBoss && old.musicState != vars.musicBoss){
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Current music is boss music.");
		}
		if (!vars.fightingBoss && !vars.fightingFinalBoss){
			if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Not fighting anyone else.");
			}
			if (vars.bossHealthHash.Contains(current.bossHealth)){
				if (settings["debugMode"]){
					print("Shantae and the Pirate's Curse AutoSplitter: \nBoss health value matched on Boss Health 1.\nBoss Health Hash 1 = "+current.bossHealth.ToString()+"\nBoss Health Hash 2 = "+current.finalBossHealth.ToString()+"\nDetected boss is "+vars.selectedBosses[current.bossHealth]);
				}
				//Special logic to check what combination of Dagron and Steel Maggot are selected.
				if (current.bossHealth == vars.dagronAndSteelMaggotHealth && vars.dagronAndSteelMaggotChecker > 0){
					if (vars.dagronAndSteelMaggotChecker == 1 || vars.dagronAndSteelMaggotChecker == 3){
						vars.dagronAndSteelMaggotChecker -= 1;
						vars.fightingBoss = true;
						if (settings["debugMode"]){
							print("Shantae and the Pirate's Curse AutoSplitter: Should be Dagron. Checker after adjusting =  "+vars.dagronAndSteelMaggotChecker.ToString());
						}
					}
					else if (vars.dagronAndSteelMaggotChecker == 2){
						vars.dagronAndSteelMaggotChecker -= 2;
						vars.fightingBoss = true;
						if (settings["debugMode"]){
							print("Shantae and the Pirate's Curse AutoSplitter: Should be Steel Maggot. Checker after adjusting = "+vars.dagronAndSteelMaggotChecker.ToString());
						}
					}
					else{
						if (settings["debugMode"]){
							print("Shantae and the Pirate's Curse AutoSplitter: Checker says there isn't another boss selected. Skipping. Checker = "+vars.dagronAndSteelMaggotChecker.ToString());
						}
					}
				}
				else if (current.bossHealth != vars.dagronAndSteelMaggotHealth){
					vars.fightingBoss = true;
					if (settings["debugMode"]){
						print("Shantae and the Pirate's Curse AutoSplitter: Fighting a boss!");
					}
				}
			}
			else if (vars.bossHealthHash.Contains(current.finalBossHealth)){
				if (settings["debugMode"]){
					print("Shantae and the Pirate's Curse AutoSplitter: \nBoss health value matched on Boss Health 2.\nBoss Health Hash 1 = "+current.bossHealth.ToString()+"\nBoss Health Hash 2 = "+current.finalBossHealth.ToString()+"\nDetected boss is "+vars.selectedBosses[current.finalBossHealth]);
				}
				//Special logic to check what combination of Dagron and Steel Maggot are selected.
				if (current.finalBossHealth == vars.dagronAndSteelMaggotHealth && vars.dagronAndSteelMaggotChecker > 0){
					if (vars.dagronAndSteelMaggotChecker == 1 || vars.dagronAndSteelMaggotChecker == 3){
						vars.dagronAndSteelMaggotChecker -= 1;
						vars.fightingBoss = true;
						if (settings["debugMode"]){
							print("Shantae and the Pirate's Curse AutoSplitter: Should be Dagron. Checker after adjusting =  "+vars.dagronAndSteelMaggotChecker.ToString());
						}
					}
					else if (vars.dagronAndSteelMaggotChecker == 2){
						vars.dagronAndSteelMaggotChecker -= 2;
						vars.fightingBoss = true;
						if (settings["debugMode"]){
							print("Shantae and the Pirate's Curse AutoSplitter: Should be Steel Maggot. Checker after adjusting = "+vars.dagronAndSteelMaggotChecker.ToString());
						}
					}
					else{
						if (settings["debugMode"]){
							print("Shantae and the Pirate's Curse AutoSplitter: Checker says there isn't another boss selected. Skipping. Checker = "+vars.dagronAndSteelMaggotChecker.ToString());
						}
					}
				}
				else if (current.finalBossHealth != vars.dagronAndSteelMaggotHealth){
					vars.fightingBoss = true;
					if (settings["debugMode"]){
						print("Shantae and the Pirate's Curse AutoSplitter: Fighting a boss!");
					}
				}
			}
			else{
				if (settings["debugMode"]){
					print("Boss health value not matched in hash. Not changing boolean.");
					print("Boss Health Hash 1 = "+current.bossHealth.ToString());
					print("Boss Health Hash 2 = "+current.finalBossHealth.ToString());
				}
			}
		}
		else{
			if (settings["debugMode"]){
				print("Currently fighting something else, no booleans changed.");
			}
		}
	}
	if (vars.fightingBoss && current.musicState == vars.musicNothing && old.musicState == vars.musicBoss){
		vars.fightingBoss = false;
		if (settings["debugMode"]){
			print("Shantae and the Pirate's Curse AutoSplitter: Split! Defeated a boss.");
		}
		return true;
	}
	
//Logic for splitting on last hit of Squid Baron.
	if (current.musicState == vars.musicSquidBaron && old.musicState != vars.musicSquidBaron){
		if (settings["debugMode"]){
			print ("Shantae and the Pirate's Curse AutoSplitter: Current music is Squid Baron's music");
		}
		if (!vars.fightingBoss && !vars.fightingFinalBoss){
			if (settings["debugMode"]){
				print ("Shantae and the Pirate's Curse AutoSplitter: Not currently fighting anyone.");
			}
			if (vars.bossHealthHash.Contains(current.bossHealth) || vars.bossHealthHash.Contains(current.finalBossHealth)){
				vars.fightingBoss = true;
				if (settings["debugMode"]){
					print("Shantae and the Pirate's Curse AutoSplitter: Fighting Squid Baron!");
				}
			}
			else{
				if (settings["debugMode"]){
					print("Shantae and the Pirate's Curse AutoSplitter: Boss health value is not in hash. Not changing boolean.");
				}
			}
		}
		else{
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Currently fighting something else, no booleans changed.");
			}
		}
	}
	if (vars.fightingBoss && current.musicState == vars.musicNothing && old.musicState == vars.musicSquidBaron){
		if (!vars.squidBaronMusicReady){
			vars.squidBaronMusicReady = true;
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Ready to split on Squid Baron's defeat.");
			}
		}
		else if (vars.squidBaronMusicReady){
			vars.fightingBoss = false;
			if (settings["debugMode"]){
				print("Shantae and the Pirate's Curse AutoSplitter: Split! Defeated Squid Baron.");
			}
			return true;
		}
	}
	
//Logic for splitting on last hit of True Pirate Master.
	if (settings["truePirateMaster"]){
		if (!vars.fightingBoss && !vars.fightingFinalBoss && current.finalBossHealth == vars.pirateMasterHealth && current.musicState == vars.musicFinalBoss){
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
	vars.squidBaronMusicReady = false;
	vars.dagronAndSteelMaggotChecker = vars.dagronAndSteelMaggotValue;
	if (settings["debugMode"]){
		print("Shantae and the Pirate's Curse AutoSplitter: Reset variables fightingFinalBoss, finalBossMusicReady, and squidBaronMusicReady to false.\nReset dagronSteelMaggotChecker to dagronSteelMaggotValue.");
	}
}