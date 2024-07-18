local mod = CrossVerse
local json = require("json")

CrossVerse.savedata = CrossVerse.savedata or {}

function CrossVerse.SaveModData()
    CrossVerse.savedata.config = {
        exampledata = CrossVerse.exampledata
    }
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