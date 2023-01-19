getgenv().StewartLittle = true --enable/disable script

--aimbot settings
getgenv().FOV = 90 --FOV of aimbot
--use X-Mouae thing to bind M4/M5 to keymul
getgenv().TriggerKey = "KeypadMultiply" --Key to enable aimbot, X, E, Q, F, etc...
getgenv().TeamCheck = true --Team check, self explanitory
getgenv().Hitpart = "Head" --Head,Torso,LowerTorso,HumanoidRootPart,LeftFoot,etc...

--extended settings
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
function CastRayToPlayers()
    for _,i in next, Players:GetPlayers() do
        BlackTable = {}
        raycwast = nil
        if i.Name ~= LocalPlayer.Name then
            if Workspace.MapFolder.Players:FindFirstChild(i.Name) then
                RaycastPR = RaycastParams.new()
                table.insert(BlackTable, LocalPlayer.Character)
                table.insert(BlackTable, Workspace.CurrentCamera)
                table.insert(BlackTable, Workspace.RaycastIgnore)
                RaycastPR.FilterDescendantsInstances = BlackTable
                RaycastPR.FilterType = Enum.RaycastFilterType.Blacklist
                if Workspace.MapFolder.Players[i.Name]:FindFirstChild("HumanoidRootPart") then
                    local ScreenP = Workspace.CurrentCamera:WorldToScreenPoint(Workspace.MapFolder.Players[i.Name].HumanoidRootPart.Position)
                    local cam = math.abs(getgenv().FOV/((Workspace.CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X))
                    if (ScreenP and ScreenP.Z > 0) and (Vector2.new(CurCamV.X/2,CurCamV.Y/2) - Vector2.new(ScreenP.X, ScreenP.Y)).Magnitude <= cam/2 then
                        if LocalPlayer.Character:FindFirstChild("Head") then
                            --------------
                            Diwection = CFrame.lookAt(LocalPlayer.Character.Head.Position, Workspace.MapFolder.Players[i.Name][getgenv().Hitpart].Position)
                            raycwast = Workspace:Raycast(LocalPlayer.Character.Head.Position, Diwection.lookVector*2000, RaycastPR)
                            if raycwast ~= nil then
                                if string.match(tostring(raycwast.Instance:GetFullName()), LocalPlayer.Name) == nil then
                                    if string.match(tostring(raycwast.Instance:GetFullName()), i.Name) ~= nil then
                                        rconsolewarn("Good Cast")
                                        if Workspace.MapFolder.Players[LocalPlayer.Name].Team.Value ~= Workspace.MapFolder.Players[i.Name].Team.Value and getgenv().TeamCheck then
                                            rconsolewarn("Changing Aim")
                                            getgenv().Lookie = Diwection
                                            break;
                                        elseif not getgenv().TeamCheck then
                                            rconsolewarn("Changing Aim")
                                            getgenv().Lookie = Diwection
                                            break;
                                        else
                                            rconsolewarn("Hit Teamate")
                                        end
                                    else
                                        rconsolewarn("Hit Not Player")
                                    end
                                else
                                    rconsolewarn("Hit Self")
                                end
                            else
                                rconsolewarn("raycast = ".. tostring(raycwast))
                            end
                        end
                    end
                end
            end
        end
    end
end

function shoot()
    mouse1press()
    rconsolewarn("Mouse Down")
    task.wait()
    mouse1release()
    rconsolewarn("Mouse Up")
end

while getgenv().StewartLittle do
    if UIS:IsKeyDown(Enum.KeyCode[getgenv().TriggerKey]) and Workspace.MapFolder.Players:FindFirstChild(LocalPlayer.Name) then
        CastRayToPlayers()
        if getgenv().Lookie ~= nil then
            Replicio = Workspace.CurrentCamera.CFrame
            Workspace.CurrentCamera.CFrame = getgenv().Lookie
            if getgenv().autoshoot then
                shoot()
            end
            Workspace.CurrentCamera.CFrame = Replicio
            getgenv().Lookie = nil
        end
    end
    task.wait()
end