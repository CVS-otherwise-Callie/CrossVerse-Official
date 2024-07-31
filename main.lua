CrossVerse = RegisterMod("isaac CrossVerse", 1)
CrossVerse.SaveManager = include("cvscripts.savemanager")

CrossVerse.SaveManager.DEFAULT_SAVE.file.deadSeaScrolls = {
    skeletalReplaceChance = 5
}


CrossVerse.SaveManager.Init(CrossVerse)

--load all main scripts
--this one under is fiend folio cus my original was somehow trash
function CrossVerse.LoadScripts(scripts)
	--load scripts
	for i,v in ipairs(scripts) do
		include(v)
	end
end
CrossVerse.LoadScripts({
    "cvscripts.constants",
    "cvscripts.cvapi",
    "cvscripts.entities2",
    --bleh
    "cvscripts.der_existente.main",
    "cvscripts.dss.dssmain",
    "cvscripts.dss.changelogs",
    "cvscripts.iam.main",
    "cvscripts.quaquao.main",
    "cvscripts.xocolate.main",
    "cvscripts.challenges.dodgeball",
    "cvscripts.gnabble.main",
})
