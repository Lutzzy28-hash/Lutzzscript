game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins"
	Coins.Value = 0
	Coins.Parent = leaderstats
end)local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
end)local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TsunamiEvent = ReplicatedStorage:WaitForChild("TsunamiEvent")

script.Parent.MouseButton1Click:Connect(function()
	TsunamiEvent:FireServer()
end)local brainrotsFolder = workspace:WaitForChild("Brainrots")

while true do
	task.wait(10)
	
	for i = 1, 3 do
		local enemy = game.ServerStorage.BrainrotTemplate:Clone()
		enemy.Parent = brainrotsFolder
		enemy:MoveTo(Vector3.new(math.random(-20,20),5,math.random(-20,20)))
	end
endlocal wavePart = Instance.new("Part")
wavePart.Size = Vector3.new(50,1,50)
wavePart.Anchored = true
wavePart.Transparency = 0.5
wavePart.BrickColor = BrickColor.new("Bright blue")
wavePart.Position = Vector3.new(0,2,0)
wavePart.Parent = workspace

game.Debris:AddItem(wavePart, 2)local function autoInfinity(player)
	local stats = player:FindFirstChild("leaderstats")
	if not stats then return end
	
	local coins = stats:FindFirstChild("Coins")
	local infinity = stats:FindFirstChild("Infinity")
	
	if coins and infinity then
		if coins.Value >= 1000 then
			coins.Value = 0
			infinity.Value += 1
			print(player.Name .. " naik Infinity!")
		end
	end
endlocal function autoDivine(player)
	local stats = player.leaderstats
	if stats.Infinity.Value >= 10 then
		stats.Infinity.Value = 0
		stats.Divine.Value += 1
	end
end

local function autoCelestial(player)
	local stats = player.leaderstats
	if stats.Divine.Value >= 5 then
		stats.Divine.Value = 0
		stats.Celestial.Value += 1
	end
endif currentWave % 10 == 0 then
	local boss = game.ServerStorage.BossBrainrot:Clone()
	boss.Parent = workspace.Brainrots
	boss.Humanoid.MaxHealth = 1000 + (currentWave * 100)
	boss.Humanoid.Health = boss.Humanoid.MaxHealth
	print("Boss Spawned!")
else
	for i = 1, 5 do
		local enemy = game.ServerStorage.BrainrotTemplate:Clone()
		enemy.Parent = workspace.Brainrots
	end
end

currentWave += 1local modeGood = Instance.new("BoolValue")
modeGood.Name = "ModeGood"
modeGood.Value = true
modeGood.Parent = playerwhile true do
	task.wait(5)
	for _, player in pairs(game.Players:GetPlayers()) do
		autoInfinity(player)
		autoDivine(player)
		autoCelestial(player)
	end
		end
		
