# Dragonflight > Plugin > Combat Rotation > Demon Hunter > Havoc

## Features
- tries his best to execute proper rotation according to [this guide](https://www.wowhead.com/guide/classes/demonhunter/havoc/rotation-cooldowns-pve-dps)
- uses all spells and all talents
- has toggleable burst mode (make `useBurstAlways = false` in `Config`) and use `/amstburst start 60` command
- fel rush vengeful retreat combo
- effective CDs stacking

## Installation
- delete previous versions!
- turn off all spells in Spells tab
- download [01_amstaffix_demonhunter_havoc_loader.lua](https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/combat_rotation/demonhunter/havoc/v1/01_amstaffix_demonhunter_havoc_loader.lua)
- place downloaded file `01_amstaffix_demonhunter_havoc_loader.lua` into
    - HWT: `{HWT_Dir}/addons/Dragonflight/Plugins/`
    - Tinkr: `{Tinkr_Dir}/scripts/GMR/Plugins/`

## Tuning
File has Config lua table with some tune options, you can change as you like

## Backlog
- 

## Troubleshooting
If you encounter problems you should:
- turn on debug mode (just change `debug = false` to `debug = true` in downloaded file), then type `/reload` in WoW client.
- do not hide chat window
- record a video (from start of client till encountered issue)
- DM to **AmsTaFFix#0047** with
    - Unlocker type (HWT, Tinkr)
    - Description of issue
    - Video as attachment/link
    - Downloaded plugin as attachment
    - Screenshot of your `Plugins/` directory
