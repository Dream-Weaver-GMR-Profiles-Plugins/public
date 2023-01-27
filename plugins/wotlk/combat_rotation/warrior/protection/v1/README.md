# WotLK > Plugin > Combat Rotation > Warrior > Protection

## Features
- uses almost all spells and talents
- trying his best to execute proper rotation according to [this guide](https://www.wowhead.com/wotlk/guide/classes/warrior/protection/dps-rotation-cooldowns-abilities-pve)
- has toggleable burst mode. Make `useBurstAlways = false` in `Config` and use `/amstburst start 60` command (save as a macro) to start burst.

## Installation
- delete previous versions!
- turn off all spells in Spells tab
- download [01_amstaffix_warrior_protection_loader.lua](https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/combat_rotation/warrior/protection/v1/01_amstaffix_warrior_protection_loader.lua)
- place downloaded file `01_amstaffix_warrior_protection_loader.lua` into
  - HWT: `{HWT_Dir}/addons/Wrath of the Lichking/Plugins/`
  - Tinkr: `{Tinkr_Dir}/scripts/GMR/Plugins/`

## Tuning
File has Config lua table with some tune options, you can change as you like

## Backlog


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
