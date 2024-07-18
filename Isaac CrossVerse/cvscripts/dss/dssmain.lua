local mod = CrossVerse
local game = Game()
local json = require("json")

local DSSModName = "CrossVerse Mod DSS Menu"

local DSSCoreVersion = 7

local MenuProvider = {}

function MenuProvider.SaveSaveData()
	mod:SaveModData()
end

function MenuProvider.GetPaletteSetting()
	return CrossVerse.savedata.MenuPalette
end

function MenuProvider.SavePaletteSetting(var)
	CrossVerse.savedata.MenuPalette = var
end

function MenuProvider.GetHudOffsetSetting()
	if not REPENTANCE then
		return CrossVerse.savedata.HudOffset
	else
		return Options.HUDOffset * 10
	end
end

function MenuProvider.SaveHudOffsetSetting(var)
	if not REPENTANCE then
		CrossVerse.savedata.HudOffset = var
	end
end

function MenuProvider.GetGamepadToggleSetting()
	return CrossVerse.savedata.GamepadToggle
end

function MenuProvider.SaveGamepadToggleSetting(var)
	CrossVerse.savedata.GamepadToggle = var
end

function MenuProvider.GetMenuKeybindSetting()
	return CrossVerse.savedata.MenuKeybind
end

function MenuProvider.SaveMenuKeybindSetting(var)
	CrossVerse.savedata.MenuKeybind = var
end

function MenuProvider.GetMenuHintSetting()
	return CrossVerse.savedata.MenuHint
end

function MenuProvider.SaveMenuHintSetting(var)
	CrossVerse.savedata.MenuHint = var
end

function MenuProvider.GetMenuBuzzerSetting()
	return CrossVerse.savedata.MenuBuzzer
end

function MenuProvider.SaveMenuBuzzerSetting(var)
	CrossVerse.savedata.MenuBuzzer = var
end

function MenuProvider.GetMenusNotified()
	return CrossVerse.savedata.MenusNotified
end

function MenuProvider.SaveMenusNotified(var)
	CrossVerse.savedata.MenusNotified = var
end

function MenuProvider.GetMenusPoppedUp()
	return CrossVerse.savedata.MenusPoppedUp
end

function MenuProvider.SaveMenusPoppedUp(var)
	CrossVerse.savedata.MenusPoppedUp = var
end
local DSSInitializerFunction = include("cvscripts.dss.dssmenucore")
local dssmod = DSSInitializerFunction(DSSModName, DSSCoreVersion, MenuProvider)


local dmdirectory = {
    main = {
        title = 'crossverse',

        buttons = {
            {str = 'resume game', action = 'resume'},
            {str = 'settings', dest = 'settings'},
            dssmod.changelogsButton,
            {str = '', fsize = 2, nosel = true},
            {str = 'a mod concieved', fsize = 2, nosel = true},
            {str = 'by the one and only', fsize = 2, nosel = true},
            {str = 'quaoquao (mulch lover)', fsize = 2, nosel = true},
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

                    {str = 'a button for crossverse',      
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

DeadSeaScrollsMenu.AddMenu("CrossVerse", {Run = dssmod.runMenu, Open = dssmod.openMenu, Close = dssmod.closeMenu, Directory = dmdirectory, DirectoryKey = dmdirectorykey})



function mod:IsSettingOn(setting)
	if setting == 1 then
		return true
	else
		return false
	end
end