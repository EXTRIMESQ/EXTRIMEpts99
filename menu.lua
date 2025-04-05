local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Удаляем предыдущее меню (если есть)
if playerGui:FindFirstChild("DragnessHud") then
    playerGui:FindFirstChild("DragnessHud"):Destroy()
end

-- Главное меню
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "DragnessHud"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Заголовок
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "DragnessHud | PTS99"
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.BorderSizePixel = 0

-- Кнопка сворачивания
local toggleButton = Instance.new("TextButton", frame)
toggleButton.Size = UDim2.new(0, 30, 0, 30)
toggleButton.Position = UDim2.new(1, -35, 0, 0)
toggleButton.Text = "-"
toggleButton.TextSize = 20
toggleButton.Font = Enum.Font.Gotham
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Боковое меню
local sidebar = Instance.new("Frame", frame)
sidebar.Size = UDim2.new(0, 100, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

-- Контент
local content = Instance.new("Frame", frame)
content.Size = UDim2.new(1, -100, 1, -30)
content.Position = UDim2.new(0, 100, 0, 30)
content.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
content.Name = "Content"

-- Вкладки
local tabs = {"Home", "Farm", "Mining", "Events", "Developer"}
local buttons = {}

local function switchTab(tabName)
    for name, btn in pairs(buttons) do
        if name == tabName then
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        else
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end
    content:ClearAllChildren()
    local label = Instance.new("TextLabel", content)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "Текущая вкладка: " .. tabName
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.BackgroundTransparency = 1
end

for i, name in ipairs(tabs) do
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
    btn.Text = name
    btn.Name = name
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
    buttons[name] = btn
end

-- Переключение меню
local visible = true
toggleButton.MouseButton1Click:Connect(function()
    visible = not visible
    sidebar.Visible = visible
    content.Visible = visible
end)

switchTab("Home")
