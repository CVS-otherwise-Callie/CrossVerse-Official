local mod = CrossVerse

local GodsGiftMoveSpeed = 0.50
local GodsGiftHealth = 2
function mod:UpdateGodsGiftMoveSpeed(player)
  if player:HasCollectible(mod.Item.GODS_GIFT) then
    local SpeedToIncrease = GodsGiftMoveSpeed * player:GetCollectibleNum(mod.Item.GODS_GIFT)
    player.MoveSpeed = player.MoveSpeed + SpeedToIncrease
  end
end

function mod:UpdateGodsGiftHealth(player)
   if player:HasCollectible(mod.Item.GODS_GIFT) then
       player:AddSoulHearts(2)
    end
end
