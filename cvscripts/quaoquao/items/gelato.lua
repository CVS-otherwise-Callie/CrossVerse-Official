local mod = CrossVerse

local GelatoMoveSpeed = -0.15
local GelatoRange = 1
--what? huh? --i didnt hear anything thats right you assholes

function mod:UpdateGelatoSpeed(player)
    if player:HasCollectible(mod.collectible.items.gelato) then
    local SpeedTodecrease = GelatoMoveSpeed * player:GetCollectibleNum(mod.collectible.items.gelato)
    player.MoveSpeed = player.MoveSpeed + SpeedTodecrease 
    end
end

function mod:UpdateGelatoTearFlags(player)
    if player:HasCollectible(mod.collectible.items.gelato) then
        player.TearFlags = player.TearFlags | TearFlags.TEAR_SLOW
    end
end

function mod:UpdateGelatoTearRange(player)
    if player:HasCollectible(mod.collectible.items.gelato) then
        local RangeToIncrease = GelatoRange * player:GetCollectibleNum(mod.collectible.items.gelato)
        player.TearRange = player.TearRange + RangeToIncrease
    end
end


