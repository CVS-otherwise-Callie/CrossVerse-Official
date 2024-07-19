CrossVerse = RegisterMod("isaac CrossVerse", 1)
local mod = CrossVerse

--load all main scripts
--this one under is fiend folio cus my original was somehow trash
function mod.LoadScripts(scripts)
	--load scripts
	for i,v in ipairs(scripts) do
		include(v)
	end
end
mod.LoadScripts({
    --first
    "cvscripts.savedata",
    --alright important part over everyone getcho ass out of here
    "cvscripts.constants",
    "cvscripts.cvapi",
    "cvscripts.entities2",
    --bleh
    "cvscripts.unlockapi.core",
    "cvscripts.dss.changelogs",
    "cvscripts.challenges.main",
    "cvscripts.der_existente.main",
    "cvscripts.dss.dssmain",
    "cvscripts.iam.main",
    "cvscripts.quaquao.main",
})