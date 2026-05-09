local PlayersController = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local IslandsFolder = workspace:WaitForChild("Islands")

-- WALK SPEED
function PlayersController:SetWalkSpeed(speed)
    local character = LocalPlayer.Character

    if not character then
        return
    end

    local humanoid =
        character:FindFirstChild("Humanoid")

    if humanoid then
        humanoid.WalkSpeed = speed
    end
end

-- JUMP POWER
function PlayersController:SetJumpPower(power)
    local character = LocalPlayer.Character

    if not character then
        return
    end

    local humanoid =
        character:FindFirstChild("Humanoid")

    if humanoid then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = power * 50
    end
end

-- GET ISLANDS
function PlayersController:GetIslandNames()
    local islandNames = {}

    for _, island in pairs(IslandsFolder:GetChildren()) do
        table.insert(islandNames, island.Name)
    end

    return islandNames
end

-- TELEPORT
function PlayersController:TeleportToIsland(islandName)
    local character = LocalPlayer.Character

    if not character then
        return false
    end

    local hrp =
        character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        return false
    end

    local island =
        IslandsFolder:FindFirstChild(islandName)

    if not island then
        return false
    end

    local target =
        island.PrimaryPart
        or island:FindFirstChildWhichIsA("BasePart")

    if not target then
        return false
    end

    hrp.CFrame =
        target.CFrame + Vector3.new(0, 5, 0)

    return true
end

return PlayersController