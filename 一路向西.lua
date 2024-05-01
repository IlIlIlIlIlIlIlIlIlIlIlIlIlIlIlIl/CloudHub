local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")() 

local OpenUI = Instance.new("ScreenGui") 
local Button = Instance.new("TextButton")  -- 将 ImageButton 修改为 TextButton
OpenUI.Name = "OpenUI" 
OpenUI.Parent = game.CoreGui 
OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
Button.Parent = OpenUI 
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
Button.BackgroundTransparency = 0.500 
Button.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0) 
Button.Size = UDim2.new(0.034, 0,0.067, 0) 
Button.Text = "隐藏/打开"  -- 替换为你的昵称
Button.TextColor3 = Color3.fromRGB(0, 0, 0)  -- 设置文本颜色
Button.TextSize = 10  -- 设置文本大小为正常大小
Button.Draggable = true 

Button.MouseButton1Click:Connect(function() 
  if uihide == false then
    uihide = true
    game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
  else
    uihide = false
    game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
  end
end)

uihide = false

 local win = lib:Window("云中心-一路向西",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl) 
  
 local setup = win:Tab("人物")
 
 setup:Toggle("夜视",false, function(Value)
if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
end)

setup:Button("透视",function()
if _G.Reantheajfdfjdgse then
    return
end

_G.Reantheajfdfjdgse = "susan"

local coregui = game:GetService("CoreGui")
local players = game:GetService("Players")
local plr = players.LocalPlayer

local highlights = {}

function esp(target, color)
    pcall(function()
        if target.Character then
            if not highlights[target] then
                local highlight = Instance.new("Highlight", coregui)
                highlight.Name = target.Name
                highlight.Adornee = target.Character
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = color
                highlights[target] = highlight
            else
                highlights[target].FillColor = color
            end
        end
    end)
end

players.PlayerAdded:Connect(function(v)
    v.CharacterAdded:Connect(function()
        esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
    end)
end)

players.PlayerRemoving:Connect(function(v)
    if highlights[v] then
        highlights[v]:Destroy()
        highlights[v] = nil
    end
end)

for i, v in pairs(players:GetPlayers()) do
    if v ~= plr then
        local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
        v.CharacterAdded:Connect(function()
            local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
            esp(v, color)
        end)
        
        esp(v, color)
    end
end

while task.wait() do
    for i, v in pairs(highlights) do
        local color = _G.UseTeamColor and i.TeamColor.Color or ((plr.TeamColor == i.TeamColor) and _G.FriendColor or _G.EnemyColor)
        v.FillColor = color
    end
end
end)

local setup = win:Tab("主要功能")

setup:Toggle("锁头",false,function(Value)
		_G.AimbotEnabled = Value

		local Camera = workspace.CurrentCamera
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")
		local TweenService = game:GetService("TweenService")
		local LocalPlayer = Players.LocalPlayer
		local Holding = false

		_G.TeamCheck = true
		_G.AimPart = "Head"
		_G.Sensitivity = 0

		_G.CircleSides = 64
		_G.CircleColor = Color3.fromRGB(255, 255, 255)
		_G.CircleTransparency = 0.7
		_G.CircleRadius = 80
		_G.CircleFilled = false
		_G.CircleVisible = false
		_G.CircleThickness = 0

		local FOVCircle = Drawing.new("Circle")
		FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Filled = _G.CircleFilled
		FOVCircle.Color = _G.CircleColor
		FOVCircle.Visible = _G.CircleVisible
		FOVCircle.Radius = _G.CircleRadius
		FOVCircle.Transparency = _G.CircleTransparency
		FOVCircle.NumSides = _G.CircleSides
		FOVCircle.Thickness = _G.CircleThickness

		local function GetClosestPlayer()
			local MaximumDistance = _G.CircleRadius
			local Target = nil

			for _, v in next, Players:GetPlayers() do
				if v.Name ~= LocalPlayer.Name then
					if _G.TeamCheck == true then
						if v.Team ~= LocalPlayer.Team then
							if v.Character ~= nil then
								if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
									if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
										local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
										local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

										if VectorDistance < MaximumDistance then
											Target = v
										end
									end
								end
							end
						end
					else
						if v.Character ~= nil then
							if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
								if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
									local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
									local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

									if VectorDistance < MaximumDistance then
										Target = v
									end
								end
							end
						end
					end
				end
			end

			return Target
		end

		UserInputService.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = true
			end
		end)

		UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton2 then
				Holding = false
			end
		end)

		RunService.RenderStepped:Connect(function()
			FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
			FOVCircle.Radius = _G.CircleRadius
			FOVCircle.Filled = _G.CircleFilled
			FOVCircle.Color = _G.CircleColor
			FOVCircle.Visible = _G.CircleVisible
			FOVCircle.Radius = _G.CircleRadius
			FOVCircle.Transparency = _G.CircleTransparency
			FOVCircle.NumSides = _G.CircleSides
			FOVCircle.Thickness = _G.CircleThickness

			if Holding == true and _G.AimbotEnabled == true then
				TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
			end
		end)
	end)

local setup = win:Tab("自动功能")

autoSell = false

setup:Toggle("自动出售（靠近出售NPC即可）",false,function(Value)
		autoSell = Value

		while autoSell do
			game:GetService("ReplicatedStorage").GeneralEvents.Inventory:InvokeServer( "Sell")
			wait(2)
		end
	end)

autoClear = false

setup:Toggle("消除赏金（靠近出警长即可）",false,function(Value)
		autoClear = Value

		while autoClear do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("PayOffBounty")
			wait(2)
		end
	end)

autoWater = false

setup:Toggle("购买药水（靠近医生即可）",false,function(Value)
		autoWater = Value

		while autoWater do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("Health Potion", true)
			wait(2)
		end
	end)
	
	

setup:Label("↓子弹（靠近武器店NPC即可）↓")

autoGun = false

setup:Toggle("手枪子弹",false,function(Value)
		autoGun = Value

		while autoGun do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("PistolAmmo", true)
			wait(2)
		end
	end)

autoGun1 = false

setup:Toggle("步枪子弹",false,function(Value)
		autoGun1 = Value

		while autoGun1 do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("RifleAmmo", true)
			wait(2)
		end
	end)

autoGun2 = false

setup:Toggle("购买箭矢",false,function(Value)
		autoGun2 = Value

		while autoGun2 do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("Arrows")
			wait(2)
		end
	end)

autoGun3 = false

setup:Toggle("霰弹枪子弹",false,function(Value)
		autoGun3 = Value

		while autoGun3 do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("ShotgunAmmo")
			wait(2)
		end
	end)

autoGun4 = false

setup:Toggle("狙击枪子弹",false,function(Value)
		autoGun4 = Value

		while autoGun4 do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("SniperAmmo", true)
			wait(2)
		end
	end)

autoGun5 = false

setup:Toggle("小型炸药",false,function(Value)
		autoGun5 = Value

		while autoGun5 do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("Dynamite")
			wait(2)
		end
	end)

autoGun6 = false

setup:Toggle("大型炸药",false,function(Value)
		autoGun6 = Value

		while autoGun6 do
			game:GetService("ReplicatedStorage").GeneralEvents.BuyItem:InvokeServer("BIG Dynamite", true)
			wait(2)
		end
	end)

local setup = win:Tab("传送功能")

setup:Label("牛仔")

setup:Button("滚筒",function()
		game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("Tumbleweed", false)
	end)

setup:Button("岩石溪",function()
		game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("StoneCreek", false)
	end)

setup:Button("灰色山脊",function()
		game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("Grayridge", false)
	end)

setup:Button("大矿洞",function()
		game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("Quarry", false)
	end)

setup:Label("不法之徒")

setup:Button("堡垒",function()
		game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("FortCassidy", true)
	end)

setup:Button("阿瑟堡",function()
		game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("FortArthur", true)
	end)

setup:Button("红色岩石营地",function()
		game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("RedRocks", true)
	end)
	
