local mod = CrossVerse
local rng = RNG()
local itemConfig = Isaac.GetItemConfig()
local player = Isaac.GetPlayer()


function mod:UpdateSkeletalFigureDamage(player)
    if player:HasCollectible(mod.Item.SKELETAL_FIGURE) then
        player.Damage = player.Damage + (0.5 * player:GetCollectibleNum(mod.Item.SKELETAL_FIGURE))
    end
end

mod.SkeletalFigureReplaceList = {
    CollectibleType.COLLECTIBLE_MARROW,
    CollectibleType.COLLECTIBLE_SLIPPED_RIB,
    CollectibleType.COLLECTIBLE_POINTY_RIB,
    CollectibleType.COLLECTIBLE_BOOK_OF_THE_DEAD, --shut up poly!!
    CollectibleType.COLLECTIBLE_JAW_BONE,
    CollectibleType.COLLECTIBLE_BRITTLE_BONES,
    CollectibleType.COLLECTIBLE_BONE_SPURS,
    CollectibleType.COLLECTIBLE_HOST_HAT,
}


function mod:ReplaceItemSkeletalFigure(item)
    if not CrossVerse.SaveManager.GetDeadSeaScrollsSave().skeletalReplaceChance then
        CrossVerse.SaveManager.GetDeadSeaScrollsSave().skeletalReplaceChance = 5
    end

    local player = Isaac.GetPlayer()
    if player:HasCollectible(mod.Item.SKELETAL_FIGURE) then
    local pedestal = item:ToPickup()
    if pedestal:CanReroll() then
        if item.Type == EntityType.ENTITY_PICKUP and item.Variant == PickupVariant.PICKUP_COLLECTIBLE then
        local itemcon = itemConfig:GetCollectible(pedestal.SubType)
        if itemcon and not itemcon:HasTags(ItemConfig.TAG_QUEST) then
                if not mod.CheckTable(mod.SkeletalFigureReplaceList, pedestal.SubType) then
                    if math.random(10) <= CrossVerse.SaveManager.GetDeadSeaScrollsSave().skeletalReplaceChance + player.Luck then
                        Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, item.Position, item.Velocity, item)
                        pedestal:Morph(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, mod.SkeletalFigureReplaceList[rng:RandomInt(1, #mod.SkeletalFigureReplaceList)], true, true, true)
                    end
                end
            end
        end
    end
    end
end