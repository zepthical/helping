local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("My Kavo UI", "DarkTheme")

local MainTab = Window:NewTab("Main")

local MainSection = MainTab:NewSection("Main Section")

MainSection:NewToggle("Example Toggle", "This is a toggle", function(state)
    print("Toggle State:", state)
end)
