local coin = script.Parent  

local COIN_VALUE = 10  
local RESPAWN_TIME = 5 


coin.BrickColor = BrickColor.new("Gold")
coin.Material = Enum.Material.Metal

local spinning = false


local function spinCoin()
    spinning = true
    while coin.Parent and spinning do
        coin.CFrame = coin.CFrame * CFrame.Angles(0, math.rad(2), 0)
        wait()
    end
end


local function onTouch(otherPart)
    local character = otherPart.Parent
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        local player = game.Players:GetPlayerFromCharacter(character)
        if player then
            -- Award points (example: using leaderstats)
            local leaderstats = player:FindFirstChild("leaderstats")
            if not leaderstats then
                leaderstats = Instance.new("Folder")
                leaderstats.Name = "leaderstats"
                leaderstats.Parent = player
                
                local coins = Instance.new("IntValue")
                coins.Name = "Coins"
                coins.Value = 0
                coins.Parent = leaderstats
            end

            spinning = false
            coin.Transparency = 1  -- Hide coin

            -- Update player's coins
            local coinsStat = leaderstats:FindFirstChild("Coins")
            if coinsStat then
                coinsStat.Value = coinsStat.Value + COIN_VALUE
                print(player.Name .. " collected a coin! Total: " .. coinsStat.Value)
            end

            -- Respawn the coin after delay
            wait(RESPAWN_TIME)
            spinning = false
            coin.Transparency = 0
            spawn(spinCoin)
        end
    end
end

