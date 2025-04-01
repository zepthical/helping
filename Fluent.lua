local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zepthical/Vayfield/main/kavo.lua"))()
local Window = Library.CreateLib("My Kavo UI", "DarkTheme")
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Main Features")

 -- Define essential variables
 local Players = game:GetService("Players")
 local LocalPlayer = Players.LocalPlayer
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
 local VirtualInputManager = game:GetService("VirtualInputManager")
 local GuiService = game:GetService("GuiService")
 
 --------------------------------------------------------------------

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

local function Shake1()
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

--------------------------------------------------------------------


 -- Ensure Character Loads Properly
 local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
 end
 
 local Char = getCharacter()
 local Backpack = LocalPlayer:FindFirstChild("Backpack")
 
 -- Auto Variables
 _G.AutoCast = false
 _G.AutoShake = false
 _G.AutoReel = false
 _G.FreezeCharacter = false
 _G.AutoDropBobber = false
 _G.InstantReel = false

local function getRod()
    local Char = game.Players.LocalPlayer.Character
    if not Char then return nil end
    return Char:FindFirstChildOfClass("Tool")
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
    -- Ensure Char is valid before trying to reset
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

----------

MainSection:NewToggle("Auto Cast", "Cast for you", function(state)
    G.AutoCast = state
        spawn(function()
            while _G.AutoCast do
                task.wait(1)
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("casted") then
                    if Rod.values.casted.Value == false then
                        Cast()
                    end
                else
                 warn("rod is missing egypt properties.")
            end
        end
    end)
end)

MainSection:NewToggle("Auto Shake", "Shake for you", function(state)
    _G.AutoShake = state
    while G.AutoShake do
        Shake()
        Shake()
        task.wait(0.1)
    end
end)

MainSection:NewToggle("Auto Reel", "Reel for you", function(state)
    _G.AutoReel = state
    if state then
        task.spawn(function()
            while _G.AutoReel do
                task.wait(0.1)  -- Adjust the wait time to prevent too much strain on the server
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then  -- Only reel if fish is biting
                        task.wait(1.85)  -- Adjusted wait time between actions (for realism)
                        Reel()  -- Assuming this function is correctly defined elsewhere
                    end
                end
            end
        end)
    else
        _G.AutoReel = false  -- Ensuring it stops if the toggle is turned off
    end
end)
