enemyPlacement = Object:extend()

local flyingEnemy = flyingEnemy or require "scripts/flyingEnemy"

local groundEnemy = enemy or require "scripts/enemy"

local pickUp = pickUp or require "scripts/pickUp"

function enemyPlacement:new()
  --UFOs
  ufo = flyingEnemy:extend()
  ufo:new(1420, 300)
  table.insert(actorList, ufo)
  
  ufo = flyingEnemy:extend()
  ufo:new(1350, 300)
  table.insert(actorList, ufo)
  
  ufo = flyingEnemy:extend()
  ufo:new(1280, 300)
  table.insert(actorList, ufo)
  
  pUp = pickUp:extend()
  pickUp:new(300, 300)
  table.insert(actorList, pUp)
  
  gE = groundEnemy:extend()
  gE:new(460, 350, false, 20, 250, 100, 2) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  --[[  
  --ZOMBIES MELEE
  gE = groundEnemy:extend()
  gE:new(500, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(600, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(700, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(800, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(850, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(900, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(950, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  
  gE = groundEnemy:extend()
  gE:new(1050, 350, true, 40, 250, 10, 4) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  table.insert(actorList, gE)
  ]]--
  
  --ZOMBIES RANGED
  --gE = groundEnemy:extend()
  --gE:new(400, 350, false, 20, 200, 100, 2) --MELEE ENEMY (x, y, isMelee, maxSpeed, detectionRange, attackRange, lives)
  --table.insert(actorList, gE)
  
end

return enemyPlacement