local PlayersController = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local IslandsFolder = workspace:WaitForChild("Islands")
local LocationsFolder = workspace:WaitForChild("Locations")
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

-- GET LOCATIONS
function PlayersController:GetLocationsNames()
    local locationsNames = {}

    for _, location in ipairs(LocationsFolder:GetChildren()) do
        print(location.Name)

        table.insert(locationsNames, location.Name)
    end

    print("Total Locations:", #locationsNames)

    return locationsNames
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
        warn("Island not found:", islandName)
        return false
    end

    local target =
        island:FindFirstChild("Spawn", true)
        or island:FindFirstChild("SpawnLocation", true)
        or island.PrimaryPart
        or island:FindFirstChildWhichIsA("BasePart", true)

    if not target then
        warn("No teleport target found")
        return false
    end

    warn("Teleporting to:", island.Name)

    hrp.CFrame =
        target.CFrame + Vector3.new(0, 10, 0)

    return true
end

function PlayersController:TeleportToLocation(locationName)
    if not locationName then
        warn("No location selected")
        return false
    end

    local character = LocalPlayer.Character

    if not character then
        return false
    end

    local location =
        LocationsFolder:FindFirstChild(locationName)

    if not location then
        warn("Location not found:", locationName)
        return false
    end

    local target =
        location:FindFirstChild("Spawn", true)
        or location:FindFirstChildWhichIsA("BasePart", true)

    if not target then
        warn("No target part found")
        return false
    end

    character:PivotTo(target.CFrame + Vector3.new(0,5,0))

    return true
end

return PlayersController