local ID = "CR/DF>Wl/Afl"
local LIB_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/custom/00_amstlib.gmr"
local ROTATION_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/combat_rotation/warlock/affliction/v1/90_amstaffix_warlock_affliction_rotation.gmr"
---@type DFWarlockAfflictionV1Config
local Config = {
    ---Toggle debug mode. Turn on, if you encounter some issues and want to deal with it, or record a video and send
    ---to author.
    debug = false,
    ---Use standard CombatRotation pluggable function. Change only if you know what you are doing.
    useCombatRotationLauncher = true,
    ---Use online loading feature to get last updates
    onlineLoad = true,
    ---Character names to force load that rotation
    forceLoadForCharacters = {},
    ---Use all bursts when they off cooldown
    useBurstAlways = true,

    useCurse = true,
    useCurseType = {1, 2, 3}, -- 1:weakness; 2:exhaustion; 3:tongues

    useDemon = {1, 2, 3, 4, 5}, -- 1:imp; 2:voidwalker; 3:felhunter; 4:sayaad; 5:felguard

    useDrainLife = true,
    useDrainLifeMinHp = 70,

    useHealthFunnel = true,
    useHealthFunnelMinPetHP = 50,
    useHealthFunnelMinHP = 70,

    useSoulburnKeepBuff = false,

    useSeedOfCorruptionMinEnemies = 2,

    useAgonyToSpreadMinEnemies = 2,

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

if GMR.GetClass("player") == "WARLOCK" and GetSpecialization() == 1 then
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