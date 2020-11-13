enemyPlacement = Object:extend()

local flyingEnemy = flyingEnemy or require "scripts/flyingEnemy"

local groundEnemy = enemy or require "scripts/enemy"

local pickUp = pickUp or require "scripts/pickUp"

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
  
  enemyPlacement:spawn1()
  
  objects.player.body:setX(3500)
  objects.player.body:setY(450)
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

return enemyPlacement