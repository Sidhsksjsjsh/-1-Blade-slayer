local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main",true)
local T2 = wndw:Tab("Hatch",true)
local T3 = wndw:Tab("Fight",true)
local T4 = wndw:Tab("Forge",true)

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
  hero = {
    index = 1,
    skill = true,
    guid = "null",
    id = 0,
    ft = false,
    ft2 = false
  },
  forge = {
    guid = "null",
    toggle = false
  }
}

--[[
local args = {
    [1] = {
        ["harmIndex"] = 2,
        ["isSkill"] = true,
        ["heroGuid"] = "8eea9d46-df8a-4cd5-8166-5b3cc52cd36f",
        ["skillId"] = 200015
    }
}

game:GetService("ReplicatedStorage")["Remotes"]["HeroSkillHarm"]:FireServer(unpack(args))

]]

local function getChildren(path,funct)
  for i,v in pairs(path:GetChildren()) do
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

local client = {
  near = true,
  range = 25,
  name = "null"
}

T3:Slider("kill range",0,500,25,function(value)
    client.range = value
end)

T3:Textbox("Insert enemy name [ disable nearest system ]",false,function(value)
    client.name = value
end)

T3:Toggle("Nearest system",true,function(value)
    client.near = value
end)

T3:Toggle("Auto attack",false,function(value)
    var.atk = value
    while wait() do
      if var.atk == false then break end
      getChildren(workspace["Enemys"],function(array)
          if client.near == true then
            if (player.self.Character.HumanoidRootPart.Position - array.HumanoidRootPart.Position).Magnitude < client.range then
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
            end
          else
            if (string.sub(string.lower(array.Name),1,string.len(client.name))) == string.lower(client.name) then
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
            end
          end
      end)
    end
end)

T3:Toggle("Fast attack [ Hero ]",false,function(value)
    var.hero.ft = value
    while wait() do
      if var.hero.ft == false then break end
      if var.hero.guid ~= "null" then
        game:GetService("ReplicatedStorage")["Remotes"]["HeroSkillHarm"]:FireServer({["harmIndex"] = var.hero.index,["isSkill"] = var.hero.skill,["heroGuid"] = var.hero.guid,["skillId"] = var.hero.id})
      else
        lib:notify(lib:ColorFonts("GUID is null, make ur hero attack one enemy","Red"),10)
        var.hero.ft = false
      end
    end
end)

if player.self.Name == "Rivanda_Cheater" then
T3:Toggle("Fast attack [ Hero ] [ Red dmg ] [ TEST ]",false,function(value)
    var.hero.ft = value
    var.hero.ft2 = value
    while wait() do
      if var.hero.ft == false then break end
      if var.hero.guid ~= "null" then
        game:GetService("ReplicatedStorage")["Remotes"]["HeroSkillHarm"]:FireServer({["harmIndex"] = var.hero.index,["isSkill"] = var.hero.skill,["heroGuid"] = var.hero.guid,["skillId"] = var.hero.id})
      else
        lib:notify(lib:ColorFonts("GUID is null, make ur hero attack one enemy","Red"),10)
        var.hero.ft = false
      end
    end
end)
end

T4:Textbox("Insert weapon GUID",false,function(value)
    var.forge.guid = value
end)

T4:Toggle("Auto forge weapon [ Anti failure ]",false,function(value)
    var.forge.toggle = value
    while wait() do
      if var.forge.toggle == false then break end
      if var.forge.guid ~= "null" then
        game:GetService("ReplicatedStorage")["Remotes"]["ForgeWeapon"]:InvokeServer(var.forge.guid)
      else
        lib:notify(lib:ColorFonts("pls insert weapon guid","Red"),10)
        var.forge.toggle = false
      end
    end
end)
--Id nya achmadrinaldi

if player.self.Name == "achmadrinaldi" or player.self.Name == "Rivanda_Cheater" then
local T99 = wndw:Tab("Access",true)
  
T99:Button("Remote spy",function()
      lib:RemoteSpy()
end)

T99:Toggle("High damage [ Config ]",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)
  
T99:Button("Infinity all currency",function()
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Give OP/Robux pet and items",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Instant kill [ LAGGY ]",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Infinite equips",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Auto modded LocalScript [ with Vanguard API ]",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Auto attack nearest enemy [ Hero ]",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Instant anti-failure",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)
end

--[[T3:Toggle("Receive task - TESTING",false,function(value)
    var.task.ach = value
    while wait() do
      if var.task.ach == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["ReceiveTask"]:FireServer(var.task.id + 1)
    end
end)
(string.sub(string.lower(v.Name),1,string.len(value))) == string.lower(value)
]]

--[[
local args = {
    [1] = {
        ["harmIndex"] = 2,
        ["isSkill"] = true,
        ["heroGuid"] = "8eea9d46-df8a-4cd5-8166-5b3cc52cd36f",
        ["skillId"] = 200015
    }
}

game:GetService("ReplicatedStorage")["Remotes"]["HeroSkillHarm"]:FireServer(unpack(args))

]]

--game:GetService("ReplicatedStorage")["Remotes"]["FinishTask"]:FireServer(unpack(args))
lib:HookFunction(function(method,self,args)
    if method == "InvokeServer" and self == "ExtractHero" then
      var.egg.id = args[1]["drawCardPlatformId"]
      var.egg.count = args[1]["count"]
    elseif method == "FireServer" and self == "FinishTask" then
      var.task.id = args[1]
    elseif method == "FireServer" and self == "HeroSkillHarm" then
      var.hero.index = args[1]["harmIndex"]
      var.hero.skill = args[1]["isSkill"]
      var.hero.guid = args[1]["heroGuid"]
      var.hero.id = args[1]["skillId"]
    elseif method == "FireServer" and self == "HeroSkillHarm" and var.hero.ft2 == true then
      if args[1]["harmIndex"] > var.hero.index then
        var.hero.index = args[1]["harmIndex"]
        var.hero.skill = args[1]["isSkill"]
        var.hero.id = args[1]["skillId"]
      end
    end
end)
