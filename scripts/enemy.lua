enemy = Object:extend()

local bullet = bullet or require "scripts/bullet"

function enemy:new(x, y, attackRange, isMelee)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.speed = 1000
  self.maxSpeed = 100
  self.detectionRange = 500
  self.attackRange = attackRange
  self.isMelee = isMelee
  
  --Initialize sprites sheets and animation lists
  self.characterWidth = 25
  self.characterHeight = 36
  self.spriteScale = 1
  self.forward = Vector.new(fx or 1,fy or 0)
  
  
  if self.isMelee then
    self.currentMeleeAnimation = 1
    self.enemyMeleeSpriteSheet = love.graphics.newImage('sprites/Melee_Zombie.png')
    gZ1 = anim8.newGrid(54, 32, self.enemySpriteSheet:getWidth(), self.enemySpriteSheet:getHeight()) --NUMEROS PROVISIONALS
    self.enemyMeleeAnimations = {anim8.newAnimation(self('1-12',1), 0.15),--RUNNING (1r Valor: Rang de frames. 2n Valor: Fila del sheet. 3r Valor: Velocitat de la animació)
                                anim8.newAnimation(self('1-10',2), 0.15)} --MORIR
  else
    self.currentRangedAnimation = 1
    self.enemyRangedSpriteSheet = love.graphics.newImage('sprites/Ranged_Zombie.png')
    gZ2 = anim8.newGrid(54, 32, self.enemySpriteSheet:getWidth(), self.enemySpriteSheet:getHeight()) --NUMEROS PROVISIONALS
    self.enemyRangedAnimations = {anim8.newAnimation(gZ2('1-12',1), 0.15),--RUNNING 1
                                  anim8.newAnimation(gZ2('1-10',2), 0.15),--RUNNING 2
                                  anim8.newAnimation(gZ2('1-21',3), 0.15),--SHOOTING
                                  anim8.newAnimation(gZ2('1-14',4), 0.15)}--MORIR
  end

  --Player in the physics system
  objects.enemy = {}
  objects.enemy.body = love.physics.newBody(world, 850, 600, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  objects.enemy.shape = love.physics.newRectangleShape(0, 0, self.sprite:getWidth(), self.sprite:getHeight()) --the ball's shape has a radius of 20
  objects.enemy.fixture = love.physics.newFixture(objects.enemy.body, objects.enemy.shape, 1) -- Attach fixture to body and give it a density of 1.
  objects.enemy.body:setLinearDamping(2)
  objects.enemy.body:setGravityScale(2)
  objects.enemy.body:setFixedRotation(true)
  
  --Player shooting
  self.shooting = false --El personatge esta disparant
  self.shot = false --El personatge ja ha disparat la bala
  self.fireRate = 0.2
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
end

function enemy:update(dt, player)
  
  VelocityX, VelocityY = objects.player.body:getLinearVelocity()
  self.playerDistance = self.posX - player.posX
  
  --DETECCIÓ I MOVIMENT
  if self.playerDistance <= self.detectionRange then
    
    if player.body:getX() < enemy.body:getX() then
      self.forward.x = 1
      self.currentAnimation = 2
      
      if VelocityX < self.maxSpeed then
      objects.enemy.body:applyLinearImpulse(self.speed/200, 0)
      end
      
    elseif player.body:getX() < enemy.body:getX() then
      self.forward.x = -1
      self.currentAnimation = 2
      
      if VelocityX < -self.maxSpeed then
      objects.enemy.body:applyLinearImpulse(self.speed/200, 0)
      end
    end
  end
  
  --Vector que agafa la velocitat en X i Y del personatge
  self.velocity = Vector.new(objects.player.body:getLinearVelocity())
  
  --SHOOTING
  if self.playerDistance <= self.attackRange and not self.isMelee then
    if canShoot then
        self.forward.y = 0
        self.currentRangedAnimation = 2
        self.enemyRangedAnimations[self.currentRangedAnimation]:gotoFrame(1)
        self.enemyRangedAnimations[self.currentRangedAnimation]:resume()
        self.nextFire = 0
        canShoot = false
        self.shot = false
        self.shooting = true
    end
  end
  
  --Coordinar el spawn de la bala amb el moment de la animacio que li toca
  if self.shooting and not self.shot and self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == 3 then
    b = bullet
    b:new(objects.player.body:getX(), objects.player.body:getY(), self.forward, #actorList + 1)
    table.insert(playerBulletList, b)
    self.shot = true
  elseif self.shooting and self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == self.torsoAnimations[self.currentTorsoAnimation]:getTotalFrameCounter() then
    self.shooting = false
    self.shootingUp = false
  end
  
  --Temps de recarrega per tornar a disparar
  self.nextFire = self.nextFire + dt
  if self.nextFire >= self.fireRate then
    canShoot = true
  end
  
  --Fa que funcioni el update del anim8
  for i=1,#self.enemyAnimations do
    self.enemyAnimations[i]:update(dt)
  end
end

function enemy:draw()
  cam:draw(function(l, t, w, h)
    love.graphics.setColor(1,1,1)
    --love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints())) --DEBUG PHYSICS HITBOX
    self.enemyAnimations[self.currentAnimation]:draw(self.legsSpriteSheet, objects.enemy.body:getX(), objects.enemy.body:getY(), 0 ,self.forward.x,1, self.sprite:getWidth()/2 - 1, 3)

  end)
end

function enemy:changeAnimation(number)
  if not self.shooting then
    self.currentTorsoAnimation = torso
  end
  
  self.currentAnimation = number
  self.enemyAnimations[self.currentAnimation]:gotoFrame(1)
  self.enemyAnimations[self.currentAnimation]:resume()
end

return enemy