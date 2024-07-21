local mod = CrossVerse

local BB = Isaac.GetChallengeIdByName("Dodge the Ball!")
local frick = {}
--mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function(continued)
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, function(_, tear)
if Isaac.GetChallenge() == BB then
    local player = Isaac.GetPlayer()
    mod:DodgeballShoot(player)
    tear:Remove()

end
end)
--end)