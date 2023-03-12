getgenv().StewartLittle = true --enable/disable script

--aimbot settings
getgenv().FOV = 20 --FOV of aimbot
--use X-Mouae thing to bind M4/M5 to keymul
getgenv().TriggerKey = "KeypadMultiply" --Key to enable aimbot, X, E, Q, F, etc...
getgenv().Hitpart = "Head" --Head,Torso,LowerTorso,HumanoidRootPart,LeftFoot,etc...
getgenv().Sensitivity = 2 --How much it moves mouse, 1 = instant snap

--extended settings
getgenv().FOVCircle = true
getgenv().autoshoot = true

rconsoleprint("Opening Console")
rconsoleclear()
rconsoleprint("                mm                                               \n      @@        @@                    *@@@***@@m            @@   \n     m@@m                               @@    @@            @@   \n    m@*@@!    *@@@  *@@@@@@@@m@@@@@m    @@    @@  m@@*@@m @@@@@@ \n   m@  *@@      @@    @@    @@    @@    @@***@mm @@*   *@@  @@   \n   @@@!@!@@     !@    !@    @@    @@    @!    *@ @@     @@  @@   \n  !*      @@    !@    !@    !@    @@    !!    m@ @@     !@  @!   \n   !!!!@!!@     !!    !!    !!    !!    !:    *! !@     !!  !!   \n  !*      !!    !!    :!    :!    !!    !:    !! !!!   !!!  !!   \n: : :   : ::: : : : : :!:  :::   ::!: : !: : : :  : : : :   ::: :")
rconsoleprint("\nCoded By YoinkedYoink#4488\n")
rconsoleprint("Github: https://github.com/YoinkedYoink?tab=repositories")

local CurCamV = game:GetService("Workspace").CurrentCamera.ViewportSize
local Workspace = game:GetService("Workspace")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

if getgenv().FOVCircle and getgenv().StewartLittle ~= false then
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

function CastRayToPlayers()
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
end

function shoot()
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

while getgenv().StewartLittle do
    if UIS:IsKeyDown(Enum.KeyCode[getgenv().TriggerKey]) then
        CastRayToPlayers()
        if getgenv().Lookie ~= nil then
            mousemoverel( ((getgenv().hiya.X) - CurCamV.X/2)/getgenv().Sensitivity, ((getgenv().hiya.Y) - CurCamV.Y/2)/getgenv().Sensitivity )
            if getgenv().autoshoot then
                shoot()
            end
            getgenv().Lookie = nil
            getgenv().hiya = nil
            getgenv().mag = nil
        end
    end
    task.wait()
end