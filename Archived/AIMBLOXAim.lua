getgenv().StewartLittle = true --enable/disable script

--aimbot settings
getgenv().FOV = 30 --FOV of aimbot
--use X-Mouae thing to bind M4/M5 to keymul
getgenv().TriggerKey = "KeypadMultiply" --Key to enable aimbot, X, E, Q, F, etc...
getgenv().Hitpart = "Head" --Head,Torso,LowerTorso,HumanoidRootPart,LeftFoot,etc...
getgenv().Sensitivity = 5 --How much it moves mouse, 1 = instant snap

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
                            --------------
                            Diwection = CFrame.lookAt(LocalPlayer.Character.Head.Position, Workspace[i.Name][getgenv().Hitpart].Position)
                            raycwast = Workspace:Raycast(LocalPlayer.Character.Head.Position, Diwection.lookVector*2000, RaycastPR)
                            if raycwast ~= nil then
                                if string.match(tostring(raycwast.Instance:GetFullName()), LocalPlayer.Name) == nil then
                                    if string.match(tostring(raycwast.Instance:GetFullName()), i.Name) ~= nil then
                                        rconsolewarn("Good Cast")
                                        --if Workspace[LocalPlayer.Name].Team.Value ~= Workspace[i.Name].Team.Value and getgenv().TeamCheck then
                                            rconsolewarn("Changing Aim")
                                            getgenv().Lookie = Diwection
                                            --break;
                                        --elseif not getgenv().TeamCheck then
                                            rconsolewarn("Changing Aim")
                                            getgenv().hiya = ScreenP
                                            getgenv().Lookie = Diwection
                                            break;
                                        --else
                                            --rconsolewarn("Hit Teamate")
                                        --end
                                    else
                                        rconsolewarn("Hit Not Player".. tostring(raycwast))
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
    end
end

function shoot()
    if game:GetService("Players").LocalPlayer.PlayerGui.Crosshair.Crosshair.TopFrame.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
    mouse1press()
    --rconsolewarn("Mouse Down")
    task.wait()
    mouse1release()
    --rconsolewarn("Mouse Up")
    end
end

while getgenv().StewartLittle do
    if UIS:IsKeyDown(Enum.KeyCode[getgenv().TriggerKey]) and Workspace:FindFirstChild(LocalPlayer.Name) then
        CastRayToPlayers()
        if getgenv().Lookie ~= nil then
            mousemoverel( ((getgenv().hiya.X) - CurCamV.X/2)/getgenv().Sensitivity, ((getgenv().hiya.Y) - CurCamV.Y/2)/getgenv().Sensitivity )
            --rconsolewarn(tostring(((CurCamV.X/2) - getgenv().hiya.X)).. "  ".. ((CurCamV.Y/2) - getgenv().hiya.Y))
            if getgenv().autoshoot then
                shoot()
            end
            --Workspace.CurrentCamera.Fists.Camera.CFrame = Replicio
            --wait(0.5)
            getgenv().Lookie = nil
        end
    end
    task.wait()
end
