local ID = "CR/W>H/M"
local LIB_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/custom/00_amstlib.gmr"
local ROTATION_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/combat_rotation/hunter/marksmanship/v1/90_amstaffix_hunter_marksmanship_rotation.gmr"
---@type HunterMarksmanshipV1Config
local Config = {
    ---Toggle debug mode. Turn on, if you encounter some issues and want to deal with it, or record a video and send
    ---to author.
    debug = true,
    ---Use standard CombatRotation pluggable function. Change only if you know what you are doing.
    useCombatRotationLauncher = true,
    ---Use online loading feature to get last updates
    onlineLoad = false,
    ---Character names to force load that rotation
    forceLoadForCharacters = {},
    useBurstAlways = true,

    useGiftOfTheNaauruMinHP = 80,
    useMultiShotMinEnemies = 2,
    useMultiShotMinMana = 20,
    useSteadyShotMinMana = 60,
    useArcaneShotMinMana = 20,
    defaultAspect = {3, 2, 3, 4, 5, 6, 7, 8, 1}, -- 1:beast; 2:cheetah; 3:dragonhawk; 4:hawk; 5:monkey; 6:pack; 7:viper; 8:wild
    useAspectOfViperToRestoreMana = true,
    useAspectOfViperToRestoreManaMinMana = 30,
    useAspectOfViperToRestoreManaMaxMana = 95,
    useConcussiveShot = true,
    useVolleyMinEnemies = 4,
    useDisengage = true,
    useExplosiveTrap = true,
    useImmolationTrap = true,
    useSnakeTrap = true,
    useWingClip = true,

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

if UnitClassBase("player") == "HUNTER" then
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
        else
            GMR.Print(msgPrefix .. "AmsTaFFix' Lib do not initialized properly")
        end
    end
end