print('started')
players = game:GetService("Players")
lighting = game:GetService("Lighting")
tweenService = game:GetService("TweenService")
starter_gui = game:GetService("StarterGui")
KJF_storage = game:FindFirstChild("KJF_storage") or Instance.new("Folder");KJF_storage.Name="KJF_storage"
localPlayer = players.LocalPlayer
prefix = '.'

chat_opened = true

teleportPos = {
	quad = Vector3.new(-625, 43, 775),
	crimbase = Vector3.new(800, 102, -729),
	yard = Vector3.new(-749, 102, -158),
	kitchen = Vector3.new(-854, 105, 39),
	cafeteria = Vector3.new(-876, 105, 27),
	cells = Vector3.new(-793, 105, -85),
	leaderboard = Vector3.new(-793, 105, 33),
	m60 = Vector3.new(464, 49, 123),
	ufospawn = Vector3.new(-197, 213, -1374),
	island_m79 = Vector3.new(55, 20, 392),
	mountant = Vector3.new(443, 200, -235),
	crim_roof = Vector3.new(800, 131.75, -726),
	awm_town = Vector3.new(399.75, 83, 106.375),
	minigun = Vector3.new(709.78, 29.25, 623.406),
	city_armory = Vector3.new(293.213, 29.5, 687.582),
	nexus = Vector3.new(-820.904, 102.249, -2.599),
	prison_roof = Vector3.new(-779.261, 132.748, -13.04),
	bus = Vector3.new(-419.874, 30.25, -523.775),
	secret_house = Vector3.new(627.916, -42, 113.206),
	armed_sp = Vector3.new(263.317, 30, -856.294),
	prison_armory = Vector3.new(-727, 105, 0),
	back_yard = Vector3.new(-905, 104, -104),
	prison_gate = Vector3.new(-520, 102, -24),
	prison_bridge = Vector3.new(-240, 101, 3),
	chinese_restaurant = Vector3.new(711, 32, 623)
}


function checkForPlayer(str)
	if str ~= nil then
		for i,plys in pairs(players:GetPlayers()) do
			if string.lower(str) == string.lower(string.sub(plys.DisplayName,1,#str)) then
				return plys
			end
		end
	end
end

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso')
	return rootPart
end

function teleport(pos)
	if localPlayer.Character ~= nil then
		if localPlayer.Character:FindFirstChildOfClass('Humanoid') and localPlayer.Character:FindFirstChildOfClass('Humanoid').SeatPart then
			localPlayer.Character:FindFirstChildOfClass('Humanoid').Sit = false
			wait(.1)
		end
		local targetPosition = teleportPos[pos]
		local magnitude = (localPlayer.Character.PrimaryPart.Position - targetPosition).magnitude
		local tweenSpeed = changeSpeed(magnitude)
		local cf = CFrame.new(targetPosition)
		tweenService:Create(getRoot(localPlayer.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = cf + Vector3.new(3, 1, 0)}):Play()
	end
end

function changeSpeed(pos)
	if pos < 99 then
		tweenSpeed = 0.2
	elseif pos < 100 then
		tweenSpeed = 0.5
	elseif pos < 200 then
		tweenSpeed = 0.8
	elseif pos < 300 then
		tweenSpeed = 0.8
	elseif pos < 400 then
		tweenSpeed = 1
	elseif pos < 500 then
		tweenSpeed = 1
	elseif pos < 600 then
		tweenSpeed = 1
	elseif pos < 700 then
		tweenSpeed = 1
	elseif pos < 800 then
		tweenSpeed = 1
	elseif pos < 900 then
		tweenSpeed = 2
	elseif pos < 1000 then
		tweenSpeed = 2
	elseif pos < 1100 then
		tweenSpeed = 3
	elseif pos < 1200 then
		tweenSpeed = 3
	elseif pos < 1300 then
		tweenSpeed = 3
	elseif pos < 1400 then
		tweenSpeed = 3
	elseif pos < 1500 then
		tweenSpeed = 4
	elseif pos < 1600 then
		tweenSpeed = 4
	elseif pos < 1700 then
		tweenSpeed = 5
	elseif pos < 1800 then
		tweenSpeed = 5
	elseif pos < 1900 then
		tweenSpeed = 6
	elseif pos < 2000 then
		tweenSpeed = 6
	elseif pos < 2100 then
		tweenSpeed = 7
	end
	return tweenSpeed
end

tweenSpeed = 4

--loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Unnamed/main/Library.lua'))()
--loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/Neverlose/source.lua"))()
library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = library:MakeWindow({
Name = "Aryan Classic", HidePremium = false, SaveConfig = true, ConfigFolder = "AryanClassicLIP", IntroEnabled = false
})

local LocalPlayerTab = Window:MakeTab({
 	Name = "LocalPlayer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local TeleportTab = Window:MakeTab({
 	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local CreditsTab = Window:MakeTab({
 	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


local Character = LocalPlayerTab:AddSection({
	Name = "LocalPlayer"
})
local FunSection = LocalPlayerTab:AddSection({
	Name = "Fun"
})

local Prison = TeleportTab:AddSection({
	Name = "Prison"
})
local Town = TeleportTab:AddSection({
	Name = "Town"
})
local Weapon = TeleportTab:AddSection({
	Name = "Weapon"
})


Character:AddSlider({
	Name = "Gravity",
	Min = 1,
	Max = 300,
	Default = 196,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "gravity",
	Callback = function(number)
		workspace.Gravity = number
	end    
})
Character:AddSlider({
	Name = "FOV",
	Min = 1,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Field of View",
	Callback = function(number)
		workspace.Camera.FieldOfView = number
	end    
})
Character:AddBind({
	Name = "Open/Close Chat",
	Default = Enum.KeyCode.Z,
	Hold = false,
	Callback = function()
		chat_opened = not chat_opened
		starter_gui:SetCore('ChatActive', chat_opened)
	end    
})

FunSection:AddButton({
	Name = "BTools!",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/TrAXzHJ/roblox-scripts/refs/heads/main/Custom%20BTools.lua"))()
  	end    
})
FunSection:AddToggle({
	Name = "FPS Boost",
	Default = false,
	Callback = function(boolean)
		if boolean then
    		lighting.GlobalShadows = false
    		lighting.ExposureCompensation = -0.8
			for _,v in pairs(lighting:GetChildren()) do
				if v.Name == "DepthOfField" or v.Name == "Blur" or v.Name == "SunRays" then
					v.Parent = KJF_storage
				end
			end
		else
			lighting.GlobalShadows = true
			lighting.ExposureCompensation = 0
			for _,v in pairs(KJF_storage:GetChildren()) do
				if v.Name == "DepthOfField" or v.Name == "Blur" or v.Name == "SunRays" then
					v.Parent = lighting
				end
			end
    	end
	end    
})
FunSection:AddToggle({
	Name = "Remove Doors",
	Default = false,
	Callback = function(boolean)
		if boolean then
    		if workspace:FindFirstChild("Doors") then
    			workspace:FindFirstChild("Doors").Parent = KJF_storage
    		end
		else
			if KJF_storage:FindFirstChild("Doors") then
				KJF_storage:FindFirstChild("Doors").Parent = workspace
    		end
    	end
	end    
})
FunSection:AddToggle({
	Name = "Remove Vents",
	Default = false,
	Callback = function(boolean)
		if boolean then
    		if workspace:FindFirstChild("Interactable"):FindFirstChild("Vents") then
    			workspace:FindFirstChild("Interactable"):FindFirstChild("Vents").Parent = KJF_storage
    		end
		else
			if KJF_storage:FindFirstChild("Vents") then
				KJF_storage:FindFirstChild("Vents").Parent = workspace:FindFirstChild("Interactable")
    		end
    	end
	end    
})

Prison:AddButton({
	Name = "Yard",
	Callback = function()
      	teleport('yard')
    end
})
Prison:AddButton({
	Name = "Back Yard",
	Callback = function()
      	teleport('back_yard')
    end
})
Prison:AddButton({
	Name = "Kitchen",
	Callback = function()
		teleport('kitchen')
	end
})
Prison:AddButton({
	Name = "Cafeteria",
	Callback = function()
		teleport('cafeteria')
	end
})
Prison:AddButton({
	Name = "Cells",
	Callback = function()
		teleport('cells')
	end
})
Prison:AddButton({
	Name = "Leaderboard",
	Callback = function()
		teleport('leaderboard')
	end
})
Prison:AddButton({
	Name = "Nexus",
	Callback = function()
		teleport('nexus')
	end
})
Prison:AddButton({
	Name = "Armory",
	Callback = function()
		teleport('prison_armory')
	end
})
Prison:AddButton({
	Name = "Prison Roof",
	Callback = function()
		teleport('prison_roof')
	end
})
Prison:AddButton({
	Name = "Prison Gate",
	Callback = function()
		teleport('prison_gate')
	end
})
Prison:AddButton({
	Name = "Prison Bridge",
	Callback = function()
		teleport('prison_bridge')
	end
})

Town:AddButton({
	Name = "Factory",
	Callback = function()
		teleport('quad')
	end
})
Town:AddButton({
	Name = "Criminal Base",
	Callback = function()
		teleport('crimbase')
	end
})
Town:AddButton({
	Name = "Criminal Roof",
	Callback = function()
		teleport('crim_roof')
	end
})
Town:AddButton({
	Name = "Mountant",
	Callback = function()
		teleport('mountant')
	end
})
Town:AddButton({
	Name = "City Armory",
	Callback = function()
		teleport('city_armory')
	end
})
Town:AddButton({
	Name = "Secret House",
	Callback = function()
		teleport('secret_house')
	end
})
Town:AddButton({
	Name = "Chinese restaurant",
	Callback = function()
		teleport("chinese_restaurant")
	end
})

Weapon:AddButton({
	Name = "M60",
	Callback = function()
		teleport('m60')
	end
})
Weapon:AddButton({
	Name = "AWM (Prison)",
	Callback = function()
		teleport('prison_armory')
	end
})
Weapon:AddButton({
	Name = "AWM (Town)",
	Callback = function()
		teleport('awm_town')
	end
})
Weapon:AddButton({
	Name = "Minigun",
	Callback = function()
		teleport('minigun')
	end
})
Weapon:AddButton({
	Name = "Thompson",
	Callback = function()
		teleport('minigun')
	end
})
library:Init()
