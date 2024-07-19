--put api here
local mod = CrossVerse

function CrossVerse.Unlock(unlock, force)
    local gamedata = Isaac.GetPersistentGameData()
    if not force then
        if not gamedata:Unlocked(force) then
            gamedata:TryUnlock(unlock)
        end
    else
        gamedata:TryUnlock(unlock) 
    end
end

--cell blocks go teehee