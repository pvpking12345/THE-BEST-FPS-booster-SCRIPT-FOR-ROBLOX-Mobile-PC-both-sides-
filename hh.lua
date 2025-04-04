-- FPS Booster Script for Samsung XCover 5 (Executor Delta) -- Optimized for low-end devices to boost FPS and reduce lag

if not game:IsLoaded() then game.Loaded:Wait() end -- Ensure the game is fully loaded

local Lighting = game:GetService("Lighting") local RunService = game:GetService("RunService") local Players = game:GetService("Players") local UserInputService = game:GetService("UserInputService")

-- Function to apply FPS optimizations local function optimizeFPS() -- Disable global shadows and environmental effects Lighting.GlobalShadows = false for _, v in pairs(Lighting:GetChildren()) do if v:IsA("PostEffect") then v.Enabled = false end end

-- Lower render settings
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
RunService:Set3dRenderingEnabled(true)

-- Disable shadows for all parts in the game
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("BasePart") then
        obj.CastShadow = false
    end
end

print("FPS Boost Activated!")

end

-- Function to show FPS counter local function showFPS() local screenGui = Instance.new("ScreenGui") screenGui.Parent = game.CoreGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 200, 0, 50)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.BackgroundTransparency = 0.5
fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.TextScaled = true
fpsLabel.Parent = screenGui

RunService.RenderStepped:Connect(function()
    fpsLabel.Text = "FPS: " .. math.floor(1 / RunService.RenderStepped:Wait())
end)
print("FPS Counter Activated!")

end

-- GUI for User Interaction local ScreenGui = Instance.new("ScreenGui") ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame") Frame.Size = UDim2.new(0, 200, 0, 100) Frame.Position = UDim2.new(0.5, -100, 0.5, -50) Frame.BackgroundColor3 = Color3.new(0, 0, 0) Frame.BackgroundTransparency = 0.5 Frame.Parent = ScreenGui

local function createButton(text, position, callback) local Button = Instance.new("TextButton") Button.Size = UDim2.new(1, 0, 0.5, -5) Button.Position = position Button.Text = text Button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) Button.TextColor3 = Color3.new(1, 1, 1) Button.Parent = Frame Button.MouseButton1Click:Connect(callback) end

createButton("FPS Boost", UDim2.new(0, 0, 0, 0), optimizeFPS) createButton("FPS Counter", UDim2.new(0, 0, 0.5, 5), showFPS)

print("XCover 5 FPS Booster Loaded Successfully!")


