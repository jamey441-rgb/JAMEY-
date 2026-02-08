-- SERVICES
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- COLORS
local PURPLE_OUTLINE = Color3.fromRGB(170,0,255)
local OFF_COLOR = Color3.fromRGB(85,35,140)
local ON_COLOR = Color3.fromRGB(0,255,0)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "FallzHubGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

------------------------------------------------
-- MAIN FRAME
------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0,340,0,270)
main.Position = UDim2.new(0.5,-170,0.5,-135)
main.BackgroundColor3 = Color3.fromRGB(40,0,80)
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui
Instance.new("UICorner",main)

local stroke = Instance.new("UIStroke")
stroke.Color = PURPLE_OUTLINE
stroke.Thickness = 3
stroke.Parent = main

------------------------------------------------
-- TITLE
------------------------------------------------
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-90,0,32)
title.Position = UDim2.new(0,50,0,6)
title.BackgroundTransparency = 1
title.Text = "Fallz Hub"
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.TextColor3 = Color3.new(0,0,0)
title.TextStrokeColor3 = PURPLE_OUTLINE
title.TextStrokeTransparency = 0
title.Parent = main

------------------------------------------------
-- MINIMIZE
------------------------------------------------
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0,28,0,28)
minimize.Position = UDim2.new(0,8,0,6)
minimize.Text = "–"
minimize.Font = Enum.Font.GothamBlack
minimize.TextSize = 24
minimize.TextColor3 = Color3.new(0,0,0)
minimize.TextStrokeColor3 = PURPLE_OUTLINE
minimize.TextStrokeTransparency = 0
minimize.BackgroundColor3 = Color3.fromRGB(55,0,95)
minimize.Parent = main
Instance.new("UICorner",minimize)

------------------------------------------------
-- CLOSE (X)
------------------------------------------------
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,28,0,28)
closeBtn.Position = UDim2.new(1,-36,0,6)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBlack
closeBtn.TextSize = 20
closeBtn.TextColor3 = Color3.new(0,0,0)
closeBtn.TextStrokeColor3 = PURPLE_OUTLINE
closeBtn.TextStrokeTransparency = 0
closeBtn.BackgroundColor3 = Color3.fromRGB(55,0,95)
closeBtn.Parent = main
Instance.new("UICorner",closeBtn)

------------------------------------------------
-- CONTENT
------------------------------------------------
local content = Instance.new("Frame")
content.Size = UDim2.new(1,-16,1,-50)
content.Position = UDim2.new(0,8,0,42)
content.BackgroundTransparency = 1
content.Parent = main

------------------------------------------------
-- SMALL BUTTONS
------------------------------------------------
local smallButtons = {}
local buttonNames = {"Speed","Leave","ESP Player","ESP Base","Auto Bat","Aimbot"}

for i=1,#buttonNames do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.48,0,0,36)
	btn.Position = UDim2.new((i%2==1) and 0 or 0.52,0,0,55+math.floor((i-1)/2)*38)
	btn.Text = buttonNames[i]
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.TextColor3 = Color3.new(0,0,0)
	btn.TextStrokeColor3 = PURPLE_OUTLINE
	btn.TextStrokeTransparency = 0
	btn.BackgroundColor3 = OFF_COLOR
	btn.Parent = content
	Instance.new("UICorner",btn)
	smallButtons[i] = btn
end

------------------------------------------------
-- BIG BUTTON
------------------------------------------------
local bigButton = Instance.new("TextButton")
bigButton.Size = UDim2.new(1,0,0,50)
bigButton.Position = UDim2.new(0,0,0,0)
bigButton.Text = "FPS Devour (need auras)"
bigButton.Font = Enum.Font.GothamBold
bigButton.TextSize = 16
bigButton.TextColor3 = Color3.new(0,0,0)
bigButton.TextStrokeColor3 = PURPLE_OUTLINE
bigButton.TextStrokeTransparency = 0
bigButton.BackgroundColor3 = Color3.fromRGB(70,20,120)
bigButton.Parent = content
Instance.new("UICorner",bigButton)

------------------------------------------------
-- SPEED TOGGLE
------------------------------------------------
local speedOn=false
smallButtons[1].MouseButton1Click:Connect(function()
	speedOn = not speedOn
	smallButtons[1].BackgroundColor3 = speedOn and ON_COLOR or OFF_COLOR
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = speedOn and 53 or 16 end
end)

------------------------------------------------
-- LEAVE BUTTON
------------------------------------------------
smallButtons[2].MouseButton1Click:Connect(function()
	player:Kick("You left the game.")
end)

------------------------------------------------
-- OTHER TOGGLE COLORS ONLY
------------------------------------------------
local states = {false,false,false,false}
for i,idx in ipairs({3,4,5,6}) do
	smallButtons[idx].MouseButton1Click:Connect(function()
		states[i]=not states[i]
		smallButtons[idx].BackgroundColor3 = states[i] and ON_COLOR or OFF_COLOR
	end)
end

------------------------------------------------
-- MINIMIZE LOGIC
------------------------------------------------
local minimized=false
local fullSize=main.Size
local miniSize=UDim2.new(0,340,0,44)

minimize.MouseButton1Click:Connect(function()
	minimized=not minimized
	content.Visible=not minimized
	main.Size=minimized and miniSize or fullSize
end)

------------------------------------------------
-- CLOSE -> FH BUTTON
------------------------------------------------
closeBtn.MouseButton1Click:Connect(function()
	main.Visible=false

	local fhBtn=Instance.new("TextButton")
	fhBtn.Size=UDim2.new(0,90,0,40)
	fhBtn.Position=UDim2.new(1,-100,0,10)
	fhBtn.Text="FH"
	fhBtn.Font=Enum.Font.GothamBlack
	fhBtn.TextSize=22
	fhBtn.TextColor3=Color3.new(0,0,0)
	fhBtn.TextStrokeColor3=PURPLE_OUTLINE
	fhBtn.BackgroundColor3=Color3.fromRGB(40,0,80)
	fhBtn.Parent=gui
	Instance.new("UICorner",fhBtn)

	local fhStroke=Instance.new("UIStroke")
	fhStroke.Color=PURPLE_OUTLINE
	fhStroke.Thickness=3
	fhStroke.Parent=fhBtn

	fhBtn.MouseButton1Click:Connect(function()
		main.Visible=true
		fhBtn:Destroy()
	end)
end)

------------------------------------------------
-- DRAG SYSTEM
------------------------------------------------
local dragging=false
local dragStart
local startPos

local dragBar=Instance.new("Frame")
dragBar.Size=UDim2.new(1,0,0,44)
dragBar.BackgroundTransparency=1
dragBar.Parent=main

local function update(input)
	local delta=input.Position-dragStart
	main.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
end

dragBar.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 then
		dragging=true
		dragStart=input.Position
		startPos=main.Position
		input.Changed:Connect(function()
			if input.UserInputState==Enum.UserInputState.End then dragging=false end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
		update(input)
	end
end)
