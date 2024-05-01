Important_functions = ([[

R.EN Revision [ April 14, 2024 ]

R.EN Release 2.0 
Copyright (c) 2024 by Mr zhi qian fong.
Writen by Mr zhi qian fong

]])



-- UI
local ui = loadstring(game:HttpGet("https://pastebin.com/raw/ChBzmEdH"))();	
local window = ui:("云中心SCP:角色扮演")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local main = window:section("主要")
local section = main:Section("主要")
local main3 = window:section("汽车")
local section5 = main3:Section("汽车农场")
local main4 = window:section("打击")
local main5 = window:section("ESP")
local section6 = main4:Section("PVP")
local section7 = main5:Section("ESP")
local main2 = window:section("瞬移")
local section2 = main2:Section("TP区")
local section3 = main2:Section("SCP安全壳TP")
local section4 = main2:Section("产卵点 TP")
local main1 = window:section("杂项")
local section1 = main1:Section("本地播放器")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

pcall(function()
local h = game.Players.LocalPlayer.Character.Humanoid
local oldmt 
oldmt = hookmetamethod(game, "__index", function(self, index)
    if self == h and index == "WalkSpeed" then
        return nil
    end 
    return oldmt(self, index)
end)
end) 

pcall(function()
local ht = game.Players.LocalPlayer.Character.Humanoid
local oldmtt 
oldmtt = hookmetamethod(game, "__index", function(selft, indext)
    if selft == ht and indext == "JumpPower" then
        return game.Players.LocalPlayer.Character.Humanoid.JumpPower
    end 
    return oldmtt(selft, indext)
end)
end) 

local function getclosestplayer()
    local closest = nil 
    local maxdist = math.huge 
    for i,v in pairs(game.Players:GetPlayers()) do 
        if v ~= plr and v.Team ~= plr.Team and v.TeamColor.Color ~= game.Teams["Class - D"].TeamColor.Color and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health > 0 then
            local magnitude = (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            if magnitude < maxdist then 
                maxdist = magnitude 
                closest = v 
            end 
        end 
    end 
    return closest
end 

local function getclosestplayertomouse()
    local closest = nil
    local maxdist = math.huge
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= plr and v.Team ~= plr.Team and v.TeamColor.Color ~= game.Teams["Class - D"].TeamColor.Color and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health > 0 then 
            local pos = game.Workspace.CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local magnitude = (Vector2.(plr:GetMouse().x, plr:GetMouse().y) - Vector2.(pos.x, pos.y)).Magnitude
            if magnitude < maxdist then
                maxdist = magnitude
                closest = v
            end
        end
    end
    return closest
end

for i,v in pairs(game.Players:GetPlayers()) do 
    if v ~= plr and (not table.find(players, v.Name)) then 
        table.insert(players, v.Name)
    end 
end 

for i,v in pairs(game.Workspace.Spawns:GetChildren()) do 
    if (not table.find(spawns, v.Name)) then 
        table.insert(spawns, v.Name)
    end 
end 

local function PartGlow(R)
    local Highlight = Instance.("Highlight")
    Highlight.Adornee = R
    Highlight.Parent = R
    Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)                              
    Highlight.OutlineTransparency = 0 
    Highlight.FillTransparency = 1
    Highlight.Name = R.Name.."'s Highlight"
    Highlight.Enabled = false
end 

local function partnametag(player)
local bill = Instance.("BillboardGui")
bill.Parent = player
bill.Adornee = player:FindFirstChildOfClass("Part")
bill.Name = player.Name.."'s Nametag"
bill.Size = UDim2.(0, 100, 0, 150)
bill.AlwaysOnTop = true
bill.StudsOffset = Vector3.(0, -1, 0)
bill.Enabled = false

local text = Instance.("TextLabel")
text.Parent = bill
text.Text = player.Name
text.Position = UDim2.(0, 0, 0, -50)
text.Size = UDim2.(0, 100, 0, 100)
text.Font = Enum.Font.SourceSans
text.TextSize = 15
text.TextColor3 = Color3.fromRGB(255, 0, 0)
text.TextYAlignment = Enum.TextYAlignment.Bottom
text.BackgroundTransparency = 1
text.TextStrokeTransparency = 0
text.ZIndex = 5

game:GetService("RunService").RenderStepped:Connect(function()
    if player then 
        text.Text = player.Name
    end
end)
end 

local function Glow(Player, Color)
    local Highlight = Instance.("Highlight")
    Highlight.Adornee = Player.Character
    Highlight.Parent = Player.Character
    Highlight.OutlineColor = Color                              
    Highlight.OutlineTransparency = 0 
    Highlight.FillTransparency = 1
    Highlight.Name = Player.Name.."'s Highlight"
    Highlight.Enabled = false
end 

local function nametag(player)
local bill = Instance.("BillboardGui")
bill.Parent = player.Character
bill.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
bill.Name = player.Name.."'s Nametag"
bill.Size = UDim2.(0, 100, 0, 150)
bill.AlwaysOnTop = true
bill.StudsOffset = Vector3.(0, -1, 0)
bill.Enabled = false

local text = Instance.("TextLabel")
text.Parent = bill
text.Text = player.Name
text.Position = UDim2.(0, 0, 0, -50)
text.Size = UDim2.(0, 100, 0, 100)
text.Font = Enum.Font.SourceSans
text.TextSize = 15
text.TextColor3 = player.TeamColor.Color
text.TextYAlignment = Enum.TextYAlignment.Bottom
text.BackgroundTransparency = 1
text.TextStrokeTransparency = 0
text.ZIndex = 5

game:GetService("RunService").RenderStepped:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
        text.Text = player.Name.." | "..math.floor(player.Character:FindFirstChild("Humanoid").Health).."/"..math.floor(player.Character:FindFirstChild("Humanoid").MaxHealth).." | "..math.floor((player.Character:FindFirstChild("HumanoidRootPart").Position - game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude).."m"
    end
end)
end 

local part = Instance.("Part")
part.Anchored = true 
part.CFrame = CFrame.(2, 32, -179)
part.Name = ""
part.Parent = game.Workspace
part.Size = Vector3.(50, 1, 50)

local part1 = Instance.("Part")
part1.Anchored = true 
part1.CFrame = CFrame.(-52, 84, 229)
part1.Name = ""
part1.Parent = game.Workspace
part1.Size = Vector3.(50, 1, 50)

section:Button("切换聊天", "", function()
if plr.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible == false then 
plr.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true 
plr.PlayerGui.Chat.Frame.ChannelsBarParentFrame.Visible = true 
else 
plr.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = false
plr.PlayerGui.Chat.Frame.ChannelsBarParentFrame.Visible = false
end
end)

section:Button("破坏/修复变形金刚", "", function()
pcall(function()
local oldpos = plr.Character.HumanoidRootPart.Position
wait(.1)
plr.Character.HumanoidRootPart.CFrame = CFrame.(-98, 32, -179)
wait(1)
if game:GetService("Workspace"):FindFirstChild("BrokenFacilityTransformer") then 
fireproximityprompt(game:GetService("Workspace").BrokenFacilityTransformer["Meshes/BrokenTransformer_Cube.023 (1)"].Attachment.CIHackDeviceDisarmPrompt)
wait(.5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
elseif game:GetService("Workspace")["Sector 2"].SectionB:FindFirstChild("TransformerC4") then 
fireproximityprompt(game:GetService("Workspace")["Sector 2"].SectionB.TransformerC4.ClickPart.ProximityPrompt)
wait(.5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
else
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
end
end)
end)

section:Button("破坏/重新建立008", "", function()
pcall(function()
local oldpos = plr.Character.HumanoidRootPart.Position 
wait(.1)
plr.Character.HumanoidRootPart.CFrame = CFrame.(533, 40, 392)
wait(1)
if game:GetService("Workspace")["Sector 3"]:FindFirstChild("CIHackDevice008") then 
fireproximityprompt(game:GetService("Workspace")["Sector 3"].CIHackDevice008["Meshes/Chaos Insurgency Hack Device_Cylinder"].CIHackDeviceDisarmPrompt)
wait(.5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
elseif game:GetService("Workspace")["Sector 3"]:FindFirstChild("ModelCI008") then
fireproximityprompt(game:GetService("Workspace")["Sector 3"].ModelCI008["Meshes/Chaos Insurgency Hack Device_Cylinder"].CIHackDevicePrompt)
wait(.5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
else 
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
end
end)
end)

section:Button("黑客/恢复控制室", "", function()
pcall(function()
local oldpos = plr.Character.HumanoidRootPart.Position 
wait(.1)
plr.Character.HumanoidRootPart.CFrame = CFrame.(83, 37, 193)
wait(1)
if game:GetService("Workspace")["Sector 2"].SectionA:FindFirstChild("ModelCI") then 
fireproximityprompt(game:GetService("Workspace")["Sector 2"].SectionA.ModelCI["Meshes/Chaos Insurgency Hack Device_Cylinder"].CIHackDevicePrompt)
wait(.5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
elseif game:GetService("Workspace")["Sector 2"].SectionA:FindFirstChild("CIHackDevice") then 
fireproximityprompt(game:GetService("Workspace")["Sector 2"].SectionA.CIHackDevice["Meshes/Chaos Insurgency Hack Device_Cylinder"].CIHackDeviceDisarmPrompt)
wait(.5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
else
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
end
end) 
end)

section:Button("突破 096", "", function()
pcall(function()
local oldpos = plr.Character.HumanoidRootPart.Position 
wait(.1)
plr.Character.HumanoidRootPart.CFrame = CFrame.(708, 40, -160)
wait(10)
plr.Character.HumanoidRootPart.CFrame = CFrame.(oldpos)
end) 
end)

section:Button("传送到核掩体", "", function()
pcall(function()
plr.Character.HumanoidRootPart.CFrame = CFrame.(220, 24, 505)
end) 
end)

section:Button("逃生设施", "", function()
plr.Character.HumanoidRootPart.CFrame = CFrame.(8, 36, -176)
wait(5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(-27, 88, 226)
end)

section:Button("自行使用医疗套件", "", function() 
pcall(function()
game:GetService("ReplicatedStorage").Remotes.Interact:FireServer(plr.Character)
end)
end)

section:Button("授权附近玩家", "", function()
pcall(function()
for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
game:GetService("ReplicatedStorage").Remotes.Authorise:FireServer(v)
end 
end) 
end)

section2:Button("TP至选定区域", "", function()
pcall(function()
if d == "部门 3" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(491, 42, 151)
elseif d == "地堡" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(228, 42, 438)
elseif d == "地堡D级观景" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(21, 62, 467)
elseif d == "D级遏制" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(26, 45, 519)
elseif d == "控制室" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(67, 42, 217)
elseif d == "部门 1" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-358, 42, 56)
elseif d == "靶场" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-433, 32, 3)
elseif d == "直升机垫" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-573, 52, 436)
elseif d == "变压器" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-95, 42, -148)
elseif d == "部门 2-1" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-313, 42, 57)
elseif d == "部门 2-2" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(290, 42, 151)
end
end)
end)

section2:Dropdown("选定区域", "", {"部门 1", "部门 2-1", "部门 2-2", "部门 3", "控制室", "变压器", "地堡", "掩体D级安全壳", "D类观看", "直升机垫", "靶场"}, function(c)
d = c 
end)

section3:Button("TP至SCP遏制", "", function()
pcall(function()
if r == "008" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(538, 40, 388)
elseif r == "008 解构器" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(498, 40, 298)
elseif r == "049" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(605, 40, 53)
elseif r == "966" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(653, 40, 48)
elseif r == "457" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(607, 40, -43)
elseif r == "096" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(662, 40, -121)
elseif r == "173" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(204, 54, 158)
elseif r == "002" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-82, 40, 143)
elseif r == "2950" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-213, 40, 190)
elseif r == "131" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-213, 40, 301)
elseif r == "066" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-215, 40, -39)
elseif r == "999" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-282, 40, 27)
elseif r == "409" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(-87, 40, -65)
elseif r == "1299" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(141, 40, -67)
elseif r == "1025" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(256, 40, -52)
elseif r == "023" then 
plr.Character.HumanoidRootPart.CFrame = CFrame.(258, 40, 248)
end 
end)
end)

section3:Dropdown("选择 SCP 选择遏制", "", {"008", "096", "049", "173", "966", "457", "999", "023", "008 解构器", "002", "1299", "1025", "2950", "131", "066", "409"}, function(l)
r = l
end)

section4:Button("选定产卵的TP", "", function()
pcall(function()
plr.Character.HumanoidRootPart.CFrame = game.Workspace.Spawns:FindFirstChild(b).CFrame + Vector3.(0, 10, 0)
end)
end)

section4:Dropdown("选择繁殖", "", spawns, function(a)
b = a 
end)

section5:Toggle("自动逃生设施", "", function(orp)
popr = orp 
while popr and task.wait() do 
pcall(function()
plr.Character.HumanoidRootPart.CFrame = CFrame.(8, 36, -176)
wait(5)
plr.Character.HumanoidRootPart.CFrame = CFrame.(-27, 88, 226)
wait(1)
plr.Character.Humanoid.Health = 0 
wait(8)
end)
end
end)
    
section5:Toggle("Auto Breach 008（使用noclip", "", function(ir)
it = ir 
while it and task.wait(.5) do 
pcall(function()
plr.Character.HumanoidRootPart.CFrame = CFrame.(530, 41, 388)
wait(1)
if game:GetService("Workspace")["Sector 3"]:FindFirstChild("ModelCI008") then 
fireproximityprompt(game:GetService("Workspace")["Sector 3"].ModelCI008["Meshes/Chaos Insurgency Hack Device_Cylinder"].CIHackDevicePrompt)
end 
end) 
end 
end)

section1:Toggle("无剪辑", "", function(q)
qr = q 
while qr and task.wait() do 
pcall(function()
for i,v in pairs(plr.Character:GetChildren()) do 
if v:IsA("BasePart") and v.CanCollide then 
v.CanCollide = false
end 
end 
end) 
end 
end)

section1:Button("夹", "", function()
pcall(function()
plr.Character.HumanoidRootPart.CanCollide = true 
end) 
end)

section1:Slider("步行速度", "", 500, 16, function(g)
ws = g 
end)

section1:Slider("跳跃力量", "", 500, 50, function(f)
jp = f
end)

section1:Toggle("环线步行速度", "", function(uwu)
uwubaka = uwu 
while uwubaka and task.wait() do 
pcall(function()
plr.Character.Humanoid.WalkSpeed = ws
end)
end 
end)

section1:Toggle("环路跳跃", "", function(uwuw)
uwubakaw = uwuw
while uwubakaw and task.wait() do 
pcall(function()
plr.Character.Humanoid.JumpPower = jp 
end)
end 
end)

section6:Toggle("杀戮光环（最近的", "", function(ora)
dora = ora 
while dora and task.wait() do 
pcall(function()
game:GetService("ReplicatedStorage").Remotes.ShootRemote:FireServer({getclosestplayer().Character.Head.Position.x, getclosestplayer().Character.Head.Position.y + .5, getclosestplayer().Character.Head.Position.z}, getclosestplayer().Character.Head)
end) 
end 
end)

section6:Toggle("杀死光环（最接近鼠标", "", function(orea)
dorea = orea 
while dorea and task.wait() do 
pcall(function()
game:GetService("ReplicatedStorage").Remotes.ShootRemote:FireServer({getclosestplayertomouse().Character.Head.Position.x, getclosestplayertomouse().Character.Head.Position.y + .5, getclosestplayertomouse().Character.Head.Position.z}, getclosestplayertomouse().Character.Head)
end) 
end 
end)

section6:Keybind("鼠标中", "", Enum.KeyCode.F, function()
mousemoveabs(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
end)

section6:Toggle("环路包含附近的SCPS（需要V-7", "", function(qot)
qor = qot 
while qor and task.wait() do 
pcall(function()
for i,v in pairs(game.Workspace.SCPs:GetChildren()) do 
game:GetService("ReplicatedStorage").Remotes.Update:FireServer(v)
end 
end)
end 
end)

section6:Toggle("杀了玩家", "", function(agsa)
rete = agsa
while rete and task.wait(.1) do 
pcall(function()
print(getclosestplayertomouse())
game:GetService("ReplicatedStorage").Remotes.ShootRemote:FireServer({game.Players[xrop].Character.Head.Position.x, game.Players[xrop].Character.Head.Position.y + .5, game.Players[xrop].Character.Head.Position.z}, game.Players[xrop].Character.Head)
end)
end 
end)

section7:Toggle("球员亮点", "", function(iroq)
iraq = iroq 
while iraq and task.wait() do 
pcall(function()
for i,v in pairs(game.Players:GetPlayers()) do 
if v.Character and v.Character:FindFirstChildOfClass("Highlight") and v.Character:FindFirstChildOfClass("Highlight").Enabled == false then
v.Character:FindFirstChildOfClass("Highlight").Enabled = true 
end 
end 
end) 
end 
end) 

section7:Toggle("球员姓名标签", "", function(irorq)
irarq = irorq 
while irarq and task.wait() do 
pcall(function()
for i,v in pairs(game.Players:GetPlayers()) do 
if v.Character and v.Character:FindFirstChildOfClass("BillboardGui") and v.Character:FindFirstChildOfClass("BillboardGui").Enabled == false then
v.Character:FindFirstChildOfClass("BillboardGui").Enabled = true 
end 
end 
end) 
end 
end) 

section7:Toggle("SCP亮点", "", function(iroqrr)
iraqrr = iroqrr
while iraqrr and task.wait() do 
pcall(function()
for i,v in pairs(game.Workspace.SCPs:GetChildren()) do 
if v:IsA("Model") and v:FindFirstChildOfClass("Highlight") and v:FindFirstChildOfClass("Highlight").Enabled == false then 
v:FindFirstChildOfClass("Highlight").Enabled = true 
elseif v:IsA("Folder") and v:FindFirstChild("096"):FindFirstChildOfClass("Highlight") and v:FindFirstChild("096"):FindFirstChildOfClass("Highlight").Enabled == false then  
v:FindFirstChild("096"):FindFirstChildOfClass("Highlight").Enabled = true
end 
end
end) 
end 
end) 

section7:Toggle("SCP名称标签", "", function(qirorq)
qirarq = qirorq 
while qirarq and task.wait() do 
pcall(function()
for i,v in pairs(game.Workspace.SCPs:GetChildren()) do 
if v:IsA("Model") and v:FindFirstChildOfClass("BillboardGui") and v.Name ~= "SCP-966" and v.Name ~= "SCP-131" and v:FindFirstChildOfClass("BillboardGui").Enabled == false then 
v:FindFirstChildOfClass("BillboardGui").Enabled = true 
elseif v:IsA("Folder") and v:FindFirstChild("096"):FindFirstChildOfClass("BillboardGui") and v:FindFirstChild("096"):FindFirstChildOfClass("BillboardGui").Enabled == false then  
v:FindFirstChild("096"):FindFirstChildOfClass("BillboardGui").Enabled = true 
elseif (v.Name == "SCP-966" or v.Name == "SCP-131") and v:IsA("Model") then 
for o,k in pairs(v:GetChildren()) do 
if k:IsA("Model") and k:FindFirstChildOfClass("BillboardGui") and k:FindFirstChildOfClass("BillboardGui").Enabled == false then 
k:FindFirstChildOfClass("BillboardGui").Enabled = true
end 
end
end 
end
end) 
end 
end) 

section7:Button("禁用播放器亮点", "", function()
pcall(function()
for i,v in pairs(game.Players:GetPlayers()) do 
if v.Character and v.Character:FindFirstChildOfClass("Highlight") and v.Character:FindFirstChildOfClass("Highlight").Enabled then
v.Character:FindFirstChildOfClass("Highlight").Enabled = false
end 
end 
end)
end)

section7:Button("禁用玩家姓名标签", "", function()
pcall(function()
for i,v in pairs(game.Players:GetPlayers()) do 
if v.Character and v.Character:FindFirstChildOfClass("BillboardGui") and v.Character:FindFirstChildOfClass("BillboardGui").Enabled then
v.Character:FindFirstChildOfClass("BillboardGui").Enabled = false
end 
end 
end)
end)

section7:Button("禁用SCP亮点", "", function()
pcall(function()
for i,v in pairs(game.Workspace.SCPs:GetChildren()) do 
if v:IsA("Model") and v:FindFirstChildOfClass("Highlight") and v:FindFirstChildOfClass("Highlight").Enabled then 
v:FindFirstChildOfClass("Highlight").Enabled = false
elseif v:IsA("Folder") and v:FindFirstChild("096"):FindFirstChildOfClass("Highlight") and v:FindFirstChild("096"):FindFirstChildOfClass("Highlight").Enabled then  
v:FindFirstChild("096"):FindFirstChildOfClass("Highlight").Enabled = false
end 
end
end)
end)

section7:Button("禁用SCP名称标签", "", function()
pcall(function()
for i,v in pairs(game.Workspace.SCPs:GetChildren()) do 
if v:IsA("Model") and v:FindFirstChildOfClass("BillboardGui") and v.Name ~= "SCP-966" and v.Name ~= "SCP-131" and v:FindFirstChildOfClass("BillboardGui").Enabled then 
v:FindFirstChildOfClass("BillboardGui").Enabled = false
elseif v:IsA("Folder") and v:FindFirstChild("096"):FindFirstChildOfClass("BillboardGui") and v:FindFirstChild("096"):FindFirstChildOfClass("BillboardGui").Enabled then  
v:FindFirstChild("096"):FindFirstChildOfClass("BillboardGui").Enabled = false
elseif (v.Name == "SCP-966" or v.Name == "SCP-131") and v:IsA("Model") then 
for o,k in pairs(v:GetChildren()) do 
if k:IsA("Model") and k:FindFirstChildOfClass("BillboardGui") and k:FindFirstChildOfClass("BillboardGui").Enabled then 
k:FindFirstChildOfClass("BillboardGui").Enabled = false
end 
end
end 
end
end)
end)

local xxxvid = section6:Dropdown("选择玩家", "", players, function(xeg)
xrop = xeg 
end) 

section6:Button("刷新玩家", "", function()
pcall(function()
table.clear(players)
for i,v in pairs(game.Players:GetPlayers()) do 
if v ~= plr and (not table.find(players, v.Name)) then 
table.insert(players, v.Name)
end 
end
xxxvid:Refresh(players)
end)
end)

game:GetService("RunService").RenderStepped:Connect(function()
for i,v in pairs(game.Workspace.SCPs:GetChildren()) do 
    if v:IsA("Model") and (not v:FindFirstChildOfClass("Highlight")) then 
    PartGlow(v)
    elseif v:IsA("Folder") and (not v:FindFirstChild("096"):FindFirstChildOfClass("Highlight")) then  
    PartGlow(v:FindFirstChild("096"))
    end 
end
end)

game:GetService("RunService").RenderStepped:Connect(function()
for i,v in pairs(game.Workspace.SCPs:GetChildren()) do 
    if v:IsA("Model") and (not v:FindFirstChildOfClass("BillboardGui")) and v.Name ~= "SCP-966" and v.Name ~= "SCP-131" then 
    partnametag(v)
    elseif v:IsA("Folder") and (not v:FindFirstChild("096"):FindFirstChildOfClass("BillboardGui")) then  
    partnametag(v:FindFirstChild("096"))
    elseif (v.Name == "SCP-966" or v.Name == "SCP-131") and v:IsA("Model") then 
        for o,k in pairs(v:GetChildren()) do 
            if k:IsA("Model") and (not k:FindFirstChildOfClass("BillboardGui")) then 
                partnametag(k)
            end 
        end 
    end 
end
end)

local function charadded(player)
player.CharacterAdded:Connect(function()
Glow(player, player.TeamColor.Color)       
nametag(player)
end) 
end

for i,v in pairs(game.Players:GetPlayers()) do 
if v ~= game.Players.LocalPlayer then 
charadded(v)                                            
end 
end

for i,v in pairs(game.Players:GetPlayers()) do 
if v ~= game.Players.LocalPlayer and v.Character then 
Glow(v, v.TeamColor.Color)    
nametag(v)
end 
end

game.Players.PlayerAdded:Connect(function(p)
if p ~= game.Players.LocalPlayer then 
charadded(p)                                              
end 
end)

while task.wait() do 
for i,v in pairs(game.Players:GetPlayers()) do 
if v ~= plr and v.Character then 
for o,k in pairs(v.Character:GetChildren()) do 
if k:IsA("BasePart") and k.Name ~= "HumanoidRootPart" and k.Transparency > 0 then 
k.Transparency = 0 
end 
end 
end 
end 
end 

pcall(function()
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
v:Disable()
end
end)
end)