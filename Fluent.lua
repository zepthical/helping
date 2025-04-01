task.wait(1) -- Wait for executor to be ready

local success, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ForgeNet/Fluent/main/source.lua"))()
end)

if not success or not Fluent then
    print("Failed to load Fluent UI. Check the URL or your executor.")
    return
end

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
        print(state and "Toggle On" or "Toggle Off")
    end
})

-- Show the UI
Window:SelectTab(Tabs.Main)
