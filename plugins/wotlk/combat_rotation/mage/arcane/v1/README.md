# WotLK > Plugin > Combat Rotation > Mage > Arcane

## Features
- trying his best to execute proper rotation according to [this guide](https://www.wowhead.com/wotlk/guide/classes/mage/arcane/dps-rotation-cooldowns-abilities-pve)
- smart usage of all procs
- smart aoe
- dps on movement

## Installation
- delete previous versions!
- turn off all spells in Spells tab
- download [01_amstaffix_mage_arcane_loader.lua](https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/combat_rotation/mage/arcane/v1/01_amstaffix_mage_arcane_loader.lua)
- place downloaded file `01_amstaffix_mage_arcane_loader.lua` into
  - HWT: `{HWT_Dir}/addons/Wrath of the Lichking/Plugins/`
  - Tinkr: `{Tinkr_Dir}/scripts/GMR/Plugins/`

## Tuning
File has Config lua table with some tune options, you can change as you like

## Backlog
- create toogle for burst
- start to use amplify magic
- start to use arcane buffs in groups and on self
- start to use counterspell
- start to use dampen magic (?)
- start to use invisibility
- start to use polymorph (?)
- start use remove curse
- start use slow (?)
- start use slow fall
- start use spell steal
- start use frost nova
- start use frost/fire wards
- start use ice lance (?)
- start use ice block

## Troubleshooting
If you encounter problems you should:
- turn on debug mode (just change `debug = false` to `debug = true` in downloaded file), then type `/reload` in WoW client.
- do not hide chat window
- record a video (from start of client till encountered issue)
- DM to **AmsTaFFix#0047** with
  - Unlocker type (HWT, Tinkr, Magick)
  - Description of issue
  - Video as attachment/link
  - Downloaded plugin as attachment
  - Screenshot of your `Plugins/` directory
