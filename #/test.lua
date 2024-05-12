pcall(function()
-- Variables --
local plr = game.Players.LocalPlayer
local Players =  game:GetService('Players')
local Player = game.Players.LocalPlayer
local PlayerChar = Player.Character
local PlayerRoot = PlayerChar.HumanoidRootPart
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
-- Functions --
function AntiAFK()
    pcall(function()
        local bb = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            bb:CaptureController()
            bb:ClickButton2(Vector2.new())
            print("Roblox tried kicking you, but I didn't let them!")
            wait(2)
            print("Status: Active")
        end)
    end)
end
AntiAFK()
function AntiDetect()
    pcall(function()
        game:GetService("StarterPlayer").StarterPlayerScripts.FROSTHUB_DETECTION.Disabled = true
        plr.PlayerScripts.FROSTHUB_DETECTION.Disabled = true
    end)
end
AntiDetect()

local function NoClip()
    pcall(function()
        task.wait()
        for _, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = not v.CanCollide
            end
        end
    end)
end
local function SpeedBypass()
    pcall(function()
    local ohString1 = "Sky Walk2"
    local ohTable2 = {
        ["char"] = workspace.PlayerCharacters[Player.Name],
        ["cf"] = workspace.PlayerCharacters[Player.Name].HumanoidRootPart.CFrame
    }
    
    ReplicatedStorage.Events.Skill:InvokeServer(ohString1, ohTable2)            
    task.wait(1)
end)
end
    local tween = false
    local function TweenToPosition(cframe)
        pcall(function()
            local clienthrp = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tweenInfo = TweenInfo.new(getgenv().flash / 50, Enum.EasingStyle.Linear)
            tween = game:GetService("TweenService"):Create(clienthrp, tweenInfo, {CFrame = cframe})
            tween:Play()
            tween.Completed:Wait()
        end)
    end
    
    local function StartQuest()
        local player = game.Players.LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local currentQuest = ReplicatedStorage["Stats" .. player.Name].Quest.CurrentQuest
        

    end
    
    local function checkQuest()
        pcall(function()     
            local player = game.Players.LocalPlayer
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local currentQuest = ReplicatedStorage["Stats" .. player.Name].Quest.CurrentQuest
    
            if currentQuest.Value == "None" then
                TweenToPosition(CFrame.new(7734.93408, -2176.13208, -17223.0176, 0.923110306, -3.56883483e-08, 0.384535313, 5.10794926e-08, 1, -2.98117122e-08, -0.384535313, 4.71613646e-08, 0.923110306))
                StartQuest()
            else
                TweenToPosition(CFrame.new(7871.11621, -2107.71704, -17114.0957, 0.784938097, -4.87679319e-09, 0.619574189, -7.61081065e-09, 1, 1.7513333e-08, -0.619574189, -1.84623445e-08, 0.784938097))
            end
        end)
    end
local Value = nil
local function Game()
    pcall(function()
        if game.PlaceId == 3978370137 then
            Value = " | First Sea"
        elseif game.PlaceId == 234924922 then
            Value = " | Second Sea"
        end
    end)
end
Game()
-- UI Library
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({
    Title = 'Vortex | Grand Piece Online' .. (Value or ""),
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})
local Tabs = {
    Main = Window:AddTab('Main'),
    Fruit = Window:AddTab('Fruit Stacks'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
-- UI Constants
local Workspace = game:GetService("Workspace")
local Farming = Tabs.Main:AddLeftGroupbox('Autofarm')
local Teleports = Tabs.Main:AddRightGroupbox('Teleports')
local ClientStatus = Tabs.Main:AddRightGroupbox('Client')
local Farm1 = Tabs.Main:AddLeftGroupbox('Factory Farm')
Farm1:AddLabel('Updating Soon! V1.0')
local SunaSuna = Tabs.Fruit:AddRightGroupbox('Suna-Suna')
local GomuGomu = Tabs.Fruit:AddLeftGroupbox('Gomu-Gomu')
local MeraMera = Tabs.Fruit:AddRightGroupbox('Mera-Mera')
local PikaPika = Tabs.Fruit:AddLeftGroupbox('Pika-Pika')
local PawPaw = Tabs.Fruit:AddRightGroupbox('Paw-Paw')
local YukiYuki = Tabs.Fruit:AddLeftGroupbox('Yuki-Yuki')
local HieHie = Tabs.Fruit:AddRightGroupbox('Hie-Hie')
local OpeOpe = Tabs.Fruit:AddLeftGroupbox('Ope-Ope')
local GuraGura = Tabs.Fruit:AddLeftGroupbox('Gura-Gura')  
local MaguMagu = Tabs.Fruit:AddLeftGroupbox('Magu-Magu')  
local Miscs = Tabs.Main:AddLeftGroupbox('Misc')

--MISC
Miscs:AddToggle('Noclip', {
    Text = 'Noclip',
    Callback = function(ToggleState)
        local NoclipEnabled = ToggleState
        while NoclipEnabled do
            NoClip()
            task.wait()
        end
        for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and not part.CanCollide then
                part.CanCollide = true
            end
        end
    end
})
Miscs:AddToggle('MyToggle', {
    Text = 'AntiFall',
    Callback = function(ToggleState)
        if ToggleState then
            antifall = Instance.new("BodyVelocity", PlayerRoot)
            antifall.Velocity = Vector3.new(0, 0, 0)
        else
            if antifall then
                antifall:Destroy()
                antifall = nil
            end
        end
end})
Miscs:AddToggle('MyToggle', {
    Text = 'Unlock Geppo',
    Callback = function(isEnabled)
        pcall(function()
            local stats = ReplicatedStorage["Stats"..Player.Name].Skills
            stats.skyWalk.Value = isEnabled
        end)
    end
})

Miscs:AddToggle('MyToggle', {
    Text = 'Speed Bypass',
    Default = false,
    Tooltip = '',

    Callback = function(ToggleState)
        pcall(function()
            local SpeedBypass = nil
            SpeedBypass = ToggleState
            while SpeedBypass do
                SpeedBypass()
                task.wait()
            end
        end)
    end})
    Miscs:AddToggle('MyToggle', {
        Text = 'Teleport Bypass',
        Tooltip = 'this drains stamina so this is pretty terrible', 
        Callback = function(Value)
            getgenv().LOL = Value
        if getgenv().LOL == true then
            local function Bypass()
                pcall(function()
                while wait() do
          local args = {
              [1] = 0.5,
              [2] = "dash"
          }
          ReplicatedStorage.Events.takestam:FireServer(unpack(args))
                end
            end)
          end
          coroutine.resume(coroutine.create(Bypass))
          end
        end
    })
    local MyButton = Miscs:AddButton({
        Text = "Server Hop (Lowest Player)",
        Func = function()
            pcall(function()
                local Lowest = "playing"
                local HTTPService = game:GetService("HttpService")
                local success, servers = pcall(function()
                    return HTTPService:JSONDecode(game:HttpGet(
                    "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?limit=100")).data
                end)
                if not success then return end
                local server = servers[1]
    
                for i,svr in pairs(servers) do
                    if svr[Lowest] < server[Lowest] then
                        server = svr
                    end
                end
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
            end)
        end
    })
    local MyButton = Miscs:AddButton({
        Text = "Hitbox Extender",
        Func = function()
            pcall(function()
                while true do
                    for i, v in next, game:GetService('Players'):GetPlayers() do
                        if v.Name ~= Players.LocalPlayer.Name then
                            pcall(function()
                                v.Character.HumanoidRootPart.Size = Vector3.new(30, 35, 30)
                                v.Character.HumanoidRootPart.CanCollide = false
                                v.Character.HumanoidRootPart.Transparency = 0.5
                            end)
                        end
                    end
                    wait(1)
                end
            end)
        end
    })
    local MyButton = Miscs:AddButton({
        Text = "Invisible Hitbox Extender",
        Func = function()
            pcall(function()
                while true do
                    for i,v in next, game:GetService('Players'):GetPlayers() do
                        if v.Name ~= Players.LocalPlayer.Name then
                            pcall(function()
                                v.Character.HumanoidRootPart.Size = Vector3.new(30,35,30)
                                v.Character.HumanoidRootPart.CanCollide = false
                                v.Character.HumanoidRootPart.Transparency = 1
                            end)
                        end
                    end
                    wait(1)
                end
            end)
        end,
    })
    local Sea1 = {
        ["Town of Beginnings"] = CFrame.new(965.146, 10, 1195.127),
        ["Marine Fort F-1"] = CFrame.new(2904.113, 25, -994.2),
        ["Sandora"] = CFrame.new(-1316.089, 15, 1129.95),
        ["Shell's Town"] = CFrame.new(-605.248, 15, -4430.41),
        ["Zou"] = CFrame.new(-4458.681, 10, -2502.741),
        ["Restaurant Baratie"] = CFrame.new(-3909.713, 55, -5569.912),
        ["Orange Town"] = CFrame.new(-6999.987, 10, -5345.705),
        ["Mysterious Cliff"] = CFrame.new(2180.005, 415, -8628.285),
        ["Roca Island"] = CFrame.new(5426.218, 20, -4918.854),
        ["Colosseum"] = CFrame.new(-2019.975, 10, -7661.091),
        ["Sphinx Island"] = CFrame.new(-6327.812, 45, -10129.278),
        ["Kori Island"] = CFrame.new(-6684.44, 10, 1828.623),
        ["Arlong Park"] = CFrame.new(652.855, 15, -13122.346),
        ["Land of the Sky"] = CFrame.new(9016.793, 1440, -10542.829),
        ["Knock-Up Stream Rock"] = CFrame.new(8116, 10, -9819),
        ["Gravito's Fort"] = CFrame.new(2611.159, 15, -15359.032),
        ["Fishman Cave"] = CFrame.new(5682.19, 5, -16458.479),
        ["Fishman Island"] = CFrame.new(8003.553, -2150, -17056.971),
        ["Marine Base G-1"] = CFrame.new(-9955.175, 70, -14910.613),
        ["Coco Island"] = CFrame.new(-4262.249, 10, -15531.864),
        ["Reverse Mountain"] = CFrame.new(-14338, 20, -9446),
        ["Shrine"] = CFrame.new(-12184.12890625, 3.2737002372742, -18545.69921875)
    }
    local EnabledToggle = nil
    local SelectedLocation = ""
    
    Teleports:AddToggle('MyToggle', {
        Text = 'Activate Tween',
        Callback = function(value)
            EnabledToggle = value
        end
    })
    
    local DropdownValues = {}
    for LocationName, _ in pairs(Sea1) do
        table.insert(DropdownValues, LocationName)
    end
    
    Teleports:AddDropdown('MyDropdown', {
        Values = DropdownValues,
        Default = 1,
        Multi = false,
        Text = 'Select Location',
        Tooltip = 'Choose a location to tween to',
        Callback = function(value)
            SelectedLocation = value
        end
    })
    
    local function StartFucking()
        local locationCFrame = Sea1[SelectedLocation]
        pcall(function()
            if locationCFrame then
                game:GetService("TweenService"):Create(
                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                    TweenInfo.new((locationCFrame.p - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p).Magnitude / getgenv().flash, Enum.EasingStyle.Linear),
                    {CFrame = locationCFrame}
                ):Play()
            end
        end)
    end
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if EnabledToggle and SelectedLocation ~= "" then
            StartFucking()
        end
    end)
    -- Farming
    local TP2FC = Farming:AddButton({
        Text = 'Teleport to Fishman Cave',
        Func = function()
            pcall(function()
            PlayerRoot.CFrame = CFrame.new(5639.86865, -92.762001, -16611.4688)
            end)
        end,
    })
    Farming:AddToggle('MyToggle', {
        Text = 'Teleport 2 Position',
        Default = false,
        Tooltip = 'Do this in fishman',
        
        Callback = function(Value)
            getgenv().LOLL = Value
                if getgenv().LOLL == true then
                    local Tween2Pos = CFrame.new(7871.11621, -2107.71704, -17114.0957, 0.784938097, -4.87679319e-09, 0.619574189, -7.61081065e-09, 1, 1.7513333e-08, -0.619574189, -1.84623445e-08, 0.784938097)
                    local Time = getgenv().flash / 2.5
                    local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = Tween2Pos})
                    tween:Play()
                end

            wait(0.1)
        end
    })
    local stats = {
        ["Strength"] = "Strength",
        ["Stamina"] = "Stamina",
        ["Defense"] = "Defense",
        ["SwordMastery"] = "Sword",
        ["GunMastery"] = "Gun"
    }
    
    local AutoStatEnabled = false
    
    Farming:AddToggle('AutoStatsToggle', {
        Text = 'Auto Stats',
        Default = false,
        Tooltip = 'Automatically distribute all stat points to the selected stat',
    
        Callback = function(ToggleState)
            AutoStatEnabled = ToggleState
        end
    })
    
    Farming:AddDropdown('StatsDropdown', {
        Values = { 'Strength', 'Stamina', 'Defense', 'SwordMastery', 'GunMastery' },
        Default = 1, 
        Multi = false, 
    
        Text = 'Select Auto Stats',
        Tooltip = '', 
    
        Callback = function(Value)
            if AutoStatEnabled then
                local selectedStat = stats[Value]
                if selectedStat then
                    local skillPoints = game:GetService("ReplicatedStorage").Stats[Player.Name].Stats.SkillPoints.Value
                    local args = {
                        [1] = selectedStat,
                        [2] = nil,
                        [3] = skillPoints
                    }
                    game:GetService("ReplicatedStorage").Events.stats:FireServer(unpack(args))
                end
            end
        end
    })
    
    
    Farming:AddToggle('AutoFMQuest', {
        Text = 'Auto Fishman Quest',
        Callback = function(ToggleState)
            while ToggleState do
                checkQuest()
                task.wait(1)
            end
            if tween then
                tween:Cancel()
            end
        end
    })
    
    Farming:AddToggle('MyToggle', {
        Text = 'Rifle Farm',
        Default = false,
        Tooltip = '',
    
        Callback = function(a)
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            getgenv().autoFarm = a
            while getgenv().autoFarm do
                if getgenv().autoFarm then
                    pcall(function()
                        local character = game.Players.LocalPlayer.Character
                        local function getDistance(position1, position2)
                            return (position1 - position2).Magnitude
                        end
                        local function getNearestMob(characterPosition)
                            local nearestMob = nil
                            local nearestDistance = math.huge
            
                            for _, mob in ipairs(workspace.NPCs:GetChildren()) do
                                local mobHead = mob:FindFirstChild("Head")
                                local mobForceField = mob:FindFirstChild("ForceField")
            
                                if mobHead and not mobForceField then
                                    local distance = getDistance(characterPosition, mobHead.Position)
                                    if distance < nearestDistance then
                                        nearestMob = mobHead
                                        nearestDistance = distance
                                    end
                                end
                            end
            
                            return nearestMob
                        end
            
                        local nearestMob = getNearestMob(character.HumanoidRootPart.Position)
            
                        if nearestMob then
                            local args = {
                                [1] = "fire",
                                [2] = {
                                    ["Start"] = character.HumanoidRootPart.CFrame,
                                    ["Gun"] = "Rifle",
                                    ["joe"] = "true",
                                    ["Position"] = nearestMob.Position
                                }
                            }
            
                            pcall(function()
                                game:GetService("ReplicatedStorage").Events.CIcklcon:FireServer(unpack(args))
                            end)
            
                            local args2 = {
                                [1] = "reload",
                                [2] = {
                                    ["Gun"] = "Rifle"
                                }
                            }
            
                            pcall(function()
                                game:GetService("ReplicatedStorage").Events.CIcklcon.gunFunctions:InvokeServer(unpack(args2))
                            end)
                        end
                    end)
                end
            
                wait(0.1)
            end
        end})
        Farming:AddToggle('MyToggle', {
            Text = 'Peli Farm',
            Callback = function(Value)
                local Players = game:GetService("Players")
                local TweenService = game:GetService("TweenService")
                local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
                local plr = Players.LocalPlayer
                getgenv().chestFarmEnabled = Value
        
                function CollectChest(chest)
                    pcall(function()
                    for i, v in ipairs(game.workspace.Env:GetChildren()) do 
                        if v:FindFirstChild("ClickDetector") then 
                            if (v.Position - plr.Character.HumanoidRootPart.Position).Magnitude < 10 then 
                                fireclickdetector(v.ClickDetector, 2)
                            end
                        end
                    end
                end)
                end
        
                function GetNearestChest()
                    pcall(function()
                    local Chest
                    for i, v in ipairs(game.workspace.Env:GetChildren()) do
                        if character:FindFirstChild("HumanoidRootPart") and v.Name == "Chest" and v:IsA("Model") and v:FindFirstChild("MeshPart") then
                            if not Chest then
                                Chest = v
                            end
                            if (v.MeshPart.Position - character.HumanoidRootPart.Position).Magnitude < (Chest.MeshPart.Position - character.HumanoidRootPart.Position).Magnitude then
                                Chest = v
                            end
                        end
                    end
                    return Chest
                end)
                end
        
                function IsChestAlive(chest)
                    pcall(function()
                    if chest.Parent and chest:FindFirstChild("MeshPart") then
                        return true
                    end
                    return false
                end)
                end
        
                while getgenv().chestFarmEnabled do
                    pcall(function()
                        local env = game.Workspace.Env
                        local chests = {}
        
                        for _, child in ipairs(env:GetDescendants()) do
                            if child.Name == "Chest" and child:IsA("Model") then
                                local meshPart = child:FindFirstChildWhichIsA("MeshPart")
                                if meshPart then
                                    table.insert(chests, meshPart)
                                end
                            end
                        end
        
                        if #chests == 0 then
                            env.ChildAdded:Wait()
                        else
                            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                            local tweenSpeed = getgenv().flash
        
                            for _, chest in ipairs(chests) do
                                if not getgenv().chestFarmEnabled then
                                    return
                                end
        
                                local chestCenter = chest.Position
                                local distance = (chestCenter - humanoidRootPart.Position).Magnitude
                                local duration = distance / tweenSpeed
        
                                local teleportTween = TweenService:Create(
                                    humanoidRootPart,
                                    TweenInfo.new(duration, Enum.EasingStyle.Linear),
                                    {
                                        CFrame = CFrame.new(chestCenter)
                                    }
                                )
                                teleportTween:Play()
                                teleportTween.Completed:Wait()
        
                                CollectChest(chest)
        
                                wait(2)
                            end
        
                            wait(3.5)
                        end
                    end)
                end
            end
        })
        Farming:AddSlider("MySlider", {
            Text = "Tween Speed",
            Default = 125,
            Min = 10,
            Max = 225,
            Rounding = 0,
            Compact = false,
        
            Callback = function(Value)
                getgenv().flash = Value
            end
        })
        --CLIENT STATUS
        ClientStatus:AddLabel('Welcome to Vortex, ' ..Player.Name, true)
        ClientStatus:AddDivider()
        ClientStatus:AddInput('MyTextbox', {
            Default = 'Enter Webhook Here!',
            Numeric = false,
            Finished = false,
            Text = 'Webhook Notifier',
            Tooltip = '',
            Placeholder = '',
            Callback = function(Webhook)
                local playerName = game.Players.LocalPlayer.Name
        
                local function NotifyWebhook(webhookURL, playerName)
                    local HttpService = game:GetService("HttpService")
                    local embed = {
                        title = "Vortex | Client Webhook",
                        description = "",
                        fields = {
                            {name = "Username:", value = playerName},
                            {name = "**Notification**", value = playerName.." has reached level 575"}
                        }
                    }
                    
                    local player = game.Players:FindFirstChild(playerName)
                    if player then
                        local thumbnailUrl = "https://www.roblox.com/headshot-thumbnail/image?userId="..player.UserId.."&width=420&height=420&format=png"
                        embed.thumbnail = {url = thumbnailUrl}
                    end
                
                    local data = {
                        embeds = {embed}
                    }
                    local response = HttpService:PostAsync(webhookURL, HttpService:JSONEncode(data))
                    print("Webhook response:", response)
                end
                
                if game:GetService("ReplicatedStorage").Stats[playerName].Stats.Level.Value == 575 then
                    NotifyWebhook(Webhook, "Client "..playerName)
                end
            end
        })
        local function SunaStack()
            pcall(function() 
                local ohString1 = "Desert Spada"
                local ohTable2 = {
                    ["cf"] = CFrame.new()
                }
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
                end)
        end
        
        local SunaDesertStack = false
    
        SunaSuna:AddToggle('Suna Stack (Desert Spada)', {
            Text = 'Suna Stack (Desert Spada)',
            Callback = function(active)
            pcall(function()
            SunaDesertStack = active
            while SunaDesertStack do
                SunaStack()
                task.wait()
            end
            end)
            end})
    
            SunaSuna:AddLabel('Desert Spada Release'):AddKeyPicker('KeyPicker', {
            Default = 'G',
            SyncToggleState = false,
            Mode = 'Toggle',
            Text = 'Test',
            NoUI = false,
            Callback = function()
                pcall(function() 
                    local remotes = game:GetService("ReplicatedStorage").PlayerRemotes:GetChildren()
                    local playerName = game.Players.LocalPlayer.Name
                    local remoteName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Suna-Suna.Desert Spada"
                
                    for i, remote in ipairs(remotes) do
                        if remote.Name == remoteName then
                            pcall(function()
                                local args = {
                                    [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                }
                
                                remote:FireServer(unpack(args))
                            end)
                        end
                    end
                end)            
            end,
            ChangedCallback = function(New)
                print('Keybind changed!', New)
            end
        })
    
        local function GomuBloon()
            pcall(function()
            local ohString1 = "Gomu-Gomu no Balloon"
            local ohTable2 = {
                ["cf"] = CFrame.new()
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
            end)
            end
            local toggleActive = false
            GomuGomu:AddToggle('Gomu -50% Damage', {
                Text = 'Gomu -50% Damage',
                Callback = function(GomuBallon)
                        pcall(function()
                        toggleActive = GomuBallon
                        while toggleActive do
                        GomuBloon()
                        task.wait()
                    end
                end)
            end})
    
    
            local function GomuInsta()
                pcall(function()
                    local ohString1 = "Gomu-Gomu no Gatling"
                    local ohTable2 = {
                        ["cf"] = CFrame.new()
                    }
                    
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
            end)
        end
        
        GomuGomu:AddToggle('Gomu Auto Gatling (Instant Gatling)', {
            Text = 'Gomu Auto Gatling (Instant)',
            Callback = function(GomuGatling)
                    pcall(function()
                    toggleActive = GomuGatling
                    while toggleActive do
                    GomuInsta()
                    task.wait()
                end
            end)
        end})
        local function GomuPistolAim()
            pcall(function()
                local ohString1 = "Gomu-Gomu no Pistol"
                local player = game.Players.LocalPlayer
                local playerCharacter = game.Workspace.PlayerCharacters[player.Name]
                local humanoidRootPart = playerCharacter:WaitForChild("HumanoidRootPart")
                local function getDistance(point1, point2)
                    return (point1 - point2).Magnitude
                end
                local closestPlayer = nil
                local closestDistance = 125
                for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
                    if otherPlayer ~= player then
                        local otherCharacter = game.Workspace.PlayerCharacters[otherPlayer.Name]
                        local otherHumanoidRootPart = otherCharacter:FindFirstChild("HumanoidRootPart")
                        if otherHumanoidRootPart then
                            local distance = getDistance(humanoidRootPart.Position, otherHumanoidRootPart.Position)
                            if distance <= closestDistance then
                                closestPlayer = otherPlayer
                                closestDistance = distance
                            end
                        end
                    end
                end
                if closestPlayer then
                    local ohTable2 = {
                        ["targetCF"] = humanoidRootPart.CFrame,
                        ["armCF"] = humanoidRootPart.CFrame,
                        ["handCF"] = humanoidRootPart.CFrame,
                        ["target"] = game.Workspace.PlayerCharacters[closestPlayer.Name],
                        ["cf"] = humanoidRootPart.CFrame
                    }
            
                    game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
                end
            end)    
            end
    
            GomuGomu:AddToggle('Gomu Auto Attack Closest Player (Instant Pistol)', {
                Text = 'Gomu Auto Attack Closest Player (Instant Pistol)',
                Callback = function(GomuPistol)
                    pcall(function()
                toggleActive = GomuPistol
                while toggleActive do
                    GomuPistolAim()
                    task.wait()
                end
            end)
        end})
    
    
    local function MeraHikenS()
                    pcall(function()
                        local args = {
                            [1] = "Hiken"
                        }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        end)
    end
    local function GuraGuraS()
        pcall(function() 
            local ohString1 = "Shock Punch"
            local ohTable2 = {
                ["cf"] = CFrame.new()
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
            end)
    end
    GuraGura:AddToggle('GuraGuraShockPunch', {
        Text = 'Gura-Gura Shock Punch Stack',
        Callback = function(GuraGuraStack)
            pcall(function()
                toggleActive = GuraGuraStack
                while toggleActive do
                    GuraGuraS()
                    task.wait()
                end
            end)
        end})
        local function GuraGuraBCS()
            pcall(function() 
                local ohString1 = "Blast Clutcher"
                local ohTable2 = {
                    ["cf"] = CFrame.new()
                }
                game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
                end)
        end
        GuraGura:AddToggle('Gura-Gura Blast Clutcher', {
            Text = 'Gura-Gura Blast Clutcher Stack',
            Callback = function(GuraGuraStack)
                pcall(function()
                    toggleActive = GuraGuraStack
                    while toggleActive do
                        GuraGuraBCS()
                        task.wait()
                    end
                end)
            end})
            GuraGura:AddLabel('Shock Punch Release'):AddKeyPicker('KeyPicker', {
                Default = '',
                SyncToggleState = false,
                Mode = 'Toggle',
                Text = 'Test',
                NoUI = false,
                Callback = function()
                    pcall(function() 
                        local remotes = game:GetService("ReplicatedStorage").PlayerRemotes:GetChildren()
                        local playerName = game.Players.LocalPlayer.Name
                        local remoteName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Gura-Gura.Shock Punch"
                    
                        for i, remote in ipairs(remotes) do
                            if remote.Name == remoteName then
                                pcall(function()
                                    local args = {
                                        [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    }
                    
                                    remote:FireServer(unpack(args))
                                end)
                            end
                        end
                    end)            
                end,
                ChangedCallback = function(New)
                    print('Keybind changed!', New)
                end
            })
            GuraGura:AddLabel('Blast Clutcher Release'):AddKeyPicker('KeyPicker', {
                Default = '',
                SyncToggleState = false,
                Mode = 'Toggle',
                Text = 'Test',
                NoUI = false,
                Callback = function()
                    pcall(function() 
                        local remotes = game:GetService("ReplicatedStorage").PlayerRemotes:GetChildren()
                        local playerName = game.Players.LocalPlayer.Name
                        local remoteName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Gura-Gura.Blast Clutcher"
                    
                        for i, remote in ipairs(remotes) do
                            if remote.Name == remoteName then
                                pcall(function()
                                    local args = {
                                        [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    }
                    
                                    remote:FireServer(unpack(args))
                                end)
                            end
                        end
                    end)            
                end,
                ChangedCallback = function(New)
                    print('Keybind changed!', New)
                end
            })
    MeraMera:AddToggle('Mera Hiken Stack', {
                    Text = 'Mera Hiken Stack',
                    Callback = function(MeraHikenStack)
                    pcall(function()
                    toggleActive = MeraHikenStack
                    while toggleActive do
                        MeraHikenS()
                        task.wait()
                    end
                end)
            end})
    
            MeraMera:AddLabel('Mera Hiken Release'):AddKeyPicker('KeyPicker', {
                Default = '',
                SyncToggleState = false,
                Mode = 'Toggle',
                Text = 'Test',
                NoUI = false,
                Callback = function()
                    pcall(function()
                        local players = game:GetService("Players"):GetPlayers()
                        local remotePath = "ServerScriptService.Skills.Skills.SkillContainer.Mera-Mera.Hiken"
            
                        for _, player in ipairs(players) do
                            local playerRemote = game:GetService("ReplicatedStorage").PlayerRemotes:FindFirstChild(player.Name .. "|" .. remotePath)
            
                            if playerRemote then
                                playerRemote:InvokeAllAsync()
                            else
                                -- Faz nada
                            end
                        end
                    end)
                end,
                ChangedCallback = function(New)
                    print('Keybind changed!', New)
                end
            })
            
            local function MeraPillarS()
                pcall(function()
            local args = {
                [1] = "Flame Pillar"
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
            end)
            end
            local function MaguFistS()
                pcall(function()
            local args = {
                [1] = "Magma Fist"
            }
            
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
            end)
            end
            local function MaguHoundS()
                pcall(function()
                    local args = {
                        [1] = "Magma Hound"
                    }
                    
                    game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
                end)
            end
            MaguMagu:AddToggle('Magma Hound Stack', {
                Text = 'Magu Hound Stack',
                Callback = function(MaguHoundStack)
                pcall(function()
                toggleActive = MaguHoundStack
                while toggleActive do
                MaguHoundS()
                task.wait()
            end
        end)
    end})
            MaguMagu:AddToggle('Magu Fist Stack', {
                        Text = 'Magma Fist Stack',
                        Callback = function(MaguFistStack)
                        pcall(function()
                        toggleActive = MaguFistStack
                        while toggleActive do
                        MaguFistS()
                        task.wait()
                    end
                end)
            end})
    
            MaguMagu:AddLabel('MagmaFistRelease'):AddKeyPicker('KeyPicker', {
                Default = '',
                SyncToggleState = false,
                Mode = 'Toggle',
                Text = 'Test',
                NoUI = false,
                Callback = function()
                    pcall(function() 
                        local remotes = game:GetService("ReplicatedStorage").PlayerRemotes:GetChildren()
                        local playerName = game.Players.LocalPlayer.Name
                        local remoteName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Magu-Magu.Magma Fist"
                    
                        for i, remote in ipairs(remotes) do
                            if remote.Name == remoteName then
                                pcall(function()
                                    local args = {
                                        [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    }
                    
                                    remote:FireServer(unpack(args))
                                end)
                            end
                        end
                    end)            
                end,
                ChangedCallback = function(New)
                    print('Keybind changed!', New)
                end
            })
            MaguMagu:AddLabel('MagmaHoundRelease'):AddKeyPicker('KeyPicker', {
                Default = '',
                SyncToggleState = false,
                Mode = 'Toggle',
                Text = 'Test',
                NoUI = false,
                Callback = function()
                    pcall(function() 
                        local remotes = game:GetService("ReplicatedStorage").PlayerRemotes:GetChildren()
                        local playerName = game.Players.LocalPlayer.Name
                        local remoteName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Magu-Magu.Magma Hound"
                    
                        for i, remote in ipairs(remotes) do
                            if remote.Name == remoteName then
                                pcall(function()
                                    local args = {
                                        [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    }
                    
                                    remote:FireServer(unpack(args))
                                end)
                            end
                        end
                    end)            
                end,
                ChangedCallback = function(New)
                    print('Keybind changed!', New)
                end
            })
    MeraMera:AddToggle('Mera Pillar Stack', {
                Text = 'Mera Pillar Stack',
                Callback = function(MeraPillarStack)
                pcall(function()
                toggleActive = MeraPillarStack
                while toggleActive do
                MeraPillarS()
                task.wait()
            end
        end)
    end})
    
    MeraMera:AddLabel('Mera Pillar Release'):AddKeyPicker('KeyPicker', {
        Default = '',
        SyncToggleState = false,
        Mode = 'Toggle',
        Text = 'Test',
        NoUI = false,
        Callback = function()
            pcall(function()
                local players = game:GetService("Players"):GetPlayers()
                local remotePath = "ServerScriptService.Skills.Skills.SkillContainer.Mera-Mera.Flame Pillar"
    
                for _, player in ipairs(players) do
                    local playerRemote = game:GetService("ReplicatedStorage").PlayerRemotes:FindFirstChild(player.Name .. "|" .. remotePath)
    
                    if playerRemote then
                        playerRemote:InvokeAllAsync()
                    else
                    end
                end
            end)
        end,
        ChangedCallback = function(New)
            print('Keybind changed!', New)
        end
    })
    
    local function PikaLungeS()
        pcall(function()
            local ohString1 = "Light Lunge"
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1)
            end)
        end
        
        PikaPika:AddToggle('Pika Lunge Stack', {
            Text = 'Pika Lunge Stack',
            Callback = function(PikaLunge)
                    pcall(function()
                    toggleActive = PikaLunge
                    while toggleActive do
                        PikaLungeS()
                task.wait()
            end
        end)
    end})
    
    PikaPika:AddLabel('Light Lunge Release'):AddKeyPicker('KeyPicker', {
        Default = '',
        SyncToggleState = false,
        Mode = 'Toggle',
        Text = 'Test',
        NoUI = false,
        Callback = function()
            pcall(function()
                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
                local function encontrarJogadorMaisProximo()
                    local players = Players:GetPlayers()
                    local currentPlayer = Players.LocalPlayer
                    local closestPlayer = nil
                    local shortestDistance = 100
    
                    for _, player in ipairs(players) do
                        if player ~= currentPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("Humanoid") then
                                local distance = (currentPlayer.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    closestPlayer = player
                                end
                            end
                        end
                    end
    
                    return closestPlayer
                end
    
                local players = Players:GetPlayers()
    
                for _, plr in ipairs(players) do
                    local closestPlayer = encontrarJogadorMaisProximo()
    
                    if closestPlayer then
                        local args = {
                            [1] = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        }
    
                        local skillName = plr.name .. "|ServerScriptService.Skills.Skills.SkillContainer.Pika-Pika.Light Lunge"
    
                        local remote = ReplicatedStorage.PlayerRemotes:FindFirstChild(skillName)
    
                        if remote then
                            remote:FireServer(unpack(args))
                        end
                    end
                end
            end)
        end,
        ChangedCallback = function(New)
            print('Keybind changed!', New)
        end
    })
    
    local function PikaKickS()
        pcall(function()
            local args = {
                [1] = "Light Kick"
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
            task.wait()
            end)
        end
    PikaPika:AddToggle('Pika Kick Stack', {
            Text = 'Pika Kick Stack',
            Callback = function(PikaKickStack)
                    pcall(function()
                    toggleActive = PikaKickStack
                    while toggleActive do
                PikaKickS()
                task.wait()
            end
        end)
    end})
    
    PikaPika:AddLabel('Pika Kick Release'):AddKeyPicker('KeyPicker', {
        Default = '',
        SyncToggleState = false,
        Mode = 'Toggle',
        Text = 'Test',
        NoUI = false,
        Callback = function()
            pcall(function()
                local skillFolder = game:GetService("ReplicatedStorage").PlayerRemotes
                local player = game.Players.LocalPlayer
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    
                if humanoidRootPart then
                    local position = humanoidRootPart.Position
    
                    for _, skillItem in ipairs(skillFolder:GetChildren()) do
                        pcall(function()
                            local args = {
                                [1] = position,
                                [2] = CFrame.new(position + Vector3.new(0, 5, 0)) * CFrame.Angles(-3.002415418624878, -0.557424008846283, 2.430689811706543)
                            }
    
                            skillItem:FireServer(unpack(args))
                        end)
                    end
                else
                    warn("HumanoidRootPart not found!")
                end
            end)
        end,
        ChangedCallback = function(New)
            print('Keybind changed!', New)
        end
    })
    
    local function InfRay()
        pcall(function()
            local args = {
            [1] = "Light Ray",
            [2] = {
                ["pos"] = Vector3.new(9475.990234375, 12.788227081298828, -7034.09814453125)
            }
        }
        
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        end)
    end
    
    PikaPika:AddToggle('Pika Infinite LightRay', {
        Text = 'Pika Infinite LightRay',
        Callback = function(InfiniteRay)
        pcall(function()
            toggleActive = InfiniteRay
            while toggleActive do
                InfRay()
                task.wait(10)
            end
        end)
    end})
    
    local function PawCannonS()
        pcall(function()
            local args = {
                [1] = "Paw Cannon",
                [2] = CFrame.new(-0, 0, -0) * CFrame.Angles(-0.0215043593198061, 0.4616168439388275, 0.015874940901994705)
            }
            
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        end)
    end
    
    PawPaw:AddToggle('Paw Cannon Stack', {
        Text = 'Paw Cannon Stack',
        Callback = function(PawCannonStack)
        pcall(function()
            toggleActive = PawCannonStack
            while toggleActive do
                PawCannonS()
                task.wait()
            end
        end)
    end})
    
    PawPaw:AddLabel('Paw Cannon Release'):AddKeyPicker('KeyPicker', {
        Default = '',
        SyncToggleState = false,
        Mode = 'Toggle',
        Text = 'Test',
        NoUI = false,
        Callback = function()
            pcall(function()
                local player = game.Players.LocalPlayer
                local playerName = player.Name
                local humanoidRootPart = player.Character.HumanoidRootPart
                local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
                local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
                local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Paw-Paw.Paw Cannon"
                local args = {
                    [1] = CFrame.new(position) * CFrame.Angles(0.0768343061208725, -0.13681165874004364, 0.010459227487444878)
                }
                remotes:FindFirstChild(eventName):FireServer(unpack(args))
            end)
        end,
        ChangedCallback = function(New)
            print('Keybind changed!', New)
        end
    })
    
    local function PawBombS()
        pcall(function()
            local args = {
                [1] = "Paw Bomb",
                [2] = CFrame.new(0, 0, 0) * CFrame.Angles(-1.2786227464675903, -0.8662163615226746, -1.19479238986969)
            }
            
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        end)
    end
    
    PawPaw:AddToggle('Paw Bomb Stack', {
        Text = 'Paw Bomb Stack',
        Callback = function(PawBombStack)
        pcall(function()
            toggleActive = PawBombStack
            while toggleActive do
                PawBombS()
                task.wait()
            end
        end)
    end})
    
    PawPaw:AddLabel('Paw Bomb Release'):AddKeyPicker('KeyPicker', {
        Default = '',
        SyncToggleState = false,
        Mode = 'Toggle',
        Text = 'Test',
        NoUI = false,
        Callback = function()
            pcall(function()
                local player = game.Players.LocalPlayer
                local playerName = player.Name
                local humanoidRootPart = player.Character.HumanoidRootPart
                local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
                local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
                local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Paw-Paw.Paw Bomb"
                local args = {
                    [1] = CFrame.new(position) * CFrame.Angles(0.0768343061208725, -0.13681165874004364, 0.010459227487444878)
                }
                remotes:FindFirstChild(eventName):FireServer(unpack(args))
            end)
        end,
        ChangedCallback = function(New)
            print('Keybind changed!', New)
        end
    })
    
    local function YukiSnowGustS()
        pcall(function()
            local args = {
                [1] = "Snow Gust"
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        end)
    end
    
    YukiYuki:AddToggle('Yuki Snow Gust Stack', {
        Text = 'Yuki Snow Gust Stack',
        Callback = function(YukiGustStack)
    pcall(function()
        toggleActive = YukiGustStack
        while toggleActive do
            YukiSnowGustS()
            task.wait()
        end
    end)
    end})
    
    YukiYuki:AddLabel('Snow Gust Release'):AddKeyPicker('KeyPicker', {
        Default = '',
        SyncToggleState = false,
        Mode = 'Toggle',
        Text = 'Test',
        NoUI = false,
        Callback = function()
            pcall(function()
                local player = game.Players.LocalPlayer
                local playerName = player.Name
                local humanoidRootPart = player.Character.HumanoidRootPart
                local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
                local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
                local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Yuki-Yuki.Snow Gust"
                local args = {
                    [1] = CFrame.new(position) * game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                }
                remotes:FindFirstChild(eventName):FireServer(unpack(args))
            end)
        end,
        ChangedCallback = function(New)
            print('Keybind changed!', New)
        end
    })
    
    local function YukiSnowStormStack()
        pcall(function()
            local args = {
                [1] = "Snow Storm"
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(unpack(args))
        end)
    end
    
    local function YukiSnowStormStop()
        pcall(function()
            local player = game.Players.LocalPlayer
            local playerName = player.Name
            local humanoidRootPart = player.Character.HumanoidRootPart
            local position = humanoidRootPart.Position + Vector3.new(0, 5, 0)
            local remotes = game:GetService("ReplicatedStorage").PlayerRemotes
            local eventName = playerName .. "|ServerScriptService.Skills.Skills.SkillContainer.Yuki-Yuki.Snow Storm"
            local args = {
                [1] = CFrame.new(position) * CFrame.Angles(0.0768343061208725, -0.13681165874004364, 0.010459227487444878)
            }
            remotes:FindFirstChild(eventName):FireServer(unpack(args))
        end)
    end
    
    local isYukiSnowStormActive = false
    
    local function StartYukiSnowStormLoop()
        pcall(function()
        while isYukiSnowStormActive do
            YukiSnowStormStack()
            task.wait()
        end
    end)
    end
    
    YukiYuki:AddToggle('Infinite Yuki Snow Storm', {
        Text = 'Infinite Yuki Snow Storm',
        Callback = function(toggleState)
        isYukiSnowStormActive = toggleState
        pcall(function()
        if isYukiSnowStormActive then
            StartYukiSnowStormLoop()
        else
            YukiSnowStormStop()
        end
    end)
    end})
    
    local function HieAttack()
        pcall(function()
            local ohString1 = "Ice Partisan"
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            local playerPosition = humanoidRootPart.Position
            local playerOrientation = humanoidRootPart.CFrame:pointToObjectSpace(playerPosition)
            local newCF = CFrame.new(
                playerPosition + Vector3.new(0, 6, 0),
                playerPosition + playerOrientation * Vector3.new(0, 0, -1)
            )
            local ohTable2 = {
                ["cf"] = newCF
            }
        game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
    end)
    end
    
    local toggleActive = false
    
    HieHie:AddToggle('Hie Auto Attack', {
    Text = 'Hie Auto Attack',
    Callback = function(active1)
    pcall(function()
    toggleActive = active1
    while toggleActive do
    HieAttack()
    task.wait(.3)
    end
    end)
    end})
    
    local function OpeKill()
        pcall(function()
            local ohString1 = "Radio Knife"
            local ohTable2 = {
                ["cf"] = CFrame.new()
            }
            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer(ohString1, ohTable2)
        end)
    end
    
    local OpeInstaKill = false
    
    OpeOpe:AddToggle('Ope Insta Kill', {
        Text = 'Ope Insta Kill',
        Callback = function(active)
        pcall(function()
            OpeInstaKill = active
        while OpeInstaKill do
            OpeKill()
            task.wait()
        end
        end)
        end})
        local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
        MenuGroup:AddButton('Unload', function() Library:Unload() end)
        MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
        Library.ToggleKeybind = Options.MenuKeybind
        end)
