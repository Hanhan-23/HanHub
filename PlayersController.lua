local PlayersController = {}

function PlayersController:SetWalkSpeed(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

function PlayersController:SetJumpPower(power)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

    humanoid.UseJumpPower = true
    humanoid.JumpPower = power
end

return PlayersController