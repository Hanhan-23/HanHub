local PlayersController = {}
local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")


function PlayersController:SetWalkSpeed(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

function PlayersController:SetJumpPower(power)
    humanoid.UseJumpPower = true
    humanoid.JumpPower = power
end
return PlayersController