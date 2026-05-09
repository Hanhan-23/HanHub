local PlayersController = {}

function PlayersController:SetWalkSpeed(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

function PlayersController:SetJumpPower(power)
    local player = game.Players.LocalPlayer

    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid

        humanoid.UseJumpPower = true
        humanoid.JumpPower = power * 50
    end
end

return PlayersController