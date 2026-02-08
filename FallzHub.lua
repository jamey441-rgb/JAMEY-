loadstring([[local P=game:GetService("Players")local U=game:GetService("UserInputService")local p=P.LocalPlayer local g=Instance.new("ScreenGui",p:WaitForChild("PlayerGui"))g.ResetOnSpawn=false local BG=Color3.fromRGB(45,0,70)local LP=Color3.fromRGB(200,150,255)local EP=Color3.fromRGB(170,0,255)local on=false
local function add(c,pl)if c:FindFirstChild("FHL")then return end local h=Instance.new("Highlight",c)h.Name="FHL"h.FillColor=EP h.OutlineColor=LP h.FillTransparency=.4 local head=c:FindFirstChild("Head")if head then local b=Instance.new("BillboardGui",head)b.Size=UDim2.new(0,200,0,40)b.StudsOffsetWorldSpace=Vector3.new(0,2.5,0)b.AlwaysOnTop=true local t=Instance.new("TextLabel",b)t.Size=UDim2.new(1,0,1,0)t.BackgroundTransparency=1 t.Text=pl.Name t.TextColor3=Color3.new()t.TextStrokeColor3=LP t.TextStrokeTransparency=0 t.Font=Enum.Font.GothamBold t.TextScaled=true end end
local function rem(c)local h=c:FindFirstChild("FHL")if h then h:Destroy()end local head=c:FindFirstChild("Head")if head then local b=head:FindFirstChildOfClass("BillboardGui")if b then b:Destroy()end end end
local function upd()for _,pl in ipairs(P:GetPlayers())do if pl.Character then if on then add(pl.Character,pl)else rem(pl.Character)end end end end
local f=Instance.new("Frame",g)f.Size=UDim2.new(0,220,0,120)f.Position=UDim2.new(.5,-110,.5,-60)f.BackgroundColor3=BG f.BorderSizePixel=0 Instance.new("UICorner",f).CornerRadius=UDim.new(0,12)local s=Instance.new("UIStroke",f)s.Color=LP s.Thickness=4
local tb=Instance.new("Frame",f)tb.Size=UDim2.new(1,0,0,28)tb.BackgroundColor3=BG
local tt=Instance.new("TextLabel",tb)tt.Size=UDim2.new(1,-30,1,0)tt.Position=UDim2.new(0,5,0,0)tt.BackgroundTransparency=1 tt.Text="Fallz ESP"tt.TextColor3=Color3.new()tt.TextStrokeColor3=LP tt.TextStrokeTransparency=0 tt.Font=Enum.Font.GothamBold tt.TextSize=14
local m=Instance.new("TextButton",tb)m.Size=UDim2.new(0,25,0,20)m.Position=UDim2.new(1,-28,.5,-10)m.BackgroundColor3=BG m.Text="-"m.TextColor3=Color3.new()m.TextStrokeColor3=LP m.TextStrokeTransparency=0 local ms=Instance.new("UIStroke",m)ms.Color=LP ms.Thickness=2
local d=Instance.new("Frame",f)d.Size=UDim2.new(1,-10,0,2)d.Position=UDim2.new(0,5,0,30)d.BackgroundColor3=LP
local c=Instance.new("Frame",f)c.Size=UDim2.new(1,0,1,-32)c.Position=UDim2.new(0,0,0,32)c.BackgroundTransparency=1
local t=Instance.new("TextButton",c)t.Size=UDim2.new(0,140,0,30)t.Position=UDim2.new(.5,-70,.5,-15)t.BackgroundColor3=BG t.Text="ESP OFF"t.TextColor3=Color3.new()t.TextStrokeColor3=LP t.TextStrokeTransparency=0 local ts=Instance.new("UIStroke",t)ts.Color=LP ts.Thickness=2
t.MouseButton1Click:Connect(function()on=not on t.Text=on and"ESP ON"or"ESP OFF"upd()end)
local min=false local fs=f.Size
m.MouseButton1Click:Connect(function()min=not min if min then c.Visible=false d.Visible=false f.Size=UDim2.new(0,220,0,28)m.Text="+"else c.Visible=true d.Visible=true f.Size=fs m.Text="-"end end)
local drag=false local ds sp
tb.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=true ds=i.Position sp=f.Position end end)
U.InputChanged:Connect(function(i)if drag and i.UserInputType==Enum.UserInputType.MouseMovement then local dl=i.Position-ds f.Position=UDim2.new(sp.X.Scale,sp.X.Offset+dl.X,sp.Y.Scale,sp.Y.Offset+dl.Y)end end)
tb.InputEnded:Connect(function()drag=false end)]])()
