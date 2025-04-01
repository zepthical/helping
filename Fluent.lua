local Fluent = loadstring(game:HttpGet("https://github.com/stevex26/Fluent/releases/latest/download/source.lua"))()

-- Create the window
local Window = Fluent:CreateWindow({
    Title = "My Fluent UI",
    SubTitle = "Fluent UI Example",
    TabWidth = 160
})

-- Add tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Add a toggle
local Toggle = Tabs.Main:AddToggle({
    Title = "My Toggle",
    Description = "This is a toggle example",
    Default = false,
    Callback = function(state)
        if state then
            print("Toggle On")
            Fluent:Notify({
                Title = "Toggle Status",
                Content = "Toggle is now ON",
                Duration = 2
            })
        else
            print("Toggle Off")
            Fluent:Notify({
                Title = "Toggle Status",
                Content = "Toggle is now OFF",
                Duration = 2
            })
        end
    end
})

-- Add a button
local Button = Tabs.Main:AddButton({
    Title = "Click Me",
    Description = "This is a button example",
    Callback = function()
        Fluent:Notify({
            Title = "Button Clicked",
            Content = "You clicked the button!",
            Duration = 2
        })
    end
})

-- Show the UI
Window:SelectTab(Tabs.Main)
