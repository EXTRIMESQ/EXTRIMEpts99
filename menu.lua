local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(1, 0, 1, 0)
toggle.Text = "Автопрокрутка: ВЫКЛ"
toggle.BackgroundColor3 = Color3.fromRGB(70, 130, 180)

_G.hatching = false

toggle.MouseButton1Click:Connect(function()
    _G.hatching = not _G.hatching
    toggle.Text = _G.hatching and "Автопрокрутка: ВКЛ" or "Автопрокрутка: ВЫКЛ"
end)
