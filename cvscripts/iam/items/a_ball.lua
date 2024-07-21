local mod = CrossVerse
local game = Game()
local sfx = SFXManager()
local nilvector = Vector.Zero
local rng = RNG()
local damage = 0

mod:AddCallback(ModCallbacks.MC_USE_ITEM, function(_, itemID, rng, player, useflags, activeslot)
    local d = player:GetData()
    if d.holdingCrossItem then
        d.holdingCrossItem = nil
        d.HoldingCrossItemBlankVisual = nil
        useflags = UseFlag.USE_REMOVEACTIVE
        mod:BallFall(player)
        player:AnimateCollectible(CollectibleType.COLLECTIBLE_A_BALL, "HideItem", "PlayerPickup")
        return {Remove=true}
    else
        d.holdingCrossItem = CollectibleType.COLLECTIBLE_A_BALL
        d.HoldingCrossItemBlankVisual = true
        player:AnimateCollectible(CollectibleType.COLLECTIBLE_A_BALL, "LiftItem", "PlayerPickup")
        if rng:RandomInt(1, 100) < 10 then
            damage = 10000000000
        else
            damage = 1
        end
    end
end, CollectibleType.COLLECTIBLE_A_BALL)


function mod:BallFall(player)
    local data = player:GetData()
    local ball = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, player.Position, (player:GetShootingJoystick():Normalized() * 10) + player.Velocity, player):ToTear()
    ball:GetData().isFallBall = true
    local s = ball:GetSprite()
    local anim = s:GetAnimation()
    s:Load("gfx/falling_ball.anm2", true)
    s:Play(anim)
    ball.CollisionDamage = damage
    ball.Height = -40
    ball.Scale = 2
    ball.FallingAcceleration = 1.3
    ball.FallingSpeed = -20
    ball.Velocity = (ball.Velocity + player.Velocity)*2
end

function BallBounceCheck(ball)
    print(ball.Height)
end

