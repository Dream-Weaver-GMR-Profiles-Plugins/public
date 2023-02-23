local ID = "CR/DW>P/R"
local LIB_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/custom/00_amstlib.gmr"
local ROTATION_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/combat_rotation/paladin/retribution/v1/90_amstaffix_paladin_retribution_rotation.gmr"
---@type RetailPaladinRetributionV1Config
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

    useDivineTollMinEnemies = 2,
    useDivineStormMinEnemies = 3,
    useDivineProtectionMinHP = 70,
    useShieldOfVengeanceMinHP = 60,
    useConsecrationMinEnemies = 2,
    useFlashHealUnderSelflessHealerMinHP = 80,
    useFlashHealUnderSelflessHealerOnParty = true,
    useWordOfGloryMinHP = 40,
    useWordOfGloryOnParty = true,
    useJusticarsVengeanceMinHP = 80,
    useEyeForAnEyeMinHP = 50,
    useFinalReckoning = true,
    useFinalReckoningMinEnemies = 3,
    useLayOnHandsMinHP = 20,
    useDevotionAura = true,
    useRetributionAura = false,
    useBlindingLightMinEnemies = 3,
    useBlindingLightMinHP = 70,
    useBlessingOfProtectionMinHP = 30,

    useHandOfReckoning = true,

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

if UnitClassBase("player") == "PALADIN" and (GetSpecialization() == 5 or GetSpecialization() == 3) then
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