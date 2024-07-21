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

--thanks community remix
function CrossVerse.TearVec(velocity, speed)
    if velocity:Length() < speed then
        velocity = velocity:Resized(speed)
    end
    return velocity
end

--THANKS FIEND FOLIOOOOOO
function mod:SnapVector(angle, snapAngle)
	local snapped = math.floor(((angle:GetAngleDegrees() + snapAngle/2) / snapAngle)) * snapAngle
	local snappedDirection = angle:Rotated(snapped - angle:GetAngleDegrees())
	return snappedDirection
end

--thakns fiend folio (ill redo this later dw)
function mod:HoldStuffUp(player, data)
    local sfx = SFXManager()
	
	--Holding stuff up
	if data.holdingCrossItem then
		if player:IsExtraAnimationFinished() then
			data.holdingCrossItem = nil
			data.holdingCrossItemSlot = nil
		end
		local aim = player:GetAimDirection()
		local lockAngle
			if not (player:HasCollectible(CollectibleType.COLLECTIBLE_ANALOG_STICK) or data.firingSanguineHookShot) then
				if player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_KNIFE) then
					lockAngle = 45
				else
					lockAngle = 90
				end
			end
		if lockAngle then
			aim = mod:SnapVector(aim, lockAngle)
		end
		if data.holdingCrossItem == CollectibleType.COLLECTIBLE_DODGEBALL then
			mod:DodgeballShoot(player, data, aim)
		else
			if aim:Length() > 0.5 then
				data.holdingCrossItem = nil
				data.holdingCrossItemSlot = nil
				data.HoldingCrossItemBlankVisual = nil
			end
		end
	else
		data.holdingCrossItemSlot = nil
	end
end
--Prevents switching with schoolbag
mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, function(_, ent, hook, buttonaction)
	if hook == InputHook.IS_ACTION_TRIGGERED and buttonaction == ButtonAction.ACTION_DROP then
		if ent and ent.Type == 1 then
			if Input.IsActionTriggered(ButtonAction.ACTION_DROP, ent:ToPlayer().ControllerIndex) then
				local d = ent:GetData()
				if d.holdingCrossItem then
					return false
				end
			end
		end
	end
end, InputHook.IS_ACTION_TRIGGERED)

