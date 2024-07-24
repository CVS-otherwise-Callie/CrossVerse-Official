local mod = CrossVerse

local GelatoMoveSpeed = -0.15
local GelatoRange = 1
--what? huh? --i didnt hear anything thats right you assholes

function mod:UpdateGelatoSpeed(player)
    if player:HasCollectible(mod.Item.GELATO) then
    local SpeedTodecrease = GelatoMoveSpeed * player:GetCollectibleNum(mod.Item.GELATO)
    player.MoveSpeed = player.MoveSpeed + SpeedTodecrease 
    end
end

function mod:UpdateGelatoTearFlags(player)
    if player:HasCollectible(mod.Item.GELATO) then
        player.TearFlags = player.TearFlags | TearFlags.TEAR_SLOW
    end
end

function mod:UpdateGelatoTearRange(player)
    if player:HasCollectible(mod.Item.GELATO) then
        local RangeToIncrease = GelatoRange * player:GetCollectibleNum(mod.Item.GELATO)
        player.TearRange = player.TearRange + RangeToIncrease
    end
end


