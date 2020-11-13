enemyPlacement = Object:extend()

local flyingEnemy = flyingEnemy or require "scripts/flyingEnemy"

local groundEnemy = enemy or require "scripts/enemy"

local pickUp = pickUp or require "scripts/pickUp"

local boss = require "scripts/boss"

function enemyPlacement:new()
  enemySpawns = {}
  
  self.spawn2Activated = false
  self.spawn3Activated = false
  self.spawn4Activated = false
  self.spawn5Activated = false
  self.spawn6Activated = false
  self.spawn7Activated = false
  self.spawn8Activated = false
  self.spawn9Activated = false
  self.spawn10Activated = false
  self.spawn11Activated = false
  self.spawn12Activated = false
  self.spawn13Activated = false
  self.spawn14Activated = false
  self.spawn15Activated = false
  self.spawn16Activated = false
  self.spawn17Activated = false
  self.spawn18Activated = false
  self.spawn19Activated = false
  
  enemyPlacement:spawn1()
  
  --objects.player.body:setX(14750)
  --objects.player.body:setY(250)
end

function enemyPlacement:update(dt)
  --print(objects.player.body:getX())
  if not self.spawn2Activated and objects.player.body:getX() > 1060 then
    self:spawn2()
  end
  if not self.spawn3Activated and objects.player.body:getX() > 1860 then
    self:spawn3()
  end
  if not self.spawn4Activated and objects.player.body:getX() > 2660 then
    self:spawn4()
  end
  if not self.spawn5Activated and objects.player.body:getX() > 3740 then
    self:spawn5() --UFO
  end
  if not self.spawn6Activated and objects.player.body:getX() > 4700 then
    self:spawn6()
  end
  if not self.spawn7Activated and objects.player.body:getX() > 5780 then
    self:spawn7()
  end
  if not self.spawn8Activated and objects.player.body:getX() > 7020 then
    self:spawn8() --UFO
  end
  if not self.spawn9Activated and objects.player.body:getX() > 7820 then
    self:spawn9()
  end
  if not self.spawn10Activated and objects.player.body:getX() > 8940 then
    self:spawn10()
  end
  if not self.spawn11Activated and objects.player.body:getX() > 9820 then
    self:spawn11()
  end
  if not self.spawn12Activated and objects.player.body:getX() > 10500 then
    self:spawn12() --UFO
  end
  if not self.spawn13Activated and objects.player.body:getX() > 10900 then
    self:spawn13() --UFO
  end
  if not self.spawn14Activated and objects.player.body:getX() > 11980 then
    self:spawn14()
  end
  if not self.spawn15Activated and objects.player.body:getX() > 12860 then
    self:spawn15()
  end
  if not self.spawn16Activated and objects.player.body:getX() > 13260 then
    self:spawn16()
  end
  if not self.spawn17Activated and objects.player.body:getX() > 13660 then
    self:spawn17()
  end
  if not self.spawn18Activated and objects.player.body:getX() > 14260 then
    self:spawn18() --UFO
  end
  if not self.spawn19Activated and objects.player.body:getX() > 14750 then
    self:spawn19() --BOSS
  end
end

function enemyPlacement:spawn1()
  --ZOMBIES MELEE
  gE = groundEnemy:extend()
  gE:new(540, 350, true, 5, 250, 10, 4, false) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(980, 350, true, 30, 250, 10, 4, false) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
end

function enemyPlacement:spawn2()
  --ZOMBIES MELEE
  gE = groundEnemy:extend()
  gE:new(1620, 350, true, 30, 250, 10, 4, false) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1640, 350, true, 30, 250, 10, 4, false) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1660, 350, true, 30, 250, 10, 4, false) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIES RANGED
  gE = groundEnemy:extend()
  gE:new(1680, 350, false, 15, 300, 200, 2, false) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn2Activated = true
end

function enemyPlacement:spawn3()
  gE = groundEnemy:extend()
  gE:new(2180, 420, true, 30, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(2230, 420, true, 30, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(2280, 420, true, 30, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1580, 450, true, 30, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1600, 450, true, 30, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1620, 450, true, 30, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  pUp = pickUp:extend()
  pUp:new(1940, 300)
  table.insert(pickUpsList, pUp)
  
  self.spawn3Activated = true
end

function enemyPlacement:spawn4()
  gE = groundEnemy:extend()
  gE:new(2420, 240, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(2460, 240, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(2940, 490, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(3200, 490, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(3240, 490, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIES RANGED
  gE = groundEnemy:extend()
  gE:new(2980, 490, false, 20, 300, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(3020, 490, false, 20, 300, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(3280, 490, false, 20, 400, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(3320, 490, false, 20, 400, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn4Activated = true
end

function enemyPlacement:spawn5()
  --UFOs
  ufo = flyingEnemy:extend()
  ufo:new(4040, 240)
  table.insert(actorList, ufo)
  
  self.spawn5Activated = true
end

function enemyPlacement:spawn6()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(4500, 400, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(4940, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(4980, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5020, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5100, 370, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5140, 370, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5140, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5180, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIE RANGED
  
  gE = groundEnemy:extend()
  gE:new(4460, 400, false, 20, 400, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5260, 370, false, 20, 400, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5380, 490, false, 20, 400, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn6Activated = true
end

function enemyPlacement:spawn7()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(5500, 400, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5540, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5580, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(5020, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6060, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6100, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6180, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6220, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6260, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6320, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6360, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIE RANGED
  
  gE = groundEnemy:extend()
  gE:new(6500, 295, false, 20, 400, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6140, 490, false, 20, 400, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn7Activated = true
end

function enemyPlacement:spawn8()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(6620, 280, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(6720, 410, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(7340, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(7460, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --UFOs
  ufo = flyingEnemy:extend()
  ufo:new(6860, 220)
  table.insert(actorList, ufo)

  self.spawn8Activated = true
end

function enemyPlacement:spawn9()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(8180, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIE RANGED
  
  gE = groundEnemy:extend()
  gE:new(6500, 295, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(8220, 490, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(8260, 490, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(8300, 380, false, 20, 400, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn9Activated = true
end

function enemyPlacement:spawn10()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(8660, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(9220, 500, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIE RANGED
  
  gE = groundEnemy:extend()
  gE:new(8660, 500, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(9340, 460, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(9380, 420, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn10Activated = true
end

function enemyPlacement:spawn11()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(9580, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(9620, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(10020, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(10060, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn11Activated = true
end

function enemyPlacement:spawn12()
  --UFO
  ufo = flyingEnemy:extend()
  ufo:new(10360, 220)
  table.insert(actorList, ufo)

  self.spawn12Activated = true
end

function enemyPlacement:spawn13()
  --UFO
  ufo = flyingEnemy:extend()
  ufo:new(10760, 220)
  table.insert(actorList, ufo)
  
  self.spawn13Activated = true
end

function enemyPlacement:spawn14()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(11780, 260, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12140, 300, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12180, 300, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12340, 380, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12540, 420, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIE RANGED
  
  gE = groundEnemy:extend()
  gE:new(12220, 500, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12260, 460, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12380, 380, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn14Activated = true
end

function enemyPlacement:spawn15()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(12700, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12740, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12940, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(12980, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn15Activated = true
end

function enemyPlacement:spawn16()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(13100, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(13140, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(13340, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(13380, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn16Activated = true
end

function enemyPlacement:spawn17()
  --ZOMBIE MELEE
  gE = groundEnemy:extend()
  gE:new(13580, 220, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(14100, 340, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(14140, 340, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIE RANGED
  
  gE = groundEnemy:extend()
  gE:new(13620, 220, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(14020, 420, false, 20, 250, 400, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn17Activated = true
end

function enemyPlacement:spawn18()
  --UFOs
  ufo = flyingEnemy:extend()
  ufo:new(14420, 220)
  table.insert(actorList, ufo)
  
  self.spawn18Activated = true
end

function enemyPlacement:spawn19()
  for _,v in ipairs(actorList) do
    v:despawn()
  end
  
  finalBoss = boss:extend()
  finalBoss:new(15150, 400, 300) --BOSS (x, y, health)
  table.insert(actorList, finalBoss)
  
  self.spawn19Activated = true
end

return enemyPlacement