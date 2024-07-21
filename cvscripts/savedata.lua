local mod = CrossVerse
local json = require("json")
local game = Game()

CrossVerse.savedata = CrossVerse.savedata or {}

--this is specifically fiend folio style, thanks to the ppl in fiend folio who made the savedata stuff
function CrossVerse.getFieldInit(tab, ...) --we lvoe saving tables
	if not tab then error("Expected table! Got " .. type(tab)) end

	local keys = { ... }
	local default = table.remove(keys) -- last arg is always default val

	for i, key in ipairs(keys) do
		if not tab[key] then
			tab[key] = i < #keys and {} or default
		end
		tab = tab[key]
	end

	return tab
end

function CrossVerse.SaveModData()
    CrossVerse.savedata.config = {
        exampledata = CrossVerse.exampledata
    }

    --I WAS LOOKING FOR THIS THANK YOU FIEND FOLIO
    local psave = mod.getFieldInit(CrossVerse.savedata, 'run', 'playerSaveData', {})
	for i = 1, game:GetNumPlayers() do
		local p = Isaac.GetPlayer(i - 1)
		local data = p:GetData()

		local playerSave = {}
		if data.crossversedata then
			for key, val in pairs(data.crossversedata) do
				playerSave[key] = val
			end
		end

		psave[i] = playerSave
	end

    Isaac.SaveModData(mod, json.encode(CrossVerse.savedata))
end
function CrossVerse.LoadModData()
    if not mod:HasData() then
        CrossVerse.SaveModData()
        print("CrossVerse Data Initialized! Have a wonderful run!!")
    else
        CrossVerse.savedata = json.decode(mod:LoadData())

        local config = CrossVerse.savedata.config
        if config then
            CrossVerse.exampledata = config.exampledata or CrossVerse.exampledata
        end
    end
end

CrossVerse.LoadModData()

CrossVerse:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, function()
	Isaac.DebugString("PREGAMEEXITPRESAVE")
    CrossVerse.SaveModData()
	Isaac.DebugString("PREGAMEEXITPOSTSAVE")
    CrossVerse.gamestarted = false
end)

CrossVerse:AddCallback(ModCallbacks.MC_POST_GAME_END, function()
    CrossVerse.gamestarted = false
end)

CrossVerse:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, function()
    CrossVerse.getFieldInit(CrossVerse.savedata, 'run', {}).level = {}
    if CrossVerse.gamestarted then
        CrossVerse.SaveModData()
    end
end)

--end of fiend folio
