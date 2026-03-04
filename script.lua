game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins"
	Coins.Value = 0
	Coins.Parent = leaderstats
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Lutzzhub
    Text = "LutzzXDanzz",
    Duration = 5
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TsunamiEvent = ReplicatedStorage:WaitForChild("TsunamiEvent")

local button = script.Parent

button.MouseButton1Click:Connect(function()
	TsunamiEvent:FireServer()
end)
game.StarterGui:SetCore("SendNotification", {
    Title = "bokep",
    Text = "LutzzXDanzz",
    Duration = 5
})
while true do
	task.wait(5) -- cek tiap 5 detik
	
	for _, player in pairs(game.Players:GetPlayers()) do
		autoInfinity(player)
		autoDivine(player)
		autoCelestial(player)
	end
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TsunamiEvent = ReplicatedStorage:WaitForChild("TsunamiEvent")

local COOLDOWN = 15
local playerCooldown = {}

TsunamiEvent.OnServerEvent:Connect(function(player)
	if playerCooldown[player] then return end
	playerCooldown[player] = true
	
	local brainrots = workspace:FindFirstChild("Brainrots")
	if brainrots then
		for _, enemy in pairs(brainrots:GetChildren()) do
			local humanoid = enemy:FindFirstChild("Humanoid")
			if humanoid then
				humanoid:TakeDamage(50)
				
				if humanoid.Health <= 0 then
					player.leaderstats.Coins.Value += 10
				end
			end
		end
	end
	
	task.delay(COOLDOWN, function()
		playerCooldown[player] = nil
	end)
end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TsunamiEvent = ReplicatedStorage:WaitForChild("TsunamiEvent")

script.Parent.MouseButton1Click:Connect(function()
	TsunamiEvent:FireServer()
end)
local brainrotsFolder = workspace:WaitForChild("Brainrots")

while true do
	task.wait(10)
	
	for i = 1, 3 do
		local enemy = game.ServerStorage.BrainrotTemplate:Clone()
		enemy.Parent = brainrotsFolder
		enemy:MoveTo(Vector3.new(math.random(-20,20),5,math.random(-20,20)))
	end
end
local wavePart = Instance.new("Part")
wavePart.Size = Vector3.new(50,1,50)
wavePart.Anchored = true
wavePart.Transparency = 0.5
wavePart.BrickColor = BrickColor.new("Bright blue")
wavePart.Position = Vector3.new(0,2,0)
wavePart.Parent = workspace

game.Debris:AddItem(wavePart, 2)
