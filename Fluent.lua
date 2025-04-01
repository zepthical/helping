local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "My UI",
    SubTitle = "Fluent UI Example",
    TabWidth = 160
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Ensure Fluent UI is ready before adding elements
task.wait(0.1)

local Toggle = Tabs.Main:AddToggle({
    Title = "Toggle", 
    Description = "Toggle description",
    Default = false,
    Callback = function(state)
        if state then
            print("Toggle On")
        else
            print("Toggle Off")
        end
    end
})
