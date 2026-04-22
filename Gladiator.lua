-- Gladiator v3 | Key: GladiatorLimited12 | Toggle: RIGHT CTRL
-- Commands: .fly .esp .tp .heal .gladre .headsit .jerkoff .baseplate .iy etc.

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService     = game:GetService("TweenService")
local Lighting         = game:GetService("Lighting")
local StarterGui       = game:GetService("StarterGui")
local SoundService     = game:GetService("SoundService")
local TextChatService  = game:GetService("TextChatService")

local plr  = Players.LocalPlayer
local cam  = workspace.CurrentCamera
local function char()  return plr.Character end
local function hrp()   return char() and char():FindFirstChild("HumanoidRootPart") end
local function hum()   return char() and char():FindFirstChild("Humanoid") end

-- ════════════════════════════════════════════════
--   KEY SYSTEM
-- ════════════════════════════════════════════════
local VALID_KEY = "GladiatorLimited12"

local KSG = Instance.new("ScreenGui")
KSG.Name="GladiatorKeyGUI"; KSG.ResetOnSpawn=false
KSG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; KSG.IgnoreGuiInset=true
KSG.Parent=plr.PlayerGui

local KC=Color3.fromRGB
local KRED=KC(192,57,43); local KDARK_RED=KC(139,0,0); local KDEEP_RED=KC(26,0,0)
local KBLACK=KC(8,8,8); local KDARK=KC(14,14,14); local KMID=KC(28,28,28)
local KGREY=KC(80,80,80); local KWHITE=KC(220,220,220)
local KGREEN=KC(34,204,85); local KDARK_GREEN=KC(0,26,10)

local function knew(class,props,parent)
    local obj=Instance.new(class)
    for k,v in pairs(props) do obj[k]=v end
    if parent then obj.Parent=parent end
    return obj
end
local function ktw(obj,goal,t,style,dir)
    TweenService:Create(obj,TweenInfo.new(t or 0.25,style or Enum.EasingStyle.Quad,dir or Enum.EasingDirection.Out),goal):Play()
end
local function makeSword(parent,cx,cy,w,h,zi)
    zi=zi or 2; local bh=math.floor(h*0.58)
    local function df(p) p.Active=false;p.BorderSizePixel=0;p.ZIndex=zi;return knew("Frame",p,parent) end
    local blade=df({Size=UDim2.new(0,4,0,bh),Position=UDim2.new(0,cx-2,0,cy),BackgroundColor3=KRED})
    knew("UICorner",{CornerRadius=UDim.new(0,2)},blade)
    df({Size=UDim2.new(0,4,0,5),Position=UDim2.new(0,cx-2,0,cy-4),BackgroundColor3=KRED})
    local g=df({Size=UDim2.new(0,w,0,4),Position=UDim2.new(0,cx-math.floor(w/2),0,cy+bh-1),BackgroundColor3=KRED})
    knew("UICorner",{CornerRadius=UDim.new(0,2)},g)
    df({Size=UDim2.new(0,4,0,math.floor(h*0.28)),Position=UDim2.new(0,cx-2,0,cy+bh+3),BackgroundColor3=KGREY})
    local p=df({Size=UDim2.new(0,9,0,9),Position=UDim2.new(0,cx-4,0,cy+h-9),BackgroundColor3=KGREY})
    knew("UICorner",{CornerRadius=UDim.new(1,0)},p)
end

local Overlay=knew("Frame",{Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundColor3=KC(0,0,0),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=1},KSG)
local KF=knew("Frame",{Name="KeyCard",Size=UDim2.new(0,480,0,390),Position=UDim2.new(0.5,-240,0.5,-195),BackgroundColor3=KBLACK,BorderSizePixel=0,ZIndex=3},KSG)
knew("UICorner",{CornerRadius=UDim.new(0,14)},KF); knew("UIStroke",{Color=KDARK_RED,Thickness=2},KF)
knew("Frame",{Size=UDim2.new(1,0,0,4),BackgroundColor3=KRED,BorderSizePixel=0,ZIndex=4},KF)
local KHeader=knew("Frame",{Size=UDim2.new(1,0,0,115),Position=UDim2.new(0,0,0,4),BackgroundColor3=KDARK,BorderSizePixel=0,ZIndex=4},KF)
makeSword(KHeader,240,8,44,62,5)
local FlashLabel=knew("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.new(0,0,0,68),BackgroundTransparency=1,Text="GLADIATOR",TextColor3=KRED,TextSize=24,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=5},KHeader)
knew("TextLabel",{Size=UDim2.new(1,0,0,16),Position=UDim2.new(0,0,0,97),BackgroundTransparency=1,Text="KEY AUTHENTICATION SYSTEM",TextColor3=KGREY,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=5},KHeader)
knew("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,119),BackgroundColor3=KDARK_RED,BorderSizePixel=0,ZIndex=4},KF)
local SBadge=knew("Frame",{Size=UDim2.new(1,-48,0,36),Position=UDim2.new(0,24,0,132),BackgroundColor3=KMID,BorderSizePixel=0,ZIndex=4},KF)
knew("UICorner",{CornerRadius=UDim.new(0,8)},SBadge); knew("UIStroke",{Color=KDEEP_RED,Thickness=1},SBadge)
local SDot=knew("Frame",{Size=UDim2.new(0,10,0,10),Position=UDim2.new(0,14,0.5,-5),BackgroundColor3=KRED,BorderSizePixel=0,ZIndex=5},SBadge)
knew("UICorner",{CornerRadius=UDim.new(1,0)},SDot)
local SText=knew("TextLabel",{Size=UDim2.new(1,-36,1,0),Position=UDim2.new(0,34,0,0),BackgroundTransparency=1,Text="AWAITING AUTHENTICATION",TextColor3=KGREY,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=5},SBadge)
knew("TextLabel",{Size=UDim2.new(1,-48,0,16),Position=UDim2.new(0,24,0,182),BackgroundTransparency=1,Text="ENTER LICENSE KEY",TextColor3=KGREY,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=4},KF)
local KeyInput=knew("TextBox",{Size=UDim2.new(1,-48,0,44),Position=UDim2.new(0,24,0,202),BackgroundColor3=KMID,BorderSizePixel=0,Text="",PlaceholderText="Enter your key here...",PlaceholderColor3=KC(55,55,55),TextColor3=KWHITE,TextSize=14,Font=Enum.Font.Code,ClearTextOnFocus=false,ZIndex=6},KF)
knew("UICorner",{CornerRadius=UDim.new(0,8)},KeyInput); knew("UIStroke",{Color=KDARK_RED,Thickness=1.5},KeyInput); knew("UIPadding",{PaddingLeft=UDim.new(0,14)},KeyInput)
local AuthBtn=knew("TextButton",{Size=UDim2.new(1,-48,0,44),Position=UDim2.new(0,24,0,255),BackgroundColor3=KDARK_RED,BorderSizePixel=0,Text="AUTHENTICATE",TextColor3=KWHITE,TextSize=13,Font=Enum.Font.Code,AutoButtonColor=false,ZIndex=6},KF)
knew("UICorner",{CornerRadius=UDim.new(0,8)},AuthBtn); knew("UIStroke",{Color=KRED,Thickness=1.5},AuthBtn)
local ResultLabel=knew("TextLabel",{Size=UDim2.new(1,-48,0,52),Position=UDim2.new(0,24,0,308),BackgroundColor3=KDEEP_RED,BackgroundTransparency=1,BorderSizePixel=0,Text="",TextColor3=KRED,TextSize=11,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Center,TextWrapped=true,ZIndex=4},KF)
knew("UICorner",{CornerRadius=UDim.new(0,8)},ResultLabel)
knew("TextLabel",{Size=UDim2.new(1,0,0,24),Position=UDim2.new(0,0,1,-24),BackgroundColor3=KBLACK,BorderSizePixel=0,Text="GLADIATOR 2025  UNAUTHORIZED ACCESS PROHIBITED",TextColor3=KC(38,38,38),TextSize=9,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=4},KF)

local flashTick,flashState=0,false
local flashConn=RunService.Heartbeat:Connect(function(dt)
    flashTick+=dt
    if flashTick>=0.5 then
        flashTick=0; flashState=not flashState
        FlashLabel.TextColor3=flashState and KC(255,30,30) or KC(100,0,0)
        KF.BackgroundColor3=flashState and KC(16,0,0) or KBLACK
    end
end)

AuthBtn.MouseEnter:Connect(function() ktw(AuthBtn,{BackgroundColor3=KC(168,0,0)},0.12) end)
AuthBtn.MouseLeave:Connect(function() if AuthBtn.Text=="AUTHENTICATE" then ktw(AuthBtn,{BackgroundColor3=KDARK_RED},0.12) end end)
Overlay.BackgroundTransparency=1; KF.BackgroundTransparency=1
ktw(Overlay,{BackgroundTransparency=0.2},0.4); ktw(KF,{BackgroundTransparency=0},0.4)

AuthBtn.MouseButton1Click:Connect(function()
    local entered=KeyInput.Text
    if entered=="" then ResultLabel.BackgroundTransparency=0; ResultLabel.Text="NO KEY ENTERED"; ResultLabel.TextColor3=KRED; return end
    AuthBtn.Text="VERIFYING..."; AuthBtn.Active=false
    task.wait(1.2)
    if entered==VALID_KEY then
        flashConn:Disconnect(); KF.BackgroundColor3=KBLACK; FlashLabel.TextColor3=KGREEN
        SDot.BackgroundColor3=KGREEN; SText.Text="AUTHENTICATED"; SText.TextColor3=KGREEN
        ResultLabel.BackgroundTransparency=0; ResultLabel.BackgroundColor3=KDARK_GREEN
        ResultLabel.Text="ACCESS GRANTED - Welcome, Gladiator operative."; ResultLabel.TextColor3=KGREEN
        knew("UIStroke",{Color=KGREEN,Thickness=1},ResultLabel)
        AuthBtn.Text="AUTHENTICATED"; ktw(AuthBtn,{BackgroundColor3=KC(0,80,34)},0.2)
        task.wait(1.4)
        ktw(Overlay,{BackgroundTransparency=1},0.5); ktw(KF,{BackgroundTransparency=1},0.5)
        task.wait(0.6); KSG:Destroy(); loadMainGUI()
    else
        SDot.BackgroundColor3=KC(255,30,30); SText.Text="INVALID KEY"; SText.TextColor3=KC(255,80,80)
        ResultLabel.BackgroundTransparency=0; ResultLabel.BackgroundColor3=KDEEP_RED
        ResultLabel.Text="ACCESS DENIED - Invalid or expired key."; ResultLabel.TextColor3=KC(255,80,80)
        AuthBtn.Text="AUTHENTICATE"; AuthBtn.Active=true; ktw(AuthBtn,{BackgroundColor3=KDARK_RED},0.12)
    end
end)

-- ════════════════════════════════════════════════
--   MAIN GUI
-- ════════════════════════════════════════════════
function loadMainGUI()

local S={
    fly=false,speed=false,noclip=false,aimlock=false,esp=false,godmode=false,
    freeze=false,invisible=false,fullbright=false,inf_jump=false,antiafk=false,
    boxesp=false,tracers=false,nametags=false,ftp=false,headsit=false,jerkoff=false
}
local cfg={
    flySpeed=50,flyBoost=2,hover=false,walkSpeed=100,sprintMult=2,
    aimFOV=60,aimSmooth=5,aimHead=true,aimTeam=true,jumpPower=100,zoom=500,
    spamMsg="GLADIATOR",spamCount=5,espColor=Color3.fromRGB(255,0,0),
    notifs=true,fpsCounter=true,bpColor=Color3.fromRGB(50,50,50),
    jerkingEnabled=false,jerkingSpeed=0.6,jerkTimePosition=0.6,
    _jerkTrack=nil,_jerkAnim=nil
}

local flyConn,noclipConn,aimConn,jumpConn,afkConn,ftpConn
local tracerObjs,boxObjs,nameTagObjs,espHighlights={},{},{},{}
local origAmbient,origBright

local swordSound=Instance.new("Sound"); swordSound.SoundId="rbxassetid://12222246"; swordSound.Volume=1; swordSound.Parent=SoundService
local function playSword() swordSound:Play() end
local function notify(msg) if not cfg.notifs then return end; pcall(function() StarterGui:SetCore("SendNotification",{Title="Gladiator",Text=msg,Duration=2}) end) end

-- FLY
local function startFly()
    local h=hum(); if h then h.PlatformStand=true end
    local r=hrp(); if not r then return end
    local bg=Instance.new("BodyGyro",r); bg.Name="_GBG"; bg.MaxTorque=Vector3.new(1e9,1e9,1e9); bg.P=1e5
    local bv=Instance.new("BodyVelocity",r); bv.Name="_GBV"; bv.MaxForce=Vector3.new(1e9,1e9,1e9); bv.Velocity=Vector3.zero
    flyConn=RunService.Heartbeat:Connect(function()
        local spd=cfg.flySpeed; local vel=Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel+=cam.CFrame.LookVector*spd end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel-=cam.CFrame.LookVector*spd end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel-=cam.CFrame.RightVector*spd end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel+=cam.CFrame.RightVector*spd end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel+=Vector3.new(0,spd,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vel-=Vector3.new(0,spd,0) end
        bv.Velocity=vel; bg.CFrame=cam.CFrame
    end)
end
local function stopFly()
    if flyConn then flyConn:Disconnect(); flyConn=nil end
    local r=hrp(); if r then
        local bg=r:FindFirstChild("_GBG"); if bg then bg:Destroy() end
        local bv=r:FindFirstChild("_GBV"); if bv then bv:Destroy() end
    end
    local h=hum(); if h then h.PlatformStand=false end
end

local function applySpeed(on) local h=hum(); if not h then return end; h.WalkSpeed=on and cfg.walkSpeed or 16 end

local function startNoclip()
    noclipConn=RunService.Stepped:Connect(function()
        local c=char(); if not c then return end
        for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end
    end)
end
local function stopNoclip()
    if noclipConn then noclipConn:Disconnect(); noclipConn=nil end
    local c=char(); if not c then return end
    for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=true end end
end

local function startAimlock()
    aimConn=RunService.RenderStepped:Connect(function()
        if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
        local best,bestDist=nil,cfg.aimFOV
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=plr and p.Character then
                local tgt=cfg.aimHead and p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("HumanoidRootPart")
                if tgt then
                    local sp,onScreen=cam:WorldToScreenPoint(tgt.Position)
                    if onScreen then
                        local center=Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)
                        local d=(Vector2.new(sp.X,sp.Y)-center).Magnitude
                        if d<bestDist then bestDist=d; best=tgt end
                    end
                end
            end
        end
        if best then cam.CFrame=CFrame.new(cam.CFrame.Position,best.Position) end
    end)
end
local function stopAimlock() if aimConn then aimConn:Disconnect(); aimConn=nil end end

local function refreshESP()
    for _,h in ipairs(espHighlights) do pcall(function() h:Destroy() end) end; espHighlights={}
    if not S.esp then return end
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=plr and p.Character then
            pcall(function()
                local hl=Instance.new("Highlight"); hl.FillColor=cfg.espColor; hl.OutlineColor=cfg.espColor
                hl.FillTransparency=0.6; hl.OutlineTransparency=0; hl.Adornee=p.Character; hl.Parent=p.Character
                table.insert(espHighlights,hl)
            end)
        end
    end
end

local boxConn
local function clearBoxESP() for _,b in ipairs(boxObjs) do pcall(function() b:Destroy() end) end; boxObjs={} end
local function startBoxESP()
    clearBoxESP()
    boxConn=RunService.Heartbeat:Connect(function()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=plr and p.Character then
                local torso=p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("Torso")
                if torso then
                    local found=false; for _,b in ipairs(boxObjs) do if b and b.Adornee==torso then found=true; break end end
                    if not found then pcall(function()
                        local sb=Instance.new("SelectionBox"); sb.Color3=cfg.espColor; sb.LineThickness=0.05
                        sb.SurfaceTransparency=0.85; sb.SurfaceColor3=cfg.espColor; sb.Adornee=torso; sb.Parent=workspace
                        table.insert(boxObjs,sb)
                    end) end
                end
            end
        end
        local newList={}
        for _,b in ipairs(boxObjs) do
            if b and b.Parent and b.Adornee and b.Adornee.Parent then table.insert(newList,b)
            else pcall(function() b:Destroy() end) end
        end; boxObjs=newList
    end)
end
local function stopBoxESP() if boxConn then boxConn:Disconnect(); boxConn=nil end; clearBoxESP() end

local tracerConn
local function clearTracers() for _,b in ipairs(tracerObjs) do pcall(function() b:Destroy() end) end; tracerObjs={} end
local function startTracers()
    clearTracers()
    tracerConn=RunService.RenderStepped:Connect(function()
        clearTracers()
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=plr and p.Character then
                local r=p.Character:FindFirstChild("HumanoidRootPart"); if r then
                    pcall(function()
                        local lha=Instance.new("LineHandleAdornment"); lha.Color3=cfg.espColor; lha.Thickness=2
                        lha.CFrame=CFrame.new(cam.CFrame.Position,r.Position)
                        lha.Length=(r.Position-cam.CFrame.Position).Magnitude
                        lha.Adornee=workspace.Terrain; lha.Parent=workspace; table.insert(tracerObjs,lha)
                    end)
                end
            end
        end
    end)
end
local function stopTracers() if tracerConn then tracerConn:Disconnect(); tracerConn=nil end; clearTracers() end

local nameTagConn
local function clearNameTags() for _,b in ipairs(nameTagObjs) do pcall(function() b:Destroy() end) end; nameTagObjs={} end
local function addNameTag(p,c)
    pcall(function()
        local hrpPart=c:FindFirstChild("HumanoidRootPart"); if not hrpPart then return end
        local bg=Instance.new("BillboardGui"); bg.Name="_GNameTag"; bg.Adornee=hrpPart
        bg.Size=UDim2.new(0,120,0,28); bg.StudsOffset=Vector3.new(0,3.5,0); bg.AlwaysOnTop=true; bg.Parent=hrpPart
        local l=Instance.new("TextLabel",bg); l.Size=UDim2.new(1,0,1,0); l.BackgroundTransparency=1; l.Text=p.Name
        l.TextColor3=cfg.espColor; l.TextSize=15; l.Font=Enum.Font.GothamBold
        l.TextStrokeTransparency=0; l.TextStrokeColor3=Color3.new(0,0,0); table.insert(nameTagObjs,bg)
    end)
end
local function startNameTags()
    clearNameTags()
    for _,p in ipairs(Players:GetPlayers()) do if p~=plr and p.Character then addNameTag(p,p.Character) end end
    nameTagConn=Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function(c) task.wait(1); if S.nametags then addNameTag(p,c) end end)
    end)
end
local function stopNameTags() clearNameTags(); if nameTagConn then nameTagConn:Disconnect(); nameTagConn=nil end end

local function setGodmode(on) local h=hum(); if not h then return end; h.MaxHealth=on and math.huge or 100; h.Health=on and math.huge or 100 end
local function setFreeze(on)
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=plr and p.Character then
            local r=p.Character:FindFirstChild("HumanoidRootPart"); if r then
                if on then local bp=Instance.new("BodyPosition",r); bp.Name="_GFZ"; bp.Position=r.Position; bp.MaxForce=Vector3.new(1e9,1e9,1e9)
                else local bp=r:FindFirstChild("_GFZ"); if bp then bp:Destroy() end end
            end
        end
    end
end
local function setInvisible(on)
    local c=char(); if not c then return end
    for _,p in ipairs(c:GetDescendants()) do if p:IsA("BasePart") or p:IsA("Decal") then p.LocalTransparencyModifier=on and 1 or 0 end end
end
local function setFullbright(on)
    if on then origAmbient=Lighting.Ambient; origBright=Lighting.Brightness; Lighting.Ambient=Color3.new(1,1,1); Lighting.Brightness=2
    else Lighting.Ambient=origAmbient or Color3.new(0,0,0); Lighting.Brightness=origBright or 1 end
end

local function startInfJump()
    jumpConn=UserInputService.JumpRequest:Connect(function()
        local h=hum(); if h then h.JumpPower=cfg.jumpPower; h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end
local function stopInfJump() if jumpConn then jumpConn:Disconnect(); jumpConn=nil end; local h=hum(); if h then h.JumpPower=50 end end

local function startAntiAfk()
    local VU=game:GetService("VirtualUser")
    afkConn=plr.Idled:Connect(function() VU:CaptureController(); VU:ClickButton2(Vector2.new()) end)
end
local function stopAntiAfk() if afkConn then afkConn:Disconnect(); afkConn=nil end end

local function startFTP()
    ftpConn=UserInputService.InputBegan:Connect(function(inp,gp)
        if gp then return end
        if inp.KeyCode==Enum.KeyCode.F then
            local myHRP=hrp(); if not myHRP then return end
            local mouse=plr:GetMouse()
            local unitRay=cam:ScreenPointToRay(mouse.X,mouse.Y)
            local rp=RaycastParams.new(); rp.FilterType=Enum.RaycastFilterType.Exclude
            if char() then rp.FilterDescendantsInstances={char()} end
            local result=workspace:Raycast(unitRay.Origin,unitRay.Direction*2000,rp)
            if result then
                local pos=result.Position+Vector3.new(0,3,0)
                myHRP.CFrame=CFrame.new(pos,pos+cam.CFrame.LookVector)
            else
                local pos=unitRay.Origin+unitRay.Direction*50
                myHRP.CFrame=CFrame.new(pos,pos+cam.CFrame.LookVector)
            end
            playSword(); notify("FTP -> Mouse position")
        end
    end)
end
local function stopFTP() if ftpConn then ftpConn:Disconnect(); ftpConn=nil end end

local function doHeal() local h=hum(); if h then h.Health=h.MaxHealth end end
local function doKill() local h=hum(); if h then h.Health=0 end end
local function doRejoin() game:GetService("TeleportService"):Teleport(game.PlaceId,plr) end
local function doFPSBoost() settings().Rendering.QualityLevel=1 end
local function doZoom() plr.CameraMaxZoomDistance=cfg.zoom end

local function doGladRe()
    local r=hrp(); if not r then return end
    local savedCF=r.CFrame
    local conn; conn=plr.CharacterAdded:Connect(function(newChar)
        conn:Disconnect()
        local newHRP=newChar:WaitForChild("HumanoidRootPart",5)
        if newHRP then
            newHRP.CFrame=savedCF
            local bp=Instance.new("BodyPosition",newHRP)
            bp.Position=savedCF.Position; bp.MaxForce=Vector3.new(1e9,1e9,1e9); bp.P=1e5
            task.delay(0.15,function() bp:Destroy() end)
        end
    end)
    plr:LoadCharacter()
end

local function doChatSpam(msg,count)
    local m=msg~="" and msg or "GLADIATOR"
    pcall(function()
        local ch=TextChatService.TextChannels:FindFirstChild("RBXGeneral")
        if ch then for i=1,count do task.delay(i*0.35,function() ch:SendAsync(m) end) end end
    end)
    pcall(function()
        local ev=game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if ev then ev=ev:FindFirstChild("SayMessageRequest") end
        if ev then for i=1,count do task.delay(i*0.35,function() ev:FireServer(m,"All") end) end end
    end)
end

local function doTeleport(name)
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=plr and p.Name:lower():find(name:lower(),1,true) then
            local r=hrp(); local tr=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
            if r and tr then r.CFrame=tr.CFrame+Vector3.new(3,0,0); return true end
        end
    end
    return false
end

-- BASEPLATE helper
local function doCreateBaseplate()
    local old=workspace:FindFirstChild("TERRAIN_EDITOR"); if old then old:Destroy() end
    local col=cfg.bpColor
    local maxPart=2048; local divX=math.ceil(40000/maxPart); local divZ=math.ceil(40000/maxPart)
    local pSX=40000/divX; local pSZ=40000/divZ
    local folder=Instance.new("Folder"); folder.Name="TERRAIN_EDITOR"; folder.Parent=workspace
    for i=0,divX-1 do
        local ox=(i-(divX/2))*pSX+(pSX/2)
        for j=0,divZ-1 do
            local oz=(j-(divZ/2))*pSZ+(pSZ/2)
            local part=Instance.new("Part"); part.Size=Vector3.new(pSX,5,pSZ)
            part.Position=Vector3.new(ox,0,oz); part.Anchored=true
            part.Material=Enum.Material.Asphalt; part.Color=col
            part.Transparency=0; part.Parent=folder
        end
    end
end
local function doDestroyBaseplate()
    local f=workspace:FindFirstChild("TERRAIN_EDITOR"); if f then f:Destroy() end
end

-- ════════════════════════════════════════════════
--   GUI CONSTRUCTION
-- ════════════════════════════════════════════════
local gui=Instance.new("ScreenGui"); gui.Name="GladiatorV3"; gui.ResetOnSpawn=false
gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; gui.Parent=plr.PlayerGui

local C=Color3.fromRGB; local RED=C(192,57,43); local LIME=C(0,255,70)

local function frame(p,s,pos,bg)
    local f=Instance.new("Frame",p); f.Size=s; f.Position=pos or UDim2.new(0,0,0,0)
    f.BackgroundColor3=bg or C(10,10,10); f.BorderSizePixel=0; return f
end
local function corner(p,r) local c=Instance.new("UICorner",p); c.CornerRadius=UDim.new(0,r or 6); return c end
local function stroke(p,col,th) local s=Instance.new("UIStroke",p); s.Color=col; s.Thickness=th or 1; return s end
local function lbl(p,txt,size,col,xa)
    local l=Instance.new("TextLabel",p); l.BackgroundTransparency=1; l.Text=txt
    l.TextColor3=col or C(204,204,204); l.TextSize=size or 12; l.Font=Enum.Font.Code
    l.TextXAlignment=xa or Enum.TextXAlignment.Left; l.Size=UDim2.new(1,0,1,0); return l
end
local function mkbtn(p,txt,size,col)
    local b=Instance.new("TextButton",p); b.BackgroundColor3=C(17,17,17); b.TextColor3=col or RED
    b.Text=txt; b.TextSize=size or 11; b.Font=Enum.Font.Code; b.BorderSizePixel=0
    b.AutoButtonColor=false; b.Size=UDim2.new(0,70,0,22); corner(b,4); stroke(b,C(139,0,0))
    b.MouseEnter:Connect(function() b.BackgroundColor3=C(42,0,0) end)
    b.MouseLeave:Connect(function() b.BackgroundColor3=C(17,17,17) end); return b
end
local function textbox(p,ph)
    local tb=Instance.new("TextBox",p); tb.BackgroundColor3=C(17,17,17); tb.TextColor3=C(204,204,204)
    tb.PlaceholderText=ph or ""; tb.PlaceholderColor3=C(68,68,68); tb.Text=""
    tb.TextSize=11; tb.Font=Enum.Font.Code; tb.ClearTextOnFocus=false; tb.BorderSizePixel=0
    corner(tb,4); stroke(tb,C(42,0,0)); return tb
end

local Main=frame(gui,UDim2.new(0,390,0,548),UDim2.new(0.5,-195,1.5,0))
Main.Active=true; Main.Draggable=true; corner(Main,10); stroke(Main,C(139,0,0),1.5)
TweenService:Create(Main,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-195,0.5,-274)}):Play()

local TopBar=frame(Main,UDim2.new(1,0,0,36)); TopBar.BackgroundColor3=C(17,17,17); corner(TopBar,10)
frame(TopBar,UDim2.new(1,0,0,10),UDim2.new(0,0,1,-10),C(17,17,17))
local swordLbl=Instance.new("TextLabel",TopBar); swordLbl.Size=UDim2.new(0,24,0,24); swordLbl.Position=UDim2.new(0,8,0.5,-12); swordLbl.BackgroundTransparency=1; swordLbl.Text="*"; swordLbl.TextColor3=RED; swordLbl.TextSize=18; swordLbl.Font=Enum.Font.Code
local nameL=lbl(TopBar,"GLADIATOR",13,C(224,224,224)); nameL.Position=UDim2.new(0,34,0,0); nameL.Size=UDim2.new(0,110,1,0)
local fpsBadge=frame(TopBar,UDim2.new(0,76,0,20),UDim2.new(1,-185,0.5,-10),C(0,26,0)); corner(fpsBadge,3); stroke(fpsBadge,C(0,139,0))
local fpsL=lbl(fpsBadge,"FPS 76",11,LIME); fpsL.TextXAlignment=Enum.TextXAlignment.Center
local pingBadge=frame(TopBar,UDim2.new(0,76,0,20),UDim2.new(1,-105,0.5,-10),C(26,0,0)); corner(pingBadge,3); stroke(pingBadge,C(51,51,51))
local pingL=lbl(pingBadge,"PING 25ms",11,C(136,136,136)); pingL.TextXAlignment=Enum.TextXAlignment.Center
local closeBtn=Instance.new("TextButton",TopBar); closeBtn.Size=UDim2.new(0,22,0,22); closeBtn.Position=UDim2.new(1,-30,0.5,-11); closeBtn.BackgroundColor3=C(58,0,0); closeBtn.TextColor3=RED; closeBtn.Text="x"; closeBtn.TextSize=12; closeBtn.Font=Enum.Font.Code; closeBtn.BorderSizePixel=0; corner(closeBtn,4); stroke(closeBtn,C(139,0,0)); closeBtn.AutoButtonColor=false
closeBtn.MouseButton1Click:Connect(function() Main.Visible=false end)

local SubBar=frame(Main,UDim2.new(1,0,0,28),UDim2.new(0,0,0,36),C(15,15,15))
local swordSub=Instance.new("TextLabel",SubBar); swordSub.Size=UDim2.new(0,100,1,0); swordSub.Position=UDim2.new(0,8,0,0); swordSub.BackgroundTransparency=1; swordSub.Text="* GLADIATOR"; swordSub.TextColor3=RED; swordSub.TextSize=11; swordSub.Font=Enum.Font.Code; swordSub.TextXAlignment=Enum.TextXAlignment.Left

local tabData={{"Cmds","cmds"},{"ESP","esp"},{"Misc","misc"},{"Cfg","cfg"}}
local tabBtns={}
for i,td in ipairs(tabData) do
    local tb=Instance.new("TextButton",SubBar); tb.Size=UDim2.new(0,30,0,20); tb.Position=UDim2.new(1,-32*(5-i)-8,0.5,-10)
    tb.BackgroundTransparency=1; tb.Text=td[1]; tb.TextSize=10; tb.Font=Enum.Font.Code
    tb.TextColor3=i==1 and RED or C(68,68,68); tb.BorderSizePixel=0; tb.AutoButtonColor=false; tabBtns[td[2]]=tb
end

local Body=frame(Main,UDim2.new(1,-24,0,468),UDim2.new(0,12,0,68)); Body.BackgroundTransparency=1
local StatBar=frame(Main,UDim2.new(1,0,0,24),UDim2.new(0,0,1,-24),C(10,10,10))
frame(StatBar,UDim2.new(1,0,0,1),nil,C(26,0,0))
local statL=lbl(StatBar,"Ready",10,C(85,85,85)); statL.Position=UDim2.new(0,12,0,0)
local statDot=frame(StatBar,UDim2.new(0,6,0,6),UDim2.new(1,-14,0.5,-3),RED); corner(statDot,99)
local function setStatus(msg,ok)
    statL.Text=msg; statDot.BackgroundColor3=ok and C(0,200,80) or RED
    task.delay(2,function() statDot.BackgroundColor3=RED end)
end

local tabs={}
local function makeTab(name) local t=frame(Body,UDim2.new(1,0,1,0),nil); t.BackgroundTransparency=1; t.Visible=(name=="cmds"); tabs[name]=t; return t end
local function switchTab(name) for n,t in pairs(tabs) do t.Visible=(n==name) end; for n,tb in pairs(tabBtns) do tb.TextColor3=(n==name) and RED or C(68,68,68) end end
for _,td in ipairs(tabData) do tabBtns[td[2]].MouseButton1Click:Connect(function() switchTab(td[2]) end) end

local function makePanelFrame(parent)
    local pf=frame(parent,UDim2.new(1,0,0,10),nil,C(14,14,14)); pf.AutomaticSize=Enum.AutomaticSize.Y; corner(pf,6); stroke(pf,C(42,0,0))
    local pad=Instance.new("UIPadding",pf); pad.PaddingTop=UDim.new(0,10); pad.PaddingBottom=UDim.new(0,10); pad.PaddingLeft=UDim.new(0,10); pad.PaddingRight=UDim.new(0,10)
    Instance.new("UIListLayout",pf).Padding=UDim.new(0,8); pf.Visible=false; return pf
end
local function makeSliderRow(parent,labelTxt,minV,maxV,defaultV,unit,onChange)
    local row=frame(parent,UDim2.new(1,0,0,22),nil); row.BackgroundTransparency=1
    lbl(row,labelTxt,11,C(153,153,153)).Size=UDim2.new(0,75,1,0)
    local sl=Instance.new("TextButton",row); sl.Size=UDim2.new(1,-120,1,-4); sl.Position=UDim2.new(0,78,0.5,-9); sl.BackgroundColor3=C(42,0,0); sl.BorderSizePixel=0; sl.Text=""; corner(sl,2); sl.AutoButtonColor=false
    local fill=frame(sl,UDim2.new((defaultV-minV)/(maxV-minV),0,1,0),nil,RED); corner(fill,2)
    local valL=lbl(row,tostring(defaultV)..(unit or ""),11,C(255,68,68)); valL.Size=UDim2.new(0,36,1,0); valL.Position=UDim2.new(1,-36,0,0); valL.TextXAlignment=Enum.TextXAlignment.Right
    local dragging=false
    sl.MouseButton1Down:Connect(function() dragging=true end)
    UserInputService.InputEnded:Connect(function(inp) if inp.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType==Enum.UserInputType.MouseMovement then
            local rel=math.clamp((inp.Position.X-sl.AbsolutePosition.X)/sl.AbsoluteSize.X,0,1)
            local val=math.floor(minV+(maxV-minV)*rel); fill.Size=UDim2.new(rel,0,1,0); valL.Text=tostring(val)..(unit or ""); if onChange then onChange(val) end
        end
    end)
    return row
end
local function makeToggleRow(parent,labelTxt,default,onChange)
    local row=frame(parent,UDim2.new(1,0,0,20),nil); row.BackgroundTransparency=1
    lbl(row,labelTxt,11,C(170,170,170)).Size=UDim2.new(1,-44,1,0)
    local tog=Instance.new("TextButton",row); tog.Size=UDim2.new(0,32,0,16); tog.Position=UDim2.new(1,-32,0.5,-8); tog.BorderSizePixel=0; corner(tog,8); tog.AutoButtonColor=false; tog.Text=""; local isOn=default or false
    local function refresh() tog.BackgroundColor3=isOn and C(139,0,0) or C(26,0,0) end; refresh()
    tog.MouseButton1Click:Connect(function() isOn=not isOn; refresh(); if onChange then onChange(isOn) end end)
    return row
end
local function makeSep(parent) return frame(parent,UDim2.new(1,0,0,1),nil,C(31,0,0)) end

-- ════════════════════════════════════════════════
--   TP PICKER GUI
-- ════════════════════════════════════════════════
local tpGuiOpen=false
local function openTPGui()
    if tpGuiOpen then return end; tpGuiOpen=true
    local tpSG=Instance.new("ScreenGui",plr.PlayerGui); tpSG.Name="_GTpGui"; tpSG.ResetOnSpawn=false; tpSG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
    local backdrop=Instance.new("TextButton",tpSG); backdrop.Size=UDim2.new(1,0,1,0); backdrop.BackgroundColor3=C(0,0,0); backdrop.BackgroundTransparency=0.45; backdrop.BorderSizePixel=0; backdrop.Text=""; backdrop.AutoButtonColor=false; backdrop.ZIndex=2
    local card=Instance.new("Frame",tpSG); card.Size=UDim2.new(0,330,0,460); card.BackgroundColor3=C(10,10,10); card.BorderSizePixel=0; card.Position=UDim2.new(0.5,-165,1.5,0); card.ZIndex=3; corner(card,10); stroke(card,C(139,0,0),1.5)
    TweenService:Create(card,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-165,0.5,-230)}):Play()
    local strip=Instance.new("Frame",card); strip.Size=UDim2.new(1,0,0,4); strip.BackgroundColor3=RED; strip.BorderSizePixel=0; strip.ZIndex=4
    local topbar=frame(card,UDim2.new(1,0,0,34),UDim2.new(0,0,0,4),C(17,17,17)); topbar.ZIndex=4
    local titl=Instance.new("TextLabel",topbar); titl.Size=UDim2.new(1,-80,1,0); titl.Position=UDim2.new(0,12,0,0); titl.BackgroundTransparency=1; titl.Text="TELEPORT TO PLAYER"; titl.TextColor3=RED; titl.TextSize=11; titl.Font=Enum.Font.GothamBold; titl.TextXAlignment=Enum.TextXAlignment.Left; titl.ZIndex=5
    local countBadge=frame(topbar,UDim2.new(0,44,0,20),UDim2.new(1,-70,0.5,-10),C(26,0,0)); countBadge.ZIndex=5; corner(countBadge,4); stroke(countBadge,C(80,0,0))
    local countTxt=Instance.new("TextLabel",countBadge); countTxt.Size=UDim2.new(1,0,1,0); countTxt.BackgroundTransparency=1; countTxt.TextColor3=RED; countTxt.TextSize=9; countTxt.Font=Enum.Font.GothamBold; countTxt.TextXAlignment=Enum.TextXAlignment.Center; countTxt.ZIndex=6; countTxt.Text="0 players"
    local xBtn=Instance.new("TextButton",topbar); xBtn.Size=UDim2.new(0,22,0,22); xBtn.Position=UDim2.new(1,-28,0.5,-11); xBtn.BackgroundColor3=C(58,0,0); xBtn.TextColor3=RED; xBtn.Text="x"; xBtn.TextSize=12; xBtn.Font=Enum.Font.Code; xBtn.BorderSizePixel=0; xBtn.AutoButtonColor=false; xBtn.ZIndex=5; corner(xBtn,4); stroke(xBtn,C(139,0,0))
    local refreshConn
    local function closeGui()
        tpGuiOpen=false; if refreshConn then refreshConn:Disconnect() end
        TweenService:Create(card,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Position=UDim2.new(0.5,-165,1.5,0)}):Play()
        task.delay(0.3,function() tpSG:Destroy() end)
    end
    xBtn.MouseButton1Click:Connect(closeGui); backdrop.MouseButton1Click:Connect(closeGui)
    local srchWrap=frame(card,UDim2.new(1,-24,0,30),UDim2.new(0,12,0,44),C(20,20,20)); srchWrap.ZIndex=4; corner(srchWrap,6); stroke(srchWrap,C(50,0,0))
    local magLbl=Instance.new("TextLabel",srchWrap); magLbl.Size=UDim2.new(0,22,1,0); magLbl.BackgroundTransparency=1; magLbl.Text="~"; magLbl.TextColor3=C(80,80,80); magLbl.TextSize=13; magLbl.Font=Enum.Font.GothamBold; magLbl.TextXAlignment=Enum.TextXAlignment.Center; magLbl.ZIndex=5
    local srch=Instance.new("TextBox",srchWrap); srch.Size=UDim2.new(1,-26,1,0); srch.Position=UDim2.new(0,24,0,0); srch.BackgroundTransparency=1; srch.PlaceholderText="Search by name..."; srch.PlaceholderColor3=C(55,55,55); srch.Text=""; srch.TextColor3=C(210,210,210); srch.TextSize=11; srch.Font=Enum.Font.Code; srch.ClearTextOnFocus=false; srch.BorderSizePixel=0; srch.ZIndex=5
    frame(card,UDim2.new(1,-24,0,1),UDim2.new(0,12,0,80),C(30,0,0)).ZIndex=4
    local listScroll=Instance.new("ScrollingFrame",card); listScroll.Size=UDim2.new(1,-18,0,346); listScroll.Position=UDim2.new(0,8,0,86); listScroll.BackgroundTransparency=1; listScroll.BorderSizePixel=0; listScroll.ScrollBarThickness=4; listScroll.ScrollBarImageColor3=C(100,0,0); listScroll.CanvasSize=UDim2.new(0,0,0,0); listScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y; listScroll.ZIndex=4; listScroll.ScrollingDirection=Enum.ScrollingDirection.Y
    local listLayout=Instance.new("UIListLayout",listScroll); listLayout.Padding=UDim.new(0,3); listLayout.SortOrder=Enum.SortOrder.LayoutOrder
    Instance.new("UIPadding",listScroll).PaddingLeft=UDim.new(0,4)
    local resLbl=Instance.new("TextLabel",card); resLbl.Size=UDim2.new(1,-24,0,22); resLbl.Position=UDim2.new(0,12,1,-26); resLbl.BackgroundTransparency=1; resLbl.Text="Click a player to teleport"; resLbl.TextColor3=C(55,55,55); resLbl.TextSize=10; resLbl.Font=Enum.Font.Code; resLbl.TextXAlignment=Enum.TextXAlignment.Center; resLbl.ZIndex=4

    local function buildList(filter)
        for _,ch in ipairs(listScroll:GetChildren()) do if ch:IsA("Frame") or ch:IsA("TextLabel") then ch:Destroy() end end
        local everyone=Players:GetPlayers()
        local othersCount=0
        for _,p in ipairs(everyone) do if p.UserId~=plr.UserId then othersCount+=1 end end
        countTxt.Text=othersCount..(othersCount==1 and " player" or " players")
        local displayList={}
        for _,p in ipairs(everyone) do
            if p.UserId~=plr.UserId then
                if filter=="" or p.Name:lower():find(filter:lower(),1,true)~=nil then table.insert(displayList,p) end
            end
        end
        if #displayList==0 then
            local none=Instance.new("TextLabel",listScroll); none.Size=UDim2.new(1,0,0,60); none.BackgroundTransparency=1
            none.Text=othersCount==0 and "No other players in this server" or ('No players match "'..filter..'"')
            none.TextColor3=C(50,50,50); none.TextSize=11; none.Font=Enum.Font.Code; none.TextXAlignment=Enum.TextXAlignment.Center; none.TextWrapped=true; none.ZIndex=5; return
        end
        for i,p in ipairs(displayList) do
            local row=Instance.new("Frame",listScroll); row.Size=UDim2.new(1,-6,0,50); row.BackgroundColor3=C(17,17,17); row.BorderSizePixel=0; row.LayoutOrder=i; row.ZIndex=5; corner(row,6); stroke(row,C(28,0,0))
            local circle=frame(row,UDim2.new(0,34,0,34),UDim2.new(0,7,0.5,-17),C(42,0,0)); circle.ZIndex=6; corner(circle,99); stroke(circle,C(139,0,0),1)
            local initL=Instance.new("TextLabel",circle); initL.Size=UDim2.new(1,0,1,0); initL.BackgroundTransparency=1; initL.Text=p.Name:sub(1,1):upper(); initL.TextColor3=RED; initL.TextSize=15; initL.Font=Enum.Font.GothamBold; initL.TextXAlignment=Enum.TextXAlignment.Center; initL.ZIndex=7
            local nameLbl=Instance.new("TextLabel",row); nameLbl.Size=UDim2.new(1,-106,0,18); nameLbl.Position=UDim2.new(0,48,0,7); nameLbl.BackgroundTransparency=1; nameLbl.Text=p.Name; nameLbl.TextColor3=C(215,215,215); nameLbl.TextSize=11; nameLbl.Font=Enum.Font.GothamBold; nameLbl.TextXAlignment=Enum.TextXAlignment.Left; nameLbl.ZIndex=6
            local myHRP=hrp(); local pHRP=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
            local distStr=(myHRP and pHRP) and (math.floor((pHRP.Position-myHRP.Position).Magnitude).." studs") or "loading..."
            local distLbl=Instance.new("TextLabel",row); distLbl.Size=UDim2.new(1,-106,0,14); distLbl.Position=UDim2.new(0,48,0,26); distLbl.BackgroundTransparency=1; distLbl.Text=distStr; distLbl.TextColor3=C(65,65,65); distLbl.TextSize=10; distLbl.Font=Enum.Font.Code; distLbl.TextXAlignment=Enum.TextXAlignment.Left; distLbl.ZIndex=6
            local tBtn=Instance.new("TextButton",row); tBtn.Size=UDim2.new(0,72,0,28); tBtn.Position=UDim2.new(1,-78,0.5,-14); tBtn.BackgroundColor3=C(139,0,0); tBtn.TextColor3=C(255,255,255); tBtn.Text="TP"; tBtn.TextSize=11; tBtn.Font=Enum.Font.GothamBold; tBtn.BorderSizePixel=0; tBtn.AutoButtonColor=false; tBtn.ZIndex=6; corner(tBtn,5); stroke(tBtn,C(192,57,43))
            tBtn.MouseEnter:Connect(function() tBtn.BackgroundColor3=C(192,57,43) end)
            tBtn.MouseLeave:Connect(function() tBtn.BackgroundColor3=C(139,0,0) end)
            row.MouseEnter:Connect(function() row.BackgroundColor3=C(22,0,0) end)
            row.MouseLeave:Connect(function() row.BackgroundColor3=C(17,17,17) end)
            local targetPlayer=p
            local function execTP()
                local r=hrp(); local tr=targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if r and tr then
                    r.CFrame=tr.CFrame+Vector3.new(3,0,0)
                    resLbl.Text="Teleported to "..targetPlayer.Name; resLbl.TextColor3=C(34,204,85)
                    tBtn.BackgroundColor3=C(0,130,55); task.delay(0.8,function() tBtn.BackgroundColor3=C(139,0,0) end)
                    setStatus("Teleported to "..targetPlayer.Name,true); notify("Teleported to "..targetPlayer.Name)
                    task.delay(3,function() resLbl.Text="Click a player to teleport"; resLbl.TextColor3=C(55,55,55) end)
                else resLbl.Text=targetPlayer.Name.." has no character yet"; resLbl.TextColor3=C(192,57,43) end
            end
            tBtn.MouseButton1Click:Connect(execTP); row.MouseButton1Click:Connect(execTP)
        end
    end
    buildList(""); srch:GetPropertyChangedSignal("Text"):Connect(function() buildList(srch.Text) end)
    local lastRefresh=tick()
    refreshConn=RunService.Heartbeat:Connect(function() if tick()-lastRefresh>=2 then lastRefresh=tick(); buildList(srch.Text) end end)
end

local function showComingSoon(msg)
    local popup=Instance.new("ScreenGui",plr.PlayerGui); popup.Name="_GCSPopup"; popup.ResetOnSpawn=false
    local pf=frame(popup,UDim2.new(0,340,0,80),UDim2.new(0.5,-170,0.5,-40),C(10,10,10)); corner(pf,10); stroke(pf,RED,2)
    local pl2=Instance.new("TextLabel",pf); pl2.Size=UDim2.new(1,0,1,0); pl2.BackgroundTransparency=1; pl2.Text=msg; pl2.TextColor3=RED; pl2.TextSize=20; pl2.Font=Enum.Font.GothamBold; pl2.TextXAlignment=Enum.TextXAlignment.Center; pl2.TextWrapped=true
    task.delay(2,function() popup:Destroy() end)
end

-- ════════════════════════════════════════════════
--   COMMANDS TAB
-- ════════════════════════════════════════════════
local tCmds=makeTab("cmds")
local sectL=lbl(tCmds,"COMMANDS",12,RED); sectL.Size=UDim2.new(1,0,0,16)
local countL=lbl(tCmds,"",10,C(85,85,85)); countL.Size=UDim2.new(0,60,0,16); countL.Position=UDim2.new(1,-60,0,0); countL.TextXAlignment=Enum.TextXAlignment.Right
local searchBox=textbox(tCmds,"Search commands..."); searchBox.Size=UDim2.new(1,0,0,28); searchBox.Position=UDim2.new(0,0,0,22)
local scroll=Instance.new("ScrollingFrame",tCmds); scroll.Size=UDim2.new(1,0,0,380); scroll.Position=UDim2.new(0,0,0,56); scroll.BackgroundTransparency=1; scroll.BorderSizePixel=0; scroll.ScrollBarThickness=4; scroll.ScrollBarImageColor3=C(139,0,0); scroll.CanvasSize=UDim2.new(0,0,0,0); scroll.AutomaticCanvasSize=Enum.AutomaticSize.Y
Instance.new("UIListLayout",scroll).Padding=UDim.new(0,3)

local cmdDefs={
    -- ── TOGGLES ──────────────────────────────────────────────────
    {n=".fly",tag="TOG",desc="Fly mode",key="fly",
     buildPanel=function(pf) makeSliderRow(pf,"Fly Speed",10,200,50,"",function(v) cfg.flySpeed=v end); makeSliderRow(pf,"Boost",1,5,2,"x",function(v) cfg.flyBoost=v end); makeToggleRow(pf,"Auto-hover",false,function(v) cfg.hover=v end) end,
     onEnable=startFly,onDisable=stopFly},
    {n=".speed",tag="TOG",desc="Walk speed",key="speed",
     buildPanel=function(pf) makeSliderRow(pf,"Walk Speed",16,300,100,"",function(v) cfg.walkSpeed=v; if S.speed then applySpeed(true) end end) end,
     onEnable=function() applySpeed(true) end,onDisable=function() applySpeed(false) end},
    {n=".noclip",tag="TOG",desc="No collision",key="noclip",onEnable=startNoclip,onDisable=stopNoclip},
    {n=".aimlock",tag="TOG",desc="Aim assist (hold RMB)",key="aimlock",
     buildPanel=function(pf) makeSliderRow(pf,"FOV",10,180,60,"deg",function(v) cfg.aimFOV=v end); makeSliderRow(pf,"Smooth",1,20,5,"",function(v) cfg.aimSmooth=v end); makeToggleRow(pf,"Head target",true,function(v) cfg.aimHead=v end) end,
     onEnable=startAimlock,onDisable=stopAimlock},
    {n=".esp",tag="TOG",desc="Player highlight ESP",key="esp",onEnable=function() refreshESP() end,onDisable=function() refreshESP() end},
    {n=".godmode",tag="TOG",desc="Infinite health",key="godmode",onEnable=function() setGodmode(true) end,onDisable=function() setGodmode(false) end},
    {n=".freeze",tag="TOG",desc="Freeze other players",key="freeze",onEnable=function() setFreeze(true) end,onDisable=function() setFreeze(false) end},
    {n=".invisible",tag="TOG",desc="Hide your character",key="invisible",onEnable=function() setInvisible(true) end,onDisable=function() setInvisible(false) end},
    {n=".fullbright",tag="TOG",desc="Max lighting",key="fullbright",onEnable=function() setFullbright(true) end,onDisable=function() setFullbright(false) end},
    {n=".inf_jump",tag="TOG",desc="Infinite jump",key="inf_jump",
     buildPanel=function(pf) makeSliderRow(pf,"Jump Power",50,500,100,"",function(v) cfg.jumpPower=v end) end,
     onEnable=startInfJump,onDisable=stopInfJump},
    {n=".antiafk",tag="TOG",desc="Prevent AFK kick",key="antiafk",onEnable=startAntiAfk,onDisable=stopAntiAfk},
    {n=".ftp",tag="TOG",desc="F key = teleport to mouse",key="ftp",
     buildPanel=function(pf)
        local info=Instance.new("TextLabel",pf); info.Size=UDim2.new(1,0,0,28); info.BackgroundTransparency=1
        info.Text="Enable then press F to teleport to where your mouse is pointing"
        info.TextColor3=C(153,153,153); info.TextSize=11; info.Font=Enum.Font.Code; info.TextXAlignment=Enum.TextXAlignment.Left; info.TextWrapped=true
     end,onEnable=startFTP,onDisable=stopFTP},

    -- .headsit — exact logic from provided reference
    {n=".headsit",tag="TOG",desc="Sit on head, press X",key="headsit",
     buildPanel=function(pf)
        local info=Instance.new("TextLabel",pf); info.Size=UDim2.new(1,0,0,28); info.BackgroundTransparency=1
        info.Text="Enable then press X near a player to sit on their head. Press X again to stop."
        info.TextColor3=C(153,153,153); info.TextSize=11; info.Font=Enum.Font.Code; info.TextXAlignment=Enum.TextXAlignment.Left; info.TextWrapped=true
     end,
     onEnable=function()
        local hsChar,hsHRP,hsHum
        local hsSitting=false
        local hsHBConn,hsInputConn

        local function hsLoadChar()
            hsChar=plr.Character or plr.CharacterAdded:Wait()
            hsHRP=hsChar:WaitForChild("HumanoidRootPart")
            hsHum=hsChar:WaitForChild("Humanoid")
        end
        local function hsGetNearest()
            local closest,shortest=nil,math.huge
            local myPos=hsHRP and hsHRP.Position; if not myPos then return nil end
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local dist=(p.Character.HumanoidRootPart.Position-myPos).Magnitude
                    if dist<shortest then shortest=dist; closest=p.Character.HumanoidRootPart end
                end
            end
            return closest
        end
        local function hsStopSit()
            hsSitting=false
            if hsHBConn then hsHBConn:Disconnect(); hsHBConn=nil end
            if hsHum then hsHum.Sit=false end
            if hsHRP then
                hsHRP.Velocity=Vector3.zero; hsHRP.RotVelocity=Vector3.zero
                local params=RaycastParams.new()
                params.FilterDescendantsInstances={hsChar}
                params.FilterType=Enum.RaycastFilterType.Exclude
                local hit=workspace:Raycast(hsHRP.Position,Vector3.new(0,-100,0),params)
                hsHRP.CFrame=hit and CFrame.new(hit.Position+Vector3.new(0,3,0)) or (hsHRP.CFrame-Vector3.new(0,5,0))
            end
        end
        local function hsStartSit()
            local target=hsGetNearest(); if not target then return end
            hsSitting=true; hsHum.Sit=true
            if hsHBConn then hsHBConn:Disconnect() end
            hsHBConn=RunService.Heartbeat:Connect(function()
                if not hsSitting or not target.Parent then hsStopSit(); return end
                hsHum.Sit=true
                hsHRP.CFrame=target.CFrame*CFrame.new(0,3,0)
                hsHRP.Velocity=Vector3.zero; hsHRP.RotVelocity=Vector3.zero
            end)
        end
        hsLoadChar()
        if hsInputConn then hsInputConn:Disconnect() end
        hsInputConn=UserInputService.InputBegan:Connect(function(input,processed)
            if processed then return end
            if not S.headsit then hsInputConn:Disconnect(); return end
            if input.KeyCode==Enum.KeyCode.X then
                if hsSitting then hsStopSit() else hsStartSit() end
            end
        end)
        plr.CharacterAdded:Connect(function() task.wait(1); hsLoadChar() end)
        notify(".headsit ON — press X near a player")
     end,
     onDisable=function() notify(".headsit OFF") end},

    -- .jerkoff — exact logic from provided reference
    {n=".jerkoff",tag="TOG",desc="Jerk animation loop",key="jerkoff",
     buildPanel=function(pf)
        makeSliderRow(pf,"Jerk Speed",2,30,6,"x0.1",function(v)
            cfg.jerkingSpeed=v/10
            if cfg._jerkTrack then cfg._jerkTrack:AdjustSpeed(cfg.jerkingSpeed) end
        end)
        local info2=Instance.new("TextLabel",pf); info2.Size=UDim2.new(1,0,0,14); info2.BackgroundTransparency=1
        info2.Text="anim: 698251653"; info2.TextColor3=C(80,80,80); info2.TextSize=10; info2.Font=Enum.Font.Code; info2.TextXAlignment=Enum.TextXAlignment.Left
     end,
     onEnable=function()
        cfg.jerkingEnabled=true
        if cfg._jerkTrack and cfg._jerkTrack.IsPlaying then return end
        local c=plr.Character or plr.CharacterAdded:Wait()
        local humanoid=c:FindFirstChildOfClass("Humanoid"); if not humanoid then return end
        local jerkAnim=Instance.new("Animation"); jerkAnim.AnimationId="rbxassetid://698251653"
        local jerkTrack=humanoid:LoadAnimation(jerkAnim)
        cfg._jerkTrack=jerkTrack; cfg._jerkAnim=jerkAnim
        task.spawn(function()
            while cfg.jerkingEnabled and cfg._jerkTrack do
                cfg._jerkTrack:Play()
                cfg._jerkTrack:AdjustSpeed(cfg.jerkingSpeed)
                cfg._jerkTrack.TimePosition=cfg.jerkTimePosition
                task.wait(0.1)
            end
        end)
        notify(".jerkoff ON")
     end,
     onDisable=function()
        cfg.jerkingEnabled=false
        if cfg._jerkTrack then cfg._jerkTrack:Stop(); cfg._jerkTrack=nil end
        if cfg._jerkAnim then cfg._jerkAnim:Destroy(); cfg._jerkAnim=nil end
        notify(".jerkoff OFF")
     end},

    -- ── ACTIONS ──────────────────────────────────────────────────
    {n=".zoom",tag="ACT",desc="Set max zoom distance",
     buildPanel=function(pf)
        makeSliderRow(pf,"Zoom Dist",50,1000,500,"",function(v) cfg.zoom=v end)
        local rb=mkbtn(pf,"APPLY",11,RED); rb.Size=UDim2.new(1,0,0,22); rb.MouseButton1Click:Connect(function() doZoom(); setStatus("Zoom "..cfg.zoom,true) end)
     end,action=doZoom},
    {n=".chat_spam",tag="ACT",desc="Spam the chat",
     buildPanel=function(pf)
        local r1=frame(pf,UDim2.new(1,0,0,22),nil); r1.BackgroundTransparency=1; lbl(r1,"Msg",11,C(153,153,153)).Size=UDim2.new(0,28,1,0)
        local mt=textbox(r1,"GLADIATOR..."); mt.Size=UDim2.new(1,-32,1,0); mt.Position=UDim2.new(0,32,0,0); mt:GetPropertyChangedSignal("Text"):Connect(function() cfg.spamMsg=mt.Text end)
        makeSliderRow(pf,"Count",1,20,5,"",function(v) cfg.spamCount=v end)
        local sb=mkbtn(pf,"SPAM",11,RED); sb.Size=UDim2.new(1,0,0,22); sb.MouseButton1Click:Connect(function() doChatSpam(cfg.spamMsg~="" and cfg.spamMsg or "GLADIATOR",cfg.spamCount); setStatus("Spammed x"..cfg.spamCount,true) end)
     end,action=function() doChatSpam(cfg.spamMsg,cfg.spamCount) end},
    {n=".tp",tag="ACT",desc="Open teleport player picker",action=function() openTPGui() end},
    {n=".heal",tag="ACT",desc="Restore full health",action=function() doHeal(); setStatus("Healed!",true) end},
    {n=".kill",tag="ACT",desc="Kill yourself",action=function() doKill(); setStatus("RIP",false) end},
    {n=".rejoin",tag="ACT",desc="Rejoin this server",action=function() doRejoin() end},
    {n=".fps_boost",tag="ACT",desc="Set graphics to level 1",action=function() doFPSBoost(); setStatus("Graphics lowered",true) end},
    {n=".gladre",tag="ACT",desc="Reset character in place",action=function() doGladRe(); setStatus("Reset in place",true) end},
    {n=".facebang",tag="ACT",desc="Face bang nearest player",action=function()
        setStatus("Loading facebang...",true)
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EnterpriseExperience/bruhlolw/refs/heads/main/face_bang_script.lua"))() end)
        setStatus("Facebang active!",true); notify(".facebang activated")
    end},
    {n=".baseplate",tag="ACT",desc="Create/destroy 40k baseplate",
     buildPanel=function(pf)
        local info=Instance.new("TextLabel",pf); info.Size=UDim2.new(1,0,0,16); info.BackgroundTransparency=1
        info.Text="Creates a 40,000x40,000 stud baseplate at y=0"; info.TextColor3=C(120,120,120); info.TextSize=10; info.Font=Enum.Font.Code; info.TextXAlignment=Enum.TextXAlignment.Left; info.TextWrapped=true

        -- colour swatches
        local colorRow=frame(pf,UDim2.new(1,0,0,22),nil); colorRow.BackgroundTransparency=1
        lbl(colorRow,"Color",11,C(153,153,153)).Size=UDim2.new(0,38,1,0)
        local bpCols={C(50,50,50),C(180,180,180),C(30,100,30),C(30,30,150),C(150,30,30),C(180,120,0)}
        for i,col in ipairs(bpCols) do
            local cb=frame(colorRow,UDim2.new(0,16,0,16),UDim2.new(0,42+(i-1)*21,0.5,-8),col); corner(cb,3)
            local cbBtn=Instance.new("TextButton",colorRow); cbBtn.Size=UDim2.new(0,16,0,16); cbBtn.Position=UDim2.new(0,42+(i-1)*21,0.5,-8); cbBtn.BackgroundTransparency=1; cbBtn.Text=""; cbBtn.BorderSizePixel=0
            cbBtn.MouseButton1Click:Connect(function()
                cfg.bpColor=col
                local f=workspace:FindFirstChild("TERRAIN_EDITOR")
                if f then for _,part in ipairs(f:GetChildren()) do if part:IsA("BasePart") then part.Color=col end end end
            end)
        end

        local btnRow=frame(pf,UDim2.new(1,0,0,26),nil); btnRow.BackgroundTransparency=1
        local createBtn=mkbtn(btnRow,"CREATE",11,C(0,180,80)); createBtn.Size=UDim2.new(0.48,0,1,0)
        createBtn.MouseButton1Click:Connect(function() doCreateBaseplate(); setStatus("Baseplate created",true); notify(".baseplate created") end)
        local destroyBtn=mkbtn(btnRow,"DESTROY",11,C(200,50,50)); destroyBtn.Size=UDim2.new(0.48,0,1,0); destroyBtn.Position=UDim2.new(0.52,0,0,0)
        destroyBtn.MouseButton1Click:Connect(function() doDestroyBaseplate(); setStatus("Baseplate removed",false); notify(".baseplate removed") end)
     end,
     action=function()
        if workspace:FindFirstChild("TERRAIN_EDITOR") then doDestroyBaseplate(); setStatus("Baseplate removed",false)
        else doCreateBaseplate(); setStatus("Baseplate created",true) end
     end},
    {n=".iy",tag="ACT",desc="Load Infinite Yield",action=function()
        setStatus("Loading Infinite Yield...",true)
        pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source"))() end)
        setStatus("Infinite Yield loaded",true); notify(".iy loaded")
    end},
    {n=".gladanim",tag="SOON",desc="Animations coming soon",action=function() showComingSoon("ANIMATIONS COMINGGG SOONN!!!") end},
}

local allBtns={}
local function buildCmdList(list)
    scroll:ClearAllChildren(); Instance.new("UIListLayout",scroll).Padding=UDim.new(0,3); allBtns={}
    for _,cd in ipairs(list) do
        local rb=Instance.new("TextButton",scroll); rb.Size=UDim2.new(1,0,0,32); rb.BackgroundColor3=C(17,17,17); rb.BorderSizePixel=0; rb.Text=""; rb.AutoButtonColor=false; corner(rb,4); stroke(rb,C(26,0,0))
        local pad2=Instance.new("UIPadding",rb); pad2.PaddingLeft=UDim.new(0,10)
        local nl=lbl(rb,cd.n,12,C(204,204,204)); nl.Size=UDim2.new(0.45,0,1,0)
        local dl=lbl(rb,cd.desc,10,C(85,85,85)); dl.Size=UDim2.new(0.35,0,1,0); dl.Position=UDim2.new(0.45,0,0,0); dl.TextXAlignment=Enum.TextXAlignment.Right
        local tagColor=cd.tag=="TOG" and C(26,0,0) or (cd.tag=="SOON" and C(26,20,0) or C(0,26,0))
        local tagTCol=cd.tag=="TOG" and RED or (cd.tag=="SOON" and C(200,180,0) or C(61,153,0))
        local tagF=frame(rb,UDim2.new(0,34,0,16),UDim2.new(1,-42,0.5,-8),tagColor); corner(tagF,3)
        local tagL=lbl(tagF,cd.tag,9,tagTCol); tagL.TextXAlignment=Enum.TextXAlignment.Center
        local panel=nil
        if cd.buildPanel then
            local wrapper=frame(scroll,UDim2.new(1,0,0,0),nil); wrapper.BackgroundTransparency=1; wrapper.Visible=false; wrapper.AutomaticSize=Enum.AutomaticSize.Y
            panel=makePanelFrame(wrapper); panel.Visible=true; cd.buildPanel(panel)
        end
        local active=false
        rb.MouseEnter:Connect(function() rb.BackgroundColor3=C(26,0,0) end)
        rb.MouseLeave:Connect(function() if not active then rb.BackgroundColor3=C(17,17,17) end end)
        rb.MouseButton1Click:Connect(function()
            if cd.tag=="TOG" then
                active=not active; S[cd.key]=active
                rb.BackgroundColor3=active and C(34,0,0) or C(17,17,17); nl.TextColor3=active and C(255,68,68) or C(204,204,204); stroke(rb,active and C(192,57,43) or C(26,0,0))
                if active then if cd.onEnable then cd.onEnable() end; setStatus(cd.n.." ON",true); notify(cd.n.." enabled")
                else if cd.onDisable then cd.onDisable() end; setStatus(cd.n.." OFF",false); notify(cd.n.." disabled") end
            else
                if cd.action then cd.action() end; rb.BackgroundColor3=C(42,0,0); task.delay(0.5,function() rb.BackgroundColor3=C(17,17,17) end)
                if not cd.buildPanel then setStatus("Executed: "..cd.n,true) end
            end
            if panel and panel.Parent then local w=panel.Parent; w.Visible=not w.Visible end
        end)
        table.insert(allBtns,{btn=rb,cmd=cd})
    end
    countL.Text=#list.." cmds"
end
buildCmdList(cmdDefs)
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q=searchBox.Text:lower()
    if q=="" then buildCmdList(cmdDefs); return end
    local f={}; for _,c in ipairs(cmdDefs) do if c.n:lower():find(q,1,true) then table.insert(f,c) end end; buildCmdList(f)
end)

-- ════════════════════════════════════════════════
--   ESP TAB
-- ════════════════════════════════════════════════
local tESP=makeTab("esp"); lbl(tESP,"ESP / VISUALS",12,RED).Size=UDim2.new(1,0,0,16)
local espPanel=frame(tESP,UDim2.new(1,0,0,10),UDim2.new(0,0,0,22),C(14,14,14)); espPanel.AutomaticSize=Enum.AutomaticSize.Y; corner(espPanel,6); stroke(espPanel,C(42,0,0))
local ep=Instance.new("UIPadding",espPanel); ep.PaddingTop=UDim.new(0,10); ep.PaddingBottom=UDim.new(0,10); ep.PaddingLeft=UDim.new(0,10); ep.PaddingRight=UDim.new(0,10); Instance.new("UIListLayout",espPanel).Padding=UDim.new(0,8)
makeToggleRow(espPanel,"Player ESP (highlight)",false,function(v) S.esp=v; refreshESP() end)
makeToggleRow(espPanel,"Box ESP",false,function(v) S.boxesp=v; if v then startBoxESP() else stopBoxESP() end end)
makeToggleRow(espPanel,"Tracers",false,function(v) S.tracers=v; if v then startTracers() else stopTracers() end end)
makeToggleRow(espPanel,"Name Tags",false,function(v) S.nametags=v; if v then startNameTags() else stopNameTags() end end)
makeToggleRow(espPanel,"Health Bar",true,function(v) end); makeSep(espPanel)
local colorRow=frame(espPanel,UDim2.new(1,0,0,22),nil); colorRow.BackgroundTransparency=1; lbl(colorRow,"ESP Color",11,C(153,153,153)).Size=UDim2.new(0,70,1,0)
local colors={C(255,0,0),C(255,255,255),C(0,255,136),C(255,170,0)}
for i,col in ipairs(colors) do
    local cb=frame(colorRow,UDim2.new(0,16,0,16),UDim2.new(0,72+(i-1)*22,0.5,-8),col); corner(cb,4)
    local cbBtn=Instance.new("TextButton",colorRow); cbBtn.Size=UDim2.new(0,16,0,16); cbBtn.Position=UDim2.new(0,72+(i-1)*22,0.5,-8); cbBtn.BackgroundTransparency=1; cbBtn.Text=""; cbBtn.BorderSizePixel=0
    cbBtn.MouseButton1Click:Connect(function() cfg.espColor=col; if S.esp then refreshESP() end; if S.nametags then stopNameTags(); startNameTags() end; setStatus("ESP color changed",true) end)
end

-- ════════════════════════════════════════════════
--   MISC TAB
-- ════════════════════════════════════════════════
local tMisc=makeTab("misc"); lbl(tMisc,"MISC TOOLS",12,RED).Size=UDim2.new(1,0,0,16)
local miscPanel=frame(tMisc,UDim2.new(1,0,0,10),UDim2.new(0,0,0,22),C(14,14,14)); miscPanel.AutomaticSize=Enum.AutomaticSize.Y; corner(miscPanel,6); stroke(miscPanel,C(42,0,0))
local mp=Instance.new("UIPadding",miscPanel); mp.PaddingTop=UDim.new(0,10); mp.PaddingBottom=UDim.new(0,10); mp.PaddingLeft=UDim.new(0,10); mp.PaddingRight=UDim.new(0,10); Instance.new("UIListLayout",miscPanel).Padding=UDim.new(0,8)
local tpRow=frame(miscPanel,UDim2.new(1,0,0,22),nil); tpRow.BackgroundTransparency=1
lbl(tpRow,"Teleport",11,C(153,153,153)).Size=UDim2.new(0,60,1,0)
local tpGo=mkbtn(tpRow,"OPEN PICKER",11,RED); tpGo.Size=UDim2.new(1,-64,1,0); tpGo.Position=UDim2.new(0,64,0,0)
tpGo.MouseButton1Click:Connect(function() openTPGui() end)
local spRow=frame(miscPanel,UDim2.new(1,0,0,22),nil); spRow.BackgroundTransparency=1
lbl(spRow,"Chat Spam",11,C(153,153,153)).Size=UDim2.new(0,66,1,0)
local spBox=textbox(spRow,"Message..."); spBox.Size=UDim2.new(1,-112,1,0); spBox.Position=UDim2.new(0,70,0,0)
local spSend=mkbtn(spRow,"SEND",11,RED); spSend.Size=UDim2.new(0,38,1,0); spSend.Position=UDim2.new(1,-38,0,0)
spSend.MouseButton1Click:Connect(function() local m=spBox.Text~="" and spBox.Text or "GLADIATOR"; doChatSpam(m,5); setStatus("Spammed: "..m,true) end)
makeSep(miscPanel)
local qRow=frame(miscPanel,UDim2.new(1,0,0,22),nil); qRow.BackgroundTransparency=1
local ql=Instance.new("UIListLayout",qRow); ql.FillDirection=Enum.FillDirection.Horizontal; ql.Padding=UDim.new(0,4)
local function qBtn(lb,col,fn) local b=mkbtn(qRow,lb,10,col); b.Size=UDim2.new(0,78,1,0); b.MouseButton1Click:Connect(fn); return b end
qBtn(".HEAL",C(0,200,80),function() doHeal(); setStatus("Healed!",true) end)
qBtn(".KILL",C(255,50,50),function() doKill(); setStatus("RIP",false) end)
qBtn(".REJOIN",RED,function() doRejoin() end)
qBtn(".GLADRE",C(200,100,0),function() doGladRe(); setStatus("Reset in place",true) end)

-- ════════════════════════════════════════════════
--   CONFIG TAB
-- ════════════════════════════════════════════════
local tCfg=makeTab("cfg"); lbl(tCfg,"CONFIG",12,RED).Size=UDim2.new(1,0,0,16)
local cfgPanel=frame(tCfg,UDim2.new(1,0,0,10),UDim2.new(0,0,0,22),C(14,14,14)); cfgPanel.AutomaticSize=Enum.AutomaticSize.Y; corner(cfgPanel,6); stroke(cfgPanel,C(42,0,0))
local cp=Instance.new("UIPadding",cfgPanel); cp.PaddingTop=UDim.new(0,10); cp.PaddingBottom=UDim.new(0,10); cp.PaddingLeft=UDim.new(0,10); cp.PaddingRight=UDim.new(0,10); Instance.new("UIListLayout",cfgPanel).Padding=UDim.new(0,8)
makeToggleRow(cfgPanel,"Notifications",true,function(v) cfg.notifs=v end)
makeToggleRow(cfgPanel,"FPS Counter",true,function(v) cfg.fpsCounter=v; fpsBadge.Visible=v end)
makeSep(cfgPanel)
local resetBtn=mkbtn(cfgPanel,"RESET ALL SETTINGS",11,C(255,50,50)); resetBtn.Size=UDim2.new(1,0,0,26)
resetBtn.MouseButton1Click:Connect(function()
    for k in pairs(S) do S[k]=false end
    stopFly(); stopNoclip(); stopAimlock(); stopInfJump(); stopAntiAfk(); stopBoxESP(); stopTracers(); stopNameTags(); stopFTP()
    setGodmode(false); setFreeze(false); setInvisible(false); setFullbright(false); refreshESP(); applySpeed(false)
    cfg.jerkingEnabled=false
    if cfg._jerkTrack then cfg._jerkTrack:Stop(); cfg._jerkTrack=nil end
    if cfg._jerkAnim then cfg._jerkAnim:Destroy(); cfg._jerkAnim=nil end
    setStatus("All settings reset",false)
end)

-- ════════════════════════════════════════════════
--   LIVE FPS / PING
-- ════════════════════════════════════════════════
local fcount,flast=0,tick()
RunService.Heartbeat:Connect(function()
    fcount+=1; local now=tick()
    if now-flast>=1 then
        if cfg.fpsCounter then fpsL.Text="FPS "..fcount end
        fcount=0; flast=now
        local ping=plr.GetNetworkPing and math.floor(plr:GetNetworkPing()*1000) or 0; pingL.Text="PING "..ping.."ms"
    end
end)

-- ════════════════════════════════════════════════
--   CHAT LISTENER
-- ════════════════════════════════════════════════
plr.Chatted:Connect(function(msg)
    local trimmed=msg:match("^%s*(.-)%s*$"); local lower=trimmed:lower()
    local tpArg=trimmed:match("^%.tp%s+(.+)")
    if tpArg then local ok=doTeleport(tpArg); setStatus(ok and "Teleported to "..tpArg or "Player not found",ok); return end
    if lower==".tp" then openTPGui(); return end
    local spamArg=trimmed:match("^%.chat_spam%s*(.*)")
    if spamArg then local m=spamArg~="" and spamArg or cfg.spamMsg; doChatSpam(m,cfg.spamCount); setStatus("Spammed x"..cfg.spamCount,true); return end
    for _,cd in ipairs(cmdDefs) do
        if lower==cd.n:lower() then
            if cd.tag=="TOG" then
                S[cd.key]=not S[cd.key]
                if S[cd.key] then if cd.onEnable then cd.onEnable() end; setStatus(cd.n.." ON",true); notify(cd.n.." ON")
                else if cd.onDisable then cd.onDisable() end; setStatus(cd.n.." OFF",false); notify(cd.n.." OFF") end
            elseif cd.tag=="ACT" or cd.tag=="SOON" then
                if cd.action then cd.action() end; setStatus("Executed: "..cd.n,true)
            end; break
        end
    end
end)

-- ════════════════════════════════════════════════
--   HOTKEY + RESPAWN
-- ════════════════════════════════════════════════
UserInputService.InputBegan:Connect(function(inp,gp)
    if gp then return end
    if inp.KeyCode==Enum.KeyCode.RightControl then Main.Visible=not Main.Visible end
end)
plr.CharacterAdded:Connect(function()
    task.wait(1)
    if S.speed then applySpeed(true) end
    if S.fly then stopFly(); startFly() end
    if S.noclip then stopNoclip(); startNoclip() end
    if S.godmode then setGodmode(true) end
    if S.fullbright then setFullbright(true) end
    if S.inf_jump then stopInfJump(); startInfJump() end
    if S.nametags then stopNameTags(); startNameTags() end
end)

print("[Gladiator v3] Loaded | Key: GladiatorLimited12 | RIGHT CTRL to toggle")
print("Commands: .fly .speed .noclip .aimlock .esp .godmode .freeze .invisible .fullbright")
print("          .inf_jump .antiafk .ftp .headsit .jerkoff .zoom .chat_spam .tp .heal")
print("          .kill .rejoin .fps_boost .gladre .facebang .baseplate .iy .gladanim")

end -- end loadMainGUI
