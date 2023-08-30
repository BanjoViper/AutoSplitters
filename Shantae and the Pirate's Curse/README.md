# Shantae and the Pirate's Curse AutoSplitter
AutoSplitter for Shantae and the Pirate's Curse. Supports both GOG version 1.04g and Steam version 1.03 (as displayed on the title screen).

For information on how to use and setup LiveSplit, go [here](https://livesplit.org/introduction/). For information on Shantae and the Pirate's Curse speedruns, go [here](https://www.speedrun.com/satpc).

To download the autosplitter manually go [here](https://raw.githubusercontent.com/BanjoViper/AutoSplitters/main/Shantae%20and%20the%20Pirate's%20Curse/Shantae%20and%20the%20Pirate's%20Curse%20AutoSplitter.asl?token=GHSAT0AAAAAACGWXOBBBPYPO2S4F2EOBG7GZHIDJ6A) and right-click to Save Page As. Otherwise, enable the autosplitter through Edit Splits in LiveSplit.

The autosplitter is set up with the below functions:
  
**Automatic Start** - Will start the timer upon selection of Normal Mode or Pirate Mode. Can be turned on or off in the Settings menu.

**Automatic Splits** - Can split on any Key Item pickup, boss defeat, or at the end of Run, Run, Rottytops! Customizable in the Settings menu.

### **All functions of this autosplitter can be toggled on or off through the Settings menu within LiveSplit.**

Troubleshooting Note

While making the autosplitter, I encountered an inconsistent issue that I was not able to fix. 
Viewing LiveSplit's debug output in a program like DebugView, you may see one of the following errors:

>The handle is invalid

>Only part of a ReadProcessMemory or WriteProcessMemory request was completed

When these occur, the autosplitter will sometimes not function until it properly loads.

**Solution**

Reloading the script while the game was open (on the main menu, usually) fixed the problem for me. Deactivating and re-activating it through the Edit Splits menu should do the same for you.
