# WotLK > Plugin > Combat Rotation > Death Knight > Frost

## Features
- trying his best to execute proper rotation according to [this guide](https://www.wowhead.com/wotlk/guides/frost-death-knight-dps-overview-best-races-professions)
- make devastating damage!
- tested with [this build](https://www.wowhead.com/wotlk/talent-calc/death-knight/23050005-32005350352203012300033101351_001s8q11s9f21xv631ts841sxd51s8g)

## Installation
- delete previous versions!
- turn off all spells in Spells tab
- download [01_amstaffix_deathknight_frost_loader.lua](https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/combat_rotation/deathknight/frost/v5/01_amstaffix_deathknight_frost_loader.lua) 
- place downloaded file `01_amstaffix_deathknight_frost_loader.lua` into
  - HWT: `{HWT_Dir}/addons/Wrath of the Lichking/Plugins/`
  - Tinkr: `{Tinkr_Dir}/scripts/GMR/Plugins/`

## Tuning
File has Config lua table with some tune options, you can change as you like

## Backlog
- make cast interrupts smarter
- make more tests with death pact + ghoul combo
- make proper actions to make summoned ghoul more powerful
- find a way to use anti-magic shield (or what the proper name)
- add auto cast to ally resurrection

## Troubleshooting
If you encounter problems you should:
- turn on debug mode (just change `debug = false` to `debug = true` in downloaded file), then type `/reload` in WoW client.
- do not hide chat window
- record a video (from start of client till encountered issue)
- DM to **AmsTaFFix#0047** with
  - Unlocker type (HWT, Tinkr, Magic)
  - Description of issue
  - Video as attachment/link
  - Downloaded plugin as attachment
  - Screenshot of your `Plugins/` directory

