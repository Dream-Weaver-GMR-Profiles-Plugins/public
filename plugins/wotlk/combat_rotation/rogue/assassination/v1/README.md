# WotLK > Plugin > Combat Rotation > Rogue > Assassination

## Features
- trying his best to execute proper rotation according to [this guide](https://www.wowhead.com/wotlk/guide/classes/rogue/assassination/dps-rotation-cooldowns-abilities-pve)
- 100% uptime of `Slice and Dice`
- smart usage of `Envenom` buff
- stealth opener (determine `behind the target` state)
- 100% uptime of `Hunger for Blood`
- `Fan of Knifes` AOE
- trinkets usage

## Installation
- delete previous versions!
- turn off all spells in Spells tab
- download [01_amstaffix_rogue_assassination_loader.lua](https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/combat_rotation/rogue/assassination/v1/01_amstaffix_rogue_assassination_loader.lua)
- place downloaded file `01_amstaffix_rogue_assassination_loader.lua` into
  - HWT: `{HWT_Dir}/addons/Wrath of the Lichking/Plugins/`
  - Tinkr: `{Tinkr_Dir}/scripts/GMR/Plugins/`

## Tuning
File has Config lua table with some tune options, you can change as you like

## Backlog
- add `Kick` usage
- add toggleable burst mode
- add usage safe CDs (`Evasion`, `Feint`, `Cloak of Shadows`)
- add usage of `Tricks of the Trade`
- decide how to use `Cheap Shot`
- decide how to use `Dismantle`
- decide how to use `Gouge`
- decide how to use `Blind`
- add usage of engineer enchants

## Troubleshooting
If you encounter problems you should:
- turn on debug mode (just change `debug = false` to `debug = true` in downloaded file), then type `/reload` in WoW client.
- do not hide chat window
- record a video (from start of client till encountered issue)
- Post a ticket to [discord](https://discord.com/channels/1025496394984865892/1044700018201874483) with additional info
  - Unlocker type (HWT, Tinkr, Magick)
  - Description of issue
  - Video as attachment/link
  - Downloaded plugin as attachment
  - Screenshot of your `Plugins/` directory
