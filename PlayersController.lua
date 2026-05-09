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

    warn("Selected Island:", islandName)

    local character = LocalPlayer.Character

    if not character then
        warn("Character not found")
        return false
    end

    local hrp =
        character:FindFirstChild("HumanoidRootPart")

    if not hrp then
        warn("HumanoidRootPart not found")
        return false
    end

    local island =
        IslandsFolder:FindFirstChild(islandName)

    if not island then
        warn("Island not found")
        return false
    end

    warn("Island Found:", island.Name)

    local target =
        island.PrimaryPart
        or island:FindFirstChildWhichIsA("BasePart", true)

    if not target then
        warn("No BasePart found inside island")
        return false
    end

    warn("Teleport Target:", target.Name)

    hrp.CFrame =
        target.CFrame + Vector3.new(0, 5, 0)

    warn("Teleport success")

    return true
end

return PlayersController