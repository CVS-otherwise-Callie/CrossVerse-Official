local mod = CrossVerse
local rng = RNG()

CrossVerse.AddItemPickupCallback(function(player)
    if player:HasCollectible(CollectibleType.SKELETAL_FIGURE) then
        player:AddHearts(-3)
        player:AddBoneHearts(3)
     end
end, nil, CollectibleType.SKELETAL_FIGURE)

function mod:UpdateSkeletalFigureDamage(player)
    if player:HasCollectible(CollectibleType.SKELETAL_FIGURE) then
        player.Damage = player.Damage + (0.5 * player:GetCollectibleNum(CollectibleType.SKELETAL_FIGURE))
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
}

function mod:ReplaceItemSkeletalFigure(item)
    if not mod:CheckTable(mod.SkeletalFigureReplaceList, item) then
        for _, pedestal in pairs(Isaac.FindByType(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE)) do
            local pedestal = pedestal:ToPickup()
            if pedestal:CanReroll() then
                local item = itemConfig:GetCollectible(pedestal.SubType)
                if item and not item:HasTags(ItemConfig.TAG_QUEST) then
                    if rng:RandomInt(1, 10) > 7 then
                        pedestal:Moprh(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, mod.SkeletalFigureReplaceList[rng:RandomInt(0, #mod.SkeletalFigureReplaceList - 1)], true, true, true)
                    end
                end
            end
        end
    end
end