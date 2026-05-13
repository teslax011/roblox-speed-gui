-- GUI SPEED ROBLOX
local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

-- FRAME UTAMA
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.5, -125, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
Frame.Active = true
Frame.Draggable = true

-- TITLE
local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1,0,0,30)
Title.BackgroundColor3 = Color3.fromRGB(40,40,40)
Title.Text = "SPEED GUI"
Title.TextColor3 = Color3.new(1,1,1)

-- TOGGLE BUTTON
local Toggle = Instance.new("TextButton")
Toggle.Parent = Frame
Toggle.Size = UDim2.new(0,100,0,35)
Toggle.Position = UDim2.new(0,10,0,40)
Toggle.Text = "OFF"
Toggle.BackgroundColor3 = Color3.fromRGB(150,0,0)

local enabled = false

Toggle.MouseButton1Click:Connect(function()
    enabled = not enabled

    if enabled then
        Toggle.Text = "ON"
        Toggle.BackgroundColor3 = Color3.fromRGB(0,150,0)
    else
        Toggle.Text = "OFF"
        Toggle.BackgroundColor3 = Color3.fromRGB(150,0,0)
        humanoid.WalkSpeed = 16
    end
end)

-- FUNCTION SPEED
local function createSpeedButton(text, speed, posY)
    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.Size = UDim2.new(0,80,0,35)
    Button.Position = UDim2.new(0,10,0,posY)
    Button.Text = text
    Button.BackgroundColor3 = Color3.fromRGB(60,60,60)
    Button.TextColor3 = Color3.new(1,1,1)

    Button.MouseButton1Click:Connect(function()
        if enabled then
            humanoid.WalkSpeed = speed
        end
    end)
end

createSpeedButton("Speed 50",50,85)
createSpeedButton("Speed 100",100,125)
createSpeedButton("Speed 150",150,165)

-- MINIMIZE BUTTON
local Minimize = Instance.new("TextButton")
Minimize.Parent = Frame
Minimize.Size = UDim2.new(0,30,0,30)
Minimize.Position = UDim2.new(1,-65,0,0)
Minimize.Text = "-"

local minimized = false

Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized

    if minimized then
        Frame.Size = UDim2.new(0,250,0,30)
    else
        Frame.Size = UDim2.new(0,250,0,210)
    end
end)

-- CLOSE BUTTON
local Close = Instance.new("TextButton")
Close.Parent = Frame
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-30,0,0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(150,0,0)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)