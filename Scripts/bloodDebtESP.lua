local cGUI = game.CoreGui;
local highlightsHolder = Instance.new("Folder",cGUI)

local murderMysteryRemote = game.ReplicatedStorage.MurderMysteryReplicatedStorage.RemoteEvent

local function checkBackpackAndChar(PlayerInstance : Player,LookingFor : String)
    return PlayerInstance.Backpack:FindFirstChild(LookingFor,true) or PlayerInstance.Character:FindFirstChild(LookingFor,true)
end
local function debtModeESP()
    for i,v in pairs(game.Players:GetPlayers()) do
        if checkBackpackAndChar(v,"GUNCHECK") and not checkBackpackAndChar(v,"SpawnGrenade") then
            local highlight = Instance.new("Highlight",highlightsHolder)
            highlight.Adornee = v.Character
            highlight.FillColor = Color3.fromRGB(0,0,255)
            highlight.OutlineTransparency = 1
            elseif checkBackpackAndChar(v,"SpawnGrenade") then
            local highlight = Instance.new("Highlight",highlightsHolder)
            highlight.Adornee = v.Character
            highlight.FillColor = Color3.fromRGB(255,0,0)
            highlight.OutlineTransparency = 1
        end
    end
end
local function shooterESP()
    for i,v in pairs(game.Players:GetPlayers()) do
        if checkBackpackAndChar(v,"GUNCHECK") then
            local highlight = Instance.new("Highlight",highlightsHolder)
            highlight.Adornee = v.Character
            highlight.FillColor = Color3.fromRGB(255,255,0)
            highlight.OutlineTransparency = 1
        end
    end
end
local function teamWarsESP()
    print("ffee")
    local myRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    for i,v in pairs(game.Players:GetPlayers()) do
        if (v.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude > 30 then
            local highlight = Instance.new("Highlight",highlightsHolder)
            highlight.Adornee = v.Character
            highlight.FillColor = Color3.fromRGB(255,0,0)
            highlight.OutlineTransparency = 1
        end
    end
end
murderMysteryRemote.OnClientEvent:Connect(function(...)

    local arguments = {...}
    if arguments[1] ~= "solvemyspawns" then 
        for i,v in pairs(arguments) do print(i,v) end
        if arguments[1] == "ROLE CHOSEN" then
            if arguments[3] ~= nil then
            print(arguments[3])
            else
            task.wait(5)
            debtModeESP()
            end
        elseif arguments[1] == "oh songs" then
            highlightsHolder:ClearAllChildren()
        end
        task.wait(1)
        if arguments[3] == "TEAM WAR" then
            task.wait(3)
            teamWarsESP()
        elseif arguments[3] == "SHOOTER" then
            task.wait(3)
            shooterESP()
        end
    end
end)