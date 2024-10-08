print('started')
players = game:GetService("Players")
tweenService = game:GetService("TweenService")
starter_gui = game:GetService("StarterGui")
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

library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/main/Neverlose/source.lua"))()

local Window = library:Window({
	text = "Well well well"
})

local TabSection = Window:TabSection({
	text = "KJF Hub"
})

local LocalPlayerTab = TabSection:Tab({
    text = "Local Player",
    icon = "rbxassetid://7999345313",
})
local TeleportTab = TabSection:Tab({
    text = "Teleports",
    icon = "rbxassetid://7999345313",
})
local CreditsTab = TabSection:Tab({
    text = "Credits",
    icon = "rbxassetid://7999345313",
})


local Character = LocalPlayerTab:Section({
	text = "LocalPlayer"
})

local Prison = TeleportTab:Section({
	text = "Prison"
})
local Town = TeleportTab:Section({
	text = "Town"
})
local Weapon = TeleportTab:Section({
	text = "Weapon"
})


Character:Button({
	text = "BTools",
	callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/TrAXzHJ/roblox-scripts/refs/heads/main/Custom%20BTools.lua"))()
	end
})
Character:Slider({
    text = "Gravity",
    min = 1,
    max = 300,
    callback = function(number)
		workspace.Gravity = number
    end
})
Character:Slider({
    text = "FOV",
    min = 1,
    max = 120,
    callback = function(number)
		workspace.Camera.FieldOfView = number
    end
})
Character:Keybind({
    text = "Open/Close Chat",
    default = Enum.KeyCode.Z,
    callback = function(defaultBind)
		chat_opened = not chat_opened
		starter_gui:SetCore('ChatActive', chat_opened)
    end
})

Prison:Button({
	text = "Yard",
	callback = function()
		teleport('yard')
	end
})
Prison:Button({
	text = "Back Yard",
	callback = function()
		teleport('back_yard')
	end
})
Prison:Button({
	text = "Kitchen",
	callback = function()
		teleport('kitchen')
	end
})
Prison:Button({
	text = "Cafeteria",
	callback = function()
		teleport('cafeteria')
	end
})
Prison:Button({
	text = "Cells",
	callback = function()
		teleport('cells')
	end
})
Prison:Button({
	text = "Leaderboard",
	callback = function()
		teleport('leaderboard')
	end
})
Prison:Button({
	text = "Nexus",
	callback = function()
		teleport('nexus')
	end
})
Prison:Button({
	text = "Armory",
	callback = function()
		teleport('prison_armory')
	end
})
Prison:Button({
	text = "Prison Roof",
	callback = function()
		teleport('prison_roof')
	end
})
Prison:Button({
	text = "Prison Gate",
	callback = function()
		teleport('prison_gate')
	end
})
Prison:Button({
	text = "Prison Bridge",
	callback = function()
		teleport('prison_bridge')
	end
})

Town:Button({
	text = "Factory",
	callback = function()
		teleport('quad')
	end
})
Town:Button({
	text = "Criminal Base",
	callback = function()
		teleport('crimbase')
	end
})
Town:Button({
	text = "Criminal Roof",
	callback = function()
		teleport('crim_roof')
	end
})
Town:Button({
	text = "Mountant",
	callback = function()
		teleport('mountant')
	end
})
Town:Button({
	text = "City Armory",
	callback = function()
		teleport('city_armory')
	end
})
Town:Button({
	text = "Secret House",
	callback = function()
		teleport('secret_house')
	end
})
Town:Button({
	text = "Chinese restaurant",
	callback = function()
		teleport("chinese_restaurant")
	end
})

Weapon:Button({
	text = "M60",
	callback = function()
		teleport('m60')
	end
})
Weapon:Button({
	text = "AWM (Prison)",
	callback = function()
		teleport('prison_armory')
	end
})
Weapon:Button({
	text = "AWM (Town)",
	callback = function()
		teleport('awm_town')
	end
})
Weapon:Button({
	text = "Minigun",
	callback = function()
		teleport('minigun')
	end
})
Weapon:Button({
	text = "Thompson",
	callback = function()
		teleport('minigun')
	end
})
