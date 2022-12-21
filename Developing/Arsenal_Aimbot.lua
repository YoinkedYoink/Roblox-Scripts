getgenv().StewartLittle = true --enable/disable script

--aimbot settings
getgenv().FOV = 15 --FOV of aimbot
getgenv().TriggerKey = "Z" --Key to enable aimbot, X, E, Q, F, etc...
getgenv().TeamCheck = true --Team check, self explanitory
getgenv().Hitpart = "Hitbox" --HeadHB or Hitbox

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
        raycwast = nil
        if i.Name ~= LocalPlayer.Name then
            if Workspace:FindFirstChild(i.Name) then
                if Workspace[i.Name]:FindFirstChild("HeadHB") and Workspace[i.Name]:FindFirstChild("Spawned") and Workspace[i.Name]:FindFirstChild("Hitbox") then
                    local ScreenP = Workspace.CurrentCamera:WorldToScreenPoint(Workspace[i.Name].Hitbox.Position)
                    local cam = math.abs(getgenv().FOV/((Workspace.CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X))
                    if (ScreenP and ScreenP.Z > 0) and (Vector2.new(CurCamV.X/2,CurCamV.Y/2) - Vector2.new(ScreenP.X, ScreenP.Y)).Magnitude <= cam/2 then
                        if LocalPlayer.Character:FindFirstChild("FakeHead") then
                            Diwection = CFrame.lookAt(LocalPlayer.Character.FakeHead.Position, i.Character[getgenv().Hitpart].Position)
                            raycwast = Workspace:Raycast(LocalPlayer.Character.FakeHead.Position, Diwection.lookVector*2000)
                            if raycwast ~= nil then
                                if string.match(tostring(raycwast.Instance:GetFullName()), LocalPlayer.Name) == nil then
                                    if string.match(tostring(raycwast.Instance:GetFullName()), i.Name) ~= nil then
                                        rconsolewarn("Good Cast")
                                        if LocalPlayer.Team ~= Players[i.Name].Team and getgenv().TeamCheck then
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
    if UIS:IsKeyDown(Enum.KeyCode[getgenv().TriggerKey]) then
        CastRayToPlayers()
        if getgenv().Lookie ~= nil then
            Workspace.CurrentCamera.CFrame = getgenv().Lookie
            if getgenv().autoshoot then
                shoot()
            end
            getgenv().Lookie = nil
        end
        task.wait()
    end
    task.wait()
end