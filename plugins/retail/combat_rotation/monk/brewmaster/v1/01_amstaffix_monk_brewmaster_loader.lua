local ID = "CR/DF>M/B"
local LIB_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/custom/00_amstlib.gmr"
local ROTATION_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/combat_rotation/monk/brewmaster/v1/90_amstaffix_monk_brewmaster_rotation.gmr"
---@type DFMonkWindwalkerV1Config
local Config = {
    ---Toggle debug mode. Turn on, if you encounter some issues and want to deal with it, or record a video and send
    ---to author.
    debug = true,
    ---Use standard CombatRotation pluggable function. Change only if you know what you are doing.
    useCombatRotationLauncher = true,
    ---Use online loading feature to get last updates
    onlineLoad = false,
    ---Character names to force load that rotation, i.e.
    ---```
    ---  forceLoadForCharacters = {"CharacterName1, "CharacterName2"},
    ---```
    forceLoadForCharacters = {},
    ---Use all bursts when they off cooldown
    useBurstAlways = true,

    useDampenHarmMinHP = 50,
    useFortifyingBrewMinHP = 40,
    useSpearHandStrike = true,
    useExpelHarmMinHP = 60,
    usePurifyingBrew = true,
    usePurifyingBrewMinHP = 75,
    useCelestialBrewMinHP = 60,
    useInvokeNiuzaoMinHP = 60,
    useHealingElixirMinHP = 85,
    useExplodingKeg = true,
    useBonedustBrew = true,
    useBlackOxStatue = true,
    useBlackOxStatueKeepAtDistanceFeature = true,
    useBlackOxStatueKeepAtDistance = 12,
    useBlackOxStatueProvoke = true,
    useBlackOxStatueAtSpecificPositionFeature = false,
    useBlackOxStatueAtSpecificPosition = {3359.7976074219, -1416.1673583984, 96.498588562012},

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

if UnitClassBase("player") == "MONK" and (GetSpecialization() == 5 or GetSpecialization() == 1) then
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