-- catto ui lib --

local library = {}
local tweenservice = game:GetService("TweenService")
local userinputservice = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()
local camera = workspace.CurrentCamera

library.animate = function(obj, properties, time)
    local tweeninfo = TweenInfo.new(time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    tweenservice:Create(obj, tweeninfo, properties):Play()
end

library.new = function(title)
    local tabs_open = false
    local sliding = false
    local ui = Instance.new("ScreenGui")
    local main = Instance.new("Frame")
    local outline = Instance.new("Frame")
    local separator = Instance.new("Frame")
    local window_title = Instance.new("TextLabel")
    local p1 = Instance.new("UIPadding")
    local tab_open = Instance.new("ImageButton")
    local t_buttons = Instance.new("Frame")
    local l1 = Instance.new("UIListLayout")
    local p3 = Instance.new("UIPadding")
    local p2 = Instance.new("UIPadding")
    local t_frames = Instance.new("Frame")

    ui.Name = "ui"
    ui.Parent = game.CoreGui

    main.Name = "main"
    main.Parent = ui
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
    main.BorderSizePixel = 0
    main.Position = UDim2.new(0.499543399, 0, 0.49999997, 0)
    main.Size = UDim2.new(0, 380, 0, 370)

    outline.Name = "outline"
    outline.Parent = main
    outline.AnchorPoint = Vector2.new(0.5, 0.5)
    outline.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    outline.BorderSizePixel = 0
    outline.Position = UDim2.new(0.5, 0, 0.5, 0)
    outline.Size = UDim2.new(0, 382, 0, 372)
    outline.ZIndex = 0

    separator.Name = "separator"
    separator.Parent = main
    separator.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    separator.BorderSizePixel = 0
    separator.Position = UDim2.new(0, 0, 0.0810810775, 0)
    separator.Size = UDim2.new(0, 380, 0, 1)

    window_title.Name = "window_title"
    window_title.Parent = main
    window_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    window_title.BackgroundTransparency = 1.000
    window_title.Position = UDim2.new(0.0605263114, 0, 0, 5)
    window_title.Size = UDim2.new(0, 357, 0, 19)
    window_title.Font = Enum.Font.Gotham
    window_title.Text = title or "cattohook"
    window_title.TextColor3 = Color3.fromRGB(90, 90, 90)
    window_title.TextSize = 12.000
    window_title.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
    window_title.TextStrokeTransparency = 0.800
    window_title.TextWrapped = true
    window_title.TextXAlignment = Enum.TextXAlignment.Left

    p1.Name = "p1"
    p1.Parent = window_title
    p1.PaddingLeft = UDim.new(0, 5)
    p1.PaddingTop = UDim.new(0, 3)

    tab_open.Name = "tab_open"
    tab_open.Parent = main
    tab_open.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    tab_open.BackgroundTransparency = 1.000
    tab_open.BorderSizePixel = 0
    tab_open.Position = UDim2.new(0, 5, 0.0149999997, 0)
    tab_open.Size = UDim2.new(0, 18, 0, 18)
    tab_open.Image = "rbxassetid://2038908845"
    tab_open.ImageColor3 = Color3.fromRGB(90, 90, 90)
    tab_open.ScaleType = Enum.ScaleType.Slice
    tab_open.SliceScale = 0.000

    t_buttons.Name = "t_buttons"
    t_buttons.Parent = main
    t_buttons.AnchorPoint = Vector2.new(0.5, 0)
    t_buttons.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
    t_buttons.BorderColor3 = Color3.fromRGB(45, 45, 45)
    t_buttons.ClipsDescendants = true
    t_buttons.Position = UDim2.new(0.157894731, 0, 0.0842432827, 0)
    t_buttons.Size = UDim2.new(0, 120, 0, 0)
    t_buttons.Visible = false
    t_buttons.ZIndex = 6

    l1.Name = "l1"
    l1.Parent = t_buttons
    l1.SortOrder = Enum.SortOrder.LayoutOrder
    l1.Padding = UDim.new(0, 2)

    p3.Name = "p3"
    p3.Parent = tab1_b
    p3.PaddingLeft = UDim.new(0, 6)

    p2.Name = "p2"
    p2.Parent = t_buttons
    p2.PaddingTop = UDim.new(0, 2)

    t_frames.Name = "t_frames"
    t_frames.Parent = main
    t_frames.AnchorPoint = Vector2.new(0.5, 0)
    t_frames.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    t_frames.BackgroundTransparency = 1.000
    t_frames.ClipsDescendants = true
    t_frames.Position = UDim2.new(0.500328958, 0, 0.083783783, 0)
    t_frames.Size = UDim2.new(0, 381, 0, 340)

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
            if (input == dragInput and dragToggle) and not sliding then
                updateInput(input)
            end
        end)
    end
    dragify(main)

    tab_open.MouseButton1Click:Connect(function()
        if not tabs_open then
            tabs_open = true
            t_buttons.Visible = true
            library.animate(t_buttons, {Size = UDim2.fromOffset(120, 339)}, 1)
            library.animate(t_frames, {Size = UDim2.fromOffset(260, 339)}, 1)
        else
            tabs_open = false
            library.animate(t_buttons, {Size = UDim2.fromOffset(120, 0)}, 1)
            library.animate(t_frames, {Size = UDim2.fromOffset(381, 339)}, 1)
            wait(0.7)
            t_buttons.Visible = false
        end
    end)
    
    local window = {}
        window.tabs = {}
        window.tabcount = 0
        window.set_title = function(newtitle)
            window_title.Text = newtitle
        end
        window.createtab = function(tabtitle)
            window.tabcount = window.tabcount + 1
            local tab1_b = Instance.new("TextButton")
            local tab1_f = Instance.new("ScrollingFrame")
            local p4 = Instance.new("UIPadding")
            local l2 = Instance.new("UIListLayout")
            table.insert(window.tabs, window.tabcount, tab1_f)
            tab1_b.Name = "tab".. tostring(window.tabcount) .."_b"
            tab1_b.Parent = t_buttons
            tab1_b.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            tab1_b.Size = UDim2.new(0, 120, 0, 20)
            tab1_b.ZIndex = 6
            tab1_b.Font = Enum.Font.Gotham
            tab1_b.Text = tabtitle
            tab1_b.TextColor3 = Color3.fromRGB(90, 90, 90)
            tab1_b.TextSize = 12.000
            tab1_b.TextXAlignment = Enum.TextXAlignment.Left
            tab1_b.BorderSizePixel = 0

            tab1_f.Name = "tab".. tostring(window.tabcount) .."_f"
            tab1_f.Parent = t_frames
            tab1_f.Active = true
            tab1_f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            tab1_f.BackgroundTransparency = 1.000
            tab1_f.BorderSizePixel = 0
            tab1_f.Position = UDim2.new(0.00787401572, 0, 0.00882352982, 0)
            tab1_f.Size = UDim2.new(0, 375, 0, 334)
            tab1_f.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            tab1_f.ScrollBarThickness = 1
            tab1_f.ScrollBarImageColor3 = Color3.fromRGB(90, 90, 90)
            tab1_f.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            tab1_f.Visible = false

            p4.Name = "p4"
            p4.Parent = tab1_f
            p4.PaddingLeft = UDim.new(0, 1)

            l2.Name = "l2"
            l2.Parent = tab1_f
            l2.SortOrder = Enum.SortOrder.LayoutOrder
            l2.Padding = UDim.new(0, 1)

            tab1_b.MouseButton1Click:Connect(function()
                for i, v in pairs(window.tabs) do 
                    v.Visible = false
                end
                tab1_f.Visible = true
            end)

            local tab = {}
                tab.createseparator = function()
                    local separator_2 = Instance.new("Frame")
                    local separator_f = Instance.new("Frame")

                    separator_2.Name = "separator"
                    separator_2.Parent = tab1_f
                    separator_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    separator_2.BackgroundTransparency = 1.000
                    separator_2.Size = UDim2.new(0, 370, 0, 10)
                    
                    separator_f.Name = "separator_f"
                    separator_f.Parent = separator_2
                    separator_f.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    separator_f.BorderSizePixel = 0
                    separator_f.Position = UDim2.new(0.0523648635, 0, 0.441080928, 0)
                    separator_f.Size = UDim2.new(0, 331, 0, 1)

                    tab1_f.CanvasSize = UDim2.fromOffset(tab1_f.Size.X.Offset / 2 - 17, tab1_f.l2.AbsoluteContentSize.Y + 25)
                end
                tab.createlabel = function(labeltitle, textoffset)
                    local l2 = Instance.new("UIListLayout")
                    local label = Instance.new("Frame")
                    local label_title = Instance.new("TextLabel")

                    label.Name = "label"
                    label.Parent = tab1_f
                    label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    label.BackgroundTransparency = 1.000
                    label.Size = UDim2.new(0, 370, 0, 20)

                    label_title.Name = "label_title"
                    label_title.Parent = label
                    label_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    label_title.BackgroundTransparency = 1.000
                    label_title.Position = UDim2.new(0.0145803709, 0, -0.189999998, 5)
                    label_title.Size = UDim2.new(0, 357, 0, 19)
                    label_title.Font = Enum.Font.Gotham
                    label_title.Text = labeltitle
                    label_title.TextColor3 = Color3.fromRGB(90, 90, 90)
                    label_title.TextSize = 12.000
                    label_title.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    label_title.TextWrapped = true
                    label_title.TextXAlignment = Enum.TextXAlignment[textoffset]
                    tab1_f.CanvasSize = UDim2.fromOffset(tab1_f.Size.X.Offset / 2 - 17, tab1_f.l2.AbsoluteContentSize.Y + 25)
                end
                tab.createbutton = function(buttontitle, callback)
                    callback = callback or function(...) return end
                    local button = Instance.new("Frame")
                    local tbutton = Instance.new("TextButton")
                                        
                    button.Name = "button"
                    button.Parent = tab1_f
                    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    button.BackgroundTransparency = 1.000
                    button.Size = UDim2.new(0, 370, 0, 20)

                    tbutton.Name = "tbutton"
                    tbutton.Parent = button
                    tbutton.Active = false
                    tbutton.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                    tbutton.BorderSizePixel = 0
                    tbutton.Position = UDim2.new(0.0145804742, 0, -0.190000147, 5)
                    tbutton.Selectable = false
                    tbutton.Size = UDim2.new(0, 357, 0, 20)
                    tbutton.Font = Enum.Font.Gotham
                    tbutton.Text = buttontitle
                    tbutton.TextColor3 = Color3.fromRGB(90, 90, 90)
                    tbutton.TextSize = 12.000
                    tbutton.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    tbutton.TextWrapped = true
                    tbutton.MouseButton1Click:Connect(function()
                        pcall(callback)
                    end)
                    tab1_f.CanvasSize = UDim2.fromOffset(tab1_f.Size.X.Offset / 2 - 17, tab1_f.l2.AbsoluteContentSize.Y + 25)
                end
                tab.createtoggle = function(toggletitle, default, callback)
                    callback = callback or function(...) return end
                    local toggled = default or false
                    local toggle = Instance.new("Frame")
                    local togglebutton = Instance.new("TextButton")
                    local checkmark = Instance.new("ImageLabel")
                    local toggle_title = Instance.new("TextLabel")

                    toggle.Name = "toggle"
                    toggle.Parent = tab1_f
                    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    toggle.BackgroundTransparency = 1.000
                    toggle.Size = UDim2.new(0, 370, 0, 20)

                    togglebutton.Name = "togglebutton"
                    togglebutton.Parent = toggle
                    togglebutton.Active = false
                    togglebutton.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                    togglebutton.BorderSizePixel = 0
                    togglebutton.Position = UDim2.new(0.0145804742, 0, -0.190000147, 5)
                    togglebutton.Selectable = false
                    togglebutton.Size = UDim2.new(0, 20, 0, 20)
                    togglebutton.Font = Enum.Font.Gotham
                    togglebutton.Text = ""
                    togglebutton.TextColor3 = Color3.fromRGB(90, 90, 90)
                    togglebutton.TextSize = 12.000
                    togglebutton.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    togglebutton.TextWrapped = true

                    checkmark.Name = "checkmark"
                    checkmark.Parent = togglebutton
                    checkmark.AnchorPoint = Vector2.new(0.5, 0.5)
                    checkmark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    checkmark.BackgroundTransparency = 1.000
                    checkmark.Position = UDim2.new(0.449999988, 0, 0.5, 0)
                    checkmark.Size = UDim2.new(0, 15, 0, 15)
                    checkmark.Image = "rbxassetid://3926305904"
                    checkmark.ImageRectOffset = Vector2.new(312, 4)
                    checkmark.ImageRectSize = Vector2.new(24, 24)

                    if toggled then
                        checkmark.ImageTransparency = 0
                        pcall(callback, toggled)
                    else
                        checkmark.ImageTransparency = 1
                        pcall(callback, toggled)
                    end

                    toggle_title.Name = "toggle_title"
                    toggle_title.Parent = toggle
                    toggle_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    toggle_title.BackgroundTransparency = 1.000
                    toggle_title.Position = UDim2.new(0.0879999995, 0, -0.150000006, 5)
                    toggle_title.Size = UDim2.new(0, 330, 0, 19)
                    toggle_title.Font = Enum.Font.Gotham
                    toggle_title.Text = toggletitle
                    toggle_title.TextColor3 = Color3.fromRGB(90, 90, 90)
                    toggle_title.TextSize = 12.000
                    toggle_title.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    toggle_title.TextWrapped = true
                    toggle_title.TextXAlignment = Enum.TextXAlignment.Left

                    togglebutton.MouseButton1Click:Connect(function()
                        if toggled then
                            toggled = false
                            library.animate(checkmark, {ImageTransparency = 1}, 1)
                            pcall(callback, toggled)
                        else
                            toggled = true
                            library.animate(checkmark, {ImageTransparency = 0}, 1)
                            pcall(callback, toggled)
                        end
                    end)
                    tab1_f.CanvasSize = UDim2.fromOffset(tab1_f.Size.X.Offset / 2 - 17, tab1_f.l2.AbsoluteContentSize.Y + 25)
                end
                tab.createslider = function(slidertitle, default, min, max, preciseval, callback)
                    callback = callback or function(...) return end
                    local value = default or 0
                    local slider = Instance.new("Frame")
                    local slidermain = Instance.new("Frame")
                    local sliderback = Instance.new("Frame")
                    local sliderval = Instance.new("TextLabel")
                    local slider_title = Instance.new("TextLabel")

                    slider.Name = "slider"
                    slider.Parent = tab1_f
                    slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    slider.BackgroundTransparency = 1.000
                    slider.Size = UDim2.new(0, 370, 0, 40)

                    slidermain.Name = "slidermain"
                    slidermain.Parent = slider
                    slidermain.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                    slidermain.BorderSizePixel = 0
                    slidermain.Position = UDim2.new(0.0145804742, 0, 0.359999835, 5)
                    slidermain.Size = UDim2.new(0, 364, 0, 20)
                    slidermain.ZIndex = 2

                    sliderback.Name = "sliderback"
                    sliderback.Parent = slidermain
                    sliderback.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    sliderback.BorderSizePixel = 0
                    sliderback.Position = UDim2.new(-0.000352975418, 0, -0.290000141, 5)
                    sliderback.Size = UDim2.new(0, 364, 0, 20)
                    sliderback.ZIndex = 1
                    sliderback.BackgroundTransparency = 1.00

                    sliderval.Name = "sliderval"
                    sliderval.Parent = slidermain
                    sliderval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    sliderval.BackgroundTransparency = 1.000
                    sliderval.Position = UDim2.new(0.0108695654, 0, -0.0410171524, 0)
                    sliderval.Size = UDim2.new(0, 60, 0, 20)
                    sliderval.ZIndex = 2
                    sliderval.Font = Enum.Font.Gotham
                    sliderval.Text = value
                    sliderval.TextColor3 = Color3.fromRGB(90, 90, 90)
                    sliderval.TextSize = 12.000

                    slider_title.Name = "slider_title"
                    slider_title.Parent = slider
                    slider_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    slider_title.BackgroundTransparency = 1.000
                    slider_title.Position = UDim2.new(0.0123243257, 0, -0.125, 5)
                    slider_title.Size = UDim2.new(0, 330, 0, 19)
                    slider_title.Font = Enum.Font.Gotham
                    slider_title.Text = slidertitle
                    slider_title.TextColor3 = Color3.fromRGB(90, 90, 90)
                    slider_title.TextSize = 12.000
                    slider_title.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    slider_title.TextWrapped = true
                    slider_title.TextXAlignment = Enum.TextXAlignment.Left

                    function Set(value)
                        value = math.clamp(math.round(value * preciseval) / preciseval, min, max)
                        local percent = 1 - ((max - value) / (max - min))
                        slidermain:TweenSize(UDim2.fromOffset(percent * sliderback.AbsoluteSize.X, sliderback.AbsoluteSize.Y), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.05)
                        sliderval.Text = tostring(value)
                        pcall(callback, value)
                    end
                    Set(default)
    
                    function Refresh()
                        local mousePos = camera:WorldToViewportPoint(mouse.Hit.p)
                        local percent = math.clamp(mousePos.X - slidermain.AbsolutePosition.X, 0, sliderback.AbsoluteSize.X) / sliderback.AbsoluteSize.X
                        local value = math.floor((min + (max - min) * percent) * preciseval) / preciseval
                        value = math.clamp(value, min, max)
                        Set(value)
                    end
    
                    slidermain.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            sliding = true
                            Refresh()
                        end
                    end)
    
                    slidermain.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            sliding = false
                        end
                    end)
    
                    sliderback.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            sliding = true
                            Refresh()
                        end
                    end)
    
                    sliderback.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            sliding = false
                        end
                    end)
    
                    userinputservice.InputChanged:Connect(function(input)
                        if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then
                            Refresh()
                        end
                    end)
                    tab1_f.CanvasSize = UDim2.fromOffset(tab1_f.Size.X.Offset / 2 - 17, tab1_f.l2.AbsoluteContentSize.Y + 40)
                end
                tab.createkeybind = function(keybindtitle, default, callback1, callback2)
                    callback1 = callback1 or function(...) return end
                    callback2 = callback2 or function(...) return end
                    local key
                    local keybind = Instance.new("Frame")
                    local kb_button = Instance.new("TextButton")
                    local kb_title = Instance.new("TextLabel")

                    keybind.Name = "keybind"
                    keybind.Parent = tab1_f
                    keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    keybind.BackgroundTransparency = 1.000
                    keybind.Size = UDim2.new(0, 370, 0, 20)
                    
                    kb_button.Name = "kb_button"
                    kb_button.Parent = keybind
                    kb_button.Active = false
                    kb_button.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                    kb_button.BorderSizePixel = 0
                    kb_button.Position = UDim2.new(0.0145804742, 0, -0.190000921, 5)
                    kb_button.Selectable = false
                    kb_button.Size = UDim2.new(0, 75, 0, 20)
                    kb_button.Font = Enum.Font.Gotham
                    kb_button.Text = "..."
                    kb_button.TextColor3 = Color3.fromRGB(90, 90, 90)
                    kb_button.TextSize = 12.000
                    kb_button.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    kb_button.TextWrapped = true

                    kb_title.Name = "kb_title"
                    kb_title.Parent = keybind
                    kb_title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    kb_title.BackgroundTransparency = 1.000
                    kb_title.Position = UDim2.new(0.236648649, 0, -0.150000006, 5)
                    kb_title.Size = UDim2.new(0, 275, 0, 19)
                    kb_title.Font = Enum.Font.Gotham
                    kb_title.Text = keybindtitle
                    kb_title.TextColor3 = Color3.fromRGB(90, 90, 90)
                    kb_title.TextSize = 12.000
                    kb_title.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    kb_title.TextWrapped = true
                    kb_title.TextXAlignment = Enum.TextXAlignment.Left

                    kb_button.MouseButton1Click:Connect(function()
                        kb_button.Text = "..."
                    end)

                    local function SetKeybind(newkey)
                        if kb_button.Text == "..." then
                            key = newkey
                            kb_button.Text = tostring(newkey.Name or newkey)
                            pcall(callback1, newkey)
                        end
                    end
        
                    SetKeybind(default or "None")
        
                    userinputservice.InputBegan:Connect(function(input, gameProcessed)
                        if not gameProcessed then
                            if kb_button.Text == "..." then
                                if input.UserInputType == Enum.UserInputType.Keyboard then
                                    SetKeybind(input.KeyCode)
                                else
                                    SetKeybind("None")
                                end
                            else
                                if key ~= "None" and input.KeyCode == key then
                                    pcall(callback2)
                                end
                            end
                        end
                    end)
                    tab1_f.CanvasSize = UDim2.fromOffset(tab1_f.Size.X.Offset / 2 - 17, tab1_f.l2.AbsoluteContentSize.Y + 25)
                end
                tab.createdropdown = function(dropdowntitle, default, choices, callback)
                    callback = callback or function(...) return end
                    local selected = default or "None"
                    local dropdown = Instance.new("Frame")
                    local dbutton = Instance.new("TextButton")
                    local c_frame = Instance.new("Frame")
                    local l3 = Instance.new("UIListLayout")
                    local p5 = Instance.new("UIPadding")

                    local defaultsize = UDim2.new(0, 357, 0, 20)
                    local down = false

                    dropdown.Name = "dropdown"
                    dropdown.Parent = tab1_f
                    dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    dropdown.BackgroundTransparency = 1.000
                    dropdown.Size = UDim2.new(0, 370, 0, 20)
                    
                    dbutton.Name = "dbutton"
                    dbutton.Parent = dropdown
                    dbutton.Active = false
                    dbutton.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                    dbutton.BorderSizePixel = 0
                    dbutton.Position = UDim2.new(0.0145804742, 0, -0.190000147, 5)
                    dbutton.Selectable = false
                    dbutton.Size = UDim2.new(0, 357, 0, 20)
                    dbutton.Font = Enum.Font.Gotham
                    dbutton.Text = dropdowntitle.. " : " .. default
                    dbutton.TextColor3 = Color3.fromRGB(90, 90, 90)
                    dbutton.TextSize = 12.000
                    dbutton.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                    dbutton.TextWrapped = true
                    
                    c_frame.Name = "c_frame"
                    c_frame.Parent = dropdown
                    c_frame.AnchorPoint = Vector2.new(0.5, 0)
                    c_frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                    c_frame.BorderSizePixel = 0
                    c_frame.ClipsDescendants = true
                    c_frame.Position = UDim2.new(0.496, 0, 1.2, 0)
                    c_frame.Size = UDim2.new(0, 357, 0, 0)
                    c_frame.Visible = false
                    c_frame.ZIndex = 5
                    
                    l3.Name = "l3"
                    l3.Parent = c_frame
                    l3.SortOrder = Enum.SortOrder.LayoutOrder
                    l3.Padding = UDim.new(0, 2)
                    
                    p5.Name = "p5"
                    p5.Parent = c_frame
                    p5.PaddingLeft = UDim.new(0, 5)
                    p5.PaddingTop = UDim.new(0, 3)
                    
                    dbutton.MouseButton1Click:Connect(function()
                        if not down then
                            down = true
                            c_frame.Visible = true
                            library.animate(c_frame, {Size = defaultsize}, 0.5)
                        else
                            down = false
                            library.animate(c_frame, {Size = UDim2.fromOffset(357, 0)}, 0.5)
                            wait(0.5)
                            c_frame.Visible = false
                        end
                    end)
                    
                    local function AddChoice(name)
                        local dchoice = Instance.new("TextButton")

                        dchoice.Name = name
                        dchoice.Parent = c_frame
                        dchoice.Active = false
                        dchoice.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                        dchoice.BorderSizePixel = 0
                        dchoice.Position = UDim2.new(-0.00222624931, 0, -0.148333475, 5)
                        dchoice.Selectable = false
                        dchoice.Size = UDim2.new(0, 357, 0, 20)
                        dchoice.Font = Enum.Font.Gotham
                        dchoice.Text = name
                        dchoice.TextColor3 = Color3.fromRGB(90, 90, 90)
                        dchoice.TextSize = 12.000
                        dchoice.TextStrokeColor3 = Color3.fromRGB(65, 65, 65)
                        dchoice.TextWrapped = true
                        dchoice.TextXAlignment = Enum.TextXAlignment.Left
                        dchoice.ZIndex = 5

                        dchoice.MouseButton1Click:Connect(function()
                            selected = name
                            dbutton.Text = dropdowntitle.. " : " .. name
                            pcall(callback, selected)
                            down = false
                            library.animate(c_frame, {Size = UDim2.fromOffset(357, 0)}, 0.5)
                            wait(0.5)
                            c_frame.Visible = false
                        end)

                        defaultsize = UDim2.fromOffset(defaultsize.X.Offset, defaultsize.Y.Offset + 20)
                    end

                    selected = default
                    dbutton.Text = dropdowntitle.. " : " .. default
                    pcall(callback, selected)

                    for _,v in next, choices do 
                        AddChoice(v)
                    end
                    tab1_f.CanvasSize = UDim2.fromOffset(tab1_f.Size.X.Offset / 2 - 17, tab1_f.l2.AbsoluteContentSize.Y + 25)
                end
            return tab;
        end
    return window;
end

return library;
