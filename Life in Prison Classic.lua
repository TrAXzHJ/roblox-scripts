print('started')
players = game:GetService("Players")
tweenService = game:GetService("TweenService")
localPlayer = players.LocalPlayer
prefix = '.'

library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Unnamed/main/Library.lua'))()

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

commands = {
	tomodel = function(speaker, arguments)
		if arguments[1] then
			for i,v in pairs(workspace:GetDescendants()) do
				if v.Name:lower() == arguments[1]:lower() and v:IsA("Model") then
					if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
						speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
						wait(.1)
					end
					local magnitude = (speaker.Character.PrimaryPart.Position - v:GetModelCFrame().p).magnitude
					tweenSpeed = changeSpeed(magnitude)
					tweenService:Create(getRoot(speaker.Character), TweenInfo.new(tweenSpeed, Enum.EasingStyle.Linear), {CFrame = v:GetModelCFrame()}):Play()
				end
			end
		end
	end,
}

local Window = library:Window({
	Text = "Aryan Classic For Life in Prison"
})
local TeleportTab = Window:Tab({
	Text = "Teleport"
})
local Prison = TeleportTab:Section({
	Text = "Prison"
})
local Town = TeleportTab:Section({
	Text = "Town"
})
local Weapon = TeleportTab:Section({
	Text = "Weapon"
})

Prison:Button({
	Text = "Yard",
	Callback = function()
		teleport('yard')
	end
})
Prison:Button({
	Text = "Back Yard",
	Callback = function()
		teleport('back_yard')
	end
})
Prison:Button({
	Text = "Kitchen",
	Callback = function()
		teleport('kitchen')
	end
})
Prison:Button({
	Text = "Cafeteria",
	Callback = function()
		teleport('cafeteria')
	end
})
Prison:Button({
	Text = "Cells",
	Callback = function()
		teleport('cells')
	end
})
Prison:Button({
	Text = "Leaderboard",
	Callback = function()
		teleport('leaderboard')
	end
})
Prison:Button({
	Text = "Nexus",
	Callback = function()
		teleport('nexus')
	end
})
Prison:Button({
	Text = "Armory",
	Callback = function()
		teleport('prison_armory')
	end
})
Prison:Button({
	Text = "Prison Roof",
	Callback = function()
		teleport('prison_roof')
	end
})
Prison:Button({
	Text = "Prison Gate",
	Callback = function()
		teleport('prison_gate')
	end
})
Prison:Button({
	Text = "Prison Bridge",
	Callback = function()
		teleport('prison_bridge')
	end
})

Town:Button({
	Text = "Factory",
	Callback = function()
		teleport('quad')
	end
})
Town:Button({
	Text = "Criminal Base",
	Callback = function()
		teleport('crimbase')
	end
})
Town:Button({
	Text = "Criminal Roof",
	Callback = function()
		teleport('crim_roof')
	end
})
Town:Button({
	Text = "Mountant",
	Callback = function()
		teleport('mountant')
	end
})
Town:Button({
	Text = "City Armory",
	Callback = function()
		teleport('city_armory')
	end
})
Town:Button({
	Text = "Secret House",
	Callback = function()
		teleport('secret_house')
	end
})
Town:Button({
	Text = "Island",
	Callback = function()
		teleport('island_m79')
	end
})

Weapon:Button({
	Text = "M60",
	Callback = function()
		teleport('m60')
	end
})
Weapon:Button({
	Text = "AWM (Town)",
	Callback = function()
		teleport('awm_town')
	end
})
Weapon:Button({
	Text = "Minigun",
	Callback = function()
		teleport('minigun')
	end
})

TeleportTab:Select()
