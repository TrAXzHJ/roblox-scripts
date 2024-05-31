if _G.HBE_LOADED == true then
	 --error("HitBox Expander is already running!", 0)
	return
end
_G.HBE_LOADED = true


local players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local local_player = players.LocalPlayer
local run_service = game:GetService("RunService")
local starter_gui = game:GetService("StarterGui")
local whitelist = {"Vault8221","DreamKJF1","krytoi_loxloxov"}
local blacklist = {"MASTERANASVET"}
local enabled = true
local HBE_size = {X=8,Y=8,Z=8}
local HBE_transparency = 0.9
local HBE_shape = Enum.PartType.Ball
local defaultRootSize = {2,2,1}

local function remove_hitbox(ply)
	local player_humanoid_root_part = ply.Character.HumanoidRootPart
	player_humanoid_root_part.Size = Vector3.new(defaultRootSize[1],defaultRootSize[2],defaultRootSize[3])
	player_humanoid_root_part.Transparency = 1
	player_humanoid_root_part.BrickColor = BrickColor.new("Medium stone grey")
	player_humanoid_root_part.Shape = Enum.PartType.Block
	player_humanoid_root_part.CanCollide = true
end

local function extend_hitboxes()
	local character = local_player.Character
	if not character then return end
	local humanoid_root_part = character:FindFirstChild("HumanoidRootPart")
	if not humanoid_root_part then return end
	if enabled == false then 
		for _, enemyPly in pairs(players:GetPlayers()) do
			if enemyPly.Name == local_player.Name then continue end
			if enemyPly.Character:FindFirstChild("HumanoidRootPart") then 
				local player_humanoid_root_part = enemyPly.Character:findFirstChild("HumanoidRootPart")
				if not player_humanoid_root_part then continue end
				remove_hitbox(enemyPly)
			end
		end
		return 
	end
	if enabled == true then
		if not local_player.Character:findFirstChild("HumanoidRootPart") then return end
		for _, enemyPly in pairs(players:GetPlayers()) do
			if table.find(whitelist, enemyPly.Name) then continue end
			if enemyPly.Name == local_player.Name then continue end
			if enemyPly.TeamColor == local_player.TeamColor then continue end
			local player_character = enemyPly.Character
			if not player_character then continue end
			local player_humanoid_root_part,player_humanoid = player_character:FindFirstChild("HumanoidRootPart"), player_character:FindFirstChild("Humanoid")
			if not player_humanoid_root_part or player_humanoid then continue end
			if player_humanoid.Health < 1 then remove_hitbox(enemyPly) continue end
			
			player_humanoid_root_part.Size = Vector3.new(HBE_size.X,HBE_size.Y,HBE_size.Z)
			player_humanoid_root_part.Transparency = HBE_transparency
			player_humanoid_root_part.BrickColor = enemyPly.TeamColor
			player_humanoid_root_part.Shape = HBE_shape
			player_humanoid_root_part.CanCollide = true
		end
	end
end

local function sendNotification(title, text, duration)
	starter_gui:SetCore("SendNotification",{
		Title = title;
		Text = text;
		Duration = duration;
	})
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local about = Instance.new("TextLabel")
local Active = Instance.new("Frame")
local hbeLabel = Instance.new("TextLabel")
local statusButton = Instance.new("TextButton")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Size = Instance.new("Frame")
local sizeBox = Instance.new("TextBox")
local sizeLabel = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Transparency = Instance.new("Frame")
local transparencyLabel = Instance.new("TextLabel")
local transparencyBox = Instance.new("TextBox")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local Shape = Instance.new("Frame")
local shapeLabel = Instance.new("TextLabel")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local shapeButton = Instance.new("TextButton")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextButton_3 = Instance.new("TextButton")
local TextButton_4 = Instance.new("TextButton")
local TextButton_5 = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.400
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 10, 0.368000001, 0)
Frame.Size = UDim2.new(0, 274, 0, 300)

about.Name = "about"
about.Parent = Frame
about.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
about.BackgroundTransparency = 0.400
about.BorderColor3 = Color3.fromRGB(0, 0, 0)
about.BorderSizePixel = 0
about.Size = UDim2.new(0, 274, 0, 35)
about.Font = Enum.Font.Gotham
about.Text = "HitBox Expander"
about.TextColor3 = Color3.fromRGB(255, 255, 255)
about.TextScaled = true
about.TextSize = 14.000
about.TextWrapped = true

Active.Name = "Active"
Active.Parent = Frame
Active.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Active.BackgroundTransparency = 1.000
Active.BorderColor3 = Color3.fromRGB(0, 0, 0)
Active.BorderSizePixel = 0
Active.Position = UDim2.new(-0.00364963501, 0, 0.124568075, 0)
Active.Size = UDim2.new(0, 275, 0, 43)

hbeLabel.Name = "hbeLabel"
hbeLabel.Parent = Active
hbeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hbeLabel.BackgroundTransparency = 1.000
hbeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
hbeLabel.Position = UDim2.new(0, 10, 0.135000005, 0)
hbeLabel.Size = UDim2.new(0, 100, 0, 40)
hbeLabel.Font = Enum.Font.Gotham
hbeLabel.Text = "Active:"
hbeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hbeLabel.TextSize = 35.000
hbeLabel.TextWrapped = true
hbeLabel.TextXAlignment = Enum.TextXAlignment.Right

statusButton.Name = "statusButton"
statusButton.Parent = Active
statusButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
statusButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
statusButton.BorderSizePixel = 0
statusButton.Position = UDim2.new(0.518000007, 0, 0.129999995, 0)
statusButton.Size = UDim2.new(0, 120, 0, 40)
statusButton.Font = Enum.Font.Gotham
statusButton.Text = "ON"
statusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
statusButton.TextScaled = true
statusButton.TextSize = 14.000
statusButton.TextWrapped = true

UIAspectRatioConstraint.Parent = Active
UIAspectRatioConstraint.AspectRatio = 7.000

Size.Name = "Size"
Size.Parent = Frame
Size.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Size.BackgroundTransparency = 1.000
Size.BorderColor3 = Color3.fromRGB(0, 0, 0)
Size.BorderSizePixel = 0
Size.Position = UDim2.new(0, 0, 0.288321167, 0)
Size.Size = UDim2.new(0, 274, 0, 42)

sizeBox.Name = "sizeBox"
sizeBox.Parent = Size
sizeBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sizeBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
sizeBox.BorderSizePixel = 0
sizeBox.Position = UDim2.new(0.518000007, 0, 0, 8)
sizeBox.Size = UDim2.new(0, 120, 0, 40)
sizeBox.Font = Enum.Font.Gotham
sizeBox.Text = "8, 8, 8"
sizeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
sizeBox.TextScaled = true
sizeBox.TextSize = 14.000
sizeBox.TextWrapped = true

sizeLabel.Name = "sizeLabel"
sizeLabel.Parent = Size
sizeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sizeLabel.BackgroundTransparency = 1.000
sizeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
sizeLabel.Position = UDim2.new(0, 10, 0.100000001, 0)
sizeLabel.Size = UDim2.new(0, 100, 0, 40)
sizeLabel.Font = Enum.Font.Gotham
sizeLabel.Text = "Size:"
sizeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sizeLabel.TextSize = 35.000
sizeLabel.TextWrapped = true
sizeLabel.TextXAlignment = Enum.TextXAlignment.Right

UIAspectRatioConstraint_2.Parent = Size
UIAspectRatioConstraint_2.AspectRatio = 7.000

Transparency.Name = "Transparency"
Transparency.Parent = Frame
Transparency.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Transparency.BackgroundTransparency = 1.000
Transparency.BorderColor3 = Color3.fromRGB(0, 0, 0)
Transparency.BorderSizePixel = 0
Transparency.Position = UDim2.new(0, 0, 0.400000006, 12)
Transparency.Size = UDim2.new(0, 274, 0, 70)

transparencyLabel.Name = "transparencyLabel"
transparencyLabel.Parent = Transparency
transparencyLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
transparencyLabel.BackgroundTransparency = 1.000
transparencyLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
transparencyLabel.Size = UDim2.new(0, 274, 0, 40)
transparencyLabel.Font = Enum.Font.Gotham
transparencyLabel.Text = "Transparency:"
transparencyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
transparencyLabel.TextSize = 34.000
transparencyLabel.TextWrapped = true

transparencyBox.Name = "transparencyBox"
transparencyBox.Parent = Transparency
transparencyBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
transparencyBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
transparencyBox.BorderSizePixel = 0
transparencyBox.Position = UDim2.new(0.280996501, 0, 0.610833347, 0)
transparencyBox.Size = UDim2.new(0, 120, 0, 40)
transparencyBox.Font = Enum.Font.Gotham
transparencyBox.Text = "0.9"
transparencyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
transparencyBox.TextScaled = true
transparencyBox.TextSize = 14.000
transparencyBox.TextWrapped = true

UIAspectRatioConstraint_3.Parent = Transparency
UIAspectRatioConstraint_3.AspectRatio = 4.000

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Frame

UIAspectRatioConstraint_4.Parent = Frame

Shape.Name = "Shape"
Shape.Parent = Frame
Shape.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shape.BackgroundTransparency = 1.000
Shape.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shape.BorderSizePixel = 0
Shape.Position = UDim2.new(0, 0, 0.75999999, 0)
Shape.Size = UDim2.new(0, 274, 0, 50)

shapeLabel.Name = "shapeLabel"
shapeLabel.Parent = Shape
shapeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
shapeLabel.BackgroundTransparency = 1.000
shapeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
shapeLabel.Position = UDim2.new(0, 10, 0.129999995, 0)
shapeLabel.Size = UDim2.new(0, 100, 0, 40)
shapeLabel.Font = Enum.Font.Gotham
shapeLabel.Text = "Shape:"
shapeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
shapeLabel.TextSize = 35.000
shapeLabel.TextWrapped = true
shapeLabel.TextXAlignment = Enum.TextXAlignment.Right

UIAspectRatioConstraint_5.Parent = Shape
UIAspectRatioConstraint_5.AspectRatio = 7.000

shapeButton.Name = "shapeButton"
shapeButton.Parent = Shape
shapeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shapeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
shapeButton.BorderSizePixel = 0
shapeButton.Position = UDim2.new(0.518000007, 0, 0.129999995, 0)
shapeButton.Size = UDim2.new(0, 120, 0, 40)
shapeButton.ZIndex = 3
shapeButton.Font = Enum.Font.Gotham
shapeButton.Text = "Ball"
shapeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
shapeButton.TextScaled = true
shapeButton.TextSize = 14.000
shapeButton.TextWrapped = true
shapeButton.TextXAlignment = Enum.TextXAlignment.Left

ScrollingFrame.Parent = Shape
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 0.100
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.514999986, 0, -3.09737206, 0)
ScrollingFrame.Size = UDim2.new(0, 120, 0, 166)
ScrollingFrame.Visible = false
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 6, 0)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TextButton.Parent = ScrollingFrame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(0, 120, 0, 30)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "Ball"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

TextButton_2.Parent = ScrollingFrame
TextButton_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Size = UDim2.new(0, 120, 0, 30)
TextButton_2.Font = Enum.Font.Gotham
TextButton_2.Text = "Block"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true

TextButton_3.Parent = ScrollingFrame
TextButton_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Size = UDim2.new(0, 120, 0, 30)
TextButton_3.Font = Enum.Font.Gotham
TextButton_3.Text = "Cornerwedge"
TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_3.TextScaled = true
TextButton_3.TextSize = 14.000
TextButton_3.TextWrapped = true

TextButton_4.Parent = ScrollingFrame
TextButton_4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.BorderSizePixel = 0
TextButton_4.Size = UDim2.new(0, 120, 0, 30)
TextButton_4.Font = Enum.Font.Gotham
TextButton_4.Text = "Cylinder"
TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.TextScaled = true
TextButton_4.TextSize = 14.000
TextButton_4.TextWrapped = true

TextButton_5.Parent = ScrollingFrame
TextButton_5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextButton_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_5.BorderSizePixel = 0
TextButton_5.Size = UDim2.new(0, 120, 0, 30)
TextButton_5.Font = Enum.Font.Gotham
TextButton_5.Text = "Wedge"
TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_5.TextScaled = true
TextButton_5.TextSize = 14.000
TextButton_5.TextWrapped = true
-- Scripts:

statusButton.MouseButton1Down:connect(function()
	if statusButton.Text == "ON" then statusButton.Text = "OFF" enabled = false else statusButton.Text = "ON" enabled = true end
end)

shapeButton.MouseButton1Down:connect(function()
	ScrollingFrame.Visible = not ScrollingFrame.Visible
end)

for i,v in pairs(ScrollingFrame:GetChildren()) do
	if v:IsA("TextButton") then
		v.MouseButton1Down:connect(function()
			ScrollingFrame.Visible = false
			if v.Text == "Ball" then
				HBE_shape = Enum.PartType.Ball
			elseif v.Text == "Block" then
				HBE_shape = Enum.PartType.Block
			elseif v.Text == "Cornerwedge" then
				HBE_shape = Enum.PartType.CornerWedge
			elseif v.Text == "Cylinder" then
				HBE_shape = Enum.PartType.Cylinder
			elseif v.Text == "Wedge" then
				HBE_shape = Enum.PartType.Wedge
			end
			shapeButton.Text = v.Text
		end)
	end
end

sizeBox.FocusLost:connect(function()
	local size = sizeBox.Text:gsub(" ","")
	local x,y,z = size:match("(%d+),(%d+),(%d+)")
	if x and y and z then
		sizeBox.Text = x..", "..y..", "..z
		HBE_size = {X=x, Y=y, Z=z}
		coroutine.resume(coroutine.create(function()
			sizeBox.TextColor3 = Color3.new(0.333333, 0.666667, 0)
			wait(2)
			sizeBox.TextColor3 = Color3.new(255, 255, 255)
		end))
	end
end)

transparencyBox.FocusLost:connect(function()
	local Ttext = transparencyBox.Text
	if Ttext then
		transparencyBox.Text = Ttext
		HBE_transparency = Ttext
		coroutine.resume(coroutine.create(function()
			transparencyBox.TextColor3 = Color3.new(0.333333, 0.666667, 0)
			wait(2)
			transparencyBox.TextColor3 = Color3.new(255, 255, 255)
		end))
	end
end)

run_service.Stepped:Connect(extend_hitboxes)

sendNotification("Life in prison HitBox:", "some text later", 20)

UserInputService.InputBegan:connect(function(inputObject, gameProcessedEvent)
	if gameProcessedEvent then return end
	if inputObject.KeyCode == Enum.KeyCode.Q then
		ScreenGui.Enabled = not ScreenGui.Enabled
	end
end)


players.PlayerAdded:connect(function(ply) if table.find(blacklist,ply.Name) then sendNotification("blacklist",ply.Name.." joined the server",30) end end)
players.PlayerRemoving:connect(function(ply) if table.find(blacklist,ply.Name) then sendNotification("blacklist",ply.Name.." left the server",30) end end)
