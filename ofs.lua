Tabs.Fishing:AddToggle("InstantReel", {
    Title = "Instant Reel",
    Default = States.InstantReel,
    Callback = function(Value)
        States.InstantReel = Value
        while States.InstantReel do
            local rod = getRod()
            if rod and rod:FindFirstChild("values") and rod.values:FindFirstChild("bite") then
                if rod.values.bite.Value then
                    for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                         if v:IsA("ScreenGui") and v.Name == "reel" then
                            local bar = v:FindFirstChild("bar")
                            if bar and ReplicatedStorage:FindFirstChild("events") then
                                local playerbar = bar:FindFirstChild("playerbar")
                                if playerbar then				
                                playerbar.Size = UDim2.new(1, 0, 1, 0) 
				task.wait(1)
                                Reel()
                                task.wait(0.5)
                                Reel()
				task.wait(1)
				if rod.values.bite.Value == true then
				   Reel()
				end
                                Reset()	
                             end
                          end
                       end
                    end                    
                    repeat task.wait(0.1) until not rod.values.bite.Value
                end
            end
            task.wait(0.1)
        end
    end
}) ]]

Tabs.Auto:AddToggle("AutoSell", 
{
    Title = "Auto Sell All", 
    Description = "Sell all your fishes",
    Default = States.AutoSell,
    Callback = function(state)
	States.AutoSell = state
	while States.AutoSell do
	   local SellAll = ReplicatedStorage.events:FindFirstChild("SellAll")
	   if SellAll then
	      SellAll:InvokeServer()
	      task.wait(1.5)
	   end
	end
    end 
})

local walkSpeed = 16
local jumpPower = 50

Tabs.Player:AddInput("WalkSpeed", {
    Title = "WalkSpeed",
    Description = "Your WalkSpeed",
    Default = walkSpeed,
    Placeholder = "Default : 16",
    Numeric = true, -- Only allows numbers
    Finished = true, -- Only calls callback when you press enter
    Callback = function(Value)
	States.Speed = Value
	while States.Speed do
           local char = getCharacter()
	   if char and char:FindFirstChild("Humanoid") then
	      char.Humanoid.WalkSpeed = Value
	      task.wait(1)
	   end
	end
    end
})

Tabs.Player:AddInput("JumpPower", {
    Title = "JumpPower",
    Description = "Your JumpPower",
    Default = jumpPower,
    Placeholder = "Default : 50",
    Numeric = true, -- Only allows numbers
    Finished = true, -- Only calls callback when you press enter
    Callback = function(Value)
	States.Jump = Value
	while States.Jump do
           local char = getCharacter()
	   if char and char:FindFirstChild("Humanoid") then
	      char.Humanoid.JumpPower = Value
	      task.wait(1)
	   end
	end
    end
}) 

-- Misc Tab

Tabs.Misc:AddToggle("Noclip", 
{
    Title = "Noclip", 
    Description = "Phase through walls",
    Default = States.NoClip,
    Callback = function(state)
	States.NoClip = state
	if Value then
	   local function nocliploop()
		while States.NoClip do
		local char = getCharacter()
		for _, v in pairs(char:GetDescendants()) do
		 if v:ISA("BasePart") then
		    v.CanCollide = false
		 end
	      end
	      task.wait(0.1)
	   end
	   coroutine.wrap(noclipLoop)()
	   else
	   	local char = getCharacter()
	   	for _, v in pairs(char:GetDescendants()) do
              	if v:IsA("BasePart") then
                 v.CanCollide = true
              end
           end
	end
    end 
}) 

--Tabs.Misc:AddToggle("NoClip", {
    Title = "NoClip",
    Default = States.NoClip,
    Callback = function(Value)
        States.NoClip = Value
        if Value then
            local function noclipLoop()
                while States.NoClip do
                    local char = getCharacter()
                    if char then
                        for _, v in pairs(char:GetDescendants()) do
                            if v:IsA("BasePart") then
                                v.CanCollide = false
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end
            coroutine.wrap(noclipLoop)()
        else
            local char = getCharacter()
            if char then
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
}) 

-- local Player = game.Players.LocalPlayer
local Character = Player and Player.Character
local Resources = Character and Character:FindFirstChild("Resources")
local gas = Resources and Resources:FindFirstChild("gas")
local oxygen = Resources and Resources:FindFirstChild("oxygen")
local peaksoxygen = Resources and Resources:FindFirstChild("oxygen(peaks)")
local temp = Resources and Resources:FindFirstChild("temperature")
local heat = Resources and Resources:FindFirstChild("temperature(heat)")

Tab.Misc:AddToggle("DisableResources", 
{
    Title = "Disable Resources", 
    Description = "Disable oxygen, heat, etc.",
    Default = States.DisableResources,
    Callback = function(state)
	if state then
	   gas.Disabled = Value
           oxygen.Disbaled = Value
           peaksoxygen.Disabled = Value
           temp.Disabled = Value
      	   heat.Disabled = Value
        end
    end 
})
	
Tabs.Misc:AddToggle("DisableResources", { -- old
   Title = "Disable Resources",
   Default = States.DisableResources,
   Callback = function(Value)
      if Value then				
          gas.Disabled = Value
          oxygen.Disbaled = Value
          peaksoxygen.Disabled = Value
          temp.Disabled = Value
      	  heat.Disabled = Value
       end			
   end
}) 

--Tabs.Misc:AddToggle("HideIdenity", 
{
    Title = "Hide Idenity", 
    Default = States.HideIdenity,
    Callback = function(state)
	_G.HideIdenity = state
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
}) 
	
Tabs.Misc:AddToggle("HideIdenity", {
   Title = "Hide Idenity",
   Default = States.HideIdenity,
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
