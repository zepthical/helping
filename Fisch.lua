
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
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

--[[ Tables --

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


------------
 
local MainTab = Window:CreateTab("Main", 124714113910876)
 
 
 Rayfield:Notify({
    Title = "Welcome to Cookie Hub!",
    Content = "Don't forget to save the configs!",
    Duration = 6.5,
    Image = 124714113910876,
 }) ]]
 
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
 _G.ar = false
 
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
    Flag = "AutoEquipRod",
    Callback = function(Value)
        _G.AutoEquipRod = Value

        while _G.AutoEquipRod do
            local player = game:GetService("Players").LocalPlayer
            local backpack = player:FindFirstChild("Backpack")

            if backpack then
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool:FindFirstChild("events") and tool.events:FindFirstChild("cast") then
                        local remote = game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Backpack/Equip")
                        remote:FireServer(tool)
                        break -- you and only you
                    end
                end
            end

            task.wait(1) -- i love you
        end
    end
})





 local MainSection = MainTab:CreateSection("Main")
 
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

MainTab:CreateToggle({
    Name = "Auto Cast",
    Flag = "ACast",
    Callback = function(v)
        _G.AutoCast = v

        spawn(function()
            while _G.AutoCast do
                task.wait(1)  -- You can adjust the wait time if needed.
                
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("casted") then
                    if Rod.values.casted.Value == false then
                        Cast()  -- Perform the cast
                        -- After casting, we don't need to repeat continuously if you want it to happen once after each toggle
                    end
                else
                    warn("Rod is missing necessary properties.")
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

local function getRod()
    return Char:FindFirstChildOfClass("Tool") -- Assuming the fishing rod is a tool in the character's inventory
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
                    bar:Destroy()
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

MainTab:CreateToggle({
    Name = "Auto Reel",
    Flag = "AReel",
    Callback = function(v)
        _G.AutoReel = v
        spawn(function()
            while _G.AutoReel do
                task.wait(1) -- Prevent excessive calls
		
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then
			task.wait(0.2)
			Rod.events.reset:FireServer()
			Rod.events.reset:FireServer()

								
    -- Search through the player's GUI for the reel UI elements
    for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == "reel" then
            local bar = v:FindFirstChild("bar")
            if bar and ReplicatedStorage:FindFirstChild("events") then
                local playerbar = bar:FindFirstChild("playerbar")
                if playerbar then
                    bar:Destroy()
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
							task.wait(1)
							if Rod.values.bite.Value == false then
								Reset()
							end
							
                        repeat task.wait(0.1) until Rod.values.bite.Value == false
                    end
                end
            end
        end)
    end
}) 
 
 --[[ MainTab:CreateToggle({
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
 }) ]]
 
local Divider = MainTab:CreateDivider()

MainTab:CreateToggle({
    Name = "Instant Reel",
    Flag = "InsReel",
    Callback = function(v)
        _G.AutoReel = v

        spawn(function()
            while _G.AutoReel do
                task.wait(1) -- Prevent excessive calls

                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then
			task.wait(1.2)
			Reel()
			task.wait(0.5)
			Reset()
                        repeat task.wait(0.1) until Rod.values.bite.Value == false
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

--[[ Create Teleport Tab
local TeleportTab = Window:CreateTab("Teleport")

-- Create Section
local IslandsSection = TeleportTab:CreateSection("Islands")

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
}) ]]


--[[local MiscTab = Window:CreateTab("Misc")
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

local waterparts = {}  
local partSize = 200  -- Size of each individual part (e.g., 200x2x200)  
local numParts = 150  -- Number of parts in each direction (adjust as needed for your map size)  
local mapSize = 30000 -- Approximate map size (in studs), adjust as needed  
  
MiscTab:CreateToggle({  
   Name = "Walk on water",  
   CurrentValue = false,  
   Flag = "walkonwater",    
   Callback = function(Value)  
       _G.WalkOnWater = Value  
  
       if Value then  
           -- Create the parts only once if they haven't been created already  
           if #waterparts == 0 then  
               local offsetX = mapSize / 2  -- Adjust for centering the grid
               local offsetZ = mapSize / 2  -- Adjust for centering the grid
               
               for i = 0, numParts - 1 do  
                   for j = 0, numParts - 1 do  
                       local waterpart = Instance.new("Part")  
                       waterpart.Size = Vector3.new(partSize, 2, partSize)  
                       
                       -- Center the grid on the map
                       waterpart.Position = Vector3.new((i * partSize) - offsetX, 126, (j * partSize) - offsetZ)  
                       
                       waterpart.Anchored = true  
                       waterpart.CanCollide = true  
                       waterpart.Transparency = 0.8  
                       waterpart.Color = Color3.fromRGB(0, 255, 255)  -- Light blue color for water  
                       waterpart.Parent = game.Workspace  
                         
                       table.insert(waterparts, waterpart)  -- Add part to the waterparts table  
                   end  
               end  
           end  
       else  
           -- Remove all water parts when toggled off  
           for _, part in ipairs(waterparts) do  
               part.Parent = nil  
           end  
           waterparts = {}  -- Clear the list  
       end  
   end,  
})

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

MiscTab:CreateToggle({
   Name = "Disable Resources",
   CurrentValue = false,
   Flag = "resources",
   Callback = function(v)
      gas.Disabled = v
      oxygen.Disbaled = v
      peaksoxygen.Disabled = v
      temp.Disabled = v
      heat.Disabled = v
   end,
})ĺ

MiscTab:CreateToggle({
    Name = "Hide Identity",
    CurrentValue = false,
    Flag = "hideidentity", 
    Callback = function(Value)
        _G.HideIdentity = Value 

        while _G.HideIdentity do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidrp = character and character:FindFirstChild("HumanoidRootPart")
            local usr = humanoidrp and humanoidrp:FindFirstChild("user")
            local hud = player:FindFirstChildOfClass("PlayerGui") and player.PlayerGui:FindFirstChild("hud")
            local sfzone = hud and hud:FindFirstChild("safezone") -- Fixed typo

            if sfzone then
                local lvl = sfzone:FindFirstChild("lvl")
                local coins = sfzone:FindFirstChild("coins")

                if lvl then 
                    lvl.Text = "Cookie Hub" 
                end
                if coins then 
                    coins.Text = "Cookie Hub" 
                end
            end
            
            if usr then
                local level = usr:FindFirstChild("level")
                local streak = usr:FindFirstChild("streak")
                local title = usr:FindFirstChild("title")
                local usertitle = usr:FindFirstChild("user")

                if level and level:IsA("TextLabel") then 
                    level.Text = "Cookie Hub" -- Fixed incorrect property
                end
                if streak and streak:IsA("TextLabel") then 
                    streak.Text = "Cookie Hub" -- Fixed incorrect property
                end
                if title and title:IsA("TextLabel") then 
                    title.Text = "Cookie Hub" -- Fixed incorrect property
                end
                if usertitle and usertitle:IsA("TextLabel") then 
                    usertitle.Text = "Cookie Hub" -- Fixed incorrect property
                end
            end

            task.wait(1) -- i love you guys :D
        end
    end
})

MiscTab:CreateDivider()

MiscTab:CreateSection("FPS")

MiscTab:CreateToggle({
    Name = "Low Graphics Mode",
    CurrentValue = false,
    Flag = "LowGraphics",
    Callback = function(Value)
        _G.LowGraphics = Value

        if _G.LowGraphics then
            -- Remove unnecessary graphical effects
            local Lighting = game:GetService("Lighting")
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.Brightness = 0
            
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") then
                    v.Enabled = false
                end
            end

            -- Reduce textures and details in workspace
            local Terrain = workspace:FindFirstChildOfClass("Terrain")
            if Terrain then Terrain.WaterWaveSize = 0 Terrain.WaterWaveSpeed = 0 Terrain.WaterReflectance = 0 Terrain.WaterTransparency = 0 end

            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = Enum.Material.Plastic
                end
            end

        else
            -- Reset to default settings when disabled
            local Lighting = game:GetService("Lighting")
            Lighting.GlobalShadows = true
            Lighting.FogEnd = 100000
            Lighting.Brightness = 2
            
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") then
                    v.Enabled = true
                end
            end
            
            local Terrain = worksMainTab:CreateToggle({
            pace:FindFirstChildOfClass("Terrain")
            if Terrain then Terrain.WaterWaveSize = 1 Terrain.WaterWaveSpeed = 10 Terrain.WaterReflectance = 1 Terrain.WaterTransparency = 0.5 end

            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 0
                elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = Enum.Material.SmoothPlastic
                end
            end
        end
    end
}) ]]

