local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fizch",
    SubTitle = "by Zepth",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

 local Players = game:GetService("Players")
 local LocalPlayer = Players.LocalPlayer
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
 local VirtualInputManager = game:GetService("VirtualInputManager")
 local GuiService = game:GetService("GuiService")

-- Functions --


local function Shake()
   local PlayerGUI = LocalPlayer:FindFirstChild("PlayerGui")
local shakeUI = PlayerGUI and PlayerGUI:FindFirstChild("shakeui")

if shakeUI and shakeUI.Enabled then
    local safezone = shakeUI:FindFirstChild("safezone")
    if safezone then
        local button = safezone:FindFirstChild("button")
        if button and button:IsA("ImageButton") and button.Visible then
          GuiService.SelectedObject = button
          VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
          VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
       end
    end
  end
end

local function getRod()
    local Char = LocalPlayer.Character
    if Char then
        return Char:FindFirstChildOfClass("Tool")
    end
    return nil
end

local function Cast()
    local Char = game:GetService("Players").LocalPlayer.Character
    if not Char then return end

    local Rod = Char:FindFirstChildOfClass("Tool") -- Finds the fishing rod
    if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
        Rod.events.cast:FireServer(100, 1)
    else
        warn("Rod or cast event not found!")
    end
end

local function Reel()
    -- Wait a short delay to ensure everything is loaded
    task.wait(0.2)

    -- Search through the player's GUI for the reel UI elements
    for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == "reel" then
            local bar = v:FindFirstChild("bar")
            if bar and ReplicatedStorage:FindFirstChild("events") then
                local playerbar = bar:FindFirstChild("playerbar")
                if playerbar then
                    -- Fill the player bar to simulate reeling
                    playerbar.Size = UDim2.new(1, 0, 1, 0)

                    -- Check for the "reelfinished" event and fire it
                    local reelFinished = ReplicatedStorage:FindFirstChild("events") and ReplicatedStorage.events:FindFirstChild("reelfinished")
                    if reelFinished then
                        reelFinished:FireServer(100, true)
                    else
                        warn("reelfinished event not found!")					end
                else
                    warn("Playerbar not found!")
                end
            else
                warn("Bar or events not found!")
            end
        end
    end
end

local function Reset()
    local Rod = getRod()
    if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("reset") then
        task.wait(0.1)
        Rod.events.reset:FireServer() -- Trigger the reset event
        -- Equip the rod again if required
        game:GetService("ReplicatedStorage").packages.Net:FindFirstChild("RE/Backpack/Equip"):FireServer(Rod)
        task.wait(0.1)
        game:GetService("ReplicatedStorage").packages.Net:FindFirstChild("RE/Backpack/Equip"):FireServer(Rod)
    else
        warn("Rod or reset event not found!")
    end
end

---------------

-- Auto var --

 _G.AutoCast = false
 _G.AutoShake = false
 _G.AutoReel = false
 _G.FreezeCharacter = false
 _G.AutoDropBobber = false
 _G.InstantReel = false

--------------

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Main:AddSection("Main")

local Toggle = Tab:AddToggle("Main", 
{
    Title = "Auto Cast", 
    Description = "Cast For you",
    Default = false,
    Callback = function(state)
	    _G.AutoCast = state

      while _G.AutoCast do
        task.wait(1)
                
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("casted") then
                    if Rod.values.casted.Value == false then
                        Cast()
                  end
              else
                    warn("Rod is missing necessary properties.")
            end
        task.wait(0.1)
      end 
    end 
})

local Toggle = Tab:AddToggle("Main", 
{
    Title = "Auto Shake", 
    Description = "Shake for you",
    Default = false,
    Callback = function(state)
	    _G.AutoShake = state

      while G.AutoShake do
        Shake()
        Shake()
        task.wait(0.1)
      end
    end 
})

local Toggle = Tab:AddToggle("Main", 
{
    Title = "Auto Reel", 
    Description = "Reel for you",
    Default = false,
    Callback = function(state)
        _G.AutoReel = state

        spawn(function()
            while _G.AutoReel do
                task.wait(1) -- Prevent excessive calls

                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then
                        task.wait(1.85)
                        Reel()
                        task.wait(0.5)
                        Reset() -- Fix missing parenthesis

                        -- Ensure the loop waits until the bite value resets
                        repeat task.wait(0.1) until not Rod.values.bite.Value
                    end
                end
            end
        end)
    end 
})
