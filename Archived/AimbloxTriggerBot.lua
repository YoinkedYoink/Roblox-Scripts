--Aimblox Simple Crosshair Triggerbot
--Coded by YoinkedYoink#4488
--When crosshair topframe backgroundcolor3 is 255, 0, 0 send a click

_G.TriggerBot = false

while _G.TriggerBot do
    if game:GetService("Players").LocalPlayer.PlayerGui.Crosshair.Crosshair.TopFrame.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
        mouse1press()
        wait(0.2)
        mouse1release()
    end
    wait()
end
