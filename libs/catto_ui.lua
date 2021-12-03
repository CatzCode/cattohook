local Exploit = (syn and "Synapse" or secure_load and "Sentinel" or pebc_execute and "ProtoSmasher")
local Vanilla = {}

repeat wait() until game:IsLoaded()

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local EncryptedCheck = HttpService:GenerateGUID(false)

local VanillaBootstrapper = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Logo = Instance.new("TextLabel")
local LogoGradient = Instance.new("UIGradient")
local CLogo = Instance.new("TextLabel")
local CLogoGradient = Instance.new("UIGradient")
local Status = Instance.new("TextLabel")

VanillaBootstrapper.Name = "VanillaBootstrapper"

if Exploit == "Synapse" and syn.protect_gui then 
    syn.protect_gui(VanillaBootstrapper)
    VanillaBootstrapper.Parent = game:GetService("CoreGui")
elseif Exploit == "ProtoSmasher" and get_hidden_gui then
    get_hidden_gui(VanillaBootstrapper)
    VanillaBootstrapper.Parent = game:GetService("CoreGui")
else
    VanillaBootstrapper.Parent = game:GetService("CoreGui")
end


Main.Name = "Main"
Main.Parent = VanillaBootstrapper
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.5, -125, 0.5, -63)
Main.Size = UDim2.new(0, 250, 0, 126)
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Color3.fromRGB(35, 35, 35)
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.08
Main.ImageTransparency = 1

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0.5, -124, 0.5, -23)
Logo.Size = UDim2.new(0, 249, 0, 47)
Logo.Font = Enum.Font.SourceSansBold
Logo.Text = "Vanilla"
Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
Logo.TextSize = 44.000
Logo.TextTransparency = 1

LogoGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(122, 191, 202)), ColorSequenceKeypoint.new(0.787, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
LogoGradient.Rotation = -90
LogoGradient.Parent = Logo

CLogo.Name = "CLogo"
CLogo.Parent = Main
CLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CLogo.BackgroundTransparency = 1.000
CLogo.Position = UDim2.new(0.5, -124, 1.2, -23)
CLogo.Size = UDim2.new(0, 249, 0, 47)
CLogo.Font = Enum.Font.SourceSansBold
CLogo.Text = "C"
CLogo.TextColor3 = Color3.fromRGB(255, 255, 255)
CLogo.TextSize = 44.000
CLogo.TextTransparency = 1

CLogoGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(122, 191, 202)), ColorSequenceKeypoint.new(0.787, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
CLogoGradient.Rotation = -90
CLogoGradient.Parent = CLogo

Status.Name = "Status"
Status.Parent = Main
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.Position = UDim2.new(0.5, -124, 0.858730257, -23)
Status.Size = UDim2.new(0, 249, 0, 27)
Status.Font = Enum.Font.SourceSansBold
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(255, 255, 255)
Status.TextSize = 22.000
Status.TextStrokeTransparency = 1
Status.TextTransparency = 1


function ChangeStatus(text)
    TweenService:Create(Status, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
    repeat wait() until Status.TextTransparency == 1
    Status.Text = text
    TweenService:Create(Status, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
end

local LocalPlayer = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local Camera = Workspace:FindFirstChildOfClass("Camera")
local CurrentCamera = Workspace.CurrentCamera

local Mouse = LocalPlayer:GetMouse()
local ClosureCheck = is_synapse_function or is_protosmasher_caller or issentinelclosure

local VanillaLibrary = Instance.new("ScreenGui")
local Container = Instance.new("Frame")
local Main = Instance.new("Frame")
local IntroFade = Instance.new("Frame")
local VanillaGlow = Instance.new("ImageLabel")
local Sections = Instance.new("Frame")
local VanillaTitle = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
local TabsHolder = Instance.new("Frame")
local TabsList = Instance.new("UIListLayout")
local TabSelectSidebar = Instance.new("Frame")
local MainToggle = Instance.new("ImageLabel")
local TabToggleButton = Instance.new("TextButton")
local TabToggleArrow = Instance.new("ImageLabel")

local Library = {
    Interface = {
        ForegroundColor = Color3.fromRGB(33, 33, 33),
        BackgroundColor = Color3.fromRGB(24, 24, 24),
        SliderColor = Color3.fromRGB(255, 197, 197),
        ToggleOnColor = Color3.fromRGB(255, 180, 180),
        ToggleOffColor = Color3.fromRGB(187, 127, 127),
        ToggleKey = Enum.KeyCode.RightShift
    }
}

local SelectingTabs = false
local SelectTabOpen = false
local OnTab = false
local IsKeyBinding = false
local SetSectionName = ""

local ColorPickerHuePosition = 0
local RainbowModeColorValue = 0

local TabsSelectOpenSize = UDim2.new(0.252, 38, 1, 0)

VanillaLibrary.Name = "Vanilla"
if Exploit == "Synapse" and syn.protect_gui then 
    syn.protect_gui(VanillaLibrary)
    VanillaLibrary.Parent = game:GetService("CoreGui")
elseif Exploit == "ProtoSmasher" and get_hidden_gui then
    get_hidden_gui(VanillaLibrary)
    VanillaLibrary.Parent = game:GetService("CoreGui")
elseif Exploit == "Sentinel" then
    VanillaLibrary.Parent = game:GetService("CoreGui")
end
VanillaLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Container.Name = "Container"
Container.Parent = VanillaLibrary
Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Container.BackgroundTransparency = 1.000
Container.Size = UDim2.new(0, 100, 0, 100)
Container.Position = UDim2.new(0.5, -50, 0.5, -50)

Main.Name = "Main"
Main.Parent = Container
Main.BackgroundColor3 = Library.Interface.BackgroundColor
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -200, 0.5, -150)
Main.Size = UDim2.new(0, 500, 0, 400)

IntroFade.Name = "IntroFade"
IntroFade.Parent = Main
IntroFade.BackgroundColor3 = Color3.fromRGB(20, 18, 44)
IntroFade.BackgroundTransparency = 0
IntroFade.BorderSizePixel = 0
IntroFade.Position = UDim2.new(0.0949999988, 0, 0, 0)
IntroFade.Size = UDim2.new(0, 362, 0, 300)
IntroFade.ZIndex = 15

VanillaGlow.Name = "VanillaGlow"
VanillaGlow.Parent = Main
VanillaGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VanillaGlow.BackgroundTransparency = 1.000
VanillaGlow.BorderSizePixel = 0
VanillaGlow.Position = UDim2.new(0, -15, 0, -15)
VanillaGlow.Size = UDim2.new(1, 30, 1, 30)
VanillaGlow.ZIndex = 0
VanillaGlow.Image = "rbxassetid://4905552912"
VanillaGlow.ImageColor3 = Color3.fromRGB(10, 10, 25)
VanillaGlow.ScaleType = Enum.ScaleType.Slice
VanillaGlow.SliceCenter = Rect.new(20, 20, 280, 280)
VanillaGlow.ImageTransparency = 1

Sections.Name = "Sections"
Sections.Parent = Main
Sections.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sections.BackgroundTransparency = 1.000
Sections.BorderSizePixel = 0
Sections.Position = UDim2.new(0, 38, 0, 0)
Sections.Size = UDim2.new(1, -45, 1, 0)

VanillaTitle.Name = "VanillaTitle"
VanillaTitle.Parent = Sections
VanillaTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
VanillaTitle.BackgroundTransparency = 1.000
VanillaTitle.Position = UDim2.new(0, 14, 0, 14)
VanillaTitle.Size = UDim2.new(1, -28, 0, 16)
VanillaTitle.Font = Enum.Font.Gotham
VanillaTitle.Text = "welcome to cattohook"
VanillaTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
VanillaTitle.TextSize = 16.000
VanillaTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
VanillaTitle.TextStrokeTransparency = 0.920
VanillaTitle.TextTransparency = 1
VanillaTitle.TextXAlignment = Enum.TextXAlignment.Left

Tabs.Name = "Tabs"
Tabs.Parent = Main
Tabs.BackgroundColor3 = Library.Interface.ForegroundColor
Tabs.BorderSizePixel = 0
Tabs.ClipsDescendants = true
Tabs.Size = UDim2.new(0, 0, 1, 0)
Tabs.ZIndex = 2

TabsHolder.Name = "TabsHolder"
TabsHolder.Parent = Tabs
TabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabsHolder.BackgroundTransparency = 1.000
TabsHolder.BorderSizePixel = 0
TabsHolder.ClipsDescendants = true
TabsHolder.Position = UDim2.new(0, 6, 0, 6)
TabsHolder.Size = UDim2.new(0, 128, 0, 288)
TabsHolder.ZIndex = 2

TabsList.Name = "TabsList"
TabsList.Parent = TabsHolder
TabsList.SortOrder = Enum.SortOrder.LayoutOrder

TabSelectSidebar.Name = "TabSelectSidebar"
TabSelectSidebar.Parent = TabsHolder
TabSelectSidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabSelectSidebar.BackgroundTransparency = 1.000
TabSelectSidebar.Size = UDim2.new(1, 0, 0, 34)
TabSelectSidebar.ZIndex = 2

MainToggle.Archivable = false
MainToggle.Name = "MainToggle"
MainToggle.Parent = TabSelectSidebar
MainToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainToggle.BackgroundTransparency = 1.000
MainToggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
MainToggle.Position = UDim2.new(0, 0, 0.5, -12)
MainToggle.Size = UDim2.new(0, 24, 0, 24)
MainToggle.ZIndex = 2
MainToggle.Image = "rbxassetid://3463843000"
MainToggle.ImageColor3 = Color3.fromRGB(0, 0, 0)
MainToggle.ImageTransparency = 1.000
MainToggle.ScaleType = Enum.ScaleType.Slice
MainToggle.SliceCenter = Rect.new(12, 12, 288, 288)

TabToggleButton.Name = "TabToggleButton"
TabToggleButton.Parent = MainToggle
TabToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TabToggleButton.BackgroundTransparency = 1.000
TabToggleButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
TabToggleButton.BorderSizePixel = 0
TabToggleButton.Size = UDim2.new(1, 0, 1, 0)
TabToggleButton.ZIndex = 2
TabToggleButton.Font = Enum.Font.SourceSans
TabToggleButton.Text = ""
TabToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TabToggleButton.TextSize = 14.000

TabToggleArrow.Name = "TabToggleArrow"
TabToggleArrow.Parent = MainToggle
TabToggleArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TabToggleArrow.BackgroundTransparency = 1.000
TabToggleArrow.BorderSizePixel = 0
TabToggleArrow.Position = UDim2.new(0.5, -9, 0.5, -9)
TabToggleArrow.Rotation = 180.000
TabToggleArrow.Size = UDim2.new(0, 18, 0, 18)
TabToggleArrow.ZIndex = 2
TabToggleArrow.Image = "rbxassetid://4905746471"

function Library:CloseAllTabs()
    SelectingTabs = false

    for i, v in pairs(TabsHolder:GetChildren()) do
        if v:IsA("ImageLabel") then
            for o, b in pairs(v:GetChildren()) do
                if b.Name == "Icon" then
                    TweenService:Create(b, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                end
            end
        end
    end

    for i, v in pairs(TabsHolder:GetChildren()) do
        if v:IsA("Frame") and v.Name ~= "TabSelectSidebar" then
            TweenService:Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 0)}):Play()
        end
    end
end

function Library:CloseAllSections()
    OnTab = false

    for i, v in pairs(TabsHolder:GetChildren()) do
        if v:IsA("Frame") and v.Name ~= "TabSelectSidebar" then
            for o, b in pairs(v:GetChildren()) do
                if b:IsA("Frame") then
                    for p, n in pairs(b:GetChildren()) do
                        if n:IsA("ImageLabel") then
                            TweenService:Create(n, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
                        end
                    end
                end
            end
        end
    end
end

function Library:HideAllSections()
    for i, v in pairs(Sections:GetChildren()) do
        if v:IsA("Frame") then
            v.Visible = false
        end
    end
end

local function RemoveSpaces(str)
    return str:gsub(" ", "")
end

TabToggleButton.MouseButton1Down:Connect(function()
    SelectTabOpen = not SelectTabOpen

    if SelectTabOpen then
        TweenService:Create(Tabs, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = TabsSelectOpenSize}):Play()
        TweenService:Create(TabToggleArrow, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{Rotation = 0}):Play()
    elseif not SelectTabOpen then
        TweenService:Create(Tabs, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 38, 1, 0)}):Play()
        TweenService:Create(TabToggleArrow, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 180}):Play()
        -- Library:CloseAllTabs()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if IsKeyBinding then return end
    if input.KeyCode == Library.Interface.ToggleKey then
        VanillaLibrary.Enabled = not VanillaLibrary.Enabled
    end
end)

function Library:Dragging(instancename, instancename2)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function update(input)
        local Delta = input.Position - DragStart
        instancename2.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
    end

    instancename.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = instancename2.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    instancename.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            DragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            update(input)
        end
    end)
end

-- Library:Dragging(Main, Main)
function dragify(Frame)
    dragToggle = nil
    dragSpeed = 0.25
    dragInput = nil
    dragStart = nil
    dragPos = nil
    
    function updateInput(input)
        Delta = input.Position - dragStart
        Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
    end
    
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if (input.UserInputState == Enum.UserInputState.End) then
                    dragToggle = false
                end
            end)
        end
    end)
    
    Frame.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if (input == dragInput and dragToggle) then
            updateInput(input)
        end
    end)
end
dragify(Main)

function SetSection(name)
    SetSectionName = name
end

coroutine.wrap(function()
    while wait() do
        RainbowModeColorValue = RainbowModeColorValue + 1/255
        if RainbowModeColorValue >= 1 then
            RainbowModeColorValue = 0
        end
        ColorPickerHuePosition = ColorPickerHuePosition + 1
        if ColorPickerHuePosition == 122 then
            ColorPickerHuePosition = 0
        end
    end
end)()

function Library:NewWindow(name, icon)
    local VanillaTab = Instance.new("ImageLabel")
    local Button = Instance.new("TextButton")
    local VanillaTabTitle = Instance.new("TextLabel")
    local Icon = Instance.new("ImageLabel")
    local Icon2 = Instance.new("ImageLabel")
    local VanillaSections = Instance.new("Frame")
    local VanillaSectionsHolder = Instance.new("Frame")
    local SectionsList = Instance.new("UIListLayout")

    local TabName = RemoveSpaces(name)

    local TabIcon = icon
    if TabIcon == nil then
        TabIcon = "4903488732"
    end

    local SectionsHolderSize = 0

    VanillaTab.Name = (TabName .. "Tab")
    VanillaTab.Parent = TabsHolder
    VanillaTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VanillaTab.BackgroundTransparency = 1.000
    VanillaTab.BorderColor3 = Color3.fromRGB(27, 42, 53)
    VanillaTab.Size = UDim2.new(1.4, 0, 0, 45)
    VanillaTab.ZIndex = 2
    VanillaTab.Image = "rbxassetid://4840201589"
    VanillaTab.ImageColor3 = Color3.fromRGB(0, 0, 0)
    VanillaTab.ImageTransparency = 1.000
    VanillaTab.ScaleType = Enum.ScaleType.Slice
    VanillaTab.SliceCenter = Rect.new(2, 2, 298, 298)
    
    Button.Name = "Button"
    Button.Parent = VanillaTab
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Button.BackgroundTransparency = 1.000
    Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.ZIndex = 2
    Button.Font = Enum.Font.SourceSans
    Button.Text = ""
    Button.TextColor3 = Color3.fromRGB(0, 0, 0)
    Button.TextSize = 14.000
    
    VanillaTabTitle.Name =  (TabName .. "Title")
    VanillaTabTitle.Parent = VanillaTab
    VanillaTabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VanillaTabTitle.BackgroundTransparency = 1.000
    VanillaTabTitle.Position = UDim2.new(0, 32, 0, 0)
    VanillaTabTitle.Size = UDim2.new(0, 200, 1, 0)
    VanillaTabTitle.ZIndex = 2
    VanillaTabTitle.Font = Enum.Font.Gotham
    VanillaTabTitle.Text = name
    VanillaTabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    VanillaTabTitle.TextSize = 12.000
    VanillaTabTitle.TextXAlignment = Enum.TextXAlignment.Left

    Icon.Name = "Icon"
    Icon.Parent = VanillaTab
    Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon.BackgroundTransparency = 1.000
    Icon.Position = UDim2.new(0, 128, 0.5, -9)
    Icon.Size = UDim2.new(0, 18, 0, 18)
    Icon.ZIndex = 2
    Icon.Image = "rbxassetid://4900368673"
    
    Icon2.Name = "Icon2"
    Icon2.Parent = VanillaTab
    Icon2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Icon2.BackgroundTransparency = 1.000
    Icon2.BorderSizePixel = 0
    Icon2.Position = UDim2.new(0, 4, 0.5, -9)
    Icon2.Size = UDim2.new(0, 18, 0, 18)
    Icon2.ZIndex = 2
    Icon2.Image = ("rbxassetid://" .. TabIcon)
    Icon2.ImageTransparency = 1

    TweenService:Create(Icon2, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()

    VanillaSections.Name =  (TabName .. "Sections")
    VanillaSections.Parent = TabsHolder
    VanillaSections.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VanillaSections.BackgroundTransparency = 1.000
    VanillaSections.ClipsDescendants = true
    VanillaSections.Position = UDim2.new(0, 0, 0.899999976, 0)
    VanillaSections.Size = UDim2.new(1, 0, 0, SectionsHolderSize)
    VanillaSections.ZIndex = 2
    
    VanillaSectionsHolder.Name = (TabName .. "SectionsHolder")
    VanillaSectionsHolder.Parent = VanillaSections
    VanillaSectionsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VanillaSectionsHolder.BackgroundTransparency = 1.000
    VanillaSectionsHolder.Size = UDim2.new(1, 0, 1, -6)
    VanillaSectionsHolder.ZIndex = 2
    
    SectionsList.Name = "SectionsList"
    SectionsList.Parent = VanillaSectionsHolder
    SectionsList.SortOrder = Enum.SortOrder.LayoutOrder
    SectionsList.Padding = UDim.new(0, 3)

    Button.MouseButton1Down:Connect(function()
        -- if not SelectTabOpen then return end
        SelectingTabs = not SelectingTabs

        if SelectingTabs then
            -- Library:CloseAllTabs()
            TweenService:Create(VanillaSections, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, SectionsHolderSize)}):Play()
            TweenService:Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 90}):Play()
        elseif not SelectingTabs then
            TweenService:Create(VanillaSections, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 0)}):Play()
            TweenService:Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
        end
    end)

    local VanillaTabSections = {}

    function VanillaTabSections:NewSection(name, icon)
        if icon == nil then
            icon = 4840201589
        end
        local SectionName = Instance.new("Frame")
        local NameHolder = Instance.new("ScrollingFrame")
        local Layout = Instance.new("UIListLayout")
        local SectionHolder = Instance.new("ImageLabel")
        local SectionButton = Instance.new("TextButton")
        local SectionTitle = Instance.new("TextLabel")
        local SectionButtonIcon = Instance.new("ImageLabel")

        local SectionsName = RemoveSpaces(name)
        SectionsHolderSize = SectionsHolderSize + 56

        SectionName.Name = (SectionsName .. "Section")
        SectionName.Parent = Sections
        SectionName.BackgroundColor3 = Library.Interface.BackgroundColor
        SectionName.BackgroundTransparency = 0.650
        SectionName.BorderSizePixel = 0
        SectionName.ClipsDescendants = true
        SectionName.Position = UDim2.new(0, 14, 0, 44)
        SectionName.Size = UDim2.new(1, -36, 1, -58)
        SectionName.Visible = false

        NameHolder.Name = (SectionsName .. "Holder")
        NameHolder.Parent = SectionName
        NameHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHolder.BackgroundTransparency = 1.000
        NameHolder.BorderSizePixel = 0
        NameHolder.Position = UDim2.new(0, 4, 0, 4)
        NameHolder.Size = UDim2.new(1, -8, 1, -8)
        NameHolder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        NameHolder.ScrollBarThickness = 0
        NameHolder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        NameHolder.ScrollingDirection = "Y"

        Layout.Name = "Layout"
        Layout.Parent = NameHolder
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Layout.Padding = UDim.new(0, 2)

        SectionHolder.Name = (SectionsName .. "SectionHolder")
        SectionHolder.Parent = VanillaSectionsHolder
        SectionHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SectionHolder.BackgroundTransparency = 1.000
        SectionHolder.BorderColor3 = Color3.fromRGB(27, 42, 53)
        SectionHolder.Size = UDim2.new(1, 0, 0, 25)
        SectionHolder.ZIndex = 2
        SectionHolder.Image = "rbxassetid://4840201589"
        SectionHolder.ImageColor3 = Color3.fromRGB(21, 100, 191)
        SectionHolder.ImageTransparency = 1.000
        SectionHolder.ScaleType = Enum.ScaleType.Slice
        SectionHolder.SliceCenter = Rect.new(2, 2, 298, 298)
        
        SectionButton.Name = "SectionButton"
        SectionButton.Parent = SectionHolder
        SectionButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        SectionButton.BackgroundTransparency = 1.000
        SectionButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
        SectionButton.BorderSizePixel = 0
        SectionButton.Size = UDim2.new(1, 0, 1, 0)
        SectionButton.ZIndex = 2
        SectionButton.AutoButtonColor = false
        SectionButton.Font = Enum.Font.SourceSans
        SectionButton.Text = ""
        SectionButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        SectionButton.TextSize = 14.000
        
        SectionTitle.Name = "SectionTitle"
        SectionTitle.Parent = SectionHolder
        SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SectionTitle.BackgroundTransparency = 1.000
        SectionTitle.Position = UDim2.new(0.239999995, 0, 0, 0)
        SectionTitle.Size = UDim2.new(0.75999999, 0, 1, 0)
        SectionTitle.ZIndex = 2
        SectionTitle.Font = Enum.Font.Gotham
        SectionTitle.Text = " " .. name
        SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionTitle.TextSize = 12.000
        SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        SectionButtonIcon.Name = "SectionButtonIcon"
        SectionButtonIcon.Parent = SectionHolder
        SectionButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SectionButtonIcon.BackgroundTransparency = 1.000
        SectionButtonIcon.Position = UDim2.new(0.04, 0, 0.20, 0)
        SectionButtonIcon.Size = UDim2.new(0, 16, 0, 16)
        SectionButtonIcon.ZIndex = 2
        SectionButtonIcon.Image = "rbxassetid://" .. icon
        --SectionButtonIcon.SliceCenter = Rect.new(2, 2, 298, 298)

        if string.len(SectionTitle.Text) >= 20 then
            TabsSelectOpenSize = UDim2.new(0.252, 55, 1, 0)
        end

        if SectionName.Name == SetSectionName .. "Section" then
            OnTab = true
            SectionName.Visible = true
            TweenService:Create(SectionHolder, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
        end

        SectionButton.MouseButton1Down:Connect(function()
            Library:CloseAllSections()
            Library:HideAllSections()
            -- Library:CloseAllTabs()

            OnTab = true
            SectionName.Visible = true
            SelectTabOpen = false
            VanillaTitle.Text = name

            --TweenService:Create(SectionHolder, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
            TweenService:Create(Tabs, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 38, 1, 0)}):Play()
            TweenService:Create(TabToggleArrow, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 180}):Play()
        end)

        local function SectionResize()
            TweenService:Create(NameHolder, TweenInfo.new(0, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(1, 0, 0, Layout.AbsoluteContentSize.Y)}):Play()
        end

        local function SmoothSectionResize()
            TweenService:Create(NameHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {CanvasSize = UDim2.new(1, 0, 0, Layout.AbsoluteContentSize.Y)}):Play()
        end
        
        local LibraryElements = {}

        function LibraryElements:CreateToggle(name, default, action)
            local ToggleHolder = Instance.new("Frame")
            local ToggleTitle = Instance.new("TextLabel")
            local ToggleButton = Instance.new("ImageButton")
            local ToggleHover = Instance.new("TextButton")

            local ToggleName = RemoveSpaces(name)
            local Toggled = default or false
            
            ToggleHolder.Name = (ToggleName .. "ToggleHolder")
            ToggleHolder.Parent = NameHolder
            ToggleHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            ToggleHolder.BackgroundTransparency = 0.300
            ToggleHolder.BorderSizePixel = 0
            ToggleHolder.Size = UDim2.new(1, 0, 0, 26)
            
            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = ToggleHolder
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.Position = UDim2.new(0, 12, 0.5, -6)
            ToggleTitle.Size = UDim2.new(1, -52, 0, 12)
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = name
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextSize = 12.000
            ToggleTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextStrokeTransparency = 0.920
            ToggleTitle.TextTransparency = 0.250
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            ToggleHover.Name = "ToggleHover"
            ToggleHover.Parent = ToggleHolder
            ToggleHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleHover.BackgroundTransparency = 1.000
            ToggleHover.Size = UDim2.new(1, 0, 1, 0)
            ToggleHover.AutoButtonColor = false
            ToggleHover.Font = Enum.Font.SourceSans
            ToggleHover.Text = ""
            ToggleHover.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleHover.TextSize = 14.000 

            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleHolder
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.BackgroundTransparency = 1
            ToggleButton.Position = UDim2.new(1, -28, 0.5, -8)
            ToggleButton.Size = UDim2.new(0, 16, 0, 16)
            ToggleButton.Image = "rbxassetid://3570695787"
            ToggleButton.ImageColor3 = Library.Interface.ToggleOffColor
            ToggleButton.ScaleType = Enum.ScaleType.Slice
            ToggleButton.SliceCenter = Rect.new(100, 100, 100, 100)
            ToggleButton.ImageTransparency = 0.000
            ToggleButton.SliceScale = 0.03
            if Toggled then
                TweenService:Create(ToggleButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOnColor}):Play()
                TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.000}):Play()
            elseif not Toggled then
                TweenService:Create(ToggleButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOffColor}):Play()
                TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()
            end
            action(Toggled)
            
            ToggleHover.MouseButton1Down:connect(function()
                Toggled = not Toggled
                if Toggled then
                    TweenService:Create(ToggleButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOnColor}):Play()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.000}):Play()
                elseif not Toggled then
                    TweenService:Create(ToggleButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOffColor}):Play()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()
                end
                action(Toggled)
            end)

            ToggleButton.MouseButton1Down:connect(function()
                Toggled = not Toggled

                if Toggled then
                    TweenService:Create(ToggleButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOnColor}):Play()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.000}):Play()
                elseif not Toggled then
                    TweenService:Create(ToggleButton, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOffColor}):Play()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()
                end

                action(Toggled)
            end)

            ToggleHover.MouseEnter:Connect(function()
                TweenService:Create(ToggleHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.98}):Play()
            end)

            ToggleHover.MouseLeave:Connect(function()
                TweenService:Create(ToggleHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end)

            SectionResize()
        end

        function LibraryElements:CreateSlider(name, minimumvalue, maximumvalue, startvalue, precisevalue, action)
            local SliderHolder = Instance.new("Frame")
            local SliderHover = Instance.new("TextButton")
            local SliderTitle = Instance.new("TextLabel")
            local MainSlider = Instance.new("TextButton")
            local SliderBackground = Instance.new("Frame")
            local Slider = Instance.new("Frame")
            local ValueHolder = Instance.new("ImageLabel")
            local SliderValue = Instance.new("TextBox")
            
            local SliderName = RemoveSpaces(name)
            local Dragging = false
            local PreciseSliderValue = precisevalue
            local StartColors = false

            SliderHolder.Name = (SliderName .. "SliderHolder")
            SliderHolder.Parent = NameHolder
            SliderHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            SliderHolder.BackgroundTransparency = 0.300
            SliderHolder.BorderSizePixel = 0
            SliderHolder.Size = UDim2.new(1, 0, 0, 50)

            SliderHover.Name = "SliderHover"
            SliderHover.Parent = SliderHolder
            SliderHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderHover.BackgroundTransparency = 1.000
            SliderHover.BorderSizePixel = 0
            SliderHover.Size = UDim2.new(1, 0, 1, 0)
            SliderHover.Font = Enum.Font.SourceSans
            SliderHover.Text = ""
            SliderHover.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderHover.TextSize = 14.000
            
            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = SliderHolder
            SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0, 12, 0, 10)
            SliderTitle.Size = UDim2.new(1, -52, 0, 12)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = name
            SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextSize = 12.000
            SliderTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextStrokeTransparency = 0.920
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            MainSlider.Name = "MainSlider"
            MainSlider.Parent = SliderHolder
            MainSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MainSlider.BackgroundTransparency = 1.000
            MainSlider.Position = UDim2.new(0, 12, 1, -20)
            MainSlider.Size = UDim2.new(1, -24, 0, 16)
            MainSlider.Font = Enum.Font.SourceSans
            MainSlider.Text = ""
            MainSlider.TextColor3 = Color3.fromRGB(0, 0, 0)
            MainSlider.TextSize = 14.000
            
            SliderBackground.Name = "SliderBackground"
            SliderBackground.Parent = MainSlider
            SliderBackground.BackgroundColor3 = Color3.fromRGB(187, 127, 127)
            SliderBackground.BackgroundTransparency = 0.3001
            SliderBackground.BorderSizePixel = 0
            SliderBackground.Position = UDim2.new(0, 0, 0, 6)
            SliderBackground.Size = UDim2.new(1, 0, 0, 3)
            SliderBackground.ClipsDescendants = true
            
            Slider.Name = "Slider"
            Slider.Parent = SliderBackground
            Slider.BackgroundColor3 = Library.Interface.SliderColor
            Slider.BorderSizePixel = 0
            Slider.Size = UDim2.new(((startvalue or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1.15, 0)
            
            ValueHolder.Name = "ValueHolder"
            ValueHolder.Parent = SliderHolder
            ValueHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueHolder.BackgroundTransparency = 1.000
            ValueHolder.ClipsDescendants = true
            ValueHolder.Position = UDim2.new(0.957055211, -33, 0, 10)
            ValueHolder.Size = UDim2.new(0, 35, 0, 16)
            ValueHolder.Image = "rbxassetid://3570695787"
            ValueHolder.ImageColor3 = Color3.fromRGB(255, 173, 173)
            ValueHolder.ScaleType = Enum.ScaleType.Slice
            ValueHolder.SliceCenter = Rect.new(100, 100, 100, 100)
            ValueHolder.SliceScale = 0.03
            
            SliderValue.Name = "SliderValue"
            SliderValue.Parent = ValueHolder
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.5, -14, 0.5, -8)
            SliderValue.Size = UDim2.new(0, 28, 0, 16)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.Text = tostring(startvalue or PreciseSliderValue and tonumber(string.format("%.2f", startvalue)))
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 12.000
            SliderValue.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextStrokeTransparency = 0.920
            SliderValue.TextXAlignment = Enum.TextXAlignment.Center

            local function Sliding(input)
                StartColors = true

                local Pos = UDim2.new(math.clamp((input.Position.X - SliderBackground.AbsolutePosition.X) / SliderBackground.AbsoluteSize.X, 0, 1), 0, 1.15, 0)
                TweenService:Create(Slider, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Pos}):Play()

                local NonSliderPreciseValue = math.floor(((Pos.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue)
                local SliderPreciseValue = ((Pos.X.Scale * maximumvalue) / maximumvalue) * (maximumvalue - minimumvalue) + minimumvalue
    
                local Value = (PreciseSliderValue and SliderPreciseValue or NonSliderPreciseValue)
                Value = tonumber(string.format("%.2f", Value))
    
                SliderValue.Text = tostring(Value)
                action(Value)
            end

            SliderValue.FocusLost:Connect(function()
                if not tonumber(SliderValue.Text) then
                    SliderValue.Text = tostring(startvalue or PreciseSliderValue and tonumber(string.format("%.2f", startvalue)))
                elseif SliderValue.Text == "" or tonumber(SliderValue.Text) <= minimumvalue then
                    SliderValue.Text = minimumvalue
                elseif SliderValue.Text == "" or tonumber(SliderValue.Text) >= maximumvalue then
                    SliderValue.Text = maximumvalue
                end

                TweenService:Create(Slider, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(((tonumber(SliderValue.Text) or minimumvalue) - minimumvalue) / (maximumvalue - minimumvalue), 0, 1.15, 0)}):Play()
                action(tonumber(SliderValue.Text))
            end)

            SliderBackground.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = true
                end
            end)
            
            SliderBackground.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Dragging = false
                end
            end)
            
            SliderBackground.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    Sliding(input)
                end
            end)
        
            UserInputService.InputChanged:Connect(function(input)
                if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    Sliding(input)
                end
            end)
            
            SliderHover.MouseEnter:Connect(function()
                TweenService:Create(SliderHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.98}):Play()
            end)

            SliderHover.MouseLeave:Connect(function()
                TweenService:Create(SliderHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end)

            SectionResize()
        end

        function LibraryElements:CreateColorPicker(name, presetcolor, action)
            local ColorPickerHolder = Instance.new("Frame")
            local ColorPickerTitle = Instance.new("TextLabel")
            local ColorPickerHover = Instance.new("TextButton")
            local ColorPickerToggle = Instance.new("ImageButton")
            local ColorPicker = Instance.new("Frame")
            local ColorSelector = Instance.new("ImageLabel")
            local ColorSelectorRound = Instance.new("ImageLabel")
            local ColorSelectionCircle = Instance.new("ImageLabel")
            local HueSelector = Instance.new("ImageLabel")
            local ColorHueRound = Instance.new("ImageLabel")
            local HueSelectionCircle = Instance.new("ImageLabel")
            local ColorValues = Instance.new("Frame")
            local ColorValuesLayout = Instance.new("UIListLayout")
            local ColorValueRRounded = Instance.new("ImageLabel")
            local ColorValueR = Instance.new("TextBox")
            local ColorValueGRounded = Instance.new("ImageLabel")
            local ColorValueG = Instance.new("TextBox")
            local ColorValueBRounded = Instance.new("ImageLabel")
            local ColorValueB = Instance.new("TextBox")
            local Rainbow = Instance.new("Frame")
            local RainbowToggle = Instance.new("ImageButton")
            local ToggleTitle = Instance.new("TextLabel")

            local ColorPickerName = RemoveSpaces(name)
            local ColorPickerOpen = false
            local IsTweening = false

            local ColorPickerOpen = false
            local RainbowColorMode = false
            
            local Color = nil
            local ColorValue = 0
            local RainbowColor = nil

            ColorPickerHolder.Name = (ColorPickerName .. "ColorPickerHolder")
            ColorPickerHolder.Parent = NameHolder
            ColorPickerHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            ColorPickerHolder.BackgroundTransparency = 0.300
            ColorPickerHolder.BorderSizePixel = 0
            ColorPickerHolder.Size = UDim2.new(1, 0, 0, 26)
            ColorPickerHolder.ClipsDescendants = true
            
            ColorPickerTitle.Name = "ColorPickerTitle"
            ColorPickerTitle.Parent = ColorPickerHolder
            ColorPickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorPickerTitle.BackgroundTransparency = 1.000
            ColorPickerTitle.Position = UDim2.new(0, 12, 0, 7)
            ColorPickerTitle.Size = UDim2.new(1, -52, 0, 12)
            ColorPickerTitle.Font = Enum.Font.Gotham
            ColorPickerTitle.Text = name
            ColorPickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorPickerTitle.TextSize = 12.000
            ColorPickerTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ColorPickerTitle.TextStrokeTransparency = 0.920
            ColorPickerTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            ColorPickerHover.Name = "ColorPickerHover"
            ColorPickerHover.Parent = ColorPickerHolder
            ColorPickerHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorPickerHover.BackgroundTransparency = 1.000
            ColorPickerHover.Size = UDim2.new(1, 0, 1, 0)
            ColorPickerHover.AutoButtonColor = false
            ColorPickerHover.Font = Enum.Font.SourceSans
            ColorPickerHover.Text = ""
            ColorPickerHover.TextColor3 = Color3.fromRGB(0, 0, 0)
            ColorPickerHover.TextSize = 14.000
            
            ColorPickerToggle.Name = "ColorPickerToggleButton"
            ColorPickerToggle.Parent = ColorPickerHolder
            ColorPickerToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorPickerToggle.BackgroundTransparency = 1
            ColorPickerToggle.Position = UDim2.new(1, -28, 0, 5)
            ColorPickerToggle.Size = UDim2.new(0, 16, 0, 16)
            ColorPickerToggle.Image = "rbxassetid://3570695787"
            ColorPickerToggle.ImageColor3 = presetcolor
            ColorPickerToggle.ScaleType = Enum.ScaleType.Slice
            ColorPickerToggle.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorPickerToggle.ImageTransparency = 0.000
            ColorPickerToggle.SliceScale = 0.03

            ColorPicker.Name = "ColorPicker"
            ColorPicker.Parent = ColorPickerHolder
            ColorPicker.BackgroundColor3 = Color3.fromRGB(141, 94, 94)
            ColorPicker.BackgroundTransparency = 1.000
            ColorPicker.BorderSizePixel = 0
            ColorPicker.ClipsDescendants = false
            ColorPicker.Position = UDim2.new(0, 12, 0, 28)
            ColorPicker.Size = UDim2.new(0, 301, 0, 139)
            
            ColorSelector.Name = "ColorSelector"
            ColorSelector.Parent = ColorPicker
            ColorSelector.BackgroundColor3 = presetcolor
            ColorSelector.BorderSizePixel = 0
            ColorSelector.ClipsDescendants = false
            ColorSelector.Position = UDim2.new(0, 0, 0.0575539581, 0)
            ColorSelector.Size = UDim2.new(0, 125, 0, 121)
            ColorSelector.Image = "rbxassetid://4805274903"
            
            ColorSelectorRound.Name = "ColorSelectorRound"
            ColorSelectorRound.Parent = ColorSelector
            ColorSelectorRound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelectorRound.BackgroundTransparency = 1.000
            ColorSelectorRound.BorderSizePixel = 0
            ColorSelectorRound.Size = UDim2.new(0, 125, 0, 121)
            ColorSelectorRound.Image = "rbxassetid://4608363740"
            ColorSelectorRound.ImageColor3 = Color3.fromRGB(187, 127, 127)
            ColorSelectorRound.ScaleType = Enum.ScaleType.Slice
            ColorSelectorRound.SliceCenter = Rect.new(128, 128, 128, 128)
            ColorSelectorRound.SliceScale = 0.050
            
            ColorSelectionCircle.Name = "ColorSelectionCircle"
            ColorSelectionCircle.Parent = ColorSelector
            ColorSelectionCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelectionCircle.BackgroundTransparency = 1.000
            ColorSelectionCircle.Position = UDim2.new(1, 0, 0, 0)
            ColorSelectionCircle.Size = UDim2.new(0, 20, 0, 20)
            ColorSelectionCircle.Image = "http://www.roblox.com/asset/?id=4953646208"
            ColorSelectionCircle.ScaleType = Enum.ScaleType.Fit
            ColorSelectionCircle.AnchorPoint = Vector2.new(0.5, 0.5)

            HueSelector.Name = "HueSelector"
            HueSelector.Parent = ColorPicker
            HueSelector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelector.BorderSizePixel = 0
            HueSelector.ClipsDescendants = false
            HueSelector.Position = UDim2.new(0, 135, 0, 8)
            HueSelector.Size = UDim2.new(0, 24, 0, 121)
            HueSelector.ZIndex = 0
            HueSelector.Image = "rbxassetid://4650897105"
            HueSelector.SliceCenter = Rect.new(128, 128, 128, 128)
            
            ColorHueRound.Name = "ColorHueRound"
            ColorHueRound.Parent = HueSelector
            ColorHueRound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorHueRound.BackgroundTransparency = 1.000
            ColorHueRound.ClipsDescendants = false
            ColorHueRound.Size = UDim2.new(0, 24, 0, 121)
            ColorHueRound.Image = "rbxassetid://4695575676"
            ColorHueRound.ImageColor3 = Color3.fromRGB(143, 96, 96)
            ColorHueRound.ScaleType = Enum.ScaleType.Slice
            ColorHueRound.SliceCenter = Rect.new(128, 128, 128, 128)
            ColorHueRound.SliceScale = 0.050

            HueSelectionCircle.Name = "HueSelectionCircle"
            HueSelectionCircle.Parent = HueSelector
            HueSelectionCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelectionCircle.BackgroundTransparency = 1.000
            HueSelectionCircle.Position = UDim2.new(0.5, 0, 0, 0)
            HueSelectionCircle.Size = UDim2.new(0, 18, 0, 18)
            HueSelectionCircle.Image = "http://www.roblox.com/asset/?id=4953646208"
            HueSelectionCircle.ScaleType = Enum.ScaleType.Fit
            HueSelectionCircle.AnchorPoint = Vector2.new(0.5, 0.5)

            ColorValues.Name = "ColorValues"
            ColorValues.Parent = ColorPicker
            ColorValues.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorValues.BackgroundTransparency = 1.000
            ColorValues.Position = UDim2.new(0, 170, 0, 8)
            ColorValues.Size = UDim2.new(0, 132, 0, 87)
            
            ColorValuesLayout.Name = "ColorValuesLayout"
            ColorValuesLayout.Parent = ColorValues
            ColorValuesLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ColorValuesLayout.Padding = UDim.new(0, 4)
            
            ColorValueRRounded.Name = "ColorValueRRounded"
            ColorValueRRounded.Parent = ColorValues
            ColorValueRRounded.Active = true
            ColorValueRRounded.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorValueRRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueRRounded.BackgroundTransparency = 1.000
            ColorValueRRounded.Position = UDim2.new(0.5, 0, 0.473684222, 0)
            ColorValueRRounded.Size = UDim2.new(0, 68, 0, 19)
            ColorValueRRounded.Image = "rbxassetid://3570695787"
            ColorValueRRounded.ImageColor3 = Color3.fromRGB(128, 73, 73)
            ColorValueRRounded.ScaleType = Enum.ScaleType.Slice
            ColorValueRRounded.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorValueRRounded.SliceScale = 0.030
            
            ColorValueR.Name = "ColorValueR"
            ColorValueR.Parent = ColorValueRRounded
            ColorValueR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueR.BackgroundTransparency = 1.000
            ColorValueR.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ColorValueR.Selectable = false
            ColorValueR.Size = UDim2.new(0, 68, 0, 19)
            ColorValueR.Font = Enum.Font.Gotham
            ColorValueR.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
            ColorValueR.ShowNativeInput = false
            ColorValueR.Text = "R: 255"
            ColorValueR.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueR.TextSize = 12.000
            ColorValueR.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueR.TextTransparency = 0.300
            ColorValueR.TextEditable = false

            ColorValueGRounded.Name = "ColorValueGRounded"
            ColorValueGRounded.Parent = ColorValues
            ColorValueGRounded.Active = true
            ColorValueGRounded.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorValueGRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueGRounded.BackgroundTransparency = 1.000
            ColorValueGRounded.Position = UDim2.new(0.5, 0, 0.473684222, 0)
            ColorValueGRounded.Size = UDim2.new(0, 68, 0, 19)
            ColorValueGRounded.Image = "rbxassetid://3570695787"
            ColorValueGRounded.ImageColor3 = Color3.fromRGB(107, 65, 65)
            ColorValueGRounded.ScaleType = Enum.ScaleType.Slice
            ColorValueGRounded.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorValueGRounded.SliceScale = 0.030
            
            ColorValueG.Name = "ColorValueG"
            ColorValueG.Parent = ColorValueGRounded
            ColorValueG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueG.BackgroundTransparency = 1.000
            ColorValueG.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ColorValueG.Selectable = false
            ColorValueG.Size = UDim2.new(0, 68, 0, 19)
            ColorValueG.Font = Enum.Font.Gotham
            ColorValueG.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
            ColorValueG.ShowNativeInput = false
            ColorValueG.Text = "G: 255"
            ColorValueG.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueG.TextSize = 12.000
            ColorValueG.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueG.TextTransparency = 0.300
            ColorValueG.TextEditable = false

            ColorValueBRounded.Name = "ColorValueBRounded"
            ColorValueBRounded.Parent = ColorValues
            ColorValueBRounded.Active = true
            ColorValueBRounded.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorValueBRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueBRounded.BackgroundTransparency = 1.000
            ColorValueBRounded.Position = UDim2.new(0.5, 0, 0.473684222, 0)
            ColorValueBRounded.Size = UDim2.new(0, 68, 0, 19)
            ColorValueBRounded.Image = "rbxassetid://3570695787"
            ColorValueBRounded.ImageColor3 = Color3.fromRGB(106, 58, 58)
            ColorValueBRounded.ScaleType = Enum.ScaleType.Slice
            ColorValueBRounded.SliceCenter = Rect.new(100, 100, 100, 100)
            ColorValueBRounded.SliceScale = 0.030
            
            ColorValueB.Name = "ColorValueB"
            ColorValueB.Parent = ColorValueBRounded
            ColorValueB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueB.BackgroundTransparency = 1.000
            ColorValueB.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ColorValueB.Selectable = false
            ColorValueB.Size = UDim2.new(0, 68, 0, 19)
            ColorValueB.Font = Enum.Font.Gotham
            ColorValueB.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
            ColorValueB.ShowNativeInput = false
            ColorValueB.Text = "B: 255"
            ColorValueB.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueB.TextSize = 12.000
            ColorValueB.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ColorValueB.TextTransparency = 0.300
            ColorValueB.TextEditable = false

            Rainbow.Name = "Rainbow"
            Rainbow.Parent = ColorPicker
            Rainbow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Rainbow.BackgroundTransparency = 1.000
            Rainbow.Position = UDim2.new(0, 170, 0, 103)
            Rainbow.Size = UDim2.new(0, 132, 0, 28)
            
            RainbowToggle.Name = "RainbowToggle"
            RainbowToggle.Parent = Rainbow
            RainbowToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            RainbowToggle.BackgroundTransparency = 1.000
            RainbowToggle.Position = UDim2.new(1, -28, 0.5, -8)
            RainbowToggle.Size = UDim2.new(0, 16, 0, 16)
            RainbowToggle.Image = "rbxassetid://3570695787"
            RainbowToggle.ImageColor3 = Color3.fromRGB(187, 127, 127)
            RainbowToggle.ScaleType = Enum.ScaleType.Slice
            RainbowToggle.SliceCenter = Rect.new(100, 100, 100, 100)
            RainbowToggle.SliceScale = 0.030
            
            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = Rainbow
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.Position = UDim2.new(-0.0909090936, 12, 0.428571433, -6)
            ToggleTitle.Size = UDim2.new(1.09090912, -52, 0.142857149, 12)
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = "Rainbow"
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextSize = 13.000
            ToggleTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextStrokeTransparency = 0.920
            ToggleTitle.TextTransparency = 0.300
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            ColorPickerToggle.MouseButton1Down:Connect(function()
                if not ColorPickerOpen then
                    ColorPickerOpen = true
                    IsTweening = true
                    TweenService:Create(ColorPickerHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 180)}):Play()
                    while IsTweening do
                        SmoothSectionResize()
                        wait()
                    end
                    repeat wait() until ColorPickerHolder.Size == UDim2.new(1, 0, 0, 210)
                    IsTweening = false           
                elseif ColorPickerOpen then
                    ColorPickerOpen = false
                    IsTweening = true
                    TweenService:Create(ColorPickerHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 26)}):Play()
                    while IsTweening do
                        SmoothSectionResize()
                        wait()
                    end
                    repeat wait() until ColorPickerHolder.Size == UDim2.new(1, 0, 0, 26)
                    IsTweening = false  
                end
            end)

            local function SetRGBValues()
                local RedValue, GreenValue, BlueValue = ColorPickerToggle.ImageColor3.r * 255, ColorPickerToggle.ImageColor3.g * 255, ColorPickerToggle.ImageColor3.b * 255

                ColorValueR.Text = ("R: " .. math.floor(RedValue))
                ColorValueG.Text = ("G: " .. math.floor(GreenValue))
                ColorValueB.Text = ("B: " .. math.floor(BlueValue))
            end

            SetRGBValues()

            local ColorData = {
                H = 1;
                S = 1;
                V = 1
            }

            local Connection1 = nil
            local Connection2 = nil

            local function GetXY(frame)
                local X, Y = Mouse.X - frame.AbsolutePosition.X, Mouse.Y - frame.AbsolutePosition.Y
                local MaxX, MaxY = frame.AbsoluteSize.X, frame.AbsoluteSize.Y
                X = math.clamp(X, 0, MaxX)
                Y = math.clamp(Y, 0, MaxY)
                return X / MaxX, Y / MaxY
            end

            local function Update()
                SetRGBValues()

                Color = Color3.fromHSV(ColorData.H, ColorData.S, ColorData.V)
                ColorPickerToggle.ImageColor3 = Color
                ColorSelector.BackgroundColor3 = Color3.fromHSV(ColorData.H, 1, 1)
                action(ColorPickerToggle.ImageColor3)
            end

            RainbowToggle.MouseButton1Down:Connect(function()
                if not RainbowColorMode then
                    RainbowColorMode = true
                    TweenService:Create(RainbowToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOnColor}):Play()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.000}):Play()
                elseif RainbowColorMode then
                    RainbowColorMode = false
                    TweenService:Create(RainbowToggle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageColor3 = Library.Interface.ToggleOffColor}):Play()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()
                end

                while RainbowColorMode do
                    RainbowColor = Color3.fromHSV(RainbowModeColorValue, 1, 1)

                    ColorPickerToggle.ImageColor3 = RainbowColor
                    ColorSelector.BackgroundColor3 = RainbowColor

                    HueSelectionCircle.Position = UDim2.new(0.5, 0, 0, ColorPickerHuePosition)
                    ColorSelectionCircle.Position = UDim2.new(1, 0, 0, 0)

                    action(ColorPickerToggle.ImageColor3) 
                    wait()
                end
            end)

            ColorSelector.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not RainbowColorMode then
                        if Connection1 then
                            Connection1:Disconnect()
                        end
                        Connection1 = RunService.RenderStepped:Connect(function()
                            local X, Y = GetXY(ColorSelector)

                            ColorSelectionCircle.Position = UDim2.new(X, 0, Y, 0)
                            ColorData.S = X
                            ColorData.V = 1 - Y
                            Update()
                        end)
                    end
                end
            end)

            ColorSelector.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if Connection1 then
                        Connection1:Disconnect()
                    end
                end
            end)

            HueSelector.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if not RainbowColorMode then
                        if Connection2 then
                            Connection2:Disconnect()
                        end

                        Connection2 = RunService.RenderStepped:Connect(function()
                            local X, Y = GetXY(HueSelector)

                            ColorData.H = 1 - Y
                            HueSelectionCircle.Position = UDim2.new(0.5, 0, Y, 0)
                            Update()
                        end)
                    end
                end
            end)

            HueSelector.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if Connection2 then
                        Connection2:Disconnect()
                    end
                end
            end)

            ColorPickerHover.MouseEnter:Connect(function()
                TweenService:Create(ColorPickerHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.98}):Play()
            end)

            ColorPickerHover.MouseLeave:Connect(function()
                TweenService:Create(ColorPickerHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end)

            SectionResize()
        end

        function LibraryElements:CreateButton(name, action)
            local ButtonNameHolder = Instance.new("Frame")
            local Button = Instance.new("TextButton")

            local ButtonName = RemoveSpaces(name)

            ButtonNameHolder.Name = (ButtonName .. "ButtonHolder")
            ButtonNameHolder.Parent = NameHolder
            ButtonNameHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            ButtonNameHolder.BackgroundTransparency = 0.300
            ButtonNameHolder.BorderSizePixel = 0
            ButtonNameHolder.Size = UDim2.new(1, 0, 0, 26)
            
            Button.Name = "Button"
            Button.Parent = ButtonNameHolder
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundTransparency = 1.000
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.Text = name
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 12.000
            Button.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextStrokeTransparency = 0.920

            Button.MouseButton1Down:Connect(function()
                action(Button)
            end)

            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.98}):Play()
            end)

            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end)

            SectionResize()
        end

        function LibraryElements:CreateLabel(name, alignment)
            local LabelNameHolder = Instance.new("Frame")
            local Label = Instance.new("TextLabel")

            local LabelName = RemoveSpaces(name)

            LabelNameHolder.Name = (LabelName .. "LabelHolder")
            LabelNameHolder.Parent = NameHolder
            LabelNameHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            LabelNameHolder.BackgroundTransparency = 1
            LabelNameHolder.BorderSizePixel = 0
            LabelNameHolder.Size = UDim2.new(1, 0, 0, 26)
            
            Label.Name = "Label"
            Label.Parent = LabelNameHolder
            Label.BackgroundTransparency = 1.000
            Label.Size = UDim2.new(1, 0, 1, 0)
            Label.Font = Enum.Font.Gotham
            Label.Text = name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 12.000
            Label.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextStrokeTransparency = 0.920
            Label.TextXAlignment = Enum.TextXAlignment[alignment]

            SectionResize()
        end

        function LibraryElements:CreateKeybind(name, defaultkeybind, action)
            local KeybindHolder = Instance.new("Frame")
            local KeybindTitle = Instance.new("TextLabel")
            local KeybindHover = Instance.new("TextButton")
            local KeybindButtonRounded = Instance.new("ImageLabel")
            local KeybindButton = Instance.new("TextButton")
            
            local KeybindName = RemoveSpaces(name)

            local DefaultKeybind = defaultkeybind
            local LastBindText = tostring(DefaultKeybind):gsub("Enum.KeyCode.", "") or tostring(DefaultKeybind):gsub("Enum.UserInputType.", "")
            local BindedKey = nil
            local JustBinded = false
            local KeyName = ""

            if DefaultKeybind == "" then
                LastBindText = "None"
            end

            KeybindHolder.Name = (KeybindName .. "KeybindHolder")
            KeybindHolder.Parent = NameHolder
            KeybindHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            KeybindHolder.BackgroundTransparency = 0.300
            KeybindHolder.BorderSizePixel = 0
            KeybindHolder.Size = UDim2.new(1, 0, 0, 26)
            
            KeybindTitle.Name = "KeybindTitle"
            KeybindTitle.Parent = KeybindHolder
            KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.BackgroundTransparency = 1.000
            KeybindTitle.Position = UDim2.new(0, 12, 0.5, -6)
            KeybindTitle.Size = UDim2.new(1, -98, 0, 12)
            KeybindTitle.Font = Enum.Font.Gotham
            KeybindTitle.Text = name
            KeybindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.TextSize = 12.000
            KeybindTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.TextStrokeTransparency = 0.920
            KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            KeybindHover.Name = "KeybindHover"
            KeybindHover.Parent = KeybindHolder
            KeybindHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindHover.BackgroundTransparency = 1.000
            KeybindHover.Size = UDim2.new(1, 0, 1, 0)
            KeybindHover.AutoButtonColor = false
            KeybindHover.Font = Enum.Font.SourceSans
            KeybindHover.Text = ""
            KeybindHover.TextColor3 = Color3.fromRGB(0, 0, 0)
            KeybindHover.TextSize = 14.000
            
            KeybindButtonRounded.Name = "KeybindButtonRounded"
            KeybindButtonRounded.Parent = KeybindHolder
            KeybindButtonRounded.Active = true
            KeybindButtonRounded.AnchorPoint = Vector2.new(0.5, 0.5)
            KeybindButtonRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButtonRounded.BackgroundTransparency = 1.000
            KeybindButtonRounded.Position = UDim2.new(0, 282, 0, 13)
            KeybindButtonRounded.Size = UDim2.new(0, 64, 0, 16)
            KeybindButtonRounded.Selectable = true
            KeybindButtonRounded.Image = "rbxassetid://3570695787"
            KeybindButtonRounded.ImageColor3 = Color3.fromRGB(187, 127, 127)
            KeybindButtonRounded.ScaleType = Enum.ScaleType.Slice
            KeybindButtonRounded.SliceCenter = Rect.new(100, 100, 100, 100)
            KeybindButtonRounded.SliceScale = 0.030

            KeybindButton.Name = "KeybindButton"
            KeybindButton.Parent = KeybindButtonRounded
            KeybindButton.BackgroundColor3 = Color3.fromRGB(187, 127, 127)
            KeybindButton.BackgroundTransparency = 1.000
            KeybindButton.Selectable = true
            KeybindButton.BorderSizePixel = 0
            KeybindButton.Position = UDim2.new(0, 0, 0, 0)
            KeybindButton.Size = UDim2.new(1, 0, 1, 0)
            KeybindButton.ZIndex = 2
            KeybindButton.AutoButtonColor = false
            KeybindButton.Font = Enum.Font.Gotham
            KeybindButton.Text = LastBindText
            KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.TextSize = 12.000

            local NotAllowedKeys = {
                [Enum.KeyCode.Return] = true,
                [Enum.KeyCode.Space] = true,
                [Enum.KeyCode.Tab] = true,
                [Enum.KeyCode.Unknown] = true
            }

            local NotAllowedMouseInputs = {
                [Enum.UserInputType.MouseMovement] = true,
                [Enum.UserInputType.MouseWheel] = true
            }

            local AllowedKeys = {
                [Enum.KeyCode.LeftShift] = "LShift",
                [Enum.KeyCode.RightShift] = "RShift",
                [Enum.KeyCode.LeftControl] = "LCtrl",
                [Enum.KeyCode.RightControl] = "RCtrl",
                [Enum.KeyCode.LeftAlt] = "LAlt",
                [Enum.KeyCode.RightAlt] = "RAlt",
                [Enum.KeyCode.CapsLock] = "CAPS",
                [Enum.KeyCode.One] = "1",
                [Enum.KeyCode.Two] = "2",
                [Enum.KeyCode.Three] = "3",
                [Enum.KeyCode.Four] = "4",
                [Enum.KeyCode.Five] = "5",
                [Enum.KeyCode.Six] = "6",
                [Enum.KeyCode.Seven] = "7",
                [Enum.KeyCode.Eight] = "8",
                [Enum.KeyCode.Nine] = "9",
                [Enum.KeyCode.Zero] = "0",
                [Enum.KeyCode.KeypadOne] = "Num-1",
                [Enum.KeyCode.KeypadTwo] = "Num-2",
                [Enum.KeyCode.KeypadThree] = "Num-3",
                [Enum.KeyCode.KeypadFour] = "Num-4",
                [Enum.KeyCode.KeypadFive] = "Num-5",
                [Enum.KeyCode.KeypadSix] = "Num-6",
                [Enum.KeyCode.KeypadSeven] = "Num-7",
                [Enum.KeyCode.KeypadEight] = "Num-8",
                [Enum.KeyCode.KeypadNine] = "Num-9",
                [Enum.KeyCode.KeypadZero] = "Num-0",
                [Enum.KeyCode.Minus] = "-",
                [Enum.KeyCode.Equals] = "=",
                [Enum.KeyCode.Tilde] = "~",
                [Enum.KeyCode.LeftBracket] = "[",
                [Enum.KeyCode.RightBracket] = "]",
                [Enum.KeyCode.RightParenthesis] = ")",
                [Enum.KeyCode.LeftParenthesis] = "(",
                [Enum.KeyCode.Semicolon] = ";",
                [Enum.KeyCode.Quote] = "'",
                [Enum.KeyCode.BackSlash] = "\\",
                [Enum.KeyCode.Comma] = ",",
                [Enum.KeyCode.Period] = ".",
                [Enum.KeyCode.Slash] = "/",
                [Enum.KeyCode.Asterisk] = "*",
                [Enum.KeyCode.Plus] = "+",
                [Enum.KeyCode.Period] = ".",
                [Enum.KeyCode.Backquote] = "`",
                [Enum.UserInputType.MouseButton1] = "M1",
                [Enum.UserInputType.MouseButton2] = "M2",
                [Enum.UserInputType.MouseButton3] = "M3"
            }
            
            BindedKey = DefaultKeybind
            KeybindButton.MouseButton1Click:Connect(function()

                KeybindButton.Text = "..."
                IsKeyBinding = true

                UISConnection = UserInputService.InputBegan:Connect(function(key)
                    if key.KeyCode == UIToggleKey then return end
                    if key.KeyCode == Enum.KeyCode.Unknown and not NotAllowedMouseInputs[key.UserInputType] then
                        BindedKey = key.UserInputType
                        KeyName = AllowedKeys[BindedKey]
                        KeybindButton.Text = KeyName or tostring(key.UserInputType):gsub("Enum.UserInputType.", "")
                        LastBindText = KeybindButton.Text

                        JustBinded = true
                        IsKeyBinding = false
                        UISConnection:Disconnect()
                    elseif key.KeyCode ~= Enum.KeyCode.Unknown and not NotAllowedKeys[key.KeyCode] then
                        BindedKey = key.KeyCode
                        KeyName = AllowedKeys[BindedKey]
                        KeybindButton.Text = KeyName or tostring(key.KeyCode):gsub("Enum.KeyCode.", "")
                        LastBindText = KeybindButton.Text
                        
                        JustBinded = true
                        IsKeyBinding = false
                        UISConnection:Disconnect()
                    end

                    UISConnection:Disconnect()
                end)
            end)
            
            UserInputService.InputBegan:Connect(function(key)
                if not JustBinded and BindedKey == key.UserInputType or not JustBinded and BindedKey == key.KeyCode then
                    action(BindedKey)
                end
                
                if JustBinded then
                    JustBinded = false
                end
            end)

            KeybindButton.MouseLeave:Connect(function()
                KeybindButton.Text = LastBindText
                IsKeyBinding = false
            end)            

            KeybindHover.MouseEnter:Connect(function()
                TweenService:Create(KeybindHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.98}):Play()
            end)

            KeybindHover.MouseLeave:Connect(function()
                TweenService:Create(KeybindHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end)

            SectionResize()
        end

        function LibraryElements:CreateKBOnlyKeybind(name, defaultkeybind, action)
            local KeybindHolder = Instance.new("Frame")
            local KeybindTitle = Instance.new("TextLabel")
            local KeybindHover = Instance.new("TextButton")
            local KeybindButtonRounded = Instance.new("ImageLabel")
            local KeybindButton = Instance.new("TextButton")

            local KBOnlyKeybindName = RemoveSpaces(name)
            local KBOnlyDefaultKeybind = defaultkeybind
            local KBOnlyLastKeybindText = tostring(KBOnlyDefaultKeybind):gsub("Enum.KeyCode.", "")
            local KBOnlyBindedKey = nil
            local KBOnlyJustBinded = false
            local KBOnlyKeyName = ""

            if KBOnlyDefaultKeybind == "" then
                KBOnlyLastKeybindText = "None"
            end

            KeybindHolder.Name = (KBOnlyKeybindName .. "KeybindHolder")
            KeybindHolder.Parent = NameHolder
            KeybindHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            KeybindHolder.BackgroundTransparency = 0.300
            KeybindHolder.BorderSizePixel = 0
            KeybindHolder.Size = UDim2.new(1, 0, 0, 26)
            
            KeybindTitle.Name = "KeybindTitle"
            KeybindTitle.Parent = KeybindHolder
            KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.BackgroundTransparency = 1.000
            KeybindTitle.Position = UDim2.new(0, 12, 0.5, -6)
            KeybindTitle.Size = UDim2.new(1, -98, 0, 12)
            KeybindTitle.Font = Enum.Font.Gotham
            KeybindTitle.Text = name
            KeybindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.TextSize = 12.000
            KeybindTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.TextStrokeTransparency = 0.920
            KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            KeybindHover.Name = "KeybindHover"
            KeybindHover.Parent = KeybindHolder
            KeybindHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindHover.BackgroundTransparency = 1.000
            KeybindHover.Size = UDim2.new(1, 0, 1, 0)
            KeybindHover.AutoButtonColor = false
            KeybindHover.Font = Enum.Font.SourceSans
            KeybindHover.Text = ""
            KeybindHover.TextColor3 = Color3.fromRGB(0, 0, 0)
            KeybindHover.TextSize = 14.000
            
            KeybindButtonRounded.Name = "KeybindButtonRounded"
            KeybindButtonRounded.Parent = KeybindHolder
            KeybindButtonRounded.Active = true
            KeybindButtonRounded.AnchorPoint = Vector2.new(0.5, 0.5)
            KeybindButtonRounded.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButtonRounded.BackgroundTransparency = 1.000
            KeybindButtonRounded.Position = UDim2.new(0, 282, 0, 13)
            KeybindButtonRounded.Size = UDim2.new(0, 64, 0, 16)
            KeybindButtonRounded.Selectable = true
            KeybindButtonRounded.Image = "rbxassetid://3570695787"
            KeybindButtonRounded.ImageColor3 = Color3.fromRGB(187, 127, 127)
            KeybindButtonRounded.ScaleType = Enum.ScaleType.Slice
            KeybindButtonRounded.SliceCenter = Rect.new(100, 100, 100, 100)
            KeybindButtonRounded.SliceScale = 0.030

            KeybindButton.Name = "KeybindButton"
            KeybindButton.Parent = KeybindButtonRounded
            KeybindButton.BackgroundColor3 = Color3.fromRGB(187, 127, 127)
            KeybindButton.BackgroundTransparency = 1.000
            KeybindButton.Selectable = true
            KeybindButton.BorderSizePixel = 0
            KeybindButton.Position = UDim2.new(0, 0, 0, 0)
            KeybindButton.Size = UDim2.new(1, 0, 1, 0)
            KeybindButton.ZIndex = 2
            KeybindButton.AutoButtonColor = false
            KeybindButton.Font = Enum.Font.Gotham
            KeybindButton.Text = KBOnlyLastKeybindText
            KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.TextSize = 12.000   

            local KBOnlyNotAllowedKeys = {
                [Enum.KeyCode.Return] = true,
                [Enum.KeyCode.Space] = true,
                [Enum.KeyCode.Tab] = true,
                [Enum.KeyCode.Unknown] = true
            }

            local KBOnlyAllowedKeys = {
                [Enum.KeyCode.LeftShift] = "LShift",
                [Enum.KeyCode.RightShift] = "RShift",
                [Enum.KeyCode.LeftControl] = "LCtrl",
                [Enum.KeyCode.RightControl] = "RCtrl",
                [Enum.KeyCode.LeftAlt] = "LAlt",
                [Enum.KeyCode.RightAlt] = "RAlt",
                [Enum.KeyCode.CapsLock] = "CAPS",
                [Enum.KeyCode.One] = "1",
                [Enum.KeyCode.Two] = "2",
                [Enum.KeyCode.Three] = "3",
                [Enum.KeyCode.Four] = "4",
                [Enum.KeyCode.Five] = "5",
                [Enum.KeyCode.Six] = "6",
                [Enum.KeyCode.Seven] = "7",
                [Enum.KeyCode.Eight] = "8",
                [Enum.KeyCode.Nine] = "9",
                [Enum.KeyCode.Zero] = "0",
                [Enum.KeyCode.KeypadOne] = "Num-1",
                [Enum.KeyCode.KeypadTwo] = "Num-2",
                [Enum.KeyCode.KeypadThree] = "Num-3",
                [Enum.KeyCode.KeypadFour] = "Num-4",
                [Enum.KeyCode.KeypadFive] = "Num-5",
                [Enum.KeyCode.KeypadSix] = "Num-6",
                [Enum.KeyCode.KeypadSeven] = "Num-7",
                [Enum.KeyCode.KeypadEight] = "Num-8",
                [Enum.KeyCode.KeypadNine] = "Num-9",
                [Enum.KeyCode.KeypadZero] = "Num-0",
                [Enum.KeyCode.Minus] = "-",
                [Enum.KeyCode.Equals] = "=",
                [Enum.KeyCode.Tilde] = "~",
                [Enum.KeyCode.LeftBracket] = "[",
                [Enum.KeyCode.RightBracket] = "]",
                [Enum.KeyCode.RightParenthesis] = ")",
                [Enum.KeyCode.LeftParenthesis] = "(",
                [Enum.KeyCode.Semicolon] = ";",
                [Enum.KeyCode.Quote] = "'",
                [Enum.KeyCode.BackSlash] = "\\",
                [Enum.KeyCode.Comma] = ",",
                [Enum.KeyCode.Period] = ".",
                [Enum.KeyCode.Slash] = "/",
                [Enum.KeyCode.Asterisk] = "*",
                [Enum.KeyCode.Plus] = "+",
                [Enum.KeyCode.Period] = ".",
                [Enum.KeyCode.Backquote] = "`",
            }

            KBOnlyBindedKey = KBOnlyDefaultKeybind
            KeybindButton.MouseButton1Click:Connect(function()
                KeybindButton.Text = "..."
                IsKeyBinding = true

                UISConnection = UserInputService.InputBegan:Connect(function(key)
                    if key.KeyCode == UIToggleKey then return end
                    if key.KeyCode ~= Enum.KeyCode.Unknown and not KBOnlyNotAllowedKeys[key.KeyCode] then
                        KBOnlyBindedKey = key.KeyCode
                        KBOnlyKeyName = KBOnlyAllowedKeys[KBOnlyBindedKey]
                        KeybindButton.Text = KBOnlyKeyName or tostring(key.KeyCode):gsub("Enum.KeyCode.", "")
                        KBOnlyLastKeybindText = KeybindButton.Text

                        KBOnlyJustBinded = true
                        IsKeyBinding = false
                        UISConnection:Disconnect()
                    end

                    UISConnection:Disconnect()
                end)
            end)
            
            UserInputService.InputBegan:Connect(function(key)
                if not KBOnlyJustBinded and KBOnlyBindedKey == key.KeyCode then
                    action(KBOnlyBindedKey)
                end
                
                if KBOnlyJustBinded then
                    KBOnlyJustBinded = false
                end
            end)

            KeybindButton.MouseLeave:Connect(function()
                KeybindButton.Text = KBOnlyLastKeybindText
                IsKeyBinding = false
            end)

            KeybindHover.MouseEnter:Connect(function()
                TweenService:Create(KeybindHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.98}):Play()
            end)

            KeybindHover.MouseLeave:Connect(function()
                TweenService:Create(KeybindHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end)

            SectionResize()
        end

        function LibraryElements:CreateDropdown(name, options, presetoption, action)
            local DropdownLibrary = {}
            local DropdownHolder = Instance.new("Frame")
            local DropdownTitle = Instance.new("TextLabel")
            local DropdownHover = Instance.new("TextButton")
            local ToggleArrowIcon = Instance.new("ImageLabel")
            local Dropdown = Instance.new("Frame")
            local DropdownMain = Instance.new("ScrollingFrame")
            local ButtonLayout = Instance.new("UIListLayout")

            local DropdownName = RemoveSpaces(name)

            local DropdownEnabled = false
            local IsDropdownTweening = false
            local SelectedOptionName = presetoption
            local NumberOfOptions = 0
            local ScrollFrameCanvasSize = 1
            local StartScrollingFrame = false

            DropdownHolder.Name = (DropdownName .. "DropdownHolder")
            DropdownHolder.Parent = NameHolder
            DropdownHolder.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            DropdownHolder.BackgroundTransparency = 0.300
            DropdownHolder.BorderSizePixel = 0
            DropdownHolder.Position = UDim2.new(0, 0, 0.153846219, 0)
            DropdownHolder.Size = UDim2.new(1, 0, 0, 26)
            DropdownHolder.ClipsDescendants = true

            DropdownTitle.Name = "DropdownTitle"
            DropdownTitle.Parent = DropdownHolder
            DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.BackgroundTransparency = 1.000
            DropdownTitle.Position = UDim2.new(0, 12, 0, 7)
            DropdownTitle.Size = UDim2.new(1, -52, 0, 12)
            DropdownTitle.Font = Enum.Font.Gotham
            DropdownTitle.Text = DropdownName .. ": " .. SelectedOptionName
            DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.TextSize = 12.000
            DropdownTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.TextStrokeTransparency = 0.920
            DropdownTitle.TextTransparency = 0.250
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownHover.Name = "DropdownHover"
            DropdownHover.Parent = DropdownHolder
            DropdownHover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownHover.BackgroundTransparency = 1.000
            DropdownHover.Size = UDim2.new(1, 0, 1, 0)
            DropdownHover.AutoButtonColor = false
            DropdownHover.Font = Enum.Font.SourceSans
            DropdownHover.Text = ""
            DropdownHover.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownHover.TextSize = 14.000
            
            ToggleArrowIcon.Name = "ToggleArrowIcon"
            ToggleArrowIcon.Parent = DropdownHolder
            ToggleArrowIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleArrowIcon.BackgroundTransparency = 1.000
            ToggleArrowIcon.BorderSizePixel = 0
            ToggleArrowIcon.Position = UDim2.new(0, 402, 0, 5)
            ToggleArrowIcon.Size = UDim2.new(0, 16, 0, 16)
            ToggleArrowIcon.ZIndex = 2
            ToggleArrowIcon.Image = "rbxassetid://4852002601"
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = DropdownHolder
            Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dropdown.BackgroundTransparency = 1.000
            Dropdown.Position = UDim2.new(0, 12, 0, 26)
            Dropdown.Size = UDim2.new(0, 402, 0, 100)
            Dropdown.ClipsDescendants = true
            
            DropdownMain.Name = "DropdownMain"
            DropdownMain.Parent = Dropdown
            DropdownMain.Active = true
            DropdownMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownMain.BackgroundTransparency = 1.000
            DropdownMain.Size = UDim2.new(0, 402, 0, 100)
            DropdownMain.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            DropdownMain.CanvasSize = UDim2.new(0, 0, ScrollFrameCanvasSize, 0)
            DropdownMain.ScrollBarThickness = 0
            DropdownMain.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            DropdownMain.ClipsDescendants = true

            ButtonLayout.Name = "ButtonLayout"
            ButtonLayout.Parent = DropdownMain
            ButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder

            for i, v in pairs(options) do
                local ButtonOption = Instance.new("TextButton")
    
                NumberOfOptions = NumberOfOptions + 1

                local ButtonOptionName = RemoveSpaces(v)

                ButtonOption.Name = (ButtonOptionName .. "ButtonOption")
                ButtonOption.Parent = DropdownMain
                ButtonOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonOption.BackgroundTransparency = 1
                ButtonOption.BorderColor3 = Color3.fromRGB(27, 42, 53)
                ButtonOption.BorderSizePixel = 0
                ButtonOption.Size = UDim2.new(0, 402, 0, 25)
                ButtonOption.AutoButtonColor = false
                ButtonOption.Font = Enum.Font.Gotham
                ButtonOption.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonOption.TextSize = 12.000
                ButtonOption.Text = v
                ButtonOption.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
                ButtonOption.TextStrokeTransparency = 0.920
                ButtonOption.TextTransparency = 0.300

                if NumberOfOptions == 5 then
                    StartScrollingFrame = true
                end

                if StartScrollingFrame then
                    ScrollFrameCanvasSize = ScrollFrameCanvasSize + 0.25
                    DropdownMain.CanvasSize = UDim2.new(0, 0, ScrollFrameCanvasSize, 0)
                end

                ButtonOption.MouseButton1Down:Connect(function()
                    DropdownTitle.Text = DropdownName .. ": " .. ButtonOption.Text
                    action(Data)
                    local NewIsDropdownTweening = true
                    TweenService:Create(DropdownHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 26)}):Play()
                    TweenService:Create(ToggleArrowIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextStrokeTransparency = 0.920}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()

                    while NewIsDropdownTweening do
                        SmoothSectionResize()
                        wait()
                    end

                    repeat wait() until DropdownHolder.Size == UDim2.new(1, 0, 0, 26)
                    NewIsDropdownTweening = false
                end)

                ButtonOption.MouseEnter:Connect(function()
                    TweenService:Create(ButtonOption, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7}):Play()
                end)
    
                ButtonOption.MouseLeave:Connect(function()
                    TweenService:Create(ButtonOption, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                end)
            end

            function DropdownLibrary:Remove(Data)
                if DropdownMain and DropdownMain:FindFirstChild(RemoveSpaces(Data) .. "ButtonOption") then
                    DropdownMain[RemoveSpaces(Data) .. "ButtonOption"]:Destroy()
                end
            end

            function DropdownLibrary:Add(Data)
                local ButtonOption = Instance.new("TextButton")
    
                NumberOfOptions = NumberOfOptions + 1

                local ButtonOptionName = RemoveSpaces(Data)

                ButtonOption.Name = (ButtonOptionName .. "ButtonOption")
                ButtonOption.Parent = DropdownMain
                ButtonOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonOption.BackgroundTransparency = 1
                ButtonOption.BorderColor3 = Color3.fromRGB(27, 42, 53)
                ButtonOption.BorderSizePixel = 0
                ButtonOption.Size = UDim2.new(0, 402, 0, 25)
                ButtonOption.AutoButtonColor = false
                ButtonOption.Font = Enum.Font.Gotham
                ButtonOption.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonOption.TextSize = 12.000
                ButtonOption.Text = Data
                ButtonOption.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
                ButtonOption.TextStrokeTransparency = 0.920
                ButtonOption.TextTransparency = 0.300

                if NumberOfOptions == 5 then
                    StartScrollingFrame = true
                end

                if StartScrollingFrame then
                    ScrollFrameCanvasSize = ScrollFrameCanvasSize + 0.25
                    DropdownMain.CanvasSize = UDim2.new(0, 0, ScrollFrameCanvasSize, 0)
                end

                ButtonOption.MouseButton1Down:Connect(function()
                    DropdownTitle.Text = DropdownName .. ": " .. ButtonOption.Text
                    action(Data)
                    local NewIsDropdownTweening = true
                    TweenService:Create(DropdownHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 26)}):Play()
                    TweenService:Create(ToggleArrowIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextStrokeTransparency = 0.920}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()

                    while NewIsDropdownTweening do
                        SmoothSectionResize()
                        wait()
                    end

                    repeat wait() until DropdownHolder.Size == UDim2.new(1, 0, 0, 26)
                    NewIsDropdownTweening = false
                end)

                ButtonOption.MouseEnter:Connect(function()
                    TweenService:Create(ButtonOption, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7}):Play()
                end)
    
                ButtonOption.MouseLeave:Connect(function()
                    TweenService:Create(ButtonOption, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                end)
            end

            DropdownHover.MouseButton1Down:Connect(function()
                if not DropdownEnabled then
                    DropdownEnabled = true
                    IsDropdownTweening = true
                    -- DropdownTitle.Text = name

                    TweenService:Create(DropdownHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 426, 0, 127)}):Play()
                    TweenService:Create(ToggleArrowIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 180}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextStrokeTransparency = 0.920}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()

                    while IsDropdownTweening do
                        SmoothSectionResize()
                        wait()
                    end

                    repeat wait() until DropdownHolder.Size == UDim2.new(0, 326, 0, 127)
                    IsDropdownTweening = false
                elseif DropdownEnabled then
                    DropdownEnabled = false
                    IsDropdownTweening = true
                    -- DropdownTitle.Text = SelectedOptionName

                    TweenService:Create(DropdownHolder, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 26)}):Play()
                    TweenService:Create(ToggleArrowIcon, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Rotation = 0}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextStrokeTransparency = 0.920}):Play()
                    TweenService:Create(DropdownTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0.250}):Play()

                    while IsDropdownTweening do
                        SmoothSectionResize()
                        wait()
                    end

                    repeat wait() until DropdownHolder.Size == UDim2.new(1, 0, 0, 26)
                    IsDropdownTweening = false
                end
            end)

            DropdownHover.MouseEnter:Connect(function()
                TweenService:Create(DropdownHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.98}):Play()
            end)

            DropdownHover.MouseLeave:Connect(function()
                TweenService:Create(DropdownHover, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
            end)

            SectionResize()

            return DropdownLibrary
        end

        return LibraryElements
    end

    return VanillaTabSections
end

VanillaBootstrapper:Destroy()

function Vanilla:UIIntro()
    if IntroFade.BackgroundTransparency == 1 then return end

    IntroFade.ZIndex = 15

    wait(0.5)
    TweenService:Create(Tabs, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 38, 1, 0)}):Play()
    TweenService:Create(VanillaTitle, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
    TweenService:Create(IntroFade, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
    TweenService:Create(VanillaGlow, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()

    repeat wait() until IntroFade.BackgroundTransparency == 1
    IntroFade:Destroy()
end

Vanilla:UIIntro()
