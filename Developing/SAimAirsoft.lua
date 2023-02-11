--Airsoft Centre Silent Aim
getgenv().StewartLittle = true --enable/disable script
--aimbot settings
getgenv().FOVCheck = false --Check if target is in FOV
getgenv().FOV = 180 --FOV of aimbot
--use X-Mouse thing to bind M4/M5 to keymul for nice keybind
getgenv().TriggerKey = "KeypadMultiply" --Key to enable aimbot, X, E, Q, F, etc...
getgenv().TeamCheck = true --Team check, self explanitory
getgenv().Hitpart = "HumanoidRootPart" --Head,Torso,LowerTorso,HumanoidRootPart,LeftFoot,etc...

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

loadstring(game:HttpGet("https://pastebin.com/raw/MJQgQkka"))()

--Raycast to player and set getgenv().Lookie to the direction if yes
function CastRayToPlayers()
    for _,i in next, Players:GetPlayers() do
        raycwast = nil
        if i.Name ~= LocalPlayer.Name then
            if Workspace:FindFirstChild(i.Name) then
                if Workspace[i.Name]:FindFirstChild("HumanoidRootPart") then
                    if not Workspace[i.Name]:FindFirstChild("ForceField") then
                    local ScreenP = Workspace.CurrentCamera:WorldToScreenPoint(Workspace[i.Name].HumanoidRootPart.Position)
                    local cam = math.abs(getgenv().FOV/((Workspace.CurrentCamera.FieldOfView*(CurCamV.X/CurCamV.Y))/CurCamV.X))
                    if ((ScreenP and ScreenP.Z > 0) and (Vector2.new(CurCamV.X/2,CurCamV.Y/2) - Vector2.new(ScreenP.X, ScreenP.Y)).Magnitude <= cam/2) or getgenv().FOVCheck == false then
                        if Workspace.Camera:FindFirstChild("ViewModel") then
                            for f,b in pairs(Workspace.Camera.ViewModel:GetChildren()) do
                                if b:IsA("Model") then
                                    ToolName = b.Name
                                end
                            end
                            if ToolName == nil then
                                rconsolewarn("No Tool Found")
                                break;
                            end
                            RaycastPR = RaycastParams.new()
                            RaycastPR.FilterDescendantsInstances = {LocalPlayer.Character, Workspace.Camera}
                            RaycastPR.FilterType = Enum.RaycastFilterType.Blacklist
                            Diwection = CFrame.lookAt(game:GetService("Workspace").Camera.ViewModel[ToolName].FirePart.Position, i.Character[getgenv().Hitpart].Position)
                            raycwast = Workspace:Raycast(game:GetService("Workspace").Camera.ViewModel[ToolName].FirePart.Position, Diwection.lookVector*2000, RaycastPR)
                            if raycwast ~= nil then
                                if string.match(tostring(raycwast.Instance:GetFullName()), LocalPlayer.Name) == nil then
                                    if string.match(tostring(raycwast.Instance:GetFullName()), i.Name) ~= nil or string.match(tostring(raycwast.Instance:GetFullName()), "Ray_Ignore") then
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
                                    rconsolewarn("Self = ".. tostring(raycwast.Instance:GetFullName()))
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
        ToolName = nil
    end
end

--Shoot if you enabled it
function shoot()
    mouse1press()
    task.wait()
    mouse1release()
end

--Check if triggerkey is down, if yes then run raycast check function
while getgenv().StewartLittle do
    LocalPlayer.Character.ChildAdded:Connect(function(NewChild)
        if NewChild:IsA("Tool") then
            require(LocalPlayer.Character[NewChild.Name].GunConfig).GunType = "Auto"
            require(LocalPlayer.Character[NewChild.Name].GunConfig).AimFOV = 85
            require(LocalPlayer.Character[NewChild.Name].GunConfig).Spread = 0
            --require(LocalPlayer.Character[NewChild.Name].GunConfig).PelletsPerShot = 4
            require(LocalPlayer.Character[NewChild.Name].GunConfig).WalkSway = 0
            require(LocalPlayer.Character[NewChild.Name].GunConfig).AimSway = 0
            require(LocalPlayer.Character[NewChild.Name].GunConfig).RotateSway = 0
            require(LocalPlayer.Character[NewChild.Name].GunConfig).ModelScale = 1.2
            require(LocalPlayer.Character[NewChild.Name].GunConfig).ShotPitch = 0
            require(LocalPlayer.Character[NewChild.Name].GunConfig).Ammo = 9999e9999
            require(LocalPlayer.Character[NewChild.Name].GunConfig).TracerSpeed = 20000
            --require(LocalPlayer.Character[NewChild.Name].GunConfig).TrailColor = Color3.new(255, 0, 191)
            require(LocalPlayer.Character[NewChild.Name].GunConfig).TrailDecayTime = math.huge
            require(LocalPlayer.Character[NewChild.Name].GunConfig).FireModes = { "Semi", "Auto" }
            wait()
        end
    end)
    if UIS:IsKeyDown(Enum.KeyCode[getgenv().TriggerKey]) and Workspace:FindFirstChild(LocalPlayer.Name) then
        CastRayToPlayers()
        --If the raycast check function returns something then aim and maybe fire
        if getgenv().Lookie ~= nil then
            local j, k, l = Diwection:toEulerAnglesXYZ()
            Workspace.CurrentCamera.ViewModel[ToolName].FirePart.Rotation = Vector3.new(math.deg(j), math.deg(k), math.deg(l))
            if getgenv().autoshoot then
                shoot()
            end
            getgenv().Lookie = nil
        end
    end
    task.wait()
end
