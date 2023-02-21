local ID = "AAH"
local PROF_LINK = "https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/autoAH/90_autoAH_base.gmr"
if not Config then
    Config = {
        IS_ON = true,
        --Show debug messages or not
        debug = true,
        --After how much time the bot will reload (in seconds). This is to fix potential TSM Errors that might pop up and require /reload. I suggest leaving it as is.
        reloadTime = 600,
        --IF the bot should go to vendor (Junk by default)
        vendor = false,
        --VENDOR OPTIONS:
            vendorGreenGear = false,
            --Add items to sell: either name in quotes or item id without quotes. Separate by comma. Examples below
            vendorFilter = {
                "Morning Glory Dew",
                27854, --Smoked Talbuk Venison
            },
        --SET YOU PATH TO TSM LIKE BELOW, INCLUDING CORE/UI OPTIONAL
        TSM_PATH = "D:/Games/World of Warcraft/_retail_/Interface/AddOns/TradeSkillMaster/Core/UI",
    }
end



local function printDbg(msg)
    if Config.debug then
        GMR.Print("|cffa335ee[" .. ID .. "]|r|cffFF0000[DEBUG]|r " .. msg)
    end
end
do
    local msgPrefix = "|cffa335ee[" .. ID .. "]|r "
    GMR.SendHttpRequest({
        Url = PROF_LINK,
        Method = "Get",
        Callback = function(content)
            printDbg("AutoAH has been downloaded, now we'll try to execute it")
            GMR.RunEncryptedScript(content)
            if not EvagorasAutoAH then
                printDbg(msgPrefix .. "AutoAH not initialized properly")
                return
            end
            printDbg("AutoAH successfully initialized")
            return
        end
    })
end


