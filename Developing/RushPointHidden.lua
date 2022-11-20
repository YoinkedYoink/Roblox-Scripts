--hidden esp and bad aimbot for rush point
--To make it hidden enable obs hide in synapse options and make obs or whatever game capture (not whole screen) 
--enter your values here
local espcolour = Color3.new(255,0,0)
local esptranspacrency = 0.6 -- 1=not transparent
local espsize = Vector2.new(10,10)

--bad aimbot key is X but don't use it if you want to look legit


--poopoo code starts here

local CurCamV = game:GetService("Workspace").CurrentCamera.ViewportSize
local Workspace = game:GetService("Workspace")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
--prerequasites
local SelectedValue = 0
_G.ESP = false
_G.Aimbot = false
_G.Triangle = false

_G.MainBox = Drawing.new("Square")
    _G.MainBox.Visible = true
    _G.MainBox.Thickness = 1
    _G.MainBox.Size = Vector2.new(150,60)
    _G.MainBox.Position = Vector2.new(CurCamV.X / 100, CurCamV.Y / 2)
    _G.MainBox.Filled = true
    _G.MainBox.Color = Color3.new(200,200,200)
    _G.MainBox.Transparency = 0.8
    _G.MainBox.ZIndex = 1
    
_G.CircleText = Drawing.new("Text")
    _G.CircleText.Visible = true
    _G.CircleText.Text = "ESP"
    _G.CircleText.Size = 20
    _G.CircleText.Center = false
    _G.CircleText.Outline = false
    _G.CircleText.Position = Vector2.new(CurCamV.X/100 + 22,CurCamV.Y/2 + 15)
    _G.CircleText.Transparency = 0.8
    _G.CircleText.Font = 3
    _G.CircleText.ZIndex = 2
    
_G.CircleTextBox = Drawing.new("Square")
    _G.CircleTextBox.Visible = true
    _G.CircleTextBox.Thickness = 1
    _G.CircleTextBox.Size = Vector2.new(5,5)
    _G.CircleTextBox.Position = Vector2.new(CurCamV.X/100 + 12, CurCamV.Y/2 +23)
    _G.CircleTextBox.Filled = true
    _G.CircleTextBox.Color = Color3.new(0,0,0)
    _G.CircleTextBox.Transparency = 0.8
    _G.CircleTextBox.ZIndex = 3
_G.SelectorBox = Drawing.new("Square")
    _G.SelectorBox.Visible = true
    _G.SelectorBox.Thickness = 1
    _G.SelectorBox.Size = Vector2.new(8,8)
    _G.SelectorBox.Position = Vector2.new(CurCamV.X / 100 +10, CurCamV.Y / 2 +22+(15*SelectedValue))
    _G.SelectorBox.Filled = true
    _G.SelectorBox.Color = Color3.new(255,0,0)
    _G.SelectorBox.Transparency = 0.8
    _G.SelectorBox.ZIndex = 2
    
_G.SquareText = Drawing.new("Text")
    _G.SquareText.Visible = true
    _G.SquareText.Text = "Aimbot(bad)"
    _G.SquareText.Size = 20
    _G.SquareText.Center = false
    _G.SquareText.Outline = false
    _G.SquareText.Position = Vector2.new(CurCamV.X/100 + 22,CurCamV.Y/2 + 30)
    _G.SquareText.Transparency = 0.8
    _G.SquareText.Font = 3
    _G.SquareText.ZIndex = 2

_G.SquareTextBox = Drawing.new("Square")
    _G.SquareTextBox.Visible = true
    _G.SquareTextBox.Thickness = 1
    _G.SquareTextBox.Size = Vector2.new(5,5)
    _G.SquareTextBox.Position = Vector2.new(CurCamV.X/100 + 12, CurCamV.Y/2 +38)
    _G.SquareTextBox.Filled = true
    _G.SquareTextBox.Color = Color3.new(0,0,0)
    _G.SquareTextBox.Transparency = 0.8
    _G.SquareTextBox.ZIndex = 3
    
-- _G.TriangleText = Drawing.new("Text")
--     _G.TriangleText.Visible = true
--     _G.TriangleText.Text = "Triangle"
--     _G.TriangleText.Size = 20
--     _G.TriangleText.Center = false
--     _G.TriangleText.Outline = false
--     _G.TriangleText.Position = Vector2.new(CurCamV.X/100 + 22,CurCamV.Y/2 + 45)
--     _G.TriangleText.Transparency = 0.8
--     _G.TriangleText.Font = 3
--     _G.TriangleText.ZIndex = 2
    
-- _G.TriangleTextBox = Drawing.new("Square")
--     _G.TriangleTextBox.Visible = true
--     _G.TriangleTextBox.Thickness = 1
--     _G.TriangleTextBox.Size = Vector2.new(5,5)
--     _G.TriangleTextBox.Position = Vector2.new(CurCamV.X/100 + 12, CurCamV.Y/2 +54)
--     _G.TriangleTextBox.Filled = true
--     _G.TriangleTextBox.Color = Color3.new(0,0,0)
--     _G.TriangleTextBox.Transparency = 0.8
--     _G.TriangleTextBox.ZIndex = 3


function RemakeUi()
    _G.MainBox:Remove()
    _G.CircleText:Remove()
    _G.CircleTextBox:Remove()
    _G.SelectorBox:Remove()
    _G.SquareText:Remove()
    _G.SquareTextBox:Remove()
    -- _G.TriangleText:Remove()
    -- _G.TriangleTextBox:Remove()
    
    _G.MainBox = Drawing.new("Square")
    _G.MainBox.Visible = true
    _G.MainBox.Thickness = 1
    _G.MainBox.Size = Vector2.new(150,60)
    _G.MainBox.Position = Vector2.new(CurCamV.X / 100, CurCamV.Y / 2)
    _G.MainBox.Filled = true
    _G.MainBox.Color = Color3.new(200,200,200)
    _G.MainBox.Transparency = 0.8
    _G.MainBox.ZIndex = 1
    
    _G.CircleText = Drawing.new("Text")
    _G.CircleText.Visible = true
    _G.CircleText.Text = "ESP"
    _G.CircleText.Size = 20
    _G.CircleText.Center = false
    _G.CircleText.Outline = false
    _G.CircleText.Position = Vector2.new(CurCamV.X/100 + 22,CurCamV.Y/2 + 15)
    _G.CircleText.Transparency = 0.8
    _G.CircleText.Font = 3
    _G.CircleText.ZIndex = 2
    
    _G.CircleTextBox = Drawing.new("Square")
    _G.CircleTextBox.Visible = true
    _G.CircleTextBox.Thickness = 1
    _G.CircleTextBox.Size = Vector2.new(5,5)
    _G.CircleTextBox.Position = Vector2.new(CurCamV.X/100 + 12, CurCamV.Y/2 +23)
    _G.CircleTextBox.Filled = true
    _G.CircleTextBox.Color = Color3.new(0,0,0)
    _G.CircleTextBox.Transparency = 0.8
    _G.CircleTextBox.ZIndex = 3
    
    _G.SelectorBox = Drawing.new("Square")
    _G.SelectorBox.Visible = true
    _G.SelectorBox.Thickness = 1
    _G.SelectorBox.Size = Vector2.new(8,8)
    _G.SelectorBox.Position = Vector2.new(CurCamV.X / 100 +10, CurCamV.Y / 2 +22+(15*SelectedValue))
    _G.SelectorBox.Filled = true
    _G.SelectorBox.Color = Color3.new(255,0,0)
    _G.SelectorBox.Transparency = 0.8
    _G.SelectorBox.ZIndex = 2
    
    _G.SquareText = Drawing.new("Text")
    _G.SquareText.Visible = true
    _G.SquareText.Text = "Aimbot(bad)"
    _G.SquareText.Size = 20
    _G.SquareText.Center = false
    _G.SquareText.Outline = false
    _G.SquareText.Position = Vector2.new(CurCamV.X/100 + 22,CurCamV.Y/2 + 30)
    _G.SquareText.Transparency = 0.8
    _G.SquareText.Font = 3
    _G.SquareText.ZIndex = 2

    _G.SquareTextBox = Drawing.new("Square")
    _G.SquareTextBox.Visible = true
    _G.SquareTextBox.Thickness = 1
    _G.SquareTextBox.Size = Vector2.new(5,5)
    _G.SquareTextBox.Position = Vector2.new(CurCamV.X/100 + 12, CurCamV.Y/2 +38)
    _G.SquareTextBox.Filled = true
    _G.SquareTextBox.Color = Color3.new(0,0,0)
    _G.SquareTextBox.Transparency = 0.8
    _G.SquareTextBox.ZIndex = 3
    
    -- _G.TriangleText = Drawing.new("Text")
    -- _G.TriangleText.Visible = true
    -- _G.TriangleText.Text = "Triangle"
    -- _G.TriangleText.Size = 20
    -- _G.TriangleText.Center = false
    -- _G.TriangleText.Outline = false
    -- _G.TriangleText.Position = Vector2.new(CurCamV.X/100 + 22,CurCamV.Y/2 + 45)
    -- _G.TriangleText.Transparency = 0.8
    -- _G.TriangleText.Font = 3
    -- _G.TriangleText.ZIndex = 2
    
    -- _G.TriangleTextBox = Drawing.new("Square")
    -- _G.TriangleTextBox.Visible = true
    -- _G.TriangleTextBox.Thickness = 1
    -- _G.TriangleTextBox.Size = Vector2.new(5,5)
    -- _G.TriangleTextBox.Position = Vector2.new(CurCamV.X/100 + 12, CurCamV.Y/2 +54)
    -- _G.TriangleTextBox.Filled = true
    -- _G.TriangleTextBox.Color = Color3.new(0,0,0)
    -- _G.TriangleTextBox.Transparency = 0.8
    -- _G.TriangleTextBox.ZIndex = 3
end

-- _G.FovCircle = Drawing.new("Circle")
--     _G.FovCircle.Visible = true
--     _G.FovCircle.Thickness = 0.5
--     _G.FovCircle.NumSides = 200
--     _G.FovCircle.Radius = 240
--     _G.FovCircle.Position = Vector2.new(CurCamV.X/2, CurCamV.Y/2)
--     _G.FovCircle.Filled = false
--     _G.FovCircle.Color = Color3.new(255,255,255)
--     _G.FovCircle.Transparency = 0.4
--     _G.FovCircle.ZIndex = 3

--------------------------------------------------------------- pee pee poo poo code
UserInputService.InputBegan:Connect(function(input, _gameProcessed)
    if input.KeyCode == Enum.KeyCode.Down then
        if SelectedValue == 1 then
        else
            SelectedValue = SelectedValue +1
            RemakeUi()
        end
    elseif input.KeyCode == Enum.KeyCode.Up then
        if SelectedValue == 0 then
            return;
        else
            SelectedValue = SelectedValue - 1
            RemakeUi()
        end
    elseif input.KeyCode == Enum.KeyCode.Right then
        if SelectedValue == 0 then
            _G.ESP = not _G.ESP
            print(_G.ESP)
            ESP()
        elseif SelectedValue == 1 then
            _G.Aimbot = not _G.Aimbot
            print(_G.Aimbot)
            Aimbot()
        -- elseif SelectedValue == 2 then
        --     _G.Triangle = not _G.Triangle
        end
    end
end)

function ESP()
    while _G.ESP do
        checkPlayers()
        if _G.ESPPlayers ~= {} then --ew
            for index = 1, #_G.ESPPlayers do
                if index == 1 then
                    _G.espbox = Drawing.new("Square")
                    _G.espbox.Visible = true
                    _G.espbox.Transparency = esptranspacrency
                    _G.espbox.ZIndex = 99
                    _G.espbox.Thickness = 1
                    _G.espbox.Color = espcolour
                    _G.espbox.Size = espsize
                    _G.espbox.Filled = true
                    _G.espbox.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 2 then
                    _G.espbox1 = Drawing.new("Square")
                    _G.espbox1.Visible = true
                    _G.espbox1.Transparency = esptranspacrency
                    _G.espbox1.ZIndex = 99
                    _G.espbox1.Color = espcolour
                    _G.espbox1.Thickness = 1
                    _G.espbox1.Size = espsize
                    _G.espbox1.Filled = true
                    _G.espbox1.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 3 then
                    _G.espbox2 = Drawing.new("Square")
                    _G.espbox2.Visible = true
                    _G.espbox2.Transparency = esptranspacrency
                    _G.espbox2.ZIndex = 99
                    _G.espbox2.Color = espcolour
                    _G.espbox2.Thickness = 1
                    _G.espbox2.Size = espsize
                    _G.espbox2.Filled = true
                    _G.espbox2.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 4 then
                    _G.espbox3 = Drawing.new("Square")
                    _G.espbox3.Visible = true
                    _G.espbox3.Transparency = esptranspacrency
                    _G.espbox3.ZIndex = 99
                    _G.espbox3.Color = espcolour
                    _G.espbox3.Thickness = 1
                    _G.espbox3.Size = espsize
                    _G.espbox3.Filled = true
                    _G.espbox3.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 5 then
                    _G.espbox4 = Drawing.new("Square")
                    _G.espbox4.Visible = true
                    _G.espbox4.Transparency = esptranspacrency
                    _G.espbox4.ZIndex = 99
                    _G.espbox4.Color = espcolour
                    _G.espbox4.Thickness = 1
                    _G.espbox4.Size = espsize
                    _G.espbox4.Filled = true
                    _G.espbox4.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 6 then
                    _G.espbox5 = Drawing.new("Square")
                    _G.espbox5.Visible = true
                    _G.espbox5.Transparency = esptranspacrency
                    _G.espbox5.ZIndex = 99
                    _G.espbox5.Color = espcolour
                    _G.espbox5.Thickness = 1
                    _G.espbox5.Size = espsize
                    _G.espbox5.Filled = true
                    _G.espbox5.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 7 then 
                    _G.espbox6 = Drawing.new("Square")
                    _G.espbox6.Visible = true
                    _G.espbox6.Transparency = esptranspacrency
                    _G.espbox6.ZIndex = 99
                    _G.espbox6.Color = espcolour
                    _G.espbox6.Thickness = 1
                    _G.espbox6.Size = espsize
                    _G.espbox6.Filled = true
                    _G.espbox6.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 8 then
                    _G.espbox7 = Drawing.new("Square")
                    _G.espbox7.Visible = true
                    _G.espbox7.Transparency = esptranspacrency
                    _G.espbox7.ZIndex = 99
                    _G.espbox7.Color = espcolour
                    _G.espbox7.Thickness = 1
                    _G.espbox7.Size = espsize
                    _G.espbox7.Filled = true
                    _G.espbox7.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 9 then
                    _G.espbox8 = Drawing.new("Square")
                    _G.espbox8.Visible = true
                    _G.espbox8.Transparency = esptranspacrency
                    _G.espbox8.ZIndex = 99
                    _G.espbox8.Color = espcolour
                    _G.espbox8.Thickness = 1
                    _G.espbox8.Size = espsize
                    _G.espbox8.Filled = true
                    _G.espbox8.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                elseif index == 10 then
                    _G.espbox9 = Drawing.new("Square")
                    _G.espbox9.Visible = true
                    _G.espbox9.Transparency = esptranspacrency
                    _G.espbox9.ZIndex = 99
                    _G.espbox9.Color = espcolour
                    _G.espbox9.Thickness = 1
                    _G.espbox9.Size = espsize
                    _G.espbox9.Filled = true
                    _G.espbox9.Position = Vector2.new(_G.ESPPlayers[index].X, _G.ESPPlayers[index].Y)
                    --wait()
                end
            end
            for index = 1, #_G.ESPPlayers do --and again
                wait()
                if index == 1 then
                    _G.espbox:Remove()
                elseif index == 2 then
                    _G.espbox1:Remove()
                elseif index == 3 then
                    _G.espbox2:Remove()
                elseif index == 4 then
                    _G.espbox3:Remove()
                elseif index == 5 then 
                    _G.espbox4:Remove()
                elseif index == 6 then
                    _G.espbox5:Remove()
                elseif index == 7 then 
                    _G.espbox6:Remove()
                elseif index == 8 then 
                    _G.espbox7:Remove()
                elseif index == 9 then 
                    _G.espbox8:Remove()
                elseif index == 10 then
                    _G.espbox9:Remove()
                end
            end
        wait()
        end
    end
end
--.MapFolder.Players
function checkPlayers() --messy but not as bad
_G.ESPPlayers = {}
for _,i in pairs(Players:GetPlayers()) do
    if i.Name ~= LocalPlayer.Name then
        if Workspace.MapFolder.Players:FindFirstChild(i.Name) then
            if Workspace.MapFolder.Players[i.Name]:FindFirstChild("HumanoidRootPart") then
                local ScreenP = Workspace.CurrentCamera:WorldToScreenPoint(Workspace.MapFolder.Players[i.Name].HumanoidRootPart.Position)
                local cam = math.abs(120/((Workspace.CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X))
                if (ScreenP and ScreenP.Z > 0) and (Vector2.new(CurCamV.X/2,CurCamV.Y/2) - Vector2.new(ScreenP.X, ScreenP.Y)).Magnitude <= cam/2 then
                    --print(i.Name)
                    --Etard == electronic retard
                    _G.Etard = game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(Workspace.MapFolder.Players[i.Name]:WaitForChild("HumanoidRootPart", math.huge).Position)
                    if Workspace.MapFolder.Players:FindFirstChild(LocalPlayer.Name) then
                        if Workspace.MapFolder.Players[LocalPlayer.Name]:FindFirstChild("HumanoidRootPart") then
                            _G.Etard = Vector2.new(_G.Etard.X, _G.Etard.Y + ((Workspace.MapFolder.Players[LocalPlayer.Name].HumanoidRootPart.Position - Workspace.MapFolder.Players[i.Name].HumanoidRootPart.Position).Magnitude/10))
                        end
                    end
                    table.insert(_G.ESPPlayers, _G.Etard)
                end
            end
        end
    end
end
end

function Aimbot()
    while _G.Aimbot do
        wait(0.01)
        AimbotTarget()
        UserInputService.InputBegan:Connect(function(input, _gameProcessed)
            if input.KeyCode == Enum.KeyCode.X then
                _G.pressed = true
                while _G.pressed do --I don't know how to make a legit aimassist
                    TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(0.01, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame=CFrame.new(Workspace.CurrentCamera.CFrame.Position, _G.aimtarget.Position)}):Play()
                    wait()
                end
            end
        end)
        wait()
        UserInputService.InputEnded:Connect(function(input, _gameProcessed)
            if input.KeyCode == Enum.KeyCode.X then
                _G.pressed = false
            end
        end)
    end
end

function AimbotTarget() --less messy but not great
    for _,aim in pairs(Players:GetPlayers()) do
        if aim.Name ~= LocalPlayer.Name then
            if Workspace.MapFolder.Players:FindFirstChild(aim.Name) then
                if Workspace.MapFolder.Players[aim.Name]:FindFirstChild("HumanoidRootPart") then
                    local PPD3 = (Workspace.CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X
                    local PPD4 = math.abs(5/PPD3)
                    local ScreenP2 = Workspace.CurrentCamera:WorldToScreenPoint(Workspace.MapFolder.Players[aim.Name].HumanoidRootPart.Position)
                    if (ScreenP2 and ScreenP2.Z > 0) and (Vector2.new(CurCamV.X/2,CurCamV.Y/2) - Vector2.new(ScreenP2.X, ScreenP2.Y)).Magnitude <= PPD4/2 then
                        local target = game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(Workspace.MapFolder.Players[aim.Name].Head.Position)
                        _G.aimtarget = Workspace.MapFolder.Players[aim.Name].Head
                    end
                end
            end
        end
    end
end

