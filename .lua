local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main",true)
local T2 = wndw:Tab("Hatch")
local T3 = wndw:Tab("Fight",true)
local T4 = wndw:Tab("Forge")
local T5 = wndw:Tab("Teleport")
local T6 = wndw:Tab("Raid",true)
local T7 = wndw:Tab("Machine",true)

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
    count = 3,
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
  },
  mapid = 50001,
  fuse = false,
  atk2 = false,
  bring = false,
  atk3 = false,
  raid = {
    table = {"Room1","Room2","Room3","Room4"},
    s = "Room1",
    diff = 1,
    mapid = 0,
    toggle = false,
    dtable = {"1","2","3","4"}
  },
  dc = false,
  fraid = false,
  cgroup = false,
  machine = {
    table = {"Mask","Breath","Ornament"},
    s = "Mask",
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
lib:CustomTeleport("tween",str,"position")
]]

local function getChildren(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

local function hatch()
  getChildren(workspace.Maps,function(a)
      getChildren(a.Map.Eggs,function(array)
          game:GetService("ReplicatedStorage")["Remotes"]["ExtractHero"]:InvokeServer({["drawCardPlatformId"] = array:GetAttribute("Id"),["count"] = var.egg.count})
      end)
  end)
end

--[[local function raidEvents()
  var.fraid = true
  lib:runtime(function()
      if var.fraid == false then break end
      if #workspace["Enemys"]:GetChildren() < 1 then
        lib:notify(lib:ColorFonts("Raid has cleared, no enemy remaining. teleporting u to the raid lobby","Green"),10)
        if workspace:FindFirstChild("EnchantChest") then
          firetouchinterest(workspace.EnchantChest.Part,player.self.Character.HumanoidRootPart,0)
          wait(0.5)
          firetouchinterest(workspace.EnchantChest.Part,player.self.Character.HumanoidRootPart,1)
          game:GetService("ReplicatedStorage")["Remotes"]["QuitRaidsMap"]:InvokeServer({["currentSlotIndex"] = 1,["toMapId"] = 50201})
          var.fraid = false
        else
          lib:notify(lib:ColorFonts("Chest not found, cant claim chest.","Red"),10)
          var.fraid = false
          game:GetService("ReplicatedStorage")["Remotes"]["QuitRaidsMap"]:InvokeServer({["currentSlotIndex"] = 1,["toMapId"] = 50201})
        end --√
      else
        getChildren(workspace["Enemys"],function(get)
            game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(get:GetAttribute("EnemyGuid"))
        end)
      end
  end)
end]]

T7:Dropdown("Select machine",var.machine.table,function(value)
    var.machine.s = value
end)

T7:Toggle("Auto draw machine",false,function(value)
    var.machine.toggle = value
    while wait() do
      if var.machine.toggle == false then break end
      if var.machine.s == "Mask" then
        game:GetService("ReplicatedStorage")["Remotes"]["RerollOrnament"]:InvokeServer(400001)
      elseif var.machine.s == "Breath" then
        game:GetService("ReplicatedStorage")["Remotes"]["RerollOrnament"]:InvokeServer(400002)
      elseif var.machine.s == "Ornament" then
        game:GetService("ReplicatedStorage")["Remotes"]["RerollOrnament"]:InvokeServer(400003)
      else
        lib:notify(lib:ColorFonts("INVALID MACHINE NAME","Red"),10)
      end
    end
end)

T6:Dropdown("Select Room",var.raid.table,function(value)
    var.raid.s = value
end)

T6:Dropdown("Select difficulty",var.raid.dtable,function(value)
    var.raid.diff = tonumber(value)
end)

T6:Textbox("Insert map ID",false,function(value)
    var.raid.mapid = tonumber(value)
end)

T6:Button("Raid lobby",function()
    game:GetService("ReplicatedStorage")["Remotes"]["LocalPlayerTeleport"]:FireServer({["mapId"] = 50201})
end)

--[[T6:Button("Start raid",function()
    lib:notify(lib:ColorFonts("Dont move, auto kill is enabled. u will lose all reward if u move","Green"),10)
    game:GetService("ReplicatedStorage")["Remotes"]["EnterRaidRoom"]:FireServer(var.raid.s)
    wait(0.1)
    game:GetService("ReplicatedStorage")["Remotes"]["SelectRaidsDifficulty"]:FireServer({["difficulty"] = var.raid.diff,["roomName"] = var.raid.s,["selectMapId"] = var.raid.mapid})
    wait(0.1)
    game:GetService("ReplicatedStorage")["Remotes"]["StartChallengeRaidMap"]:InvokeServer({["userIds"] = {player.self.UserId},["roomName"] = var.raid.s})
    wait(0.1)
    raidEvents()
end)
]]

T6:Toggle("Start raid + Auto kill",false,function(value)
    var.fraid = value
    if value == true then
      lib:notify(lib:ColorFonts("Dont move, auto kill is enabled. u will lose all reward if u move","Green"),10)
      game:GetService("ReplicatedStorage")["Remotes"]["EnterRaidRoom"]:FireServer(var.raid.s)
      wait(0.1)
      game:GetService("ReplicatedStorage")["Remotes"]["SelectRaidsDifficulty"]:FireServer({["difficulty"] = var.raid.diff,["roomName"] = var.raid.s,["selectMapId"] = var.raid.mapid})
      wait(0.1)
      game:GetService("ReplicatedStorage")["Remotes"]["StartChallengeRaidMap"]:InvokeServer({["userIds"] = {player.self.UserId},["roomName"] = var.raid.s})
    end
    wait(0.5)
    while wait() do
      if var.fraid == false then break end
      if #workspace["Enemys"]:GetChildren() < 1 then
        if workspace:FindFirstChild("EnchantChest") then
          firetouchinterest(workspace.EnchantChest.Part,player.self.Character.HumanoidRootPart,0)
          wait(0.1)
          firetouchinterest(workspace.EnchantChest.Part,player.self.Character.HumanoidRootPart,1)
          game:GetService("ReplicatedStorage")["Remotes"]["QuitRaidsMap"]:InvokeServer({["currentSlotIndex"] = 1,["toMapId"] = 50201})
          var.fraid = false
        else
          lib:notify(lib:ColorFonts("Pls join raid. #Failed","Red"),10)
          var.fraid = false
        end
      else
        getChildren(workspace["Enemys"],function(get)
            if var.hero.guid ~= "null" then
              game:GetService("ReplicatedStorage")["Remotes"]["ClickEnemy"]:InvokeServer(get:GetAttribute("EnemyGuid"))
              game:GetService("ReplicatedStorage")["Remotes"]["HeroSkillHarm"]:FireServer({["harmIndex"] = var.hero.index,["isSkill"] = var.hero.skill,["heroGuid"] = var.hero.guid,["skillId"] = var.hero.id})
              game:GetService("ReplicatedStorage")["Remotes"]["RespirationSkillHarm"]:FireServer({["harmIndex"] = var.hero.index,["skillId"] = var.hero.id})
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(get:GetAttribute("EnemyGuid"))
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(get:GetAttribute("EnemyGuid"))
              --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = get:GetAttribute("EnemyGuid")})
            else
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(get:GetAttribute("EnemyGuid"))
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(get:GetAttribute("EnemyGuid"))
              --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = get:GetAttribute("EnemyGuid")})
            end
        end)
      end --√
    end
end)

T1:Toggle("Auto click",false,function(value)
    var.click = value
    while wait() do
      if var.click == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer()
      game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer()
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
    if value == true then
      game:GetService("ReplicatedStorage")["Remotes"]["EquipBestWeapon"]:FireServer()
    end
    
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

T1:Toggle("Auto fuse weapon",false,function(value)
    var.fuse = value
    while wait() do
      if var.fuse == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["FuseWeapon"]:FireServer()
    end
end)

T1:Toggle("Auto collect dropped items",false,function(value)
    var.bring = value
    while wait() do
      if var.bring == false then break end
      getChildren(workspace.Collects,function(v)
          --game:GetService("ReplicatedStorage")["Remotes"]["CollectItem"]:InvokeServer(v:GetAttribute("GUID"))
          lib:CustomTeleport("tween",v,"position")
      end)
    end
end)

T1:Toggle("Auto claim group chest",false,function(value)
    var.cgroup = value
    while wait() do
      if var.cgroup == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["ClaimGroupReward"]:InvokeServer()
    end
end)

T2:Slider("Hatch amount",1,10,3,function(value)
    var.egg.id = value
end)

T2:Toggle("Auto Hatch",false,function(value)
    var.egg.toggle = value
    while wait() do
      if var.egg.toggle == false then break end
        hatch()
    end
end)

T2:Toggle("Auto equip best hero every 1s",false,function(value)
    var.bh = value
    if value == true then
      game:GetService("ReplicatedStorage")["Remotes"]["AutoEquipBestHero"]:FireServer()
    end
    
    while wait(1) do
      if var.bh == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["AutoEquipBestHero"]:FireServer()
    end
end)

local client = {
  near = true,
  range = 25,
  name = "null",
  lock = false
}

T3:Slider("kill range",0,500,25,function(value)
    client.range = value
end)

T3:Textbox("Insert enemy name [ disable nearest ]",false,function(value)
    client.name = value
end)

T3:Toggle("Nearest system",true,function(value)
    client.near = value
end)

T3:Toggle("Target enemy [ For Hero ]",false,function(value)
    client.lock = value
end)

T3:Toggle("Auto attack",false,function(value)
    var.atk = value
    while wait() do
      if var.atk == false then break end
      getChildren(workspace["Enemys"],function(array)
          if client.near == true then
            if (player.self.Character.HumanoidRootPart.Position - array.HumanoidRootPart.Position).Magnitude < client.range then
              if client.lock == true then
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
                game:GetService("ReplicatedStorage")["Remotes"]["ClickEnemy"]:InvokeServer(array:GetAttribute("EnemyGuid"))
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(array:GetAttribute("EnemyGuid"))
                --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = array:GetAttribute("EnemyGuid")})
              else
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(array:GetAttribute("EnemyGuid"))
                --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = array:GetAttribute("EnemyGuid")})
              end
            end
          else
            if (string.sub(string.lower(array.Name),1,string.len(client.name))) == string.lower(client.name) then
              if client.lock == true then
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
                game:GetService("ReplicatedStorage")["Remotes"]["ClickEnemy"]:InvokeServer(array:GetAttribute("EnemyGuid"))
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(array:GetAttribute("EnemyGuid"))
                --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = array:GetAttribute("EnemyGuid")})
              else
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
                game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(array:GetAttribute("EnemyGuid"))
                --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = array:GetAttribute("EnemyGuid")})
              end
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
        game:GetService("ReplicatedStorage")["Remotes"]["RespirationSkillHarm"]:FireServer({["harmIndex"] = var.hero.index,["skillId"] = var.hero.id})
        --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = array:GetAttribute("EnemyGuid")})
      else
        lib:notify(lib:ColorFonts("GUID is null, make ur hero attack one enemy","Red"),10)
        var.hero.ft = false
      end
    end
end)

T3:Toggle("Auto attack all rendered enemies",false,function(value)
    var.atk3 = value
    while wait() do
      if var.atk3 == false then break end
      getChildren(workspace["Enemys"],function(array)
          if client.lock == true then
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
              game:GetService("ReplicatedStorage")["Remotes"]["ClickEnemy"]:InvokeServer(array:GetAttribute("EnemyGuid"))
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(array:GetAttribute("EnemyGuid"))
              --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = array:GetAttribute("EnemyGuid")})
          else
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerClickAttack"]:FireServer(array:GetAttribute("EnemyGuid"))
              game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(array:GetAttribute("EnemyGuid"))
              --game:GetService("ReplicatedStorage")["Remotes"]["HeroUseSkill"]:FireServer({["heroGuid"] = var.hero.guid,["attackType"] = var.hero.index,["userId"] = player.self.UserId,["enemyGuid"] = array:GetAttribute("EnemyGuid")})
          end
      end)
    end
end)
--[[T4:Textbox("Insert weapon GUID",false,function(value)
    var.forge.guid = value
end)
]]

T4:Toggle("Auto forge weapon [ Anti failure ]",false,function(value)
    var.forge.toggle = value
    while wait() do
      if var.forge.toggle == false then break end
      if var.forge.guid ~= "null" then
        game:GetService("ReplicatedStorage")["Remotes"]["ForgeWeapon"]:InvokeServer(var.forge.guid)
      else
        lib:notify(lib:ColorFonts("pls forge the weapon first to use this. [ Missing-GUID ]","Red"),10)
        var.forge.toggle = false
      end
    end
end)
--Id nya achmadrinaldi

T5:Dropdown("Select map ID",{"50001","50002","50003","50004","50005","50006","50007","50008","50009","50010","50011","50012","50013","50014","50015"},function(value)
    var.mapid = tonumber(value)
end)

T5:Button("Teleport to a selected map",function()
    game:GetService("ReplicatedStorage")["Remotes"]["LocalPlayerTeleport"]:FireServer({["mapId"] = var.mapid})
end)

T5:Button("Join dungeon [ Bypass cooldown ]",function()
    game:GetService("ReplicatedStorage")["Remotes"]["LocalPlayerTeleport"]:FireServer({["mapId"] = 50016})
end)

T5:Toggle("Auto open daily chest [ in selected map ]",false,function(value)
    var.dc = value
    while wait() do
      if var.dc == false then break end
      getChildren(workspace["Maps"],function(i)
          getChildren(i["Map"]["Box"],function(get)
              game:GetService("ReplicatedStorage")["Remotes"]["GetBoxGift"]:FireServer({["mapId"] = var.mapid,["pointId"] = get.Name})
          end)
      end)
    end
end)

if player.self.Name == "achmadrinaldi" or player.self.Name == "Rivanda_Cheater" then
local T99 = wndw:Tab("Access",true)
  
T99:Button("Remote spy",function()
      lib:RemoteSpy()
end)

--[[T99:Button("Run LS Decompiler [ Vanguard ]",function()
      lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
end)

T99:Button("Run LocalScript Leaker [ Vanguard ]",function()
      lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
end)

T99:Button("Run Hidden remote execution [ Vanguard ]",function()
      lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
end)

T99:Toggle("Open Vanguard system manager",false,function(value)
      if value == true then
        lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
      end
end)

T99:Toggle("Open Turtle Panel",false,function(value)
      if value == true then
        lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
      end
end)

T99:Toggle("Open AI panel",false,function(value)
      if value == true then
        lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
      end
end)

T99:Toggle("Open LocalScript manager",false,function(value)
      if value == true then
        lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
      end
end)

T99:Toggle("Sent a message when success",false,function(value)
      if value == true then
        lib:notify(lib:ColorFonts("You're not developer or staff.","Red"),30)
      end
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

T99:Toggle("Auto modded LocalScript with Vanguard API",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Auto attack nearest enemy [ Hero ]",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)

T99:Toggle("Instant anti-failure",false,function(value)
      lib:notify(lib:ColorFonts('{"title":"Authorized failed","desc":"Ur ID and Username does not match..."}',"Red"),30)
end)
lib:CheckServers(3,function(vuln)
  if vuln == true then
  lib:Serverhop(3)
end
end)
lib:rejoin() 
  ]]
T99:Button("Teleport to lower server",function()
      lib:CheckServers(4,function(vuln)
          if vuln == true then
            lib:Serverhop(4)
          else
            lib:notify(lib:ColorFonts("Failed to teleport. #ERROR_OCCURED","Red"),10)
          end
      end)
end)

T99:Button("Rejoin",function()
      lib:rejoin()
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

local args = {
    [1] = "6cd1497a-299a-455f-a250-aace178fcef5"
}

game:GetService("ReplicatedStorage")["Remotes"]["PlayerRespirationSkillAttack"]:InvokeServer(unpack(args))

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
    elseif method == "InvokeServer" and self == "ForgeWeapon" then
      var.forge.guid = args[1]
    end
end)
