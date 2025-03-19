local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/zepthical/Vayfield/refs/heads/main/README.md'))()
 
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
       FileName = "cdevtest.lua"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
 })


 
 local MainTab = Window:CreateTab("Main", 124714113910876)
 
 
 Rayfield:Notify({
    Title = "Welcome to Cookie Hub!",
    Content = "Don't forget to save the configs!",
    Duration = 6.5,
    Image = 124714113910876,
 })
 
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

local function Shake2()
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
 
 local CharSection = MainTab:CreateSection("Character")
 
 MainTab:CreateToggle({
    Name = "Freeze Character",
    Flag = "FChar",
    Callback = function(v)
       _G.FreezeCharacter = v
       spawn(function()
          while _G.FreezeCharacter do
             Char = getCharacter()
             if Char and Char:FindFirstChild("HumanoidRootPart") then
                Char.HumanoidRootPart.Anchored = true
             end
             task.wait(0.1)
          end
          -- Unfreeze when toggled off
          Char = getCharacter()
          if Char and Char:FindFirstChild("HumanoidRootPart") then
             Char.HumanoidRootPart.Anchored = false
          end
       end)
    end
 })

MainTab:CreateToggle({
   Name = "Auto Equip Rod",
   CurrentValue = false,
   Flag = "AER",
   Callback = function(Value)
     local Rod = Char:FindFirstChildOfClass("Tool")
    if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
        
    else
        warn("Rod or cast event not found!")
     end
   end,
})


 local MainSection = MainTab:CreateSection("Main")
 
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


MainTab:CreateToggle({
    Name = "Auto Cast",
    Flag = "ACast",
    Callback = function(v)
        _G.AutoCast = v
        spawn(function()
            while _G.AutoCast do
                task.wait(0.1)
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
    end
})



 
 MainTab:CreateToggle({
    Name = "Auto Shake",
    Flag = "AShake",
    Callback = function(v)
    _G.AutoShake = v
       spawn(function()
          while _G.AutoShake do
             Shake()
             Shake2()
             task.wait(0.01)
          end
       end)
    end
 })

local function Reel()
      task.wait(0.15)
      for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
      if v:IsA("ScreenGui") and v.Name == "reel" then
       local bar = v:FindFirstChild("bar")
       if bar and ReplicatedStorage:FindFirstChild("events") then
         local playerbar = bar:FindFirstChild("playerbar")
         if playerbar then
           playerbar.Size = UDim2.new(1, 0, 1, 0)
           local reelFinished = ReplicatedStorage.events:FindFirstChild("reelfinished")
           if reelFinished then
             reelFinished:FireServer(100, true)
          end   
        end
      end
    end
  end
end


MainTab:CreateToggle({
    Name = "Auto Reel",
    Flag = "AReel",
    Callback = function(v)
        _G.AutoReel = v
        spawn(function()
            while _G.AutoReel do
                task.wait(0.1)
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then 
                        Reel()
                    end
                end
            end
        end)
    end
})

 
 
 
 MainTab:CreateToggle({
    Name = "Auto Drop Bobber",
    Flag = "DropBob",
    Callback = function(v)
       _G.AutoDropBobber = v
       spawn(function()
          while _G.AutoDropBobber do
             task.wait(0.1) -- Adjust delay as needed
             Char = getCharacter()
             local Rod = Char:FindFirstChildOfClass("Tool")
             if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
                
                if _G.FreezeCharacter then
                   Char.HumanoidRootPart.Anchored = false
                end
                
                Rod.events.cast:FireServer(100, 1)

                if _G.FreezeCharacter then
                   Char.HumanoidRootPart.Anchored = true
                end
             end
          end
       end)
    end
 })
 
 local Divider = MainTab:CreateDivider()

 local function Reset()
  local Rod = Char and Char:FindFirstChildOfClass("Tool")
  if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("reset") then
     task.wait(0.1)
     Rod.events.reset:FireServer()
  end                              
end


MainTab:CreateToggle({
    Name = "Instant Reel[In-dev]",
    Flag = "InsReel",
    Callback = function(v)
        _G.InstantReel = v
        spawn(function()
            while _G.InstantReel do
                task.wait(0.1)
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then  
                        Reset()
                        task.wait(0.01)
                        Reset()
                        task.wait(0.01)

                        local PlayerGUI = LocalPlayer:FindFirstChild("PlayerGui")
                        local reelUI = PlayerGUI and PlayerGUI:FindFirstChild("reel")
                        if reelUI then
                            local bar = reelUI:FindFirstChild("bar")
                            if bar then
                                local playerbar = bar:FindFirstChild("playerbar")
                                if playerbar then
                                    playerbar.Size = UDim2.new(1, 0, 1, 0)
                                    task.wait(0.01)
                                    local reelFinished = ReplicatedStorage:FindFirstChild("events") and ReplicatedStorage.events:FindFirstChild("reelfinished")
                                    if reelFinished then
                                        reelFinished:FireServer(100, true)
                                        task.wait(0.1)
                                        reelFinished:FireServer(100, true)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
})
 
 
 
 local AutoTab = Window:CreateTab("Auto", 124714113910876)
 local AutoSection = AutoTab:CreateSection("Auto")
 
AutoTab:CreateToggle({
    Name = "Auto Sell",
    Flag = "ASell",
    Callback = function(v)
        _G.AutoSell = v
        spawn(function()
            while _G.AutoSell do
                local SellAllEvent = game:GetService("ReplicatedStorage").events:FindFirstChild("SellAll")
                if SellAllEvent then
                    SellAllEvent:InvokeServer()
                end
                task.wait(1.5)
            end
        end)
    end
})

-- Create Teleport Tab
local TeleportTab = Window:CreateTab("Teleport")

-- Create Section
local IslandsSection = TeleportTab:CreateSection("Islands")

-- Island List
local Islands = {
    "Moosewood", "Statue", "Forsaken", "RoslitBay", "GrandReef", "AncientArchivesDoor", 
    "Altar", "DesolateDeep", "SnowCap", "Mushgrove", "CalmZone", "TheDepths", 
    "ForsakenShores", "Terrapin", "Sunstone", "TheArch", "Brine", "CraftTable", 
    "Spike", "Vertigo", "Ancient", "NorthEXP", "ChallengerDeep", "VolcanicVent", 
    "AbyssalZenith", "Atlantis", "EtherealPuzzle", "FinalPuzNorthEXP", "None"
}

-- Coordinates Table
local coordinates = {
    Moosewood = Vector3.new(381, 135, 240),
    Statue = Vector3.new(17.7, 160, -1044),
    Forsaken = Vector3.new(-2500, 134, 1548),
    RoslitBay = Vector3.new(-1447, 133, 672),
    GrandReef = Vector3.new(-3565, 150, 535),
    AncientArchivesDoor = Vector3.new(-3155, 754, 2193),
    Altar = Vector3.new(-1296, 805, 298),
    DesolateDeep = Vector3.new(-1510, 234, 2852),
    SnowCap = Vector3.new(-2648, 142, 2521),
    Mushgrove = Vector3.new(-2501, 131, 720),
    CalmZone = Vector3.new(-4255, 11201, 1775),
    TheDepths = Vector3.new(-568, 704, 1230),
    ForsakenShores = Vector3.new(-2498, 136, 1624),
    Terrapin = Vector3.new(-146, 145, 1914),
    Sunstone = Vector3.new(-932, 131, 1118),
    TheArch = Vector3.new(-998, 131, 1237),
    Brine = Vector3.new(-1794, 142, 3302),
    CraftTable = Vector3.new(-3159, 745, 1684),
    Spike = Vector3.new(-1254, 137, 1554),
    Vertigo = Vector3.new(-112, 515, 1040),
    Ancient = Vector3.new(-6055, 195, 278),
    NorthEXP = Vector3.new(-19990, 1136, 5536),
    ChallengerDeep = Vector3.new(-735, 3360, 1684),
    VolcanicVent = Vector3.new(-3181, 2036, 4017),
    AbyssalZenith = Vector3.new(-13550, 11050, 123),
    Atlantis = Vector3.new(-4263, -603, 1829),
    EtherealPuzzle = Vector3.new(-4122, 602, 1820),
    FinalPuzNorthEXP = Vector3.new(19963, 1137, 5401)
}

-- Teleport Dropdown
TeleportTab:CreateDropdown({
    Name = "Select Island",
    Options = Islands,
    CurrentOption = {"None"},
    MultipleOptions = false,
    Callback = function(Options)
        -- Ensure the dropdown returns a valid option
        local selectedIsland = Options[1]
        if not selectedIsland then
            warn("No island selected!")
            return
        end

        print("Selected Island:", selectedIsland)

        -- Get Player and Character
        local Player = game.Players.LocalPlayer
        if not Player then
            warn("Player not found!")
            return
        end

        -- Ensure Character is loaded
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local HRP = Character and Character:FindFirstChild("HumanoidRootPart")

        if not HRP then
            warn("HumanoidRootPart not found! Try again.")
            return
        end

        -- If "None" is selected, save current position
        if selectedIsland == "None" then
            coordinates["None"] = HRP.Position
            print("Saved current position as 'None':", coordinates["None"])
            return
        end

        -- Check if the island has valid coordinates
        if coordinates[selectedIsland] then
            print("Teleporting to:", selectedIsland, coordinates[selectedIsland])
            HRP.CFrame = CFrame.new(coordinates[selectedIsland]) -- Teleport player
        else
            warn("No coordinates found for the selected island!")
        end
    end
})


local MiscTab = Window:CreateTab("Misc")
local LPlayerSection = MiscTab:CreateSection("LocalPlayer")

-- WalkSpeed Input with Number Validation
MiscTab:CreateInput({
   Name = "WalkSpeed",
   CurrentValue = "16",
   PlaceholderText = "Value",
   RemoveTextAfterFocusLost = false,
   Flag = "WalkSpeed",
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
      else
         warn("Invalid WalkSpeed value!")
      end
   end,
})

-- JumpPower Input with Number Validation
MiscTab:CreateInput({
   Name = "JumpPower",
   CurrentValue = "50",
   PlaceholderText = "Value",
   RemoveTextAfterFocusLost = false,
   Flag = "JumpPower",
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
      else
         warn("Invalid JumpPower value!")
      end
   end,
})

-- NoClip Toggle with Proper Loop Handling
MiscTab:CreateToggle({
    Name = "NoClip",
    Callback = function(v)
        _G.NoClip = v
        if _G.NoClip then
            local function NoClipLoop()
                while _G.NoClip and task.wait() do
                    local Character = game.Players.LocalPlayer.Character
                    if Character then
                        for _, v in pairs(Character:GetDescendants()) do
                            if v:IsA("BasePart") and v.CanCollide then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            end
            spawn(NoClipLoop) -- Start NoClip when enabled
        else
            local Character = game.Players.LocalPlayer.Character
            if Character then
                for _, v in pairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
})

-- Ensure "Resources" exist before accessing
local Player = game.Players.LocalPlayer
local Character = Player and Player.Character
local Resources = Character and Character:FindFirstChild("Resources")
local gas = Resources and Resources:FindFirstChild("gas")
local oxygen = Resources and Resources:FindFirstChild("oxygen")
local peaksoxygen = Resources and Resources:FindFirstChild("oxygen(peaks)")
local temp = Resources and Resources:FindFirstChild("temperature")
local heat = Resources and Resources:FindFirstChild("temperature(heat)")

-- Toggle for Disabling Gas
MiscTab:CreateToggle({
   Name = "Disable Gas",
   CurrentValue = false,
   Flag = "gas", 
   Callback = function(Value)
      if gas then
         gas.Disabled = Value
      else
         warn("Gas not found!")
      end
   end,
})

-- Toggle for Disabling Oxygen
MiscTab:CreateToggle({
   Name = "Disable Oxygen",
   CurrentValue = false,
   Flag = "oxygen", 
   Callback = function(Value)
      if oxygen then
         oxygen.Disabled = Value
      else
         warn("Oxygen not found!")
      end
      if peaksoxygen then
         peaksoxygen.Disabled = Value
      else
         warn("Peaks Oxygen not found!")
      end
   end,
})

-- Toggle for Disabling Temperature
MiscTab:CreateToggle({
   Name = "Disable Temperature",
   CurrentValue = false,
   Flag = "temp", 
   Callback = function(Value)
      if temp then
         temp.Disabled = Value
      else
         warn("Temperature not found!")
      end
   end,
})

-- Toggle for Disabling Heat
MiscTab:CreateToggle({
   Name = "Disable Heat",
   CurrentValue = false,
   Flag = "heat", 
   Callback = function(Value)
      if heat then
         heat.Disabled = Value
      else
         warn("Heat not found!")
      end
   end,
})

MiscTab:CreateToggle({
    Name = "Hide Identity",
    CurrentValue = false,
    Flag = "hideidentity", 
    Callback = function(Value)
        _G.HideIdentity = Value 

        while _G.HideIdentity do
            local player = game.Players.LocalPlayer
            local hud = player:FindFirstChild("hud")
            local humanoidrp = Character and Character:FindFirstChild("HumanoidRootPart")
            local usr = humanoidrp:FindFirstChild("user")

            if hud and usr then
                
                local lvl = hud:FindFirstChild("lvl")
                local coins = hud:FindFirstChild("coins")
                local level = usr:FindFirstChild("level")
                local streak = usr:FindFirstChild("streak")
                local title = usr:FindFirstChild("title")
                local usertitle = usr:FindFirstChild("user")

                
                if lvl then
                  lvl.Text = "Cookie Hub" 
                 end
                if coins then 
                  coins.Text = "Cookie Hub"
                  end
                if level then 
                  level.Text = "Cookie Hub"
                  end
                if streak then
                  streak.Text = "Cookie Hub"
                  end
                if title then
                  title.Text = "Cookie Hub"
                  end
                if usertitle then
                usertitle.Text = "Cookie Hub"
              end
            end

            task.wait(1) 
        end
    end,
})
