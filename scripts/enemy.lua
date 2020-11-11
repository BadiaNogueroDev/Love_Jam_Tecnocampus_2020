enemy = Object:extend()

local bullet = bullet or require "scripts/bullet"

function enemy:new(x, y, isMelee, maxSpeed, detectionRange, attackRange, health)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.speed = 1000
  self.maxSpeed = maxSpeed
  self.detectionRange = detectionRange
  self.attackRange = attackRange
  self.isMelee = isMelee
  self.health = health
  self.alive = true
  self.dying = false --Si està en l'animació de morir-se
  self.damaged = false --Red frames després de rebre damage
  self.damagedTime = 0.03
  self.damagedTimeLeft = 0
  
  --Initialize sprites sheets and animation lists
  self.characterWidth = 25
  self.characterHeight = 35
  self.spriteScale = 1
  self.torsoOffsetY = 20
  self.forward = Vector.new(fx or -1,fy or 0)

  
  if self.isMelee then
    self.currentMeleeAnimation = 1
    self.enemyMeleeSpriteSheet = love.graphics.newImage('sprites/Melee_Zombie.png')
    gZ1 = anim8.newGrid(34, 43, self.enemyMeleeSpriteSheet:getWidth(), self.enemyMeleeSpriteSheet:getHeight()) --NUMEROS PROVISIONALS
    self.enemyMeleeAnimations = {anim8.newAnimation(gZ1('1-12',1), 0.10),--RUNNING (1r Valor: Rang de frames. 2n Valor: Fila del sheet. 3r Valor: Velocitat de la animació)
                                 anim8.newAnimation(gZ1('1-14',2), 0.07)} --MORIR
  else
    self.currentRangedAnimation = 1
    self.enemyRangedSpriteSheet = love.graphics.newImage('sprites/Ranged_Zombie.png')
    gZ2 = anim8.newGrid(37, 45, self.enemyRangedSpriteSheet:getWidth(), self.enemyRangedSpriteSheet:getHeight()) --NUMEROS PROVISIONALS
    self.enemyRangedAnimations = {anim8.newAnimation(gZ2('1-12',1), 0.10),--IDLE
                                  anim8.newAnimation(gZ2('1-12',2), 0.10),--RUNNING 2
                                  anim8.newAnimation(gZ2('1-21',3), 0.10),--SHOOTING
                                  anim8.newAnimation(gZ2('1-14',4), 0.07)}--MORIR
  end

  --Player in the physics system
  self.enemy = {}
  self.enemy.body = love.physics.newBody(world, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.enemy.shape = love.physics.newRectangleShape(0, 0, self.characterWidth, self.characterHeight) --the ball's shape has a radius of 20
  self.enemy.fixture = love.physics.newFixture(self.enemy.body, self.enemy.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.enemy.body:setLinearDamping(2)
  self.enemy.body:setGravityScale(2)
  self.enemy.body:setFixedRotation(true)
  table.insert(objects, self.enemy)
  
  --Enemy hitbox in the physics system
  self.enemyHitbox = {}
  self.enemyHitbox.body = love.physics.newBody(hitboxes, self.posX, self.posY, "static") --place the body somewhere in the world and make it dynamic, so it can move around
  self.enemyHitbox.shape = love.physics.newRectangleShape(0, 0, self.characterWidth - 1, self.characterHeight - 1) --the ball's shape has a radius of 20
  self.enemyHitbox.fixture = love.physics.newFixture(self.enemyHitbox.body, self.enemyHitbox.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.enemyHitbox.fixture:setSensor(true)
	self.enemyHitbox.fixture:setUserData(self)
  table.insert(objects, self.enemyHitbox)
  
  --Player shooting
  self.canShoot = true --El personatge pot disparar
  self.shooting = false --El personatge esta disparant
  self.shot = false --El personatge ja ha disparat la bala
  self.fireRate = 2
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
end

function enemy:update(dt)
  if self.health <= 0 then
    self.alive = false
    if self.isMelee then
      if not self.dying then
        self.currentMeleeAnimation = 2
        self.enemyMeleeAnimations[self.currentMeleeAnimation]:gotoFrame(1)
        self.enemyMeleeAnimations[self.currentMeleeAnimation]:resume()
        self.dying = true
        self.enemy.body:destroy()
        self.enemyHitbox.body:destroy()
      end
      if self.enemyMeleeAnimations[self.currentMeleeAnimation]:getCurrentFrameCounter() == self.enemyMeleeAnimations[self.currentMeleeAnimation]:getTotalFrameCounter() then
        self.enemyMeleeAnimations[self.currentMeleeAnimation]:pauseAtEnd()
        self:die()
      end
    else
      if not self.dying then
        self.currentRangedAnimation = 4
        self.enemyRangedAnimations[self.currentRangedAnimation]:gotoFrame(1)
        self.enemyRangedAnimations[self.currentRangedAnimation]:resume()
        self.dying = true
        self.enemy.body:destroy()
        self.enemyHitbox.body:destroy()
      end
      if self.enemyRangedAnimations[self.currentRangedAnimation]:getCurrentFrameCounter() == self.enemyRangedAnimations[self.currentRangedAnimation]:getTotalFrameCounter() then
        self.enemyRangedAnimations[self.currentRangedAnimation]:pauseAtEnd()
        self:die()
      end
    end
  end
  
  if self.alive then
    self.VelocityX, self.VelocityY = self.enemy.body:getLinearVelocity()
    self.playerDistance = self.enemy.body:getX() - objects.player.body:getX()
    
    self.posX = self.enemy.body:getX()
    self.posY = self.enemy.body:getY()
    
    self.enemyHitbox.body:setPosition(self.enemy.body:getPosition()) --Posar la hitbox fixe al objecte
  end
  
  --DETECCIÓ I MOVIMENT
  if self.playerDistance <= self.detectionRange and self.playerDistance >= -self.detectionRange and self.alive then
    if self.playerDistance > self.attackRange or self.playerDistance < -self.attackRange then
      if objects.player.body:getX() > self.enemy.body:getX() then
        self.forward.x = 1
        
        if self.isMelee then
          self.currentMeleeAnimation = 1
        else
          self.currentRangedAnimation = 2
        end
        
        if self.VelocityX < self.maxSpeed then
            self.enemy.body:applyLinearImpulse(self.speed/200, 0)
        end
      end
    
    
      if objects.player.body:getX() < self.enemy.body:getX() then
        self.forward.x = -1
        
        if self.isMelee then
          self.currentMeleeAnimation = 1
        else
          self.currentRangedAnimation = 2
        end
        
        if self.VelocityX > -self.maxSpeed then
            self.enemy.body:applyLinearImpulse(-self.speed/200, 0)
        end
      end
    end
  end
  
  --SHOOTING
  if not self.isMelee and self.alive then
    if self.playerDistance < self.attackRange and self.playerDistance > -self.attackRange then
      if self.canShoot then
          self.forward.y = 0
          self.currentRangedAnimation = 3
          self.enemyRangedAnimations[self.currentRangedAnimation]:gotoFrame(1)
          self.enemyRangedAnimations[self.currentRangedAnimation]:resume()
          self.nextFire = 0
          self.canShoot = false
          self.shot = false
          self.shooting = true
      end
    end
    
    --Coordinar el spawn de la bala amb el moment de la animacio que li toca
    if self.shooting and not self.shot and self.enemyRangedAnimations[self.currentRangedAnimation]:getCurrentFrameCounter() == 14 then
      b = bullet:extend()
      b:new(self.enemy.body:getX(), self.enemy.body:getY(), self.forward, "Normal")
      table.insert(enemyBulletList, b)
      self.shot = true
    elseif self.shooting and self.enemyRangedAnimations[self.currentRangedAnimation]:getCurrentFrameCounter() == self.enemyRangedAnimations[self.currentRangedAnimation]:getTotalFrameCounter() then
      self.shooting = false
    end
    
    --Temps de recarrega per tornar a disparar
    self.nextFire = self.nextFire + dt
    if self.nextFire >= self.fireRate then
      self.canShoot = true
    end
  end
    
    if self.damaged then
      if self.damagedTimeLeft >= self.damagedTime then
        self.damaged = false
      end
      self.damagedTimeLeft = self.damagedTimeLeft + dt
    end
    
  --Fa que funcioni el update del anim8
  if self.isMelee then
    for i=1,#self.enemyMeleeAnimations do
    self.enemyMeleeAnimations[i]:update(dt)
    end
  else
    for i=1,#self.enemyRangedAnimations do
    self.enemyRangedAnimations[i]:update(dt)
    end
  end

end

function enemy:draw()
  cam:draw(
    function(l, t, w, h)
    --love.graphics.polygon("line", self.enemyHitbox.body:getWorldPoints(self.enemyHitbox.shape:getPoints())) --DEBUG PHYSICS HITBOX
    
    if self.damaged then
      love.graphics.setColor(1,0,0)
    else
      love.graphics.setColor(1,1,1)
    end
    
    if self.isMelee then
      self.enemyMeleeAnimations[self.currentMeleeAnimation]:draw(self.enemyMeleeSpriteSheet, self.posX, self.posY, 0 ,-self.forward.x,1, self.characterWidth/2 + 5, 3 + self.torsoOffsetY)
    else
      self.enemyRangedAnimations[self.currentRangedAnimation]:draw(self.enemyRangedSpriteSheet, self.posX, self.posY, 0 ,-self.forward.x,1, self.characterWidth/2 + 4, self.characterHeight/2 + 5)
    end
    love.graphics.setColor(1,1,1)
  end)
end

function enemy:die()
  for _,v in ipairs(actorList) do
    if v == self then
      table.remove(actorList, _)
      --self.enemy.body:destroy()
      --self.enemyHitbox.body:destroy()
    end
  end
end

function enemy:takeDamage()
  self.health = self.health - 1
  self.damaged = true
  self.damagedTimeLeft = 0
end

return enemy