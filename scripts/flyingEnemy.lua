flyingEnemy = Object:extend()

local flyingEnemyBullet = enemyBullet or require "scripts/flyingEnemyBullet"

function flyingEnemy:new(x, y)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.speed = 2
  self.maxSpeed = 100
  self.detectionRange = 200
  self.attackRange = 20
  self.alive = true
  
  --Initialize sprites sheets and animation lists
  self.characterWidth = 45
  self.characterHeight = 32
  self.spriteScale = 1
  self.forward = Vector.new(fx or 1,fy or 0)
  
  self.currentAnimation = 1
  self.spriteSheet = love.graphics.newImage('sprites/UFO_Sprite_Sheet.png')
  gUFO = anim8.newGrid(57, 40, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
  self.animations = {anim8.newAnimation(gUFO('1-12',1), 0.05), --IDLE
                     anim8.newAnimation(gUFO('1-12',2), 0.07)  --DEAD
  }

  --Enemy in the physics system
  self.enemy = {}
  self.enemy.body = love.physics.newBody(world, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
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
end

function flyingEnemy:update(dt, player)
  
  VelocityX, VelocityY = objects.player.body:getLinearVelocity()
  
  self.playerDistanceX = self.enemy.body:getX() - objects.player.body:getX()
  self.playerDistanceY = self.enemy.body:getY() - objects.player.body:getY()
  
  --DETECCIÓ I MOVIMENT
  if self.playerDistanceX >= -self.detectionRange and self.playerDistanceX <= self.detectionRange and self.alive then
    self.enemy.body:setY(self.enemy.body:getY() - (self.playerDistanceY + 120) * self.speed * dt)
    self.enemy.body:setX(self.enemy.body:getX() - self.playerDistanceX * self.speed * dt)
  
    self.enemyHitbox.body:setPosition(self.enemy.body:getPosition()) --Posar la hitbox fixe al objecte
    if self.playerDistanceX <= self.attackRange and self.playerDistanceX >= -self.attackRange then
      if self.canShoot then
        print("shooting")
          self.forward.y = 0
          self.nextFire = 0
          self.canShoot = false
          enemyBullet = flyingEnemyBullet:extend()
          enemyBullet:new(self.enemy.body:getX(), self.enemy.body:getY())
          table.insert(playerBulletList, enemyBullet)
      end
    end
  end
  if not self.alive then
    self.currentAnimation = 2
    if self.animations[self.currentAnimation]:getCurrentFrameCounter() == self.animations[self.currentAnimation]:getTotalFrameCounter() then
      self.animations[self.currentAnimation]:pauseAtEnd()
      self:die()
    end
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
    love.graphics.setColor(1,1,1)
    love.graphics.polygon("line", self.enemyHitbox.body:getWorldPoints(self.enemyHitbox.shape:getPoints())) --DEBUG HITBOX
    self.animations[self.currentAnimation]:draw(self.spriteSheet, self.enemy.body:getX(), self.enemy.body:getY(), 0, 1, 1, 57/2, 40/2)

  end)
end

function flyingEnemy:die()
  for _,v in ipairs(actorList) do
    if v == self then
      --table.remove(actorList, _)
      --self.enemy.body:destroy()
      --self.enemyHitbox.body:destroy()
      --print("removed")
    end
  end
end

return flyingEnemy