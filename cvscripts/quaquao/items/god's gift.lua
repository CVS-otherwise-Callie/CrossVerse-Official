local mod = CrossVerse

local GodsGiftMoveSpeed = 0.50

function mod:UpdateGodsGiftSpeed(player)
  if player:HasCollectible(CollectibleType.GODS_GIFT) then
    local SpeedToIncrease = GodsGiftMoveSpeed * player:GetCollectibleNum(CollectibleType.GODS_GIFT)
    player.MoveSpeed = player.MoveSpeed + SpeedToIncrease
  end
end
