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

while _G.Cast do
  pcall(function()
  for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
      if v:IsA("Tool") and v.Name:lower():find("rod") then
        if v:FindFirstChild("events") and v.events:FindFirstChild("cast") then
          if v:FindFirstChild("values") and v.values:FindFirstChild("casted") and v.values.casted.Value == false then
          v.events.cast:FireServer(100, 1)
          else
            print("it already casted")
          end
        end
      end
    end
  end)
  task.wait(0.5)
end

while _G.Shake do
  local PlayerGui = LocalPlayerL:FindFirstChild("PlayerGui")
  local shakeui = PlayerGui and PlayerGui:FindFirstChild("shakeui")

  if shakeui and shakeui.Enabled = true then
    local safezone = shakeUI:FindFirstChild("safezone")
    if safezone then
        local button = safezone:FindFirstChild("button")
        if button and button:IsA("ImageButton") and button.Visible then
          GuiService.SelectedObject = button
          VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
          VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
          task.wait()
       end
    end
  end
end

while _G.Reel do
  pcall(function()
    for i, v in pairs(LocalPlayer.Character:GetChildren()) do
      if v:IsA("Tool") and v.Name:lower():find("rod") then
        if v:FindFirstChild("events") and v.events:FindFirstChild("reelfinished") then
          local reel = v.events.reelfinished
          if v:FindFirstChildA("values") and v.values:FindFirstChild("bite") and v.values.bite.Value == true then
            for i, f in pairs(LocalPlayer:GetChildren()) do
              if f:IsA("ScreenGui") and f.Name == "reel" then
                  if f:FindFirstChild("bar") and f.bar:FindFirstChild("playerbar") then
                    f.bar.playerbar.Size = UDim2.new(1, 0, 1, 0)
                    f.bar:Destroy()
                    reel:FireServer(100, true)
                    task.wait(0.5)
                    ReplicatedStorage.packages.Net:FindFirstChild("RE/Backpack/Equip"):FireServer(v)
                    task.wait(0.2)
                    ReplicatedStorage.packages.Net:FindFirstChild("RE/Backpack/Equip"):FireServer(v)
                end
              end
            end
          end
        end
      end
    end
  end)
  task.wait()
end
