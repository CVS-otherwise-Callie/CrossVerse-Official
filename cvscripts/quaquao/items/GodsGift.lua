local mod = CrossVerese

local GodsGiftMoveSpeed = 0.50

function mod:UpdateGodsGiftSpeed(player)
if player:HasCollectible(mod.collectible.item.GodsGift) then
local SpeedToIncrease + GodsGiftMoveSpeed * player:GetCollectibleNum(mod.collectible.item.GodsGift)
player.MoveSpeed = player.MoveSpeed + SpeedToIncrease
  end
-- work in progress btw :D
