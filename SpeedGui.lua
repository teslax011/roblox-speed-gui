--// SPEED + INFINITE JUMP GUI
--// Support Android Executor
--// GUI Transparan + Drag + Minimize + Close + Animasi

local ScreenGui = Instance.new("ScreenGui")
‎local Frame = Instance.new("Frame")
‎local TextButton = Instance.new("TextButton")
‎local UICorner = Instance.new("UICorner")
‎
‎ScreenGui.Parent = game.CoreGui
‎ScreenGui.Name = "FPSGui"
‎
‎Frame.Parent = ScreenGui
‎Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
‎Frame.Position = UDim2.new(0.03,0,0.3,0)
‎Frame.Size = UDim2.new(0,160,0,80)
‎Frame.Active = true
‎Frame.Draggable = true
‎
‎UICorner.Parent = Frame
‎
‎TextButton.Parent = Frame
‎TextButton.Size = UDim2.new(0,130,0,40)
‎TextButton.Position = UDim2.new(0.09,0,0.25,0)
‎TextButton.Text = "FPS 120 : OFF"
‎TextButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
‎TextButton.TextColor3 = Color3.fromRGB(255,255,255)
‎
‎local enabled = false
‎
‎TextButton.MouseButton1Click:Connect(function()
‎    enabled = not enabled
‎
‎    if enabled then
‎        setfpscap(120)
‎        TextButton.Text = "FPS 120 : ON"
‎        TextButton.BackgroundColor3 = Color3.fromRGB(0,170,0)
‎    else
‎        setfpscap(60)
‎        TextButton.Text = "FPS 120 : OFF"
‎        TextButton.BackgroundColor3 = Color3.fromRGB(40,40,40)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- SETTINGS
local speedEnabled = false
local infiniteJump = false
local selectedSpeed = 50

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpeedGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 240, 0, 260)
Main.Position = UDim2.new(0.5, -120, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BackgroundTransparency = 0.25
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)

-- OPEN ANIMATION
Main.Size = UDim2.new(0,0,0,0)

TweenService:Create(
	Main,
	TweenInfo.new(0.4, Enum.EasingStyle.Back),
	{Size = UDim2.new(0,240,0,260)}
):Play()

-- TITLE
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "Speed + Infinite Jump"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

-- CLOSE BUTTON
local Close = Instance.new("TextButton")
Close.Parent = Main
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-35,0,5)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.new(1,1,1)
Close.BackgroundColor3 = Color3.fromRGB(255,70,70)
Close.BackgroundTransparency = 0.2
Instance.new("UICorner", Close)

-- MINIMIZE BUTTON
local Minimize = Instance.new("TextButton")
Minimize.Parent = Main
Minimize.Size = UDim2.new(0,30,0,30)
Minimize.Position = UDim2.new(1,-70,0,5)
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 16
Minimize.TextColor3 = Color3.new(1,1,1)
Minimize.BackgroundColor3 = Color3.fromRGB(80,80,80)
Minimize.BackgroundTransparency = 0.2
Instance.new("UICorner", Minimize)

-- CONTENT
local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0,10,0,50)
Content.Size = UDim2.new(1,-20,1,-60)
Content.BackgroundTransparency = 1

-- SPEED TOGGLE
local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Parent = Content
SpeedToggle.Size = UDim2.new(1,0,0,40)
SpeedToggle.Position = UDim2.new(0,0,0,0)
SpeedToggle.Text = "Speed : OFF"
SpeedToggle.Font = Enum.Font.Gotham
SpeedToggle.TextSize = 14
SpeedToggle.TextColor3 = Color3.new(1,1,1)
SpeedToggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
SpeedToggle.BackgroundTransparency = 0.2
Instance.new("UICorner", SpeedToggle)

-- SPEED 50
local Speed50 = Instance.new("TextButton")
Speed50.Parent = Content
Speed50.Size = UDim2.new(0.48,0,0,40)
Speed50.Position = UDim2.new(0,0,0,55)
Speed50.Text = "Speed 50"
Speed50.Font = Enum.Font.Gotham
Speed50.TextSize = 14
Speed50.TextColor3 = Color3.new(1,1,1)
Speed50.BackgroundColor3 = Color3.fromRGB(50,50,50)
Speed50.BackgroundTransparency = 0.2
Instance.new("UICorner", Speed50)

-- SPEED 100
local Speed100 = Instance.new("TextButton")
Speed100.Parent = Content
Speed100.Size = UDim2.new(0.48,0,0,40)
Speed100.Position = UDim2.new(0.52,0,0,55)
Speed100.Text = "Speed 100"
Speed100.Font = Enum.Font.Gotham
Speed100.TextSize = 14
Speed100.TextColor3 = Color3.new(1,1,1)
Speed100.BackgroundColor3 = Color3.fromRGB(50,50,50)
Speed100.BackgroundTransparency = 0.2
Instance.new("UICorner", Speed100)

-- INFINITE JUMP
local JumpToggle = Instance.new("TextButton")
JumpToggle.Parent = Content
JumpToggle.Size = UDim2.new(1,0,0,40)
JumpToggle.Position = UDim2.new(0,0,0,110)
JumpToggle.Text = "Infinite Jump : OFF"
JumpToggle.Font = Enum.Font.Gotham
JumpToggle.TextSize = 14
JumpToggle.TextColor3 = Color3.new(1,1,1)
JumpToggle.BackgroundColor3 = Color3.fromRGB(40,40,40)
JumpToggle.BackgroundTransparency = 0.2
Instance.new("UICorner", JumpToggle)

-- CHARACTER FUNCTION
local function applySpeed()
	local char = player.Character
	if char and char:FindFirstChild("Humanoid") then
		char.Humanoid.WalkSpeed = speedEnabled and selectedSpeed or 16
	end
end

-- REAPPLY SPEED (SUPPORT ITEM/SKILL/COIL)
game:GetService("RunService").RenderStepped:Connect(function()
	if speedEnabled then
		applySpeed()
	end
end)

player.CharacterAdded:Connect(function(char)
	character = char
	wait(1)
	applySpeed()
end)

-- BUTTON EVENTS
SpeedToggle.MouseButton1Click:Connect(function()
	speedEnabled = not speedEnabled
	
	if speedEnabled then
		SpeedToggle.Text = "Speed : ON"
	else
		SpeedToggle.Text = "Speed : OFF"
	end
	
	applySpeed()
end)

Speed50.MouseButton1Click:Connect(function()
	selectedSpeed = 50
	applySpeed()
end)

Speed100.MouseButton1Click:Connect(function()
	selectedSpeed = 100
	applySpeed()
end)

JumpToggle.MouseButton1Click:Connect(function()
	infiniteJump = not infiniteJump
	
	if infiniteJump then
		JumpToggle.Text = "Infinite Jump : ON"
	else
		JumpToggle.Text = "Infinite Jump : OFF"
	end
end)

-- INFINITE JUMP
UIS.JumpRequest:Connect(function()
	if infiniteJump then
		local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

-- MINIMIZE
local minimized = false

Minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	
	if minimized then
		TweenService:Create(
			Main,
			TweenInfo.new(0.3),
			{Size = UDim2.new(0,240,0,40)}
		):Play()
		
		Content.Visible = false
	else
		Content.Visible = true
		
		TweenService:Create(
			Main,
			TweenInfo.new(0.3),
			{Size = UDim2.new(0,240,0,260)}
		):Play()
	end
end)

-- CLOSE
Close.MouseButton1Click:Connect(function()
	TweenService:Create(
		Main,
		TweenInfo.new(0.3),
		{Size = UDim2.new(0,0,0,0)}
	):Play()
	
	wait(0.3)
	ScreenGui:Destroy()
end)
