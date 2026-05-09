local PlayersController = {}

function PlayersController:SetWalkSpeed(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

function PlayersController:SetJumpPower(power)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = power
end

return PlayersController