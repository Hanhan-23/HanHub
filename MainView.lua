local Fluent = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

-- local Controller = loadstring(game:HttpGet(
--     "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
-- ))()

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

Tabs.Fishing:AddSection("Mode Fishing")

Tabs.Fishing:AddToggle("Hectic Mode", 
{
    Title = "Hectic", 
    Description = "Brutal Fishing",
    Default = false,
    Callback = function(state)
      if state then
         print("Toggle On")

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

Window:SelectTab(1)

Fluent:Notify({
    Title = "Han Hub",
    Content = "Successfully Loaded",
    SubContent = "Experience enhanced gameplay",
    Duration = 5
})