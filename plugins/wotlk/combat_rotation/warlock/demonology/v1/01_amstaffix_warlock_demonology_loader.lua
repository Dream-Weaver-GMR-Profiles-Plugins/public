local ID = "CR>W/Dem"
local LIB_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/custom/00_amstlib.gmr"
local ROTATION_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/combat_rotation/warlock/demonology/v1/90_amstaffix_warlock_demonology_rotation.gmr"
---@type WarlockDemonologyV1Config
local Config = {
    ---Toggle debug mode. Turn on, if you encounter some issues and want to deal with it, or record a video and send
    ---to author.
    debug = false,
    ---Use standard CombatRotation pluggable function. Change only if you know what you are doing.
    useCombatRotationLauncher = true,
    ---Use online loading feature to get last updates
    onlineLoad = true,
    ---Character names to force load that rotation, i.e.
    ---```
    ---  forceLoadForCharacters = {"CharacterName1, "CharacterName2"},
    ---```
    forceLoadForCharacters = {},

    minEneminesToAoe = 3,

    defaultArmor = {2, 3, 1}, -- 1:Demon Skin;2:Demon Armor;3:Fel Armor
    useCurse = {1, 2, 5, 4, 3}, -- 1:Curse of Agony;2:Curse of Doom;3:Curse of Tongues;4:Curse of Weakness;5:Curse of the Elements
    useDemon = {4, 1, 5, 3, 2}, -- 1:Imp;2:Incubus;3:Succubus;4:Voidwalker;5:Felhunter

    useLifeTapToGetMpMinHPThreshold = 20,

    useMetamorphosis = true,
    useMetamorphosisCharge = true,
    useSeedOfCorruptionMinEnemies = 2,
    useDrainSoul = true,

    minSoulShards = 5,

    useTrinket1 = false,
    useTrinket1Type = 1, -- 1:self-buff, 2:target-harmful, 3:aoe-harmful

    useTrinket2 = false,
    useTrinket2Type = 1, -- 1:self-buff, 2:target-harmful, 3:aoe-harmful
}

local function printDbg(msg)
    if Config.debug then
        GMR.Print("[" .. ID .. "][DEBUG] " .. msg)
    end
end

if UnitClassBase("player") == "WARLOCK" then
    local msgPrefix = "[" .. ID .. "] "
    if Config.onlineLoad then
        GMR.SendHttpRequest({
            Url = LIB_LINK,
            Method = "Get",
            Callback = function(content)
                printDbg("library has been downloaded, now we'll try to execute it")
                GMR.RunEncryptedScript(content)
                if not amstlib then
                    GMR.Print(msgPrefix .. "AmsTaFFix' Lib do not initialized properly")
                    return
                end

                printDbg("library successfully initialized, start work with rotation")
                local cr = amstlib:getCombatRotation(ID)
                cr:prepare(Config)
                printDbg("rotation has been prepared, start loading the file with rotation")
                cr:loadEncrypted(ROTATION_LINK)
            end
        })
    else
        GMR.Print(msgPrefix .. "Offline loading of rotation initiated")
        if amstlib then
            local cr = amstlib:getCombatRotation(ID)
            cr:prepare(Config)
            if Config.onlineLoad then
                cr:loadEncrypted(ROTATION_LINK)
            end
        else
            GMR.Print(msgPrefix .. "AmsTaFFix' Lib do not initialized properly")
        end
    end
end