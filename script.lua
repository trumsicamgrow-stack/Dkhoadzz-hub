local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DkhoaHub"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- ===== TOGGLE BUTTON =====
local toggleBtn = Instance.new("ImageButton")
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0.02, 0, 0.35, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleBtn.BorderSizePixel = 0
toggleBtn.Image = "rbxassetid://13116520982"
toggleBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Parent = gui
toggleBtn.Active = true
toggleBtn.Draggable = true
local cornerToggle = Instance.new("UICorner")
cornerToggle.CornerRadius = UDim.new(1, 0)
cornerToggle.Parent = toggleBtn

-- ===== MAIN MENU =====
local menuVisible = true
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 280, 0, 400)
main.Position = UDim2.new(0.4, 0, 0.12, 0)
main.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
main.BackgroundTransparency = 0
main.BorderSizePixel = 0
main.Parent = gui
main.Active = true
main.Draggable = true
local cornerMain = Instance.new("UICorner")
cornerMain.CornerRadius = UDim.new(0, 12)
cornerMain.Parent = main

-- Viền cầu vồng dark
local border = Instance.new("Frame")
border.Size = UDim2.new(1, 4, 1, 4)
border.Position = UDim2.new(0, -2, 0, -2)
border.BackgroundColor3 = Color3.new(1, 1, 1)
border.BackgroundTransparency = 0
border.BorderSizePixel = 0
border.Parent = main
border.ZIndex = 0
local cornerBorder = Instance.new("UICorner")
cornerBorder.CornerRadius = UDim.new(0, 14)
cornerBorder.Parent = border

local gradient = Instance.new("UIGradient")
gradient.Rotation = 45
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 0, 20)),
    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(60, 40, 0)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 50, 20)),
    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 40, 60)),
    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(30, 20, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 0, 60))
})
gradient.Parent = border
spawn(function()
    while true do
        for rot = 0, 360, 1 do
            gradient.Rotation = rot
            wait(0.025)
        end
    end
end)

-- Title bar
local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 28)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 30)
titleBar.Text = "DKHOADZ HUB"
titleBar.TextColor3 = Color3.fromRGB(220, 220, 255)
titleBar.TextScaled = true
titleBar.Font = Enum.Font.SourceSansBold
titleBar.Parent = main
local cornerTitle = Instance.new("UICorner")
cornerTitle.CornerRadius = UDim.new(0, 12)
cornerTitle.Parent = titleBar

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 22, 0, 22)
close.Position = UDim2.new(1, -27, 0, 3)
close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextScaled = true
close.Font = Enum.Font.SourceSansBold
close.Parent = titleBar
local cornerClose = Instance.new("UICorner")
cornerClose.CornerRadius = UDim.new(0, 6)
cornerClose.Parent = close
close.MouseButton1Click:Connect(function()
    main.Visible = false
    menuVisible = false
    toggleBtn.ImageColor3 = Color3.fromRGB(80, 80, 120)
end)

-- ===== TAB SYSTEM =====
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0, 24)
tabContainer.Position = UDim2.new(0, 0, 0, 28)
tabContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
tabContainer.BackgroundTransparency = 0
tabContainer.BorderSizePixel = 0
tabContainer.Parent = main

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -54)
contentFrame.Position = UDim2.new(0, 0, 0, 52)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = main

local function createTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 55, 0, 22)
    btn.Position = UDim2.new(0, 5 + (#tabContainer:GetChildren() * 60), 0, 1)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 230)
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSans
    btn.Parent = tabContainer
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = btn
    
    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1, -10, 1, -5)
    content.Position = UDim2.new(0, 5, 0, 2)
    content.BackgroundTransparency = 1
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.ScrollBarThickness = 4
    content.Visible = false
    content.Parent = contentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.Parent = content
    layout.Padding = UDim.new(0, 2)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local function addLabel(text, color)
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(0.9, 0, 0, 16)
        lbl.Position = UDim2.new(0.05, 0, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = color or Color3.fromRGB(160, 160, 180)
        lbl.TextScaled = true
        lbl.Font = Enum.Font.SourceSans
        lbl.Parent = content
    end
    
    local function addButton(text, callback)
        local btn2 = Instance.new("TextButton")
        btn2.Size = UDim2.new(0.85, 0, 0, 22)
        btn2.Position = UDim2.new(0.075, 0, 0, 0)
        btn2.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        btn2.Text = text
        btn2.TextColor3 = Color3.fromRGB(220, 220, 240)
        btn2.TextScaled = true
        btn2.Font = Enum.Font.SourceSans
        btn2.Parent = content
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = btn2
        btn2.MouseButton1Click:Connect(callback)
    end
    
    local function addSpace()
        local sp = Instance.new("Frame")
        sp.Size = UDim2.new(0.9, 0, 0, 2)
        sp.BackgroundTransparency = 1
        sp.Parent = content
    end
    
    btn.MouseButton1Click:Connect(function()
        for _, child in ipairs(contentFrame:GetChildren()) do
            if child:IsA("ScrollingFrame") then
                child.Visible = false
            end
        end
        content.Visible = true
        local total = 0
        for _, child in ipairs(content:GetChildren()) do
            if child:IsA("TextButton") or child:IsA("TextLabel") then
                total = total + child.Size.Y.Offset + 2
            end
        end
        content.CanvasSize = UDim2.new(0, 0, 0, total + 10)
    end)
    
    return {
        addLabel = addLabel,
        addButton = addButton,
        addSpace = addSpace,
        show = function()
            for _, child in ipairs(contentFrame:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    child.Visible = false
                end
            end
            content.Visible = true
            local total = 0
            for _, child in ipairs(content:GetChildren()) do
                if child:IsA("TextButton") or child:IsA("TextLabel") then
                    total = total + child.Size.Y.Offset + 2
                end
            end
            content.CanvasSize = UDim2.new(0, 0, 0, total + 10)
        end
    }
end

-- ===== SOUND SYSTEM =====
local volume = 0.8
local currentSound = nil
local lastPlayedID = nil
local autoResume = false

local function playSound(id)
    if currentSound then currentSound:Destroy() end
    local char = player.Character or player.CharacterAdded:Wait()
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://" .. id
    s.Volume = volume
    s.Parent = char
    s:Play()
    currentSound = s
    lastPlayedID = id
    s.Ended:Connect(function() s:Destroy(); currentSound = nil end)
end

local function continueMusic()
    if lastPlayedID then
        playSound(lastPlayedID)
    end
end

player.CharacterAdded:Connect(function()
    if autoResume and lastPlayedID then
        wait(1)
        playSound(lastPlayedID)
    end
end)

-- ===== BUILD TABS =====

-- TAB HOME
local home = createTab("Home")
home.addLabel("TikTok ID: kgameing9", Color3.fromRGB(255, 200, 100))
home.addLabel("Player: " .. player.Name, Color3.fromRGB(180, 180, 255))
home.addLabel("Status: Online", Color3.fromRGB(100, 255, 150))
home.addSpace()
home.addButton("Toggle Menu", function()
    main.Visible = not main.Visible
    menuVisible = main.Visible
    toggleBtn.ImageColor3 = menuVisible and Color3.fromRGB(200, 200, 255) or Color3.fromRGB(80, 80, 120)
end)

-- ===== TAB: MONTAGEM (10+ BÀI) =====
local montagem = createTab("Montagem")
montagem.addLabel("--- MONTAGEM SLOWED ---", Color3.fromRGB(200, 120, 50))
montagem.addButton("Montagem Altura Slowed", function() playSound("76574076244729") end)
montagem.addButton("Montagem Bandido 2.0", function() playSound("99595075475449") end)
montagem.addButton("Montagem Dresce Slowed", function() playSound("138968496511779") end)
montagem.addButton("Montagem Altura V2", function() playSound("7538729980") end)
montagem.addButton("Montagem Funk", function() playSound("105889535056845") end)
montagem.addButton("Montagem Ritmada", function() playSound("108443459361998") end)
montagem.addButton("Montagem Mega", function() playSound("113634595254962") end)
montagem.addButton("Montagem Automotivo", function() playSound("11339479089") end)
montagem.addButton("Montagem Bipolador", function() playSound("15696947180") end)
montagem.addButton("Montagem Buga Noia", function() playSound("15932453494") end)
montagem.addButton("Montagem Malandro", function() playSound("15492632978") end)
montagem.addButton("Montagem Sigcuro Ultra", function() playSound("96028783423401") end)
montagem.addLabel("--- CUSTOM ID ---", Color3.fromRGB(200, 120, 50))
montagem.addButton("Montagem Uranium (Paste ID)", function()
    -- PASTE YOUR MONTAGEM URANIUM ID HERE
    playSound("YOUR_ID_HERE")
end)

-- ===== TAB: FUNK =====
local funk = createTab("Funk")
funk.addLabel("--- FUNK HOT ---", Color3.fromRGB(255, 200, 100))
funk.addButton("Funk - Cute Funk", function() playSound("131578874678681") end)
funk.addButton("Funk - Funk Yeah", function() playSound("94443317106207") end)
funk.addButton("Funk - Giraffa Celeste", function() playSound("81082959190322") end)
funk.addButton("Funk - Wifey Funk", function() playSound("110496775219641") end)
funk.addButton("Funk - 9AM Calabasas", function() playSound("95366744208132") end)
funk.addButton("Funk - Automotivo", function() playSound("105889535056845") end)
funk.addButton("Funk - Ritmada", function() playSound("108443459361998") end)
funk.addButton("Funk - Brazilian Funk", function() playSound("118519630891871") end)
funk.addButton("Funk - Funk Rave", function() playSound("122370270006872") end)
funk.addButton("Funk - Mega Funk", function() playSound("127623817278466") end)
funk.addButton("Funk - Super Slowed", function() playSound("130012974783008") end)
funk.addButton("Funk - Mafia Funk", function() playSound("132189220399110") end)

-- ===== TAB: CHILL =====
local chill = createTab("Chill")
chill.addLabel("--- CHILL / LOFI ---", Color3.fromRGB(80, 200, 120))
chill.addButton("Chill Lofi #1", function() playSound("9123593304") end)
chill.addButton("Chill Lofi #2", function() playSound("1845673050") end)
chill.addButton("Chill Lofi #3", function() playSound("9043887091") end)
chill.addButton("Chill Lofi #4 (Dust)", function() playSound("78783219474740") end)
chill.addButton("Chill Lofi #5 (Dreams)", function() playSound("86667526667372") end)
chill.addButton("Chill Lofi #6 (Leaf)", function() playSound("81682364618663") end)
chill.addButton("Chill Lofi #7 (Midnight)", function() playSound("133481457180248") end)
chill.addButton("Chill Lofi #8 (Hop)", function() playSound("124866279858588") end)
chill.addButton("Chill Lofi #9", function() playSound("104024500674661") end)

-- ===== TAB: PHONK =====
local phonk = createTab("Phonk")
phonk.addLabel("--- PHONK ---", Color3.fromRGB(200, 80, 160))
phonk.addButton("Phonk Bass Heavy", function() playSound("6961776813") end)
phonk.addButton("Phonk Drift", function() playSound("6843558868") end)
phonk.addButton("Brazilian Phonk", function() playSound("6937354391") end)
phonk.addButton("Toma Funk Phonk", function() playSound("129098116998483") end)
phonk.addButton("Phonk House", function() playSound("7024143472") end)
phonk.addButton("DRIFT PHONK", function() playSound("80709171471864") end)
phonk.addButton("Ghostblade Phonk", function() playSound("90441404910975") end)
phonk.addButton("Pure Phonk Violence", function() playSound("96461852889782") end)
phonk.addButton("Chill Phonk", function() playSound("136974179670066") end)
phonk.addButton("Phonk of Darkness", function() playSound("116896498238234") end)

-- ===== TAB: YOUTUBE =====
local yt = createTab("YouTube")
yt.addLabel("--- YOUTUBE PLAYER ---", Color3.fromRGB(255, 200, 100))
yt.addButton("Open YouTube Player", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dan41/Roblox-Scripts/refs/heads/main/Youtube%20Music%20Player/YoutubeMusicPlayer.lua"))()
    end)
end)
yt.addLabel("Type any song name to search", Color3.fromRGB(150, 150, 150))

-- ===== TAB: SETTINGS =====
local settings = createTab("Settings")
settings.addLabel("--- AUDIO ---", Color3.fromRGB(180, 180, 200))
settings.addButton("Volume +", function()
    volume = math.min(volume + 0.1, 1)
    if currentSound then currentSound.Volume = volume end
end)
settings.addButton("Volume -", function()
    volume = math.max(volume - 0.1, 0)
    if currentSound then currentSound.Volume = volume end
end)
settings.addButton("Mute", function()
    if currentSound then currentSound.Volume = 0 end
end)
settings.addButton("Stop", function()
    if currentSound then currentSound:Destroy(); currentSound = nil end
end)
settings.addLabel("--- PLAYBACK ---", Color3.fromRGB(180, 180, 200))
settings.addButton("Continue", function()
    continueMusic()
end)

local autoResumeBtn = nil
local function updateAutoResumeBtn()
    if autoResumeBtn then
        autoResumeBtn.Text = "Auto-Resume: " .. (autoResume and "ON" or "OFF")
    end
end
autoResumeBtn = settings.addButton("Auto-Resume: OFF", function()
    autoResume = not autoResume
    updateAutoResumeBtn()
end)

settings.addLabel("--- INFO ---", Color3.fromRGB(160, 160, 180))
settings.addLabel("TikTok: kgameing9", Color3.fromRGB(200, 200, 255))
settings.addLabel("Montagem: 12+ Songs", Color3.fromRGB(100, 255, 150))

home.show()

-- ===== TOGGLE BUTTON =====
toggleBtn.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    menuVisible = main.Visible
    toggleBtn.ImageColor3 = menuVisible and Color3.fromRGB(200, 200, 255) or Color3.fromRGB(80, 80, 120)
end)

print("✅ DKHOADZ HUB - MONTAGEM EDITION (12+ MONTAGEM) LOADED")
