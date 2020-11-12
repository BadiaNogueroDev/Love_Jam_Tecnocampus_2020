enemyPlacement = Object:extend()

local flyingEnemy = flyingEnemy or require "scripts/flyingEnemy"

local groundEnemy = enemy or require "scripts/enemy"

local pickUp = pickUp or require "scripts/pickUp"

function enemyPlacement:new()
  enemySpawns = {}
  
  --pUp = pickUp:extend()
  --pUp:new(1740, 300)
  --table.insert(pickUpsList, pUp)
  
  self.spawn3Activated = false
  
  enemyPlacement:spawn1()
  
  enemyPlacement:spawn2()
  
  --objects.player.body:setX(1700)
  --objects.player.body:setY(450)
  
  --UFOs
  --ufo = flyingEnemy:extend()
  --ufo:new(1420, 300)
  --table.insert(actorList, ufo)
  
end

function enemyPlacement:update(dt)
  if not self.spawn3Activated and objects.player.body:getX() > 1860 then
    self:spawn3()
  end
end

function enemyPlacement:spawn1()
  --ZOMBIES MELEE
  gE = groundEnemy:extend()
  gE:new(540, 350, true, 0, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(980, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn1Activated = true
end

function enemyPlacement:spawn2()
  --ZOMBIES MELEE
  gE = groundEnemy:extend()
  gE:new(1620, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1640, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1660, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --ZOMBIES RANGED
  gE = groundEnemy:extend()
  gE:new(1680, 350, false, 20, 300, 200, 2) --RANGED ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  self.spawn2Activated = true
end

function enemyPlacement:spawn3()
  gE = groundEnemy:extend()
  gE:new(2180, 420, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(2230, 420, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(2280, 420, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1580, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1600, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1620, 450, true, 40, 400, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  pUp = pickUp:extend()
  pUp:new(1940, 300)
  table.insert(pickUpsList, pUp)
  
  self.spawn3Activated = true
end

function enemyPlacement:spawn4()
  
end

function enemyPlacement:spawn5()
  
end

return enemyPlacement