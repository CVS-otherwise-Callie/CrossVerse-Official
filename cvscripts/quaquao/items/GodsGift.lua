local mod = CrossVerese

local GodsGiftMoveSpeed = 0.50

function mod:UpdateGodsGiftSpeed(player)
if player:HasCollectible(mod.collectible.item.GodsGift) then
local health = player:GetSoulHearts() + 2 * player:GetBoneHearts() + player:GetMaxHearts()
local SpeedToIncrease + GodsGiftMoveSpeed * player:GetCollectibleNum(mod.collectible.item.GodsGift)
player.MoveSpeed = player.MoveSpeed + SpeedToIncrease
  end
end
