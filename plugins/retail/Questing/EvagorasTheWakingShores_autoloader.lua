GMR.SendRequestAndThen("https://raw.githubusercontent.com/Dream-Weaver-GMR-Profiles-Plugins/public/master/plugins/retail/Questing/EvagorasTheWakingShores.gmr", true,
    function(cipher)
        GMR.RunEncryptedScript(cipher)
    end
)