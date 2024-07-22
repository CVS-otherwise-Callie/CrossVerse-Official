local mod = CrossVerse
mod.LoadScripts({
    "cvscripts.quaquao.items.gelato",
    "cvscripts.quaquao.items.god's gift"
    --it should be "yourfoldername.folder.howevermanyfoldersthereare.scripts"
    --remember NOT to leave the .lua at the end! Isaac will crash
})


mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE,function(_, player, flag)
    
	local basedata = player:GetData() --for stats and shit
	local data = basedata.crossversedata

    if flag == CacheFlag.CACHE_DAMAGE then

    elseif flag == CacheFlag.CACHE_FIREDELAY then
    elseif flag == CacheFlag.CACHE_SHOTSPEED then
    elseif flag == CacheFlag.CACHE_RANGE then
        mod:UpdateGelatoTearRange(player)
    elseif flag == CacheFlag.CACHE_SPEED then
        mod:UpdateGelatoSpeed(player)
        mod:UpdateGodsGiftSpeed(player)
    elseif flag == CacheFlag.CACHE_TEARFLAG then
        mod:UpdateGelatoTearFlags(player)
    elseif flag == CacheFlag.CACHE_TEARCOLOR then
    elseif flag == CacheFlag.CACHE_FLYING then
    elseif flag == CacheFlag.CACHE_WEAPON then
    elseif flag == CacheFlag.CACHE_FAMILIARS then
        local itemconfig = Isaac.GetItemConfig()
    elseif flag == CacheFlag.CACHE_LUCK then
    elseif flag == CacheFlag.CACHE_ALL then --everything after this is repenatcne only
    elseif flag == CacheFlag.CACHE_SIZE then --this will invalidate the size! only use in extremely rare cases!!!
    elseif flag == CacheFlag.CACHE_COLOR then --this will invalidate the color of the player! ONLY USE IN SPECIAL CASES!!!!
    elseif flag == CacheFlag.CACHE_TWIN_SYNC then --specific for jacob and esau sync movement
    end
end)
