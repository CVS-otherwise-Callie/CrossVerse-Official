local mod = CrossVerse

local COLLECTIBLE_TOOTHPASTE = Isaac.GetItemIdByName("Toothpaste")
local ToothpasteShotspeed = -0.2
local ToothpasteDamage = 1
ColorApplied = 0

function mod:UpdateToothpasteDamage(player)
    local itemCount = player:GetCollectibleNum(COLLECTIBLE_TOOTHPASTE)
    local damageToAdd = ToothpasteDamage * itemCount
    player.Damage = player.Damage + damageToAdd
end

function mod:UpdateToothpasteShotspeed(player)
    local itemCount = player:GetCollectibleNum(COLLECTIBLE_TOOTHPASTE)
    local shotspeedToAdd = ToothpasteShotspeed * itemCount
    player.ShotSpeed = player.ShotSpeed + shotspeedToAdd
end

function mod:UpdateToothpasteTearcolor(player)
    if player:GetCollectibleNum(COLLECTIBLE_TOOTHPASTE) >= 1 then
        player.TearColor = Color(1, 1, 1, 1, 0.4, 0.4, 0.6)
    end
end