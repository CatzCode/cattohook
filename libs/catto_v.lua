-- cattohook // catto_v.lua \\ 12/2/21 --

-- made by false --

print("using cattohook visuals library")

local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInput = game:GetService("UserInputService")

getgenv().cv_settings = {
    box = {
        enabled = false,
        outline = false,
        healthbar = false,
        color1 = Color3.fromRGB(255, 255, 255),
        color2 = Color3.fromRGB(0, 0, 0)
    },
    tracer = {
        enabled = false,
        unlocktracers = false,
        color = Color3.fromRGB(255, 255, 255)
    },
    names = {
        enabled = false,
        outline = false,
        font = "Monospace",
        size = 16,
        color = Color3.fromRGB(255, 255, 255)
    },
    misc = {
        teamcheck = false,
        useteamcolors = false,
        visibleonly = false
    }
}

assert(getgenv().cv_settings, "could not load settings")

function esp(v)
    -- box --
    local Box = Drawing.new("Square")
    Box.Visible = false,
    Box.Color = Color3.fromRGB(255, 255, 255)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local BOutline = Drawing.new("Square")
    Box.Visible = false,
    Box.Color = Color3.fromRGB(0, 0, 0)
    Box.Thickness = 3
    Box.Transparency = 1
    Box.Filled = false

    local HBOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false
    
    -- tracer --

    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    -- name --

    local Name = Drawing.new("Text")
    Name.Transparency = 1
    Name.Visible = false
    Name.Color = Color3.new(1,1,1)
    Name.Size = 12
    Name.Center = true
    Name.Outline = false
    Name.Text = "name [100/100]"

    game:GetService("RunService").RenderStepped:Connect(function()
        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 and (not cv_settings.misc.teamcheck or v.TeamColor == lplr.TeamColor) then
            local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
            local Distance = (CurrentCamera.CFrame.p - v.Character.HumanoidRootPart.Position).Magnitude
            local RootPart = v.Character.HumanoidRootPart
            local Head = v.Character.Head
            local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
            local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + Vector3.new(0,0.5,0))
            local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - Vector3.new(0,3,0))
            if (not cv_settings.misc.visibleonly or onScreen) then
                if cv_settings.box.enabled then
                    BOutline.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BOutline.Position = Vector2.new(RootPosition.X - BOutline.Size.X / 2, RootPosition.Y - BOutline.Size.Y / 2)
                    BOutline.Visible = cv_settings.box.outline
                    BOutline.Color = cv_settings.box.color2
    
                    Box.Size = Vector2.new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = cv_settings.box.enabled
                    if not cv_settings.misc.useteamcolors then
                        Box.Color = v.TeamColor
                    else
                        Box.Color = cv_settings.box.color1
                    end
                        
                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = cv_settings.box.outline
    
                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0,v.Character.Humanoid.MaxHealth)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                    HealthBar.Color = Color3.fromRGB(255 - 255 / (v.Character.Humanoid.MaxHealth / v.Character.Humanoid.Health), 255 / (v.Character.Humanoid.MaxHealth / v.Character.Humanoid.Health), 0)
                    HealthBar.Visible = cv_settings.box.healthbar
                else
                    BOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
                if cv_settings.tracer.enabled then
                    if cv_settings.tracer.unlocktracers then
                        Tracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                    else
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    end
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    Tracer.Color = cv_settings.tracer.color
                    Tracer.Visible = cv_settings.tracer.enabled
                else
                    Tracer.Visible = false
                end
                if cv_settings.name.enabled then
                    Name.Text = tostring(v.Name).. "[".. tostring(v.Humanoid.Health) .. "/" .. tostring(v.Humanoid.MaxHealth) "]"
                    Name.Position = Vector2.new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
                    Name.Visible = true
                    Name.Size = cv_settings.name.size
                    Name.Color = cv_settings.name.color
                    Name.Outline = cv_settings.name.outline
                    if esp_settings.font == "UI" then
                        Name.Font = 0
                    elseif esp_settings.font == "System" then
                        Name.Font = 1
                    elseif esp_settings.font == "Plex" then
                        Name.Font = 2
                    elseif esp_settings.font == "Monospace" then
                        Name.Font = 3
                    end
                else
                    Name.Visible = false
                end
            else
                BOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
                Tracer.Visible = false
                Name.Visible = false
            end
        else
            BOutline.Visible = false
            Box.Visible = false
            HealthBarOutline.Visible = false
            HealthBar.Visible = false
            Tracer.Visible = false
            Name.Visible = false
        end
    end)
end

for i,v in pairs(game.Players:GetChildren()) do
    esp(v)
end

game.Players.PlayerAdded:Connect(function(v)
    esp(v)
end)
