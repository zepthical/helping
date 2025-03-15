local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/alexc01/Roblox-Scripts/0e4b4b3/Rayfield%20v1.0.6.lua"))()

local Window = Rayfield:CreateWindow({ 
Name = "🍪 | Cookie Hub DEV", 
Icon = 0,
LoadingTitle = "CookieHub DEV", 
LoadingSubtitle = "by Zepthical",
Theme = "Default",
DisableRayfieldPrompts = false,
DisableBuildWarnings = false,
ConfigurationSaving = {
Enabled = true,
FolderName = nil,
FileName = "sigma.lua"
}, 
Discord = {
Enabled = false,
Invite = "noinvitelink", 
RememberJoins = true }, 
KeySystem = false, })

local function Reset()
local Char = getCharacter() 
local Rod = Char:FindFirstChildOfClass("Tool")
if Rod and Rod:FindFirstChild("events")
and Rod.events:FindFirstChild("reset")
then Rod.events.reset:FireServer()
end
end

local function Cast()
local Char = getCharacter() 
local Rod = Char:FindFirstChildOfClass("Tool")
if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then 
Rod.events.cast:FireServer(100, 1)
end
end

local function Reel()
task.wait(0.15) 
local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
local reelGui = PlayerGui and PlayerGui:FindFirstChild("reel") 
if reelGui and reelGui:FindFirstChild("bar") then
local bar = reelGui:FindFirstChild("bar") local playerbar = bar:FindFirstChild("playerbar")
if playerbar then 
playerbar.Size = UDim2.new(1, 0, 1, 0)
task.wait(0.01) 
ReplicatedStorage.events.reelfinished:FireServer(100, true)
end 
end 
end

local MainTab = Window:CreateTab("Main", 124714113910876)

Rayfield:Notify({ Title = "Welcome to Cookie Hub!", Content = "Enjoy Your Scripts!", Duration = 6.5, Image = 124714113910876, })

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game: GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")

local function getCharacter()
return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local Char = getCharacter()
local Backpack = LocalPlayer:FindFirstChild("Backpack")

_G.AutoCast = false
_G.AutoShake = false
_G.AutoReel = false
_G.FreezeCharacter = false
_G.InstantShake = false
_G.AutoDropBobber = false
_G.InstantReel = false

local CharSection = MainTab:CreateSection("Character")

MainTab:CreateToggle({
Name = "Freeze Character",
Callback = function(v) 
_G.FreezeCharacter = v spawn(function()
while _G.FreezeCharacter do
Char = getCharacter() 
if Char and Char:FindFirstChild("HumanoidRootPart") then
Char.HumanoidRootPart.Anchled = true end task.wait(0.1)
end
Char = getCharacter()
if Char and Char:FindFirstChild("HumanoidRootPart") then
Char.HumanoidRootPart.Anchled = false
end
end)
end 
})

local MainSection = MainTab:CreateSection("Main")

MainTab:CreateToggle({
Name = "Auto Cast",
Callback = function(v)
_G.AutoCast = v spawn(function()
while _G.AutoCast do
task.wait(0.1) Char = getCharacter()
local Rod = Char:FindFirstChildOfClass("Tool")
if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
if _G.FreezeCharacter then
Char.HumanoidRootPart.Anchled = false
end 
Rod.events.cast:FireServer(100, 1)
if _G.FreezeCharacter then
Char.HumanoidRootPart.Anchled = true
end 
end 
end
end)
end
})

MainTab:CreateToggle({
Name = "Auto Shake [Enable with Instant Shake]", 
Callback = function(v)
_G.AutoShake = v 
spawn(function()
while _G.AutoShake do 
task.wait(0.01) 
local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
local shakeUI = PlayerGui and PlayerGui:FindFirstChild("shakeui") 
if shakeUI and shakeUI.Enabled then
local safezone = shakeUI:FindFirstChild("safezone") 
if safezone then
local button = safezone:FindFirstChild("button") 
if button and button:IsA("ImageButton") and button.Visible then 
GuiService.SelectedObject = button VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game) end end end end end) end )

MainTab:CreateToggle({
Name = "Auto Reel", 
Callback = function(v)
_G.AutoReel = v 
spawn(function()
while _G.AutoReel do 
Reel() task.wait(0.01)
end
end)
end )

MainTab:CreateToggle({
Name = "Auto Drop Bobber",
Callback = function(v)
_G.AutoDropBobber = v spawn(function()
while _G.AutoDropBobber do 
task.wait(0.1)
Char = getCharacter() 
local Rod = Char:FindFirstChildOfClass("Tool") if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
if _G.FreezeCharacter then 
Char.HumanoidRootPart.Anchled = false 
end
Rod.events.cast:FireServer(100, 1)
if _G.FreezeCharacter then 
Char.HumanoidRootPart.Anchled = true
end
end 
end
end)
end })

local Divider = MainTab:CreateDivider()

MainTab:CreateToggle({
Name = "Instant Shake [Enable with Auto Shake]",
Callback = function(v)
_G.InstantShake = v 
spawn(function()
while _G.InstantShake do
local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
local shakeUI = PlayerGui and PlayerGui:FindFirstChild("shakeui")
if shakeUI and shakeUI.Enabled then 
local safezone = shakeUI:FindFirstChild("safezone") 
if safezone then local button = safezone:FindFirstChild("button")
if button and button:IsA("ImageButton") and button.Visible then 
GuiService.SelectedObject = button VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
end
end
end 
task.wait(0.01)
end 
end 
end 
})

MainTab:CreateToggle({ Name = "Instant Reel",
Callback = function(v)
_G.InstantReel = v spawn(function() 
while _G.InstantReel do
task.wait(0.1)
Reel() 
task.wait(0.2)
Reel()
task.wait(0.3)
Reel() 
task.wait(0.4) 
Reel() 
task.wait(0.5)
Reel() 
end 
end) 
end 
})

local AutoTab = Window:CreateTab("Auto", 124714113910876)
local AutoSection = AutoTab:CreateSection("Auto")

AutoTab:CreateToggle({ Name = "Auto Sell",
Callback = function(v)
_G.AutoSell = v spaw
n(function() 
while _G.AutoSell do
game:GetService("ReplicatedStorage").events.SellAll:FireServer()
task.wait(1.5)
end 
end) 
end
})
