--Pahntom Forces GUI made by YoinkedYoink#4488
--My github for more scripts: https://github.com/YoinkedYoink/Roblox-Scripts

--Uses Orion Ui Lib: https://github.com/shlexware/Orion/blob/main/Documentation.md

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Phantom Forces GUI by YoinkedYoink#4488", HidePremium = false, SaveConfig = false, IntroEnabled = false})

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
    Max = 500,
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
        getgenv().FOVCircle = Value
        if getgenv().FOVCircle then
            CurCamV = game:GetService("Workspace").CurrentCamera.ViewportSize
            if getgenv().FOVC == nil then
                getgenv().FOVC = Drawing.new("Circle")
            end
            Workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
                getgenv().FOVC.Radius = (math.abs(getgenv().FOV/((game:GetService("Workspace").CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X)))/2
            end)
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
            end
        end
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
    getgenv().Aimbot = Value
    while getgenv().Aimbot do
        local CurCamV = game:GetService("Workspace").CurrentCamera.ViewportSize
        local Workspace = game:GetService("Workspace")
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Players = game:GetService("Players")
        local UIS = game:GetService("UserInputService")
        BlackTable = {}
        LTeam = tostring(Players.LocalPlayer.TeamColor)
        if LTeam == "Bright orange" then
            Suckers = "Bright blue"
        else
            Suckers = "Bright orange"
        end
        if Workspace.Ignore:FindFirstChild("RefPlayer") then
            for i,v in next, Workspace.Players[Suckers]:GetChildren() do
                if v:FindFirstChild(getgenv().Hitpart) then
                    RaycastPR = RaycastParams.new()
                    table.insert(BlackTable, Workspace.CurrentCamera)
                    table.insert(BlackTable, Workspace.Ignore)
                    RaycastPR.FilterDescendantsInstances = BlackTable
                    RaycastPR.FilterType = Enum.RaycastFilterType.Blacklist
                    RaycastPR.RespectCanCollide = false
                    local ScreenP = Workspace.CurrentCamera:WorldToViewportPoint(v[getgenv().Hitpart].Position)
                    local cam = math.abs(getgenv().FOV/((Workspace.CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X))
                    if (ScreenP and ScreenP.Z > 0) and (Vector2.new(CurCamV.X/2,CurCamV.Y/2) - Vector2.new(ScreenP.X, ScreenP.Y)).Magnitude <= cam/2 then
                        Diwection = CFrame.lookAt(Workspace.Ignore.RefPlayer.Head.Position, v[getgenv().Hitpart].Position)
                        raycwast = Workspace:Raycast(LocalPlayer.Character.Head.Position, Diwection.lookVector*2000, RaycastPR)
                        if raycwast ~= nil then
                            if raycwast.Instance:IsDescendantOf(v) then
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
                            end
                        end
                    end
                end
            end
        end
        
        if getgenv().Lookie ~= nil then
            mousemoverel( ((getgenv().hiya.X) - CurCamV.X/2)/getgenv().Sensitivity, ((getgenv().hiya.Y) - CurCamV.Y/2)/getgenv().Sensitivity )
            if getgenv().autoshoot then
                mouse = LocalPlayer:GetMouse()
                mouse.TargetFilter = Workspace.CurrentCamera
                if mouse.Target:IsDescendantOf(getgenv().Person) then
                    mouse1press()
                    task.wait()
                    mouse1release()
                else
                    mouse.TargetFilter = Workspace.Ignore
                    if mouse.Target:IsDescendantOf(getgenv().Person) then
                        mouse1press()
                        task.wait()
                        mouse1release()
                    end
                end
            end
            getgenv().Lookie = nil
            getgenv().hiya = nil
            getgenv().mag = nil
        end
    task.wait()
    end
    end
})
