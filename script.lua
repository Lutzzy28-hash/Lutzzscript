print("Script berhasil dimuat!")

game.StarterGui:SetCore("SendNotification", {
    Title = "Test Script",
    Text = "Berhasil execute!",
    Duration = 5
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TsunamiEvent = ReplicatedStorage:WaitForChild("TsunamiEvent")

local button = script.Parent

button.MouseButton1Click:Connect(function()
	TsunamiEvent:FireServer()
end)
game.StarterGui:SetCore("SendNotification", {
    Title = "Test",
    Text = "Script berhasil jalan",
    Duration = 5
})
