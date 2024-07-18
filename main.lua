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
    "cvscripts.challenges.main",
    "cvscripts.der_existente.main",
    "cvscripts.dss.dssmain",
    "cvscripts.iam.main",
    "cvscripts.qiaoqiao.main",
})
local Gelato = Isaac.GetItemIdByName("Gelato")
local GelatoMoveSpeed = -0.15 
function mod:EvaluateCache(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED  then
        local itemcount = player:GetCollectibleNum(Gelato)
        local SpeedTodecrease = GelatoMoveSpeed * itemcount
        local RangeToIncrease = 1
        player.MoveSpeed = player.MoveSpeed + SpeedTodecrease 
        player.TearFlags = player.TearFlags | TearFlags.TEAR_SLOW
        player.TearRange = player.TearRange + RangeToIncrease
    end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE,mod.EvaluateCache)