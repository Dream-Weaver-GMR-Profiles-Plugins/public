local ID = "CR>P/P"
local LIB_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/custom/00_amstlib.gmr"
local ROTATION_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/wotlk/combat_rotation/paladin/protection/v3/90_amstaffix_paladin_protection_rotation.gmr"
---@type PaladinProtectionV3Config
local Config = {
    ---Toggle debug mode. Turn on, if you encounter some issues and want to deal with it, or record a video and send
    ---to author.
    debug = false,
    ---Use standard CombatRotation pluggable function. Change only if you know what you are doing.
    useCombatRotationLauncher = true,
    ---Use online loading feature to get last updates
    onlineLoad = true,

    useGiftOfTheNaauruMinHP = 80,

    useConsecrations = true,
    useConsecrationsMinEnemies = 1,

    groupCleanseModEnabled = false,
    useJudgmentType = 1, -- 1:Judgement of Light; 2:Judgement of Wisdom; 3:Judgement of Justice;
    useJudgmentTryToCleave = false,
    useJudgmentForDebuffOnly = false,

    useHandOfReckoningToMakeDamage = true,
    useHandOfReckoningInInstance = true,

    defaultAuraToUse = 1, -- 1:Devotion Aura; 2:Retribution Aura; 3:Concentration Aura; 4:Shadow Resistance Aura; 5:Frost Resistance Aura; 6:Fire Resistance Aura
    defaultAuraChangeIfAlreadyExist = { 2, 3 }, -- 1:Devotion Aura; 2:Retribution Aura; 3:Concentration Aura; 4:Shadow Resistance Aura; 5:Frost Resistance Aura; 6:Fire Resistance Aura
    defaultBlessingToUse = 4, -- 1:Blessing of Might; 2:Blessing of Kings; 3:Blessing of Wisdom; 4:Blessing of Sanctuary;
    defaultSealToUse = 4, -- 1:Seal of Righteousness; 2:Seal of Justice; 3:Seal of Light; 4:Seal of Wisdom; 5:Seal of Command; 6:Seal of Corruption;
    defaultSealDoNotSwitchList = { 6 }, -- 1:Seal of Righteousness; 2:Seal of Justice; 3:Seal of Light; 4:Seal of Wisdom; 5:Seal of Command; 6:Seal of Corruption;

    useCrusaderAuraWhileMounted = true,
    useCrusaderAuraWhileMounterMinDistance = 50,

    useBlessingOfFreedom = true,

    groupBuffModEnabled = false,
    groupBuffModMinMana = 70,

    useAggroSpellsInGroup = false,

    useHolyWrath = false,

    useSacredShield = true,
    useLayOnHandsMinHP = 20,
    useDivineShieldMinHP = 50,
    useHandOfProtectionMinHP = 40,
    useDivineProtectionMinHP = 10,
    useAuraMasteryMinHP = 70,
    useHandOfFreedomByCD = true,
    useHolyLightNotInMelee = true,
    useHolyLightNotInMeleeMinHP = 85,
    useHolyLightNotInMeleeMinMana = 50,
    
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

if UnitClassBase("player") == "PALADIN" then
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