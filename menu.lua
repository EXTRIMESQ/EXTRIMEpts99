-- Загрузка WindUI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua"))()

-- Создание окна
local Window = WindUI:CreateWindow("DragnessHud | PTS99")

-- Вкладка: Домой
local Home = Window:CreateTab("Домой")
Home:CreateLabel("Добро пожаловать в DragnessHud!")

-- Вкладка: Ферма
local Farm = Window:CreateTab("Ферма")
Farm:CreateButton("Начать автофарм", function()
    print("Автофарм запущен")
end)

-- Вкладка: Mining
local Mining = Window:CreateTab("Mining")
Mining:CreateToggle("Автоматическая добыча", false, function(state)
    print("Авто-добыча: " .. tostring(state))
end)

-- Вкладка: Events
local Events = Window:CreateTab("Events")
Events:CreateDropdown("Выбери ивент", {"Событие 1", "Событие 2", "Событие 3"}, function(selected)
    print("Выбран ивент: " .. selected)
end)

-- Вкладка: Developer
local Dev = Window:CreateTab("Developer")
Dev:CreateSlider("Скорость скрипта", 1, 100, 50, function(value)
    print("Скорость: " .. value)
end)
