local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Backpack = LocalPlayer:FindFirstChild("Backpack")

_G.Shake = false
_G.Reel = false
_G.Cast = false

-- 🟡 LOOP 1: CAST
task.spawn(function()
    while true do
        pcall(function()
            for i, v in pairs(LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v.Name:lower():find("rod") then
                    if v:FindFirstChild("events") and v.events:FindFirstChild("cast") then
                        if v:FindFirstChild("values") and v.values:FindFirstChild("casted") and v.values.casted.Value == false then
                            v.events.cast:FireServer(100, 1)
                        else
                            print("Already casted")
                        end
                    end
                end
            end
        end)
        task.wait(0.5)
    end
end)

-- 🟡 LOOP 2: SHAKE
task.spawn(function()
    while true do
        pcall(function()
            local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui") -- 🔧 FIXED: was "LocalPlayerL"
            local shakeui = PlayerGui and PlayerGui:FindFirstChild("shakeui")

            if shakeui and shakeui.Enabled == true then -- 🔧 FIXED: was '=' instead of '=='
                local safezone = shakeui:FindFirstChild("safezone")
                if safezone then
                    local button = safezone:FindFirstChild("button")
                    if button and button:IsA("ImageButton") and button.Visible then
                        GuiService.SelectedObject = button
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                end
            end
        end)
        task.wait()
    end
end)

-- 🟡 LOOP 3: REEL
task.spawn(function()
    while true do
        pcall(function()
            local args = {
    [1] = 100,
    [2] = true
}

game:GetService("ReplicatedStorage").events:FindFirstChild("reelfinished "):FireServer(unpack(args))

        end)
        task.wait()
    end
end)
