local mod = CrossVerse
mod.LoadScripts({
    "cvscripts.iam.items.dodgeball",
    "cvscripts.iam.items.a_ball",
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
    elseif flag == CacheFlag.CACHE_SPEED then
    elseif flag == CacheFlag.CACHE_TEARFLAG then
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

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, function(_, player)
    local data = player:GetData()
    mod:HoldStuffUp(player, data)
end)

mod:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, function(_, entity)
    local data = entity:GetData()

    --this is for items :3
    if data.isFallBall == true then
        if entity.Height > 0 then
        end
    elseif data.isDodgeball == true then
        mod:DodgeBallHeight(entity)
    end
end)

mod:AddCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, function(_, entity)
    local data = entity:GetData()

    if data.isDodgeball == true then
        mod:DodgeBallEntityAi(entity)
    end
end)