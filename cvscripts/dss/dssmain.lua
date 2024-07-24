local mod = CrossVerse
local game = Game()
local json = require("json")

local DSSModName = "CrossVerse Mod DSS Menu"

local DSSCoreVersion = 7

local MenuProvider = {}

function MenuProvider.SaveSaveData()
	CrossVerse.SaveManager:Save()
end

function MenuProvider.GetPaletteSetting()
	return CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuPalette
end

function MenuProvider.SavePaletteSetting(var)
	CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuPalette = var
end

function MenuProvider.GetHudOffsetSetting()
	return Options.HUDOffset * 10
end

function MenuProvider.SaveHudOffsetSetting(var)
end

function MenuProvider.GetGamepadToggleSetting()
	return CrossVerse.SaveManager.GetDeadSeaScrollsSave().GamepadToggle
end

function MenuProvider.SaveGamepadToggleSetting(var)
	CrossVerse.SaveManager.GetDeadSeaScrollsSave().GamepadToggle = var
end

function MenuProvider.GetMenuKeybindSetting()
	return CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuKeybind
end

function MenuProvider.SaveMenuKeybindSetting(var)
	CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuKeybind = var
end

function MenuProvider.GetMenuHintSetting()
	return CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuHint
end

function MenuProvider.SaveMenuHintSetting(var)
	CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuHint = var
end

function MenuProvider.GetMenuBuzzerSetting()
	return CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuBuzzer
end

function MenuProvider.SaveMenuBuzzerSetting(var)
	CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenuBuzzer = var
end

function MenuProvider.GetMenusNotified()
	return CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenusNotified
end

function MenuProvider.SaveMenusNotified(var)
	CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenusNotified = var
end

function MenuProvider.GetMenusPoppedUp()
	return CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenusPoppedUp
end

function MenuProvider.SaveMenusPoppedUp(var)
	CrossVerse.SaveManager.GetDeadSeaScrollsSave().MenusPoppedUp = var
end
local DSSInitializerFunction = include("cvscripts.dss.dssmenucore")
local dssmod = DSSInitializerFunction(DSSModName, DSSCoreVersion, MenuProvider)


local dmdirectory = {
    main = {
        title = 'crossverse',

        buttons = {
            {str = 'resume game', action = 'resume'},
            {str = 'settings', dest = 'settings', tooltip = {strset = {'---','play around', 'with what', 'you like and', 'do not like', '---'}}},
            dssmod.changelogsButton,
            {str = '', fsize = 2, nosel = true},
            {str = 'a mod concieved', fsize = 2, nosel = true},
            {str = 'by the one and only', fsize = 2, nosel = true},
            {str = 'quaquao (mulch lover)', fsize = 2, nosel = true},
            {str = '', fsize = 2, nosel = true},
            {str = 'check out our', fsize = 2, nosel = true},
            {str = 'discord in the', fsize = 2, nosel = true},
            {str = 'mod page!', fsize = 2, nosel = true},
        },
        tooltip = dssmod.menuOpenToolTip,
    },

    settings =  {
            title = 'settings',
                buttons = {

                    {str = 'corssverse button',      
                    choices = {'enabled', 'disabled'},
                    variable = 'exampledata',
                    cursoroff = Vector(6, 0),
                    setting = 1,

                    load = function()
                        if CrossVerse.exampledata then
                            return 1
                        else
                            return 2
                        end                    
                    end,

                    store = function(var)
                        mod.exampledata = var
                    end,

                    tooltip = {strset = {'crossverse is', 'gonna be the', 'best mod', 'ever!!!'}}
                    }
                }
    },
}

local dmdirectorykey = {
    Item = dmdirectory.main,
    Main = 'main',
    Idle = false,
    MaskAlpha = 1,
    Settings = {},
    SettingsChanged = false,
    Path = {},
}

DeadSeaScrollsMenu.AddMenu("Crossverse", {Run = dssmod.runMenu, Open = dssmod.openMenu, Close = dssmod.closeMenu, Directory = dmdirectory, DirectoryKey = dmdirectorykey})



function mod:IsSettingOn(setting)
	if setting == 1 then
		return true
	else
		return false
	end
end