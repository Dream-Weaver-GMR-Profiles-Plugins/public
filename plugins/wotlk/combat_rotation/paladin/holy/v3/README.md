# WotLK > Plugin > Combat Rotation > Paladin > Holy

## Features
- smart usage of beacon of light
- optimal usage of all spells
- can't calculate spell's heal amount, so please tune in `Config`
- do not use spells with long cooldowns
- do not use Divine Plea, you should use it on your own
- smart aura changes in case of multiple paladins in group and while on mount

## Installation
- delete previous versions!
- turn off spells from the list in Spells tab:
  - All blessings
  - All seals
  - All auras
  - All judgements
  - Consecrations
  - Hammer Of Wrath
- download [01_amstaffix_paladin_holy_loader.lua](TODO)
- place downloaded file `01_amstaffix_paladin_holy_loader.lua` into
  - HWT: `{HWT_Dir}/addons/Wrath of the Lichking/Plugins/`
  - Tinkr: `{Tinkr_Dir}/scripts/GMR/Plugins/`

## Tuning
File has Config lua table with some tune options, you can change as you like

## Backlog
- smart usage of some long cooldown spells

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
