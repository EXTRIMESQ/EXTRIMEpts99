spawn(function()
    while true do
        if _G.hatching then
            -- Здесь замените на вашу функцию открытия яйца
            game:GetService("ReplicatedStorage").Network.OpenEgg:InvokeServer({
                egg = "YourEggNameHere",
                amount = 1,
                auto = true
            })
        end
        wait(5)
    end
end)
