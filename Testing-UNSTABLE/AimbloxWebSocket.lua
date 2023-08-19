--Aimblox GUI made by YoinkedYoink#4488
--My github for more scripts: https://github.com/YoinkedYoink/Roblox-Scripts

--Uses Orion Ui Lib: https://github.com/shlexware/Orion/blob/main/Documentation.md

--THIS IS THE WEBSOCKET VERSION
--USE THE WEBSOCKET SERVER PYTHON SCRIPT

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
    Name = "Finding Websocket...",
    Content = "Remember to run the websocket!!!",
    Time = 2
})

function ConWS()
	S = WebSocket.connect("ws://127.0.0.1:6969")
	OrionLib:MakeNotification({
		Name = "Found Socket!",
		Content = "Time to run this server >:)",
		Time = 4
	})
end

local ConOrNot = pcall(ConWS)
while not ConOrNot do
	wait(2)
	OrionLib:MakeNotification({
		Name = "Finding Websocket...",
		Content = "Remember to run the websocket!!!",
		Time = 2
	})
  	ConOrNot = pcall(ConWS)
end

local Window = OrionLib:MakeWindow({Name = "Aimblox GUI by YoinkedYoink#4488", HidePremium = false, SaveConfig = false, IntroEnabled = false})

local CreditsTab = Window:MakeTab({
    Name = "Credits"
})
local DiscordSec = CreditsTab:AddSection({
    Name = "Discord"
})
DiscordSec:AddButton({
    Name = "Message YoinkedYoink#4488 for support",
    Callback = function()
        syn.write_clipboard("YoinkedYoink#4488")
        OrionLib:MakeNotification({
            Name = "Copied to Clipboard!",
            Content = "Copied my Discord Username to Clipboard",
            Time = 2
        })
    end
})
DiscordSec:AddButton({
    Name = "Join my Discord server",
    Callback = function()
        syn.write_clipboard("https://discord.gg/drtwNmFxeF")
        OrionLib:MakeNotification({
            Name = "Copied to Clipboard!",
            Content = "Copied my Discord Server to Clipboard",
            Time = 2
        })
    end
})
local GithubSec = CreditsTab:AddSection({
    Name = "Github"
})
GithubSec:AddButton({
    Name = "Get more scripts",
    Callback = function()
        syn.write_clipboard("https://github.com/YoinkedYoink/Roblox-Scripts")
        OrionLib:MakeNotification({
            Name = "Copied to Clipboard!",
            Content = "Copied Github link to Clipboard",
            Time = 2
        })
    end
})


local AimbotTab = Window:MakeTab({
    Name = "Aimbot"
})

local AimbotFOV = AimbotTab:AddSlider({
    Name = "FOV",
    Min = 1,
    Max = 900,
    Default = 25,
    Increment = 1,
    Callback = function(Value)
        getgenv().FOV = Value
        if getgenv().FOVC ~= nil then
            CurCamV = game:GetService("Workspace").CurrentCamera.ViewportSize
            getgenv().FOVC.Radius = (math.abs(getgenv().FOV/((game:GetService("Workspace").CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X)))/2
        end
    end
})

AimbotTab:AddDropdown({
    Name = "HitPart",
    Default = "Head",
    Options = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart"},
    Callback = function(Value)
        getgenv().Hitpart = Value
    end
})

AimbotTab:AddToggle({
    Name = "FOV Circle",
    Default = false,
    Callback = function(Value)
        if Value then
            CurCamV = game:GetService("Workspace").CurrentCamera.ViewportSize
            getgenv().FOVC.Visible = true
            getgenv().FOVC.ZIndex = -9999999
            getgenv().FOVC.Transparency = 0.8
            getgenv().FOVC.Color = Color3.fromRGB(255,5,239)
            getgenv().FOVC.Thickness = 1
            getgenv().FOVC.NumSides = 200
            getgenv().FOVC.Radius = (math.abs(getgenv().FOV/((game:GetService("Workspace").CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X)))/2
            getgenv().FOVC.Filled = false
            getgenv().FOVC.Position = Vector2.new(CurCamV.X/2,CurCamV.Y/2)
        else
            if getgenv().FOVC ~= nil then
                getgenv().FOVC.Visible = false
            else
                getgenv().FOVC = Drawing.new("Circle")
            end
        end
    end
})

AimbotTab:AddToggle({
    Name = "Snapline",
    Default = false,
    Callback = function(Value)
        getgenv().Snapline = Value
    end
})

AimbotTab:AddToggle({
    Name = "Auto Shoot",
    Default = false,
    Callback = function(Value)
        getgenv().autoshoot = Value
    end
})

AimbotTab:AddSlider({
    Name = "Sensitivity",
    Min = 1,
    Max = 20,
    Default = 7,
    Increment = 1,
    Callback = function(Value)
        getgenv().Sensitivity = Value
    end
})

AimbotTab:AddBind({
    Name = "Aim Keybind",
    Default = Enum.KeyCode.X,
    Hold = true,
    Callback = function(Value)
        getgenv().StewartLittle = Value
    local CurCamV = game:GetService("Workspace").CurrentCamera.ViewportSize
    local Workspace = game:GetService("Workspace")
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Players = game:GetService("Players")
    local UIS = game:GetService("UserInputService")
    function CastRayToPlayers()
        for _,i in next, Players:GetPlayers() do
            BlackTable = {}
            raycwast = nil
            if i.Name ~= LocalPlayer.Name then
                if Workspace:FindFirstChild(i.Name) then
                    RaycastPR = RaycastParams.new()
                    table.insert(BlackTable, LocalPlayer.Character)
                    table.insert(BlackTable, Workspace.CurrentCamera)
                    table.insert(BlackTable, Workspace.Ignore)
                    for u,m in pairs(Workspace:GetChildren()) do
                        if string.match(tostring(m), "PseudoCharacter") then
                            table.insert(BlackTable, m)
                        end
                    end
                    if game:GetService("Workspace").CompetitiveMap:FindFirstChild("fooliage") then
                        if game:GetService("Workspace").CompetitiveMap.fooliage:FindFirstChild("Grass") then
                            table.insert(BlackTable, game:GetService("Workspace").CompetitiveMap.fooliage.Grass)
                        end
                    end
                    if game:GetService("Workspace").CompetitiveMap:FindFirstChild("Presets") then
                        table.insert(BlackTable, game:GetService("Workspace").CompetitiveMap.Presets)
                    end
                    if game:GetService("Workspace").CompetitiveMap:FindFirstChild("Particles") then
                        table.insert(BlackTable, game:GetService("Workspace").CompetitiveMap.Particles)
                    end
                    RaycastPR.FilterDescendantsInstances = BlackTable
                    RaycastPR.FilterType = Enum.RaycastFilterType.Blacklist
                    RaycastPR.RespectCanCollide = false
                    if Workspace[i.Name]:FindFirstChild(getgenv().Hitpart) then
                        local ScreenP = Workspace.CurrentCamera:WorldToViewportPoint(Workspace[i.Name][getgenv().Hitpart].Position)
                        local cam = math.abs(getgenv().FOV/((Workspace.CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X))
                        if (ScreenP and ScreenP.Z > 0) and (Vector2.new(CurCamV.X/2,CurCamV.Y/2) - Vector2.new(ScreenP.X, ScreenP.Y)).Magnitude <= cam/2 then
                            if LocalPlayer.Character:FindFirstChild("Head") then
                                if Workspace[i.Name]:FindFirstChild("Shading") then
                                if Workspace[i.Name].Shading.OutlineTransparency ~= 1 then
                                Diwection = CFrame.lookAt(LocalPlayer.Character.Head.Position, Workspace[i.Name][getgenv().Hitpart].Position)
                                raycwast = Workspace:Raycast(LocalPlayer.Character.Head.Position, Diwection.lookVector*2000, RaycastPR)
                                if raycwast ~= nil then
                                    if string.match(tostring(raycwast.Instance:GetFullName()), LocalPlayer.Name) == nil then
                                        if string.match(tostring(raycwast.Instance:GetFullName()), i.Name) ~= nil then
                                            if getgenv().mag ~= nil then
                                                temp = ((Vector2.new(CurCamV.X/2,CurCamV.Y/2)) - (Vector2.new(ScreenP.X,ScreenP.Y))).Magnitude
                                                if getgenv().mag > temp then
                                                    getgenv().mag = temp
                                                    getgenv().Lookie = Diwection
                                                    getgenv().hiya = ScreenP
                                                end
                                            else
                                                getgenv().mag = ((Vector2.new(CurCamV.X/2,CurCamV.Y/2)) - (Vector2.new(ScreenP.X,ScreenP.Y))).Magnitude
                                                getgenv().Lookie = Diwection
                                                getgenv().hiya = ScreenP
                                            end
                                        else
                                        end
                                    else
                                    end
                                else
                                end
                                end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    function shoot()
        if game:GetService("Players").LocalPlayer.PlayerGui.Crosshair.Crosshair.TopFrame.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
        mouse1press()
        task.wait()
        mouse1release()
        end
    end
    
    while getgenv().StewartLittle do
        if Workspace:FindFirstChild(LocalPlayer.Name) then
            CastRayToPlayers()
            if getgenv().Lookie ~= nil then
                if getgenv().Snapline then
                    if getgenv().Sline == nil then
                        getgenv().Sline = Drawing.new("Line")
                    end
                    getgenv().Sline.Visible = true
                    getgenv().Sline.ZIndex = -99999999
                    getgenv().Sline.Transparency = 0.6
                    getgenv().Sline.Color = Color3.fromRGB(0,200,40)
                    getgenv().Sline.Thickness = 2
                    getgenv().Sline.From = Vector2.new(CurCamV.X/2,CurCamV.Y/2)
                    getgenv().Sline.To = Vector2.new(getgenv().hiya.X, getgenv().hiya.Y)
                elseif getgenv().Snapline == false and getgenv().Sline ~= nil then
                    getgenv().Sline.Visible = false
                end
                --mousemoverel( ((getgenv().hiya.X) - CurCamV.X/2)/getgenv().Sensitivity, ((getgenv().hiya.Y) - CurCamV.Y/2)/getgenv().Sensitivity )
                S:Send( tostring( ((getgenv().hiya.X) - CurCamV.X/2)/getgenv().Sensitivity).." "..tostring(((getgenv().hiya.Y) - CurCamV.Y/2)/getgenv().Sensitivity))
				if getgenv().autoshoot then
                    shoot()
                end
            elseif getgenv().Lookie == nil then
                if getgenv().Sline ~= nil then
                    getgenv().Sline.Visible = false
                end
            end
            getgenv().Lookie = nil
            getgenv().mag = nil
        end
        task.wait()
    end
    if getgenv().StewartLittle == false then
        if getgenv().Sline ~= nil then
            getgenv().Sline.Visible = false
        end
    end
    end
})


local Movementtab = Window:MakeTab({
    Name = "Movement"
})

Movementtab:AddSlider({
    Name = "Speed Value",
    Min = 1,
    Max = 100,
    Default = 50,
    Increment = 1,
    Callback = function(Value)
        getgenv().SpeedSpeed = Value
    end
})

Movementtab:AddToggle({
    Name = "Speed",
    Default = false,
    Callback = function(Value)
        getgenv().Speed = Value
        local Workspace = game:GetService("Workspace")
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Players = game:GetService("Players")
        LocalPlayer.CharacterAdded:Connect(function()
            repeat
                wait()
            until LocalPlayer.Character:FindFirstChild("Humanoid")
            LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if getgenv().Speed and Workspace:FindFirstChild(LocalPlayer.Name) then
                    LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SpeedSpeed
                end
            end)
            if Workspace:FindFirstChild(LocalPlayer.Name) then
                LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SpeedSpeed
            end
        end)
    end
})

Movementtab:AddSlider({
    Name = "HighJump Value",
    Min = 0.1,
    Max = 10,
    Increment = 0.1,
    Callback = function(Value)
        getgenv().HighJumpJump = Value
    end
})

Movementtab:AddBind({
    Name = "HighJump",
    Default = Enum.KeyCode.RightBracket,
    Hold = true,
    Callback = function(Value)
        getgenv().HighJump = Value
        local Workspace = game:GetService("Workspace")
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Players = game:GetService("Players")
        while getgenv().HighJump do
            if Workspace:FindFirstChild(LocalPlayer.Name) then
                if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.CFrame.X,LocalPlayer.Character.HumanoidRootPart.CFrame.Y+getgenv().HighJumpJump,LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                    LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(LocalPlayer.Character.HumanoidRootPart.Velocity.X,0,LocalPlayer.Character.HumanoidRootPart.Velocity.Z)
                end
            end
            wait()
        end
    end
})

local Extratab = Window:MakeTab({
    Name = "Extra"
})

Extratab:AddSlider({
    Name = "Spin Speed",
    Min = 1,
    Max = 40,
    Default = 25,
    Increment = 1,
    Callback = function(Value)
        getgenv().SpinSpeed = Value
    end
})

Extratab:AddToggle({
    Name = "Spin Bot",
    Default = false,
    Callback = function(Value)
        getgenv().Run = Value
        LPlayer = game:GetService("Players").LocalPlayer
        Workspace = game:GetService("Workspace")
        while getgenv().Run do
            if LPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if LPlayer.Character:FindFirstChild("Humanoid") then
                    LPlayer.Character.Humanoid.AutoRotate = false
                    LPlayer.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(getgenv().SpinSpeed), 0)
                    task.wait()
                end
                task.wait()
            else
                task.wait()
            end
            task.wait()
        end
        if getgenv().Run == false then
            if LPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LPlayer.Character.Humanoid.AutoRotate = true
            end
        end
    end
})
