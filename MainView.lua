local Fluent = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

local PlayersController = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Hanhan-23/HanHub/main/PlayersController.lua?t=" .. tick()
))()

local IslandNames = {}
local selectedIsland
local selectedLocation

local Window = Fluent:CreateWindow({
    Title = "🛠️ Han Hub",
    SubTitle = "Premium Script Hub",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Fishing = Window:AddTab({
         Title = "Fishing",
         Icon = "anchor"
    }),
    Players = Window:AddTab({
         Title = "Players",
         Icon = "user"
    }),
    Settings = Window:AddTab({
         Title = "Settings",
         Icon = "settings"
    })
}

--SECTION FISHING
Tabs.Fishing:AddSection("Mode Fishing")

Tabs.Fishing:AddToggle("Hectic Mode", 
{
    Title = "Hectic", 
    Description = "Brutal Fishing",
    Default = false,
    Callback = function(state)
      if state then
         Fluent:Notify({
            Title = "Hectic Mode",
            Content = "ACTIVATED",
            Duration = 5
         })

      else
         print("Toggle Off")

         Fluent:Notify({
            Title = "Hectic Mode",
            Content = "UNACTIVATED",
            Duration = 5
         })
         end
      end 
})


--SECTION PLAYERS
Tabs.Players:AddSection("Players Abilities")
Tabs.Players:AddSlider("WalkSpeed", {
    Title = "Walk Speed",
    Description = "Increase your walk speed",

    Default = 1,
    Min = 1,
    Max = 10,
    Rounding = 1,

    Callback = function(Value)
        local speed = Value * 16

        PlayersController:SetWalkSpeed(speed)
    end
})

Tabs.Players:AddSlider("JumpPower", {
    Title = "Jump Power",
    Description = "Increase your jump height",

    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 1,

    Callback = function(Value)
        PlayersController:SetJumpPower(Value)
    end
})

Tabs.Players:AddSection("Players Teleport")
Tabs.Players:AddDropdown("Teleport", {
    Title = "Teleport",
    Description = "Teleport to island",

    Values = PlayersController:GetIslandNames(),
    Multi = false,
    Default = 1,

    Callback = function(value)
        selectedIsland = value
    end
})
Tabs.Players:AddButton({
    Title = "Teleport to island",

    Callback = function()
        PlayersController:TeleportToIsland(selectedIsland)
    end
})

Tabs.Players:AddDropdown("TeleportLocation", {
    Title = "Teleport location",
    Description = "Teleport to location on island",

    Values = PlayersController:GetLocationsNames(),
    Multi = false,
    Default = PlayersController:GetLocationsNames()[1],

    Callback = function(value)
        selectedLocation = value
    end
})

Window:SelectTab(1)

Fluent:Notify({
    Title = "Han Hub",
    Content = "Successfully Loaded",
    SubContent = "Experience enhanced gameplay",
    Duration = 5
})