local mod = CrossVerse
local game = Game()
local rng = RNG()
local sfx = SFXManager()
local room = game:GetRoom()
local nilvector = Vector.Zero

mod:AddCallback(ModCallbacks.MC_USE_ITEM, function(_, itemID, rng, player, useflags, activeslot)
    local d = player:GetData()
    if d.holdingCrossItem then
        d.holdingCrossItem = nil
        d.HoldingCrossItemBlankVisual = nil
        player:AnimateCollectible(CrossVerse.Item.A_BALL, "HideItem", "PlayerPickup")
    else
        d.holdingCrossItem = CrossVerse.Item.DODGEBALL
        d.HoldingCrossItemBlankVisual = true
        player:AnimateCollectible(CrossVerse.Item.A_BALL, "LiftItem", "PlayerPickup")
    end
    return {Discharge = false}
end, CrossVerse.Item.DODGEBALL)


function mod:DodgeballShoot(player)
    local data = player:GetData()
    if player:GetFireDirection() ~= -1 then
        if player:GetShootingInput():Length() > 0.1 then
            local ball = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, player.Position, (player:GetShootingJoystick():Normalized() * 10) + player.Velocity, player):ToTear()
            ball:GetData().isDodgeball = true
            ball:AddTearFlags(TearFlags.TEAR_BOUNCE)
            ball.CollisionDamage = player.Damage + 5
            ball.Scale = 2
            ball.FallingAcceleration = -0.01
            ball.FallingSpeed = -3
            ball.Velocity = mod.TearVec(ball.Velocity + player.Velocity, 20)
            local s = ball:GetSprite()
            local anim = s:GetAnimation()
            s:Load("gfx/falling_ball.anm2", true)
            s:Play(anim)
            if data.holdingCrossItem then
                data.holdingCrossItem = nil
                data.HoldingCrossItemBlankVisual = nil
                player:AnimateCollectible(CrossVerse.Item.A_BALL, "HideItem", "PlayerPickup")
                player:DischargeActiveItem(data.holdingCrossItemSlot)
            end
        end
    end
end

function mod:DodgeBallEntityAi(ball)
    local d = ball:GetData()
    ball.TearFlags = Isaac.GetPlayer().TearFlags
    ball.Height = -20
    d.dir = d.dir or 0
    if not d.init then
        d.dir = 0
        d.height = -20
    end

    if d.dir == 0 then
        local poses = {}
        poses = CheckBallEnts(ball)
        d.target = poses[rng:RandomInt(0, #poses - 1 )]
        for k in pairs (poses) do
            poses [k] = nil
        end
        if d.target then
            d.dir = (d.target.Position - ball.Position):GetAngleDegrees()
            ball.Velocity = ball.Velocity:Rotated(d.dir)
        end
    else
    end
end

function CheckBallEnts(ball)
    local noses = {}
    local roomtargs = Isaac.GetRoomEntities()
    for i, ent in pairs(roomtargs) do
        if ent:IsVulnerableEnemy() or (ent.Position - ball.Position):Length() < 250 or game:GetRoom():CheckLine(ent.Position,ball.Position,3,900,false,false) then
            if math.abs((ent.Position - ball.Position):GetAngleDegrees()) < 180 then
                noses[#noses + 1]=ent --shut the fuck up
            end
        end
    end
    return noses
end

function mod:DodgeBallHeight(ball)
    ball.Height = -20
end
