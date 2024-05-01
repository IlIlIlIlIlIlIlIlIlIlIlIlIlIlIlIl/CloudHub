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

 local win = lib:Window("云中心-河北唐县",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl) 
 

 local setup = win:Tab("人物")
 


setup:Button("飞行",function()
loadstring(game:HttpGet("https://pastebin.com/raw/tp55hbu6"))()

end)

setup:Textbox("速度",WalkSpeed,function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

setup:Textbox("跳跃",JumpPower,function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)


setup:Toggle("无限跳",false, function(s)
getgenv().InfJ = s
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfJ == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
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

setup:Toggle("夜视",false, function(Value)
if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
end)





setup:Toggle("穿墙",  false, function(Value)


if Value then
      Noclip = true
      Stepped = game.RunService.Stepped:Connect(function()
        if Noclip == true then
          for a, b in pairs(game.Workspace:GetChildren()) do
            if b.Name == game.Players.LocalPlayer.Name then
              for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                  v.CanCollide = false
                end
              end
            end
          end
         else
          game.Workspace.Humanoid:ChangeState("Jumping")
        end
      end)
     else
      Noclip = false
    end
end)

local tab = win:Tab("主要功能")

tab:Toggle("自动刷钱", false, function(value)
	_G.autoFarm = value
	if value then
		autoFarm()
	end
end)

game.RunService.Stepped:Connect(function()
local virtualUser = game:GetService('VirtualUser')
virtualUser:CaptureController()

function teleportTo(CFrame) 
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame
end

_G.autoFarm = true

function autoFarm()
	while _G.autoFarm do
		fireclickdetector(game:GetService("Workspace").DeliverySys.Misc["Package Pile"].ClickDetector)
		task.wait(2.2)
		for _,point in pairs(game:GetService("Workspace").DeliverySys.DeliveryPoints:GetChildren()) do
			if point.Locate.Locate.Enabled then
				teleportTo(point.CFrame)
			end
		end
		task.wait(0)
	end
end
end)