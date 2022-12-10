--Coded By YoinkedYoink#4488
--Using TwinkUI lib from https://github.com/bloodball/UI-Librarys/blob/main/TwinkLib
--new anticheat update
--more active anticheat dev, yname left
--niceeeeeeeee
local Player = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
rconsolename("For Debug")

--Presetting Values :)
_G.CFrameFlySpeed = 1
_G.CFrameFlyHeight = -340
FOV = 90
HipHeight = 0


--The Actual UI and code
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()

local MainUI = UILibrary.Load("Airsoft Center")
local FirstPage = MainUI.AddPage("Main")

local FirstLabel = FirstPage.AddLabel("Made By YoinkedYoink#4488 using TwinkUI lib")

local GithubLink = FirstPage.AddButton("Github link to clipboard", function()
    setclipboard("https://github.com/YoinkedYoink/Roblox-Scripts")
end)

local ClearConsoleButton = FirstPage.AddButton("ClearConsole", function()
    rconsoleclear()
end)



local SecondPage = MainUI.AddPage("Movement")

local BetterMovement = SecondPage.AddButton("No Jump Delay", function()
    OldJumpDelay = Player.Character["Jump Delay"]
    OldJumpDelay.Disabled = true
end)

local GlitchySpeed = SecondPage.AddToggle("Glitchy Speed", false, function(Value)
    _G.GlitchySpeedToggle = Value
    loadstring(game:HttpGet"https://pastebin.com/raw/SiRfjCAi")()
    while _G.GlitchySpeedToggle do
        Player.Character.HumanoidRootPart.Anchored = true
        wait()
    end
end)

local CFrameFlySpeed = SecondPage.AddSlider("CFrame Fly Speed(Reccommed 1)", {Min = 1, Max = 20, Def = 1}, function(Value)
     _G.CFrameFlySpeed = Value
end)

local CFrameFlyHeight = SecondPage.AddSlider("CFrame Fly Height(Reccommed -340 to -200)", {Min = -350, Max = 999, Def = -340}, function(Value)
    _G.CFrameFlyHeight = Value
end)

local CFrameFly = SecondPage.AddToggle("CFrameFly", false, function(Value)
    _G.CFrameFly = Value
    loadstring(game:HttpGet"https://pastebin.com/raw/deJdYep7")()
end)







local ThirdPage = MainUI.AddPage("Visuals")

local FOVSlider = ThirdPage.AddSlider("FOV(patched)", {Min = 1, Max = 120, Def = 90}, function(Value)
    FOV = Value
    rconsoleprint("FOV Value is "..FOV)
    rconsoleprint("\n")
end)

local FOVButton = ThirdPage.AddToggle("Set FOV(patched)", false, function(Value)
    _G.FOVSet = Value
    rconsoleprint("Set FOV to "..FOV)
    rconsoleprint("\n")
    while _G.FOVSet do
        Workspace.Camera.FieldOfView = FOV
        wait()
    end
end)

local ShitEsp = ThirdPage.AddToggle("Highlight ESP", false, function(Value)
    getgenv().enabled = Value
    getgenv().uselocalplayer = false
    getgenv().filluseteamcolor = true
    getgenv().outlineuseteamcolor = true
    getgenv().fillcolor = Color3.new(0, 0, 0)
    getgenv().outlinecolor = Color3.new(1, 1, 1)
    getgenv().filltrans = 0.7
    getgenv().outlinetrans = 0.2

    loadstring(game:HttpGet("https://pastebin.com/raw/REjmVt0E"))()
end)


local FourthPage = MainUI.AddPage("GunMods")

local FireRateSlider = FourthPage.AddSlider("FireRate(Rounds Per Min)", {Min = 1, Max = 2000, Def = 600}, function(Value)
    _G.FireRate = Value
end)

local FireRateSet = FourthPage.AddToggle("Set FireRate", false, function(Value)
    _G.FireRateSet = Value
    while _G.FireRateSet do
        Player.Character.ChildAdded:Connect(function(NewChild)
            if NewChild:IsA("Tool") then
                require(Player.Character[NewChild.Name].GunConfig).RoundsPerMinute = _G.FireRate
                wait()
            end
        end)
        wait()
    end
end)

local INFAmmo = FourthPage.AddToggle("Inf Ammo", false, function(Value)
    _G.InfAmmo = Value
    while _G.InfAmmo do
        Player.Character.ChildAdded:Connect(function(NewChild)
            if NewChild:IsA("Tool") then
                SetAmmo = require(Player.Character[NewChild.Name].GunConfig).Ammo
                if SetAmmo <= 0 then
                    SetAmmo = 20
                end
                while Player.Character:FindFirstChild(NewChild.Name) and _G.InfAmmo do
                    require(Player.Character[NewChild.Name].GunConfig).Ammo = SetAmmo
                    wait(0.1)
                end
            end
        end)
        wait()
    end
end)

local FullAuto = FourthPage.AddToggle("Full Auto", false, function(Value)
    _G.FullAuto = Value
    while _G.FullAuto do
        Player.Character.ChildAdded:Connect(function(NewChild)
            if NewChild:IsA("Tool") then
                require(Player.Character[NewChild.Name].GunConfig).GunType = "Auto"
                require(Player.Character[NewChild.Name].GunConfig).FireModes = { "Semi", "Auto" }
                wait()
            end
        end)
        wait()
    end
end)

local DisableTracer = FourthPage.AddToggle("Disable Tracer", false, function(Value)
    _G.DisableTracer = Value
    while _G.DisableTracer do
        Player.Character.ChildAdded:Connect(function(NewChild)
            if NewChild:IsA("Tool") then
                require(Player.Character[NewChild.Name].GunConfig).TrailTransparency = 1
                require(Player.Character[NewChild.Name].GunConfig).TrailDecayTime = 1
                wait()
            end
        end)
        wait()
    end
end)

local RemoveSway = FourthPage.AddToggle("Better Weapon", false, function(Value)
    _G.BetterWeapon = Value
    while _G.BetterWeapon do
        Player.Character.ChildAdded:Connect(function(NewChild)
            if NewChild:IsA("Tool") then
                require(Player.Character[NewChild.Name].GunConfig).Spread = 0
                require(Player.Character[NewChild.Name].GunConfig).AimSpeed = 1
                require(Player.Character[NewChild.Name].GunConfig).AimFov = 90
                require(Player.Character[NewChild.Name].GunConfig).MaxRange = 500
                require(Player.Character[NewChild.Name].GunConfig).TransitionSpeed = 1
                require(Player.Character[NewChild.Name].GunConfig).Damage = 2000
                require(Player.Character[NewChild.Name].GunConfig).LimbDamage = {200, 200}
                require(Player.Character[NewChild.Name].GunConfig).TorsoDamage = {200, 200}
                require(Player.Character[NewChild.Name].GunConfig).DamageDropoff = 0
                require(Player.Character[NewChild.Name].GunConfig).WalkSway = 0
                require(Player.Character[NewChild.Name].GunConfig).AimSway = 0
                require(Player.Character[NewChild.Name].GunConfig).RotateSway = 0
                
                wait(2)
            end
        end)
    wait(0.5)
    end
end)

--local InfoRemoveSway = FourthPage.AddLabel("Hold Weapon while removing sway")




local FithPage = MainUI.AddPage("Scripts")

local AimLock = FithPage.AddButton("AimLock", function()
    rconsoleprint("Started Aimlock")
    rconsoleprint("\n")
    loadstring(game:HttpGet"https://raw.githubusercontent.com/Wheeleee/AIMWARE/main/Startup")()
end)

local SilentAim = FithPage.AddButton("Silent Aim", function()
    rconsoleprint("Started Silent Aim")
    rconsoleprint("\n")
    loadstring(game:HttpGet"https://pastebin.com/raw/KQfLkckX")()
end)
local InfoSilentAim = FithPage.AddLabel("Use FindPartOnRayWithIgnorelist on SilentAim")

local InfYeild = FithPage.AddButton("Infinite Yeild", function()
    rconsoleprint("Started InfYeild")
    rconsoleprint("\n")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)






local SixthPage = MainUI.AddPage("Old stuff")

local HipHeightSlider = SixthPage.AddSlider("Hip Height(patched for now)", {Min = 0, Max = 50, Def = 0}, function(Value)
    HipHeight = Value
    rconsoleprint(HipHeight.." Slider HipHeight")
    rconsoleprint("\n")
end)

local HipHeightButton = SixthPage.AddButton("Set Hip Height(patched for now)", function()
    rconsoleprint(HipHeight.." Set HipHeight")
    rconsoleprint("\n")
    Player.Character.Humanoid.HipHeight = HipHeight
end)

-- local DarkDex = FithPage.AddButton("DarkDex", function()
--     rconsoleprint("Started DarkDex")
--     rconsoleprint("\n")
--     loadstring(game:HttpGet"https://pastebin.com/raw/qXT5FRwX")()
-- end)

local SeventhPage = MainUI.AddPage("Testing")

local AntiAim = SeventhPage.AddToggle("AntiAim", false, function(Value)
    _G.AntiAim = Value
    while _G.AntiAim do
        wait()
    end
end)

local HahaFunny = SeventhPage.AddToggle("Do a funny", false, function(Value)
    _G.Funny = Value
    while _G.Funny do
        Player.Character["ONYX Client"].Lean.Value = 1
        wait()
        Player.Character["ONYX Client"].Lean.Value = -1
        wait()
    end
end)

local ONYXDISABLER = SeventhPage.AddButton("ONYX Disabler(patched)", function()
    loadstring(game:HttpGet"https://pastebin.com/64K0qYfG")()
    rconsolewarn("Disabler Used!")
end)

local ServerLagger = SeventhPage.AddToggle("Increase receving and ping a bit(AK47)", false, function(Value)
    _G.Lag = Value
    while _G.Lag do
        userdata_1 = game:GetService("ReplicatedStorage").ONYX.Guns.AK47;
        bool_1 = true;
        game:GetService("ReplicatedStorage").ONYX.Remotes.GunSetup:FireServer(userdata_1, bool_1);
        wait(0.01)
        userdata_1 = game:GetService("ReplicatedStorage").ONYX.Guns.AK47;
        bool_1 = false;
        game:GetService("ReplicatedStorage").ONYX.Remotes.GunSetup:FireServer(userdata_1, bool_1);
        wait()
    end
end)
