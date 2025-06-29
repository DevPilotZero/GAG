--!strict
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Load RayField UI Library (Must be in ReplicatedStorage)
local RayField = require(ReplicatedStorage:WaitForChild("RayField"))

-- Initialize UI
local LoadingUI = RayField.CreateWindow({
    Name = "LoadingScreen",
    LoadingTitle = "Loading Game...",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- Create Loading Frame
local LoadingFrame = LoadingUI:CreateFrame({
    Name = "LoadingFrame",
    Color = Color3.fromRGB(20, 20, 20),
    Transparency = 0.5,
    Size = UDim2.new(0.6, 0, 0.2, 0),
    Position = UDim2.new(0.2, 0, 0.4, 0),
})

-- Add Progress Bar
local ProgressBar = LoadingFrame:CreateProgressBar({
    Name = "LoadProgress",
    Value = 0,
    Size = UDim2.new(0.9, 0, 0.2, 0),
    Position = UDim2.new(0.05, 0, 0.5, 0),
    CornerRadius = 5,
    FillColor = Color3.fromRGB(0, 170, 255),
})

-- Add Status Text
local StatusLabel = LoadingFrame:CreateLabel({
    Name = "StatusText",
    Text = "Initializing...",
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 18,
    Position = UDim2.new(0.05, 0, 0.3, 0),
})

-- Simulate Loading Progress
local function UpdateLoadProgress()
    -- Fake loading steps (replace with real loading checks)
    local steps = {
        "Loading Assets (1/3)",
        "Setting Up World (2/3)",
        "Connecting Players (3/3)",
    }

    for i = 1, 3 do
        StatusLabel.Text = steps[i]
        ProgressBar.Value = i * 33
        wait(1)
    end

    -- Animation: Smooth fade-out
    for i = 1, 10 do
        LoadingFrame.BackgroundTransparency += 0.1
        wait(0.05)
    end

    LoadingUI:Destroy() -- Remove UI when done
end

-- Wait for player to load before starting
Players.LocalPlayer:WaitForChild("PlayerGui")  
UpdateLoadProgress()