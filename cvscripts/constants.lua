--put constants here
local mod = CrossVerse

-- ITEMS --
CollectibleType.COLLECTIBLE_GELATO = Isaac.GetItemIdByName("Gelato") --MAKE SURE THESE ARE IN ORDER TO XML I WILL WOOP YOUR ASS IF NOT id 1
CollectibleType.COLLECTIBLE_DODGEBALL = Isaac.GetItemIdByName("Dodgeball") -- id 3
CollectibleType.COLLECTIBLE_A_BALL = Isaac.GetItemIdByName("A Ball")
CollectibleType.GODS_GIFT = Isaac.GetItemIdByName("God's Gift")

mod.PassiveItems = {
    CollectibleType.COLLECTIBLE_GELATO,
    CollectibleType.GODS_GIFT,
}

mod.Actives = {
    CollectibleType.COLLECTIBLE_DODGEBALL,
    CollectibleType.COLLECTIBLE_A_BALL
}

mod.ThrowableStuff = {}
mod.ThrowableStuff[CollectibleType.COLLECTIBLE_DODGEBALL] = 'throw'
mod.ThrowableStuff[CollectibleType.COLLECTIBLE_A_BALL] = 'throw'
--OOOOH I WONDER WHAT MOD THIS IS LIKE (YOU CANT GUESS CAN YOU???) yeah thanks community remix


