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
    CrossVerse.Item.GELATO,
    CrossVerse.Item.GODS_GIFT,
    CrossVerse.Item.SKELETAL_FIGURE,
}

CrossVerse.Actives = {
    CrossVerse.Item.DODGEBALL,
    CrossVerse.Item.A_BALL
}

CrossVerse.ThrowableStuff = {}
CrossVerse.ThrowableStuff[CrossVerse.Item.DODGEBALL] = 'throw'
CrossVerse.ThrowableStuff[CrossVerse.Item.A_BALL] = 'throw'
--OOOOH I WONDER WHAT MOD THIS IS LIKE (YOU CANT GUESS CAN YOU???) yeah thanks community remix