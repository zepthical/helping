-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local RunService = game:GetService("RunService")

local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

local Window = Luna:CreateWindow({
	Name = "Lunaris | Fisch", -- This Is Title
	Subtitle = nil, 
	LogoID = "82795327169782", 
	LoadingEnabled = true, 
	LoadingTitle = "Luna Interface Suite", 
	LoadingSubtitle = "Fisch | zepthical", 

	ConfigSettings = {
		RootFolder = nil, 
		ConfigFolder = "luna" 
	},

	KeySystem = false, 
	KeySettings = {
		Title = "Luna Example Key",
		Subtitle = "Key System",
		Note = "Best Key System Ever! Also, Please Use A HWID Keysystem like Pelican, Luarmor etc. that provide key strings based on your HWID since putting a simple string is very easy to bypass",
		SaveInRoot = false, 
		SaveKey = true, 
		Key = {"Example Key"}, 
		SecondAction = {
			Enabled = false, 
			Type = "Link",
			Parameter = "" 
		}
	}
})
print("Window created successfully!")

---- functions
local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function GetRod()
    for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name:lower():find("rod") then
            return v 
        end
    end
    return nil 
end

local function Cast()
    local Rod = GetRod()
    if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
        task.wait(0.1) -- รอเวลาสักครู่
        Rod.events.cast:FireServer(100, 1)
    end
end

local function Shake()
    local PlayerGUI = LocalPlayer:FindFirstChild("PlayerGui")
    if not PlayerGUI then return end -- ถ้าไม่เจอ PlayerGui ก็หยุดทำงาน

    local shakeUI = PlayerGUI:FindFirstChild("shakeui")
    if not shakeUI or not shakeUI.Enabled then return end -- ถ้าไม่เจอ shakeUI หรือมันปิด ก็หยุดทำงาน

    local safezone = shakeUI:FindFirstChild("safezone")
    if not safezone then return end -- ถ้าไม่เจอ safezone ก็หยุดทำงาน

    local button = safezone:FindFirstChild("button")
    if button and button:IsA("ImageButton") and button.Visible then
        -- ใช้ pcall เพื่อป้องกันข้อผิดพลาดที่อาจเกิดขึ้น
        local success, errorMessage = pcall(function() 
            GuiService.SelectedObject = button
            -- ส่ง key event ให้กับ button
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end)

        -- ตรวจสอบหากเกิดข้อผิดพลาด
        if not success then
            warn("Error occurred during Shake: " .. errorMessage)
        end
    end
end

local function Reel()
    -- ลองลดเวลา wait() ให้เร็วที่สุด
    local rod = GetRod()
    if not rod then return end
    
    -- ตรวจสอบค่าต่างๆ
    local reelUI = nil
    for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == "reel" then
            reelUI = v
            break
        end
    end

    if not reelUI then return end
    local bar = reelUI:FindFirstChild("bar")
    if not bar then return end

    local playerbar = bar:FindFirstChild("playerbar")
    if not playerbar then return end

    local events = ReplicatedStorage:FindFirstChild("events")
    if not events then return end
    local reelFinished = events:FindFirstChild("reelfinished")
    if not reelFinished then return end

    -- รีลให้เต็ม
    playerbar.Size = UDim2.new(1, 0, 1, 0)
    bar.Visible = false

    -- ส่ง event ให้รีลเสร็จ
    pcall(function()
        reelFinished:FireServer(100, true)
    end)
end

local function Reset()
    local Rod = GetRod()
    if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("reset") then
        task.wait(0.1)
        Rod.events.reset:FireServer()

        local equipRemote = ReplicatedStorage.packages.Net:FindFirstChild("RE/Backpack/Equip")
        if equipRemote then
            pcall(function()
                equipRemote:FireServer(rod)
                task.wait(0.1)
                equipRemote:FireServer(rod)
            end)
        end
    end
end


------

-- features
_G.AutoCast = false
_G.AutoShake = false
_G.AutoReel = false
_G.InstantReel = false
_G.AutoEquipRod = false

local success, errorMsg = pcall(function()
    local MainTab = Window:CreateTab({
        Name = "Main",
        Icon = "view_in_ar",
        ImageSource = "rbxassetid://82795327169782"  -- Replace with a valid asset ID
        ShowTitle = true
    })
    print("MainTab created successfully!")
end)
if not success then
    warn("Error in CreateTab: " .. errorMsg)
end


MainTab:CreateSection("Configs")

local autoequip = MainTab:CreateToggle({
    Name = "Auto Equip Rod",
    Description = nil,
    CurrentValue = _G.AutoEquipRod,
    Callback = function(Value)
	print("Toggled AutoCast: " .. tostring(Value))
        _G.AutoEquipRod = Value
        while _G.AutoEquipRod do
            local backpack = LocalPlayer:FindFirstChild("Backpack")
            if backpack then
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool:FindFirstChild("events") and tool.events:FindFirstChild("cast") then
                        local remote = ReplicatedStorage.packages.Net:FindFirstChild("RE/Backpack/Equip")
                        if remote then 
                            remote:FireServer(tool) 
                        end
                        break
                    end
                end
            end
            task.wait(0.1)  -- Ensures the loop doesn't run too quickly
        end
    end
})

local autocast = MainTab:CreateToggle({
    Name = "Auto Cast",
    Description = nil,
    CurrentValue = _G.AutoCast,
    Callback = function(Value)
        print("Toggled AutoCast: " .. tostring(Value))
        _G.AutoCast = Value
        while _G.AutoCast do
            local Rod = GetRod()
            print("Checking for rod:", Rod)
            if Rod and Rod:FindFirstChild("values") then
                local casted = Rod.values:FindFirstChild("casted")
                if casted and casted.Value == false then
                    pcall(function()
                        Cast()
                    end)
                end
            end
            task.wait(0.1)
        end
    end
})  -- <-- This is the closing parenthesis for CreateToggle


local autoshake = MainTab:CreateToggle({
	Name = "Auto Shake",
	Description = nil,
	CurrentValue = AutoShake,
    	Callback = function(Value)
	print("Toggled AutoCast: " .. tostring(Value))
       	AutoShake = Value
        while AutoShake do
        Shake()
        Shake()
        task.wait(0.1)
     end
  end
})

local autoreel = MainTab:CreateToggle({
	Name = "Auto Reel",
	Description = nil,
	CurrentValue = AutoReel,
    	Callback = function(Value)
	print("Toggled AutoCast: " .. tostring(Value))
       	 AutoReel = Value
         while AutoReel do
            local Rod = GetRod()
	    print("Checking for rod:", Rod.Name)
            if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                -- ทำงานจนกว่าจะไม่มี bite
                while Rod.values.bite.Value do
                     -- รีลในขณะที่ยังมี bite
                     local success, errorMessage = pcall(function()
                     Reel()
                 end)
              if not success then
                 warn("Error in Reel: " .. errorMessage)
              end

               -- ใช้เวลารอให้เร็วที่สุด แต่ไม่บัค
               task.wait(0.1) -- ใช้ wait แบบเร็วเพื่อไม่ให้เกิดการหน่วงมากเกินไป
           end
        end
        task.wait(0.1)
     end
  end
})
