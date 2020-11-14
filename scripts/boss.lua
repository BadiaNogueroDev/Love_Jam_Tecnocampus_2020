boss = Object:extend()

local flyingEnemyBullet = flyingEnemyBullet or require "scripts/flyingEnemyBullet"

local bossFireball = bossFireball or require "scripts/bossFireball"

function boss:new(x, y, health)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.detectionRange = detectionRange
  self.attackRange = attackRange
  self.health = health
  self.alive = true
  self.dying = false --Si està en l'animació de morir-se
  self.damaged = false --Red frames després de rebre damage
  self.damagedTime = 0.03
  self.damagedTimeLeft = 0

  --Initialize sprites sheets and animation lists
  self.characterWidth = 200
  self.characterHeight = 200
  self.spriteScale = 1
  self.torsoOffsetY = 20
  self.forward = Vector.new(fx or -1,fy or 0)
  
  --CUERPO
  self.currentBodyAnimation = 1
  self.spriteSheet = love.graphics.newImage('sprites/Boss Sprite Sheet.png')
  gBoss = anim8.newGrid(200, 200, self.spriteSheet:getWidth(), self.spriteSheet:getHeight()) --NUMEROS PROVISIONALS
  self.bossBodyAnimations = {anim8.newAnimation(gBoss('1-12',2), 0.10),--IDLE (1r Valor: Rang de frames. 2n Valor: Fila del sheet. 3r Valor: Velocitat de la animació)
                             anim8.newAnimation(gBoss('1-20',7), 0.10)} --MORIR
  
  --METRALLETA
  self.currentGunAnimation = 1
  self.bossGunAnimations = {anim8.newAnimation(gBoss('1-11',3), 0.04),   --POSITION 1 IDLE 
                            anim8.newAnimation(gBoss('12-20',3), 0.04),  --POSITION 1 ATTACK
                            anim8.newAnimation(gBoss('1-11',4), 0.04),   --POSITION 2 IDLE 
                            anim8.newAnimation(gBoss('12-20',4), 0.04),  --POSITION 2 ATTACK
                            anim8.newAnimation(gBoss('1-11',5), 0.04),   --POSITION 3 IDLE 
                            anim8.newAnimation(gBoss('12-20',5), 0.04),  --POSITION 3 ATTACK
                            anim8.newAnimation(gBoss('1-11',6), 0.04),   --POSITION 4 IDLE 
                            anim8.newAnimation(gBoss('12-20',6), 0.04)}  --POSITION 4 ATTACK
                            
  
  
  self.currentCannonAnimation = 1
  self.bossCannonAnimation = {anim8.newAnimation(gBoss('1-1',1), 0.04),  --1 IDLE
                              anim8.newAnimation(gBoss('1-12',1), 0.04)} --2 ATTACKING
  
  --Enemy hitbox in the physics system
  self.upperHitbox = {}
  self.upperHitbox.body = love.physics.newBody(hitboxes, self.posX, self.posY +40, "static")
  self.upperHitbox.shape = love.physics.newRectangleShape(0, 0, self.characterWidth/2, self.characterHeight/2) --the ball's shape has a radius of 20
  self.upperHitbox.fixture = love.physics.newFixture(self.upperHitbox.body, self.upperHitbox.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.upperHitbox.fixture:setSensor(true)
	self.upperHitbox.fixture:setUserData(self)
  table.insert(objects, self.upperHitbox)
  
  --Enemy hitbox in the physics system
  self.lowerHitbox = {}
  self.lowerHitbox.body = love.physics.newBody(hitboxes, self.posX, self.posY+self.characterHeight/2, "static")
  self.lowerHitbox.shape = love.physics.newRectangleShape(0, 0, self.characterWidth, self.characterHeight/2 - 40) --the ball's shape has a radius of 20
  self.lowerHitbox.fixture = love.physics.newFixture(self.lowerHitbox.body, self.lowerHitbox.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.lowerHitbox.fixture:setSensor(true)
	self.lowerHitbox.fixture:setUserData(self)
  table.insert(objects, self.lowerHitbox)
  
  --Boss shooting
  self.canShoot = false --El personatge pot disparar
  self.shooting = false --El personatge esta disparant
  self.shot = false --El personatge ja ha disparat la bala
  self.fireRate = 2
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
  
  self.changeAttackTimer = 0
  self.changeAttackTreshold = 12
  
  self.gunPosition = 1
  
  self.timer = 0
  
  self.attackType = 1 --1 GUN, 2 FIREBALL
  self.attackNumber = 0
  
  --Audio
  sound.inGameMusic:stop()
  sound.bossMusic:play()
  
  self.bossHurt = love.audio.newSource(sfxEnemies[3], 'stream')
  self.bossHurt:setVolume(0.3)
  
  self.bossAttack = love.audio.newSource("sound/Boss/Boss_Attack.wav", 'stream')
  self.bossAttack:setVolume(0.4)
  
  self.bossFireball = love.audio.newSource("sound/Boss/Boss_Fireball.wav", 'stream')
  self.bossFireball:setVolume(0.4)
  
  self.bossDeath = love.audio.newSource("sound/Boss/Boss_Death.wav", 'stream')
  self.bossDeath:setVolume(1)
end

function boss:update(dt)
  if self.health <= 0 then
    self.alive = false
    if not self.dying then
      self.bossDeath:play()
      self.currentBodyAnimation = 2
      self.bossBodyAnimations[self.currentBodyAnimation]:gotoFrame(1)
      self.bossBodyAnimations[self.currentBodyAnimation]:resume()
      self.dying = true
      self:die()
      self.upperHitbox.body:destroy()
      self.lowerHitbox.body:destroy()
    end
    if self.bossBodyAnimations[self.currentBodyAnimation]:getCurrentFrameCounter() == self.bossBodyAnimations[self.currentBodyAnimation]:getTotalFrameCounter() then
      self.bossBodyAnimations[self.currentBodyAnimation]:pauseAtEnd()
    end
  end
  
  if self.alive then
  --if self.alive and not self.shooting then --BOSS NERF
    angle = math.atan2(objects.player.body:getY()-(self.posY +45), objects.player.body:getX()-(self.posX-25))
      
    if math.deg(angle) > 165 then
      self.gunPosition = 2
      self.forward.x = math.cos(2.96)
      self.forward.y = math.sin(2.96)
    elseif math.deg(angle) > 155 then
      self.gunPosition = 3
      self.forward.x = math.cos(2.76)
      self.forward.y = math.sin(2.76)
    elseif math.deg(angle) > 145 then
      self.gunPosition = 4
      self.forward.x = math.cos(2.56)
      self.forward.y = math.sin(2.56)
    else
      self.gunPosition = 1
      self.forward.x = math.cos(3.14)
      self.forward.y = math.sin(3.14)
    end
    if not self.shooting then
      self.currentGunAnimation = self.gunPosition * 2 - 1
    end
  end
 
  --SHOOTING
  if self.alive then
    if self.attackType == 1 then  --GUN
      if self.canShoot then
        self.currentGunAnimation = self.gunPosition * 2
        self.bossGunAnimations[self.currentGunAnimation]:gotoFrame(1)
        self.bossGunAnimations[self.currentGunAnimation]:resume()
        self.nextFire = 0
        self.canShoot = false
        self.shot = false
        self.shooting = true
      elseif not self.shooting then
        --self.currentGunAnimation = 1
      end
      
      --Coordinar el spawn de la bala amb el moment de la animacio que li toca
      if self.bossGunAnimations[self.currentGunAnimation]:getCurrentFrameCounter() % 3 == 0 then
          self.shot = false
      end
      if self.shooting and not self.shot and (self.bossGunAnimations[self.currentGunAnimation]:getCurrentFrameCounter() == 2 or self.bossGunAnimations[self.currentGunAnimation]:getCurrentFrameCounter() == 5 or self.bossGunAnimations[self.currentGunAnimation]:getCurrentFrameCounter() == 8) then
        enemyBullet = flyingEnemyBullet:extend()
        enemyBullet:new(self.posX + 50* self.forward.x, self.posY + 40, self.forward, 3)
        table.insert(enemyBulletList, enemyBullet)
        self.bossAttack:stop()
        self.bossAttack:play()
        self.shot = true
      elseif self.shooting and self.bossGunAnimations[self.currentGunAnimation]:getCurrentFrameCounter() == self.bossGunAnimations[self.currentGunAnimation]:getTotalFrameCounter() then
        self.shooting = false
        self.fireRate = math.random(1.5,2.5)
      end--]]
      
      
    elseif self.attackType == 2 then  --FIREBALL
      if self.canShoot then
        self.currentCannonAnimation = 2
        self.bossCannonAnimation[self.currentCannonAnimation]:gotoFrame(1)
        self.bossCannonAnimation[self.currentCannonAnimation]:resume()
        self.nextFire = 0
        self.canShoot = false
        self.shot = false
        self.shooting = true
      elseif not self.shooting then
        self.currentCannonAnimation = 1
      end
      
      --Coordinar el spawn de la bala amb el moment de la animacio que li toca
      if self.shooting and not self.shot and self.bossCannonAnimation[self.currentCannonAnimation]:getCurrentFrameCounter() == 11 then
        local fireball = bossFireball:extend()
        fireball:new(self.posX - 40, self.posY, self.forward, 3)
        table.insert(enemyBulletList, fireball)
        self.bossFireball:play()
        self.shot = true
      elseif self.shooting and self.bossCannonAnimation[self.currentCannonAnimation]:getCurrentFrameCounter() == self.bossCannonAnimation[self.currentCannonAnimation]:getTotalFrameCounter() then
        self.currentCannonAnimation = 1
        self.shooting = false
        self.fireRate = math.random(1.5,2.5)
        self.attackNumber = self.attackNumber + 1
      end
      
      if self.attackNumber == 2 then
        self.attackNumber = 0
        self.attackType = 1
      end
    end
    
    --Temps de recarrega per tornar a disparar
    self.nextFire = self.nextFire + dt
    if self.nextFire >= self.fireRate then
      self.canShoot = true
    end
  end
    
    self.changeAttackTimer = self.changeAttackTimer + dt
  if not self.shooting and self.changeAttackTimer >= self.changeAttackTreshold then
    self.attackType = 2
    self.changeAttackTimer = 0
    self.changeAttackTreshold = math.random(7.5, 15)
  end
    
  if self.damaged then
    if self.damagedTimeLeft >= self.damagedTime then
      self.damaged = false
    end
    self.damagedTimeLeft = self.damagedTimeLeft + dt
  end
  
  self.timer = self.timer + dt
  if self.timer >= 13 then
    self.timer = 0
    self:drop()
  end
  
  --Fa que funcioni el update del anim8
  for i=1,#self.bossBodyAnimations do
    self.bossBodyAnimations[i]:update(dt)
  end
  
  for i=1,#self.bossGunAnimations do
    self.bossGunAnimations[i]:update(dt)
  end
  
  for i=1,#self.bossCannonAnimation do
    self.bossCannonAnimation[i]:update(dt)
  end
  
end

function boss:draw()
  cam:draw(
    function(l, t, w, h)
    --love.graphics.polygon("line", self.upperHitbox.body:getWorldPoints(self.upperHitbox.shape:getPoints())) --DEBUG PHYSICS HITBOX
    --love.graphics.polygon("line", self.lowerHitbox.body:getWorldPoints(self.lowerHitbox.shape:getPoints())) --DEBUG PHYSICS HITBOX
    
    if self.damaged then
      love.graphics.setColor(1,0,0)
    else
      love.graphics.setColor(1,1,1)
    end
    
    self.bossBodyAnimations[self.currentBodyAnimation]:draw(self.spriteSheet, self.posX, self.posY, 0 ,1 ,1, self.characterWidth/2 + 5, 3 + self.torsoOffsetY)
    
    if self.alive then
      self.bossGunAnimations[self.currentGunAnimation]:draw(self.spriteSheet, self.posX, self.posY, 0 ,1 ,1, self.characterWidth/2 + 5, 3 + self.torsoOffsetY)
      self.bossCannonAnimation[self.currentCannonAnimation]:draw(self.spriteSheet, self.posX, self.posY, 0 ,1 ,1, self.characterWidth/2 + 5, self.torsoOffsetY + 4)
    end 
    love.graphics.setColor(1,1,1)
  end)
end

function boss:changeAttack()
  
end

function boss:die()
  gFinal.gameFinished = true
end

function boss:drop()
  pUp = pickUp:extend()
  pUp:new(14850, 300)
  table.insert(pickUpsList, pUp)
end

function boss:takeDamage()
  self.bossHurt:stop()
  self.bossHurt:play()
  self.health = self.health - 1
  self.damaged = true
  self.damagedTimeLeft = 0
end

return boss