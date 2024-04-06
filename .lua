local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main",true)
local T2 = wndw:Tab("Hatch",true)
local T3 = wndw:Tab("Task")


local workspace = game:GetService("Workspace")
local player = {
  self = game:GetService("Players").LocalPlayer,
  all = game:GetService("Players")
}

local var = {
  click = false,
  atk = false,
  on = false,
  bw = false,
  cs = false,
  spin = false,
  reb = false,
  egg = {
    id = 0,
    count = 1,
    toggle = false
  },
  bh = false,
  task = {
    claim = false,
    ach = false,
    id = 0
  },
  
}

local function getChildren(path,funct)
  for i,v in pair(path:GetChildren()) do
    funct(v)
  end
end

T1:Toggle("Auto click",false,function(value)
    var.click = value
    while wait() do
      if var.click == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer()
    end
end)

T1:Toggle("Auto attack nearest [ Turn on auto click ]",false,function(value)
    var.atk = value
    while wait() do
      if var.atk == false then break end
      getChildren(workspace["Enemys"],function(array)
          if (player.self.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < 25 then
            game:GetService("ReplicatedStorage")["Remotes"]["ClickEnemy"]:InvokeServer(v:GetAttribute("EnemyGuid"))
          end
      end)
    end
end)

T1:Toggle("Auto claim online rewards",false,function(value)
    var.on = value
    while wait() do
      if var.on == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "1"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "2"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "3"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "4"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "5"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "6"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "7"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "8"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "9"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "10"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "11"})
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimOnlineReward"]:InvokeServer({["id"] = "12"})
    end
end)

T1:Toggle("Auto equip best weapon every 1s",false,function(value)
    var.bw = value
    while wait(1) do
      if var.bw == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["EquipBestWeapon"]:FireServer()
    end
end)

T1:Toggle("Auto claim spin tickets",false,function(value)
    var.cs = value
    while wait() do
      if var.cs == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(1)
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(2)
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(3)
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(4)
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(5)
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(6)
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(7)
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimActivitySpinTicket"]:InvokeServer(8)
    end
end)

T1:Toggle("Auto spin",false,function(value)
    var.spin = value
    while wait() do
      if var.spin == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["StartActivitySpin"]:InvokeServer(1)
    end
end)

T1:Toggle("Auto ascendant",false,function(value)
    var.reb = value
    while wait() do
      if var.reb == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["PlayerReborn"]:FireServer()
    end
end)

T2:Toggle("Auto Hatch [ hatch first ]",false,function(value)
    var.egg.toggle = value
    while wait() do
      if var.egg.toggle == false then break end
      if var.egg.id ~= 0 then
        game:GetService("ReplicatedStorage")["Remotes"]["ExtractHero"]:InvokeServer({["drawCardPlatformId"] = var.egg.id,["count"] = var.egg.count})
      else
        lib:notify(lib:ColorFonts("Pls hatch first before enabling this","Red"),10)
        var.egg.toggle = false
      end
    end
end)

T2:Toggle("Auto best hero every 1s",false,function(value)
    var.bh = value
    while wait(1) do
      if var.bh == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["AutoEquipBestHero"]:FireServer()
    end
end)

T3:Toggle("Receive task - TESTING",false,function(value)
    var.task.ach = value
    while wait() do
      if var.task.ach == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["ReceiveTask"]:FireServer(var.task.id + 1)
    end
end)

--game:GetService("ReplicatedStorage")["Remotes"]["FinishTask"]:FireServer(unpack(args))
lib:HookFunction(function(method,self,args)
    if method == "InvokeServer" and self == "ExtractHero" then
      var.egg.id = args[1]["drawCardPlatformId"]
      var.egg.count = args[1]["count"]
    elseif method == "FireServer" and self == "FinishTask" then
      var.task.id = args[1]
    end
end)
