flyingEnemy = Object:extend()

local flyingEnemyBullet = enemyBullet or require "scripts/flyingEnemyBullet"

function flyingEnemy:new(x, y, maxSpeed, detectionRange, attackRange, health)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.speed = 2
  self.maxSpeed = 100
  self.detectionRange = 200
  self.attackRange = attackRange or 40
  self.alive = true  --Si està viu
  self.dying = false --Si està en l'animació de morir-se
  self.health = 16
  self.damaged = false --Red frames després de rebre damage
  self.damagedTime = 0.03
  self.damagedTimeLeft = 0
  self.canDrop = true
  
  --Initialize sprites sheets and animation lists
  self.characterWidth = 45
  self.characterHeight = 32
  self.spriteScale = 1
  self.forward = Vector.new(0, 1)
  
  self.currentAnimation = 1
  self.spriteSheet = love.graphics.newImage('sprites/UFO_Sprite_Sheet.png')
  gUFO = anim8.newGrid(57, 40, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
  self.animations = {anim8.newAnimation(gUFO('1-12',1), 0.05), --IDLE
                     anim8.newAnimation(gUFO('1-12',2), 0.10)  --DEAD
  }

  --Enemy in the physics system
  self.enemy = {}
  self.enemy.body = love.physics.newBody(world, self.posX, self.posY, "kinematic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.enemy.shape = love.physics.newRectangleShape(0, 0, self.characterWidth, self.characterHeight) --the ball's shape has a radius of 20
  self.enemy.fixture = love.physics.newFixture(self.enemy.body, self.enemy.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.enemy.body:setGravityScale(0)
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
  self.fireRate = 1
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
  self.canShoot = true
  
  self.enemyUFOBala = love.audio.newSource(sfxEnemies[1], 'stream')
  self.enemyUFOBala:setVolume(0.4)
  self.enemyUFOHurt = love.audio.newSource(sfxEnemies[3], 'stream')
  self.enemyUFOHurt:setVolume(0.3)
  self.enemyUFODeath = love.audio.newSource(sfxEnemies[4], 'stream')
  self.enemyUFODeath:setVolume(0.25)
  self.enemyUFOSpawn = love.audio.newSource(sfxEnemies[2], 'stream')
  self.enemyUFOSpawn:setVolume(0.3)
  self.enemyUFOSpawn:play()
  
end

function flyingEnemy:update(dt, player)
  if self.health <= 0 then
    self.alive = false
    if not self.dying then
      self:randomDrop()
      self.enemyUFODeath:play()
      self.currentAnimation = 2
      self.animations[self.currentAnimation]:gotoFrame(1)
      self.animations[self.currentAnimation]:resume()
      self.dying = true
      self.enemy.body:destroy()
      self.enemyHitbox.body:destroy()
    end
    if self.animations[self.currentAnimation]:getCurrentFrameCounter() == self.animations[self.currentAnimation]:getTotalFrameCounter() then
      self.animations[self.currentAnimation]:pauseAtEnd()
      self:die()
    end
  end
  
  if self.alive then  
    self.playerDistanceX = self.enemy.body:getX() - objects.player.body:getX()
    self.playerDistanceY = self.enemy.body:getY() - objects.player.body:getY()

    --DETECCIÓ I MOVIMENT
    if self.playerDistanceX >= -self.detectionRange and self.playerDistanceX <= self.detectionRange and self.alive and not p.invencible then
      self.posX, self.posY = self.enemy.body:getPosition()
      self.enemy.body:setY(self.enemy.body:getY() - (self.playerDistanceY + 120) * self.speed * dt)
      self.enemy.body:setX(self.enemy.body:getX() - self.playerDistanceX * self.speed * dt)
    
      self.enemyHitbox.body:setPosition(self.enemy.body:getPosition()) --Posar la hitbox fixe al objecte
      if self.playerDistanceX <= self.attackRange and self.playerDistanceX >= -self.attackRange then
        if self.canShoot then
          self.nextFire = 0
          self.canShoot = false
          self.enemyUFOBala:stop()
          self.enemyUFOBala:play()
          enemyBullet = flyingEnemyBullet:extend()
          enemyBullet:new(self.enemy.body:getX(), self.enemy.body:getY(),self.forward ,2)
          table.insert(enemyBulletList, enemyBullet)
        end
      end
    end
  end
  if self.damaged then
      if self.damagedTimeLeft >= self.damagedTime then
        self.damaged = false
      end
      self.damagedTimeLeft = self.damagedTimeLeft + dt
    end
  
  --Temps de recarrega per tornar a disparar
  self.nextFire = self.nextFire + dt
  if self.nextFire >= self.fireRate then
    self.canShoot = true
  end
  
  --Fa que funcioni el update del anim8
  for i=1,#self.animations do
    self.animations[self.currentAnimation]:update(dt)
  end
end

function flyingEnemy:draw()
  cam:draw(function(l, t, w, h)
    if self.damaged then
      love.graphics.setColor(1,0,0)
    else
      love.graphics.setColor(1,1,1)
    end
    --love.graphics.polygon("line", self.enemyHitbox.body:getWorldPoints(self.enemyHitbox.shape:getPoints())) --DEBUG HITBOX
    self.animations[self.currentAnimation]:draw(self.spriteSheet, self.posX, self.posY, 0, 1, 1, 57/2, 40/2)
    
    love.graphics.setColor(1,1,1)
  end)
end

function flyingEnemy:die()
  for _,v in ipairs(actorList) do
    if v == self then
      table.remove(actorList, _)
      --self.enemy.body:destroy()
      --self.enemyHitbox.body:destroy()
      --print("removed")
    end
  end
end

function flyingEnemy:randomDrop()
  local chance = math.random(1, 100)
  if chance <= 100 and self.canDrop then
    pUp = pickUp:extend()
    pUp:new(self.enemy.body:getX(), self.enemy.body:getY())
    table.insert(pickUpsList, pUp)
  end
end

function flyingEnemy:takeDamage()
  self.enemyUFOHurt:stop()
  self.enemyUFOHurt:play()
  self.health = self.health - 1
  self.damaged = true
  self.damagedTimeLeft = 0
end

function flyingEnemy:despawn()
  self.enemy.body:destroy()
  self.enemyHitbox.body:destroy()
  self.alive = false
  self.die()
end

return flyingEnemy