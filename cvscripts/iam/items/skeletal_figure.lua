local mod = CrossVerse
local rng = RNG()
local itemConfig = Isaac.GetItemConfig()


function mod:UpdateSkeletalFigureDamage(player)
    if player:HasCollectible(mod.Item.SKELETAL_FIGURE) then
        player.Damage = player.Damage + (0.5 * player:GetCollectibleNum(mod.Item.SKELETAL_FIGURE))
    end
end

mod.SkeletalFigureReplaceList = {
    CrossVerse.Item.MARROW,
    CrossVerse.Item.SLIPPED_RIB,
    CrossVerse.Item.POINTY_RIB,
    CrossVerse.Item.BOOK_OF_THE_DEAD, --shut up poly!!
    CrossVerse.Item.JAW_BONE,
    CrossVerse.Item.BRITTLE_BONES,
    CrossVerse.Item.BONE_SPURS,
}


function mod:ReplaceItemSkeletalFigure(item)
    local player = Isaac.GetPlayer()
    if player:HasCollectible(mod.Item.SKELETAL_FIGURE) then
    local pedestal = item:ToPickup()
    if pedestal:CanReroll() then
        if item.Type == EntityType.ENTITY_PICKUP and item.Variant == PickupVariant.PICKUP_COLLECTIBLE then
        local item = itemConfig:GetCollectible(pedestal.SubType)
        if item and not item:HasTags(ItemConfig.TAG_QUEST) then
                if not mod:CheckTable(mod.SkeletalFigureReplaceList, item) then
                    if rng:RandomInt(1, 10) > 5 then
                        pedestal:Morph(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, mod.SkeletalFigureReplaceList[rng:RandomInt(1, #mod.SkeletalFigureReplaceList - 1)], true, true, true)
                    end
                end
            end
        end
    end
    end
end