local PlayersController = {}

function PlayersController:SetWalkSpeed(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

return PlayersController