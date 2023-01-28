local ID = "CR/DF>D/F"
local LIB_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/custom/00_amstlib.gmr"
local ROTATION_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/combat_rotation/druid/feral/v1/90_amstaffix_druid_feral_rotation.gmr"
---@type DFDruidFeralV1Config
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

    useRegrowthWithSwiftnessMinHP = 90,
    useThrashMinEnemies = 3,
    usePrimalWrathMinEnemies = 3,
    useSwipeMinEnemies = 3,
    useRakeToSpreadMinEnemies = 2, -- work always with bloodtalons
    useRakeToSpreadMinHP = 70,
    useMoonfireToSpreadMinEnemies = 2, -- work always with bloodtalons
    useMoonfireToSpreadMinHP = 70,
    useSurvivalInstinctsMinHP = 30,
    useBarskinMinHP = 70,
    useFrenziedRegenerationMinHP = 50,
    useNaturesVigil = false,
    useRenewalMinHP = 70,
    useSkullBash = true,
    useWildCharge = true,
    useProwl = true,
    useSwiftmendMinHP = 80,

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

if UnitClassBase("player") == "DRUID" and (GetSpecialization() == 5 or GetSpecialization() == 2) then
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