local KeyGuardLibrary = loadstring(game:HttpGet("https://cdn.keyguardian.org/library/v1.0.0.lua"))()
local trueData = "ada93ccf591c4fd9a2501f47ad1484ef"
local falseData = "fb46ce25695e4fbb883a5f513814c78b"

KeyGuardLibrary.Set({
    publicToken = "7fba9d9ed25a4fc39ba25b078a94355d",
    privateToken = "977e83efba474130af14a9d66ec28bcc",
    trueData = trueData,
    falseData = falseData,
})


local UI = CustomUI 

local function showNotification(title, message, success)
    UI:CreateNotification({
        Title = title,
        Message = message,
        Duration = 3, -- Auto close in 3 seconds
        Type = success and "Success" or "Error" -- Green for success, red for error
    })
end

-- Add a new tab for Key System
local KeySystemTab = UI:AddTab("Key System")

-- Create a key input box
local keyInput = KeySystemTab:AddTextbox({
    Title = "Enter Key",
    Placeholder = "Enter your key here...",
    Callback = function(Value)
        key = Value
    end
})

-- Create a button to check the key
KeySystemTab:AddButton({
    Title = "Check Key",
    Callback = function()
        local success, response = pcall(KeyGuardLibrary.validateDefaultKey, key)
        if success then
            if response == trueData then
                showNotification("Key System", "✅ Key is valid!", true)
                loadstring(game:HttpGet("https://raw.githubusercontent.com/zepthical/helping/refs/heads/main/Fisch.lua", true))()  
            else
                showNotification("Key System", "❌ Key is invalid. Try again!", false)
            end
        else
            showNotification("Key System", "⚠️ Error validating key. Try later.", false)
        end
    end
})

KeySystemTab:AddButton({
    Title = "Get Key",
    Callback = function()
        local keyLink = "https://key-link.com" -- Replace with your link
        setclipboard(keyLink)
        showNotification("Key System", "🔗 Key link copied to clipboard!", true)
    end
})
