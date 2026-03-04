-- Leaderboard
game.Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local Coins = Instance.new("IntValue")
    Coins.Name = "Coins"
    Coins.Value = 0
    Coins.Parent = leaderstats

    local Infinity = Instance.new("IntValue")
    Infinity.Name = "Infinity"
    Infinity.Value = 0
    Infinity.Parent = leaderstats

    local Divine = Instance.new("IntValue")
    Divine.Name = "Divine"
    Divine.Value = 0
    Divine.Parent = leaderstats

    local Celestial = Instance.new("IntValue")
    Celestial.Name = "Celestial"
    Celestial.Value = 0
    Celestial.Parent = leaderstats
end)

-- Tsunami Event
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

-- Spawn Enemy
local brainrotsFolder = workspace:WaitForChild("Brainrots")
local currentWave = 0

while true do
    task.wait(10)
    if currentWave % 10 == 0 then
        local boss = game.ServerStorage.BossBrainrot:Clone()
        boss.Parent = brainrotsFolder
        boss.Humanoid.MaxHealth = 1000 + (currentWave * 100)
        boss.Humanoid.Health = boss.Humanoid.MaxHealth
        print("Boss Spawned!")
    else
        for i = 1, 5 do
            local enemy = game.ServerStorage.BrainrotTemplate:Clone()
            enemy.Parent = brainrotsFolder
            enemy:MoveTo(Vector3.new(math.random(-20,20),5,math.random(-20,20)))
        end
    end
    currentWave += 1
end

-- Auto Upgrade
local function autoInfinity(player)
    local stats = player.leaderstats
    if stats.Coins.Value >= 1000 then
        stats.Coins.Value = 0
        stats.Infinity.Value += 1
        print(player.Name .. " naik Infinity!")
    end
end

local function autoDivine(player)
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
end

while true do
    task.wait(5)
    for _, player in pairs(game.Players:GetPlayers()) do
        autoInfinity(player)
        autoDivine(player)
        autoCelestial(player)
    end
end

		
