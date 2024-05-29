local players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local local_player = players.LocalPlayer
local run_service = game:GetService("RunService")
local starter_gui = game:GetService("StarterGui")
local whitelist = {"Vault8221","DreamKJF1","krytoi_loxloxov"}
local blacklist = {"MASTERANASVET"}
local enabled = true
local HBE_size = {X=8,Y=8,Z=8}
local HBE_transparency = 0

local function extend_hitboxes()
	if enabled == false then 
		for _, enemyPlys in pairs(players:GetPlayers()) do
			if enemyPlys.Name == local_player.Name then return end
			if enemyPlys.Character:FindFirstChild("HumanoidRootPart") then 
				local player_humanoid_root_part = enemyPlys.Character:findFirstChild("HumanoidRootPart")
				if not player_humanoid_root_part then return end
				if enemyPlys.Character.HumanoidRootPart.Transparency == 1 then return end
				player_humanoid_root_part.Size = Vector3.new(2, 2, 1)
				player_humanoid_root_part.Transparency = 1
				player_humanoid_root_part.BrickColor = enemyPlys.TeamColor
				player_humanoid_root_part.Shape = Enum.PartType.Ball
				player_humanoid_root_part.CanCollide = true
				break
			end
		end
		return 
	end
	if enabled == true then 
		local character = local_player.Character
		if not character then return end
		local humanoid_root_part = character:findFirstChild("HumanoidRootPart")
		if not humanoid_root_part then return end
		for _, enemyPlys in pairs(players:GetPlayers()) do
			if enemyPlys.Name == local_player.Name then return end
			if enemyPlys.Character:FindFirstChild("HumanoidRootPart") then 
				local player_humanoid_root_part = enemyPlys.Character:findFirstChild("HumanoidRootPart")
				if not player_humanoid_root_part then return end
				if enemyPlys.TeamColor ~= local_player.TeamColor then
				player_humanoid_root_part.Size = Vector3.new(HBE_size.X,HBE_size.Y,HBE_size.Z)
				player_humanoid_root_part.Transparency = HBE_transparency
				player_humanoid_root_part.BrickColor = enemyPlys.TeamColor
				player_humanoid_root_part.Shape = Enum.PartType.Ball
				player_humanoid_root_part.CanCollide = true
				end
			end
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
local Active = Instance.new("Folder")
local statusButton = Instance.new("TextButton")
local hbeLabel = Instance.new("TextLabel")
local Size = Instance.new("Folder")
local sizeLabel = Instance.new("TextLabel")
local sizeBox = Instance.new("TextBox")
local Transparency = Instance.new("Folder")
local transparencyLabel = Instance.new("TextLabel")
local transparencyBox = Instance.new("TextBox")
--Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.600
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 10, 0.368000001, 0)
Frame.Size = UDim2.new(0, 274, 0, 300)

about.Name = "about"
about.Parent = Frame
about.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
about.BackgroundTransparency = 0.600
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

statusButton.Name = "statusButton"
statusButton.Parent = Active
statusButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
statusButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
statusButton.BorderSizePixel = 0
statusButton.Position = UDim2.new(0.518222809, 0, 0.139166668, 0)
statusButton.Size = UDim2.new(0, 120, 0, 40)
statusButton.Font = Enum.Font.Gotham
statusButton.Text = "ON"
statusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
statusButton.TextScaled = true
statusButton.TextSize = 14.000
statusButton.TextWrapped = true

hbeLabel.Name = "hbeLabel"
hbeLabel.Parent = Active
hbeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hbeLabel.BackgroundTransparency = 1.000
hbeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
hbeLabel.Position = UDim2.new(0, 0, 0.139166668, 0)
hbeLabel.Size = UDim2.new(0, 100, 0, 40)
hbeLabel.Font = Enum.Font.Gotham
hbeLabel.Text = "Active:"
hbeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hbeLabel.TextSize = 35.000
hbeLabel.TextWrapped = true
hbeLabel.TextXAlignment = Enum.TextXAlignment.Right

Size.Name = "Size"
Size.Parent = Frame

sizeLabel.Name = "sizeLabel"
sizeLabel.Parent = Size
sizeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sizeLabel.BackgroundTransparency = 1.000
sizeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
sizeLabel.Position = UDim2.new(-3.31712791e-08, 0, 0.297500014, 0)
sizeLabel.Size = UDim2.new(0, 100, 0, 40)
sizeLabel.Font = Enum.Font.Gotham
sizeLabel.Text = "Size:"
sizeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sizeLabel.TextSize = 35.000
sizeLabel.TextWrapped = true
sizeLabel.TextXAlignment = Enum.TextXAlignment.Right

sizeBox.Name = "sizeBox"
sizeBox.Parent = Size
sizeBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
sizeBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
sizeBox.BorderSizePixel = 0
sizeBox.Position = UDim2.new(0.518222809, 0, 0.297500014, 0)
sizeBox.Size = UDim2.new(0, 120, 0, 40)
sizeBox.Font = Enum.Font.Gotham
sizeBox.Text = "8, 8, 8"
sizeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
sizeBox.TextScaled = true
sizeBox.TextSize = 14.000
sizeBox.TextWrapped = true

Transparency.Name = "Transparency"
Transparency.Parent = Frame

transparencyLabel.Name = "transparencyLabel"
transparencyLabel.Parent = Transparency
transparencyLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
transparencyLabel.BackgroundTransparency = 1.000
transparencyLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
transparencyLabel.Position = UDim2.new(0, 0, 0.454166681, 0)
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
transparencyBox.Text = "1"
transparencyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
transparencyBox.TextScaled = true
transparencyBox.TextSize = 14.000
transparencyBox.TextWrapped = true



statusButton.MouseButton1Down:connect(function()
	if statusButton.Text == "ON" then statusButton.Text = "OFF" enabled = false else statusButton.Text = "ON" enabled = true end
end)

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

sendNotification("Life in prison HitBox:", "some text later 😊", 20)

players.PlayerAdded:connect(function(ply) if table.find(blacklist,ply.Name) then sendNotification("blacklist",ply.Name.." joined the server",30) end end)
players.PlayerRemoving:connect(function(ply) if table.find(blacklist,ply.Name) then sendNotification("blacklist",ply.Name.." left the server",30) end end)
