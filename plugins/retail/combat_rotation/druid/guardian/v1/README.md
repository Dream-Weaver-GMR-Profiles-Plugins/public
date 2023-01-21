# Dragonflight > Plugin > Combat Rotation > Druid > Guardian

## Features
- tries his best to execute proper rotation according to [this guide](https://www.wowhead.com/guide/classes/druid/guardian/rotation-cooldowns-pve-dps)
- uses all spells and all talents
- has toggleable burst mode (make `useBurstAlways = false` in `Config`) and use `/amstburst start 60` command
- uses all defensive spells
- uses all heals
- moonfire spread for big heals

## Installation
- delete previous versions!
- turn off all spells in Spells tab
- download [01_amstaffix_druid_guardian_loader.lua](https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/combat_rotation/druid/guardian/v1/01_amstaffix_druid_guardian_loader.lua)
- place downloaded file `01_amstaffix_druid_guardian_loader.lua` into
    - HWT: `{HWT_Dir}/addons/Dragonflight/Plugins/`
    - Tinkr: `{Tinkr_Dir}/scripts/GMR/Plugins/`

## Tuning
File has Config lua table with some tune options, you can change as you like

## Backlog
- recheck with 2pc set
- recheck with 4pc set

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
