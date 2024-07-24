local mod = CrossVerse

local MAX_SOULS = 15
local USE_DELAY = 4
local DURATION = 30 * 10

---@param entity Entity
mod:AddCallback(ModCallbacks.MC_POST_ENTITY_KILL, function (_, entity)
    if not PlayerManager.AnyoneHasCollectible(mod.Item.BUCKET_OF_SOULS) then return end

    for _, player in ipairs(PlayerManager.GetPlayers()) do
        if player:HasCollectible(mod.Item.BUCKET_OF_SOULS) then
            local data = mod.SaveManager.GetRunSave(player) if data then
                data.BucketOfSouls = data.BucketOfSouls or {NUM_SOULS = 0}
                data.BucketOfSouls.NUM_SOULS = math.min(data.BucketOfSouls.NUM_SOULS + 1, MAX_SOULS)
            end
        end
    end
end)

---@param player EntityPlayer
mod:AddCallback(ModCallbacks.MC_USE_ITEM, function (_, _, _, player)
    local data = mod.SaveManager.GetRunSave(player) if not data then return end
    data.BucketOfSouls = data.BucketOfSouls or {NUM_SOULS = 0}

    if data.BucketOfSouls.NUM_SOULS == 0 then return true end

    Isaac.CreateTimer(function ()
        Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HUNGRY_SOUL, 1, player.Position, RandomVector():Resized(10), player):ToEffect().Timeout = DURATION
        player:AnimateCollectible(mod.Item.BUCKET_OF_SOULS, "UseItem")
    end, USE_DELAY, data.BucketOfSouls.NUM_SOULS, true)

    data.BucketOfSouls.NUM_SOULS = 0
end, mod.Item.BUCKET_OF_SOULS)