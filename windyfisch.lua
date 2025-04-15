local Starhook, Flags = loadstring(game:HttpGet("https://raw.githubusercontent.com/LorisHost/Files/refs/heads/main/StarHookUI.lua"))()

local Window = Starhook:New({
    Size = UDim2.new(0, 600, 0, 450)
})


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")
local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Backpack = LocalPlayer:FindFirstChild("Backpack")


local MainPage = Window:Page({
    Name = "Main",
    Icon = "rbxassetid://6022668955"
})

local MainSection = MainPage:Section({
    Name = "Configs",
    Side = "left",
    Size = 200
})

--[[MainSection:Button({
    Name = "Press Me",
    Callback = function()
        print("Button Pressed!")
    end
})]]

MainSection:Toggle({
    Name = "Auto Cast",
    State = false,
    Callback = function(state)
        while state do
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
    end
})

MainSection:Toggle({
    Name = "Enable Feature",
    State = false,
    Callback = function(state)
      while state do
        local PlayerGui = LocalPlayerL:FindFirstChild("PlayerGui")
        local shakeui = PlayerGui and PlayerGui:FindFirstChild("shakeui")
      
        if shakeui and shakeui.Enabled = true then
          local safezone = shakeui:FindFirstChild("safezone")
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
    end
})

MainSection:Toggle({
    Name = "Auto Reel",
    State = false,
    Callback = function(state)
      while state do
        pcall(function()
          for i, v in pairs(LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.Name:lower():find("rod") then
              if v:FindFirstChild("events") and v.events:FindFirstChild("reelfinished") then
                local reel = v.events.reelfinished
                if v:FindFirstChild("values") and v.values:FindFirstChild("bite") and v.values.bite.Value == true then
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
    end
})

--[[MainSection:Slider({
    Name = "Adjust Value",
    Min = 0,
    Max = 100,
    State = 50,
    Callback = function(value)
        print("Slider Value:", value)
    end
})

MainSection:Textbox({
    Name = "Enter Text",
    Default = "Hello",
    Placeholder = "Type here...",
    Callback = function(text)
        print("User Input:", text)
    end
})

MainSection:Colorpicker({
    Name = "Pick a Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        print("Selected Color:", color)
    end
})

MainSection:List({
    Name = "Choose Option",
    Options = {"Option 1", "Option 2", "Option 3"},
    Default = "Option 1",
    Callback = function(option)
        print("Selected Option:", option)
    end
})

MainSection:Keybind({
    Name = "Set Keybind",
    Default = Enum.KeyCode.F,
    Callback = function(key)
        print("Key Pressed:", key.Name)
    end
})

local NestedSection = MainSection:Nest({
    Name = "Nested Controls"
})

NestedSection:Button({
    Name = "Nested Button",
    Callback = function()
        print("Nested Button Clicked!")
    end
})]]

Window:Seperator({
    Name = "UI Components"
})
