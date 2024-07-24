--put constants here

CrossVerse.Item = {
    GELATO = Isaac.GetItemIdByName("Gelato"),
    DODGEBALL = Isaac.GetItemIdByName("Dodgeball"),
    A_BALL = Isaac.GetItemIdByName("A Ball"),
    GODS_GIFT = Isaac.GetItemIdByName("God's Gift"),
    SKELETAL_FIGURE = Isaac.GetItemIdByName("Skeletal Figure"),
    TOOTHPASTE = Isaac.GetItemIdByName("Toothpaste"),
}

CrossVerse.PassiveItems = {
    CollectibleType.COLLECTIBLE_GELATO,
    CollectibleType.GODS_GIFT,
    CollectibleType.SKELETAL_FIGURE,
}

CrossVerse.Actives = {
    CollectibleType.COLLECTIBLE_DODGEBALL,
    CollectibleType.COLLECTIBLE_A_BALL
}

CrossVerse.ThrowableStuff = {}
CrossVerse.ThrowableStuff[CrossVerse.Item.DODGEBALL] = 'throw'
CrossVerse.ThrowableStuff[CrossVerse.Item.A_BALL] = 'throw'
--OOOOH I WONDER WHAT MOD THIS IS LIKE (YOU CANT GUESS CAN YOU???) yeah thanks community remix