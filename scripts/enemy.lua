enemy = Object:extend()

local bullet = bullet or require "scripts/bullet"

function enemy:new(x, y, attackRange, isMele)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.speed = 1000
  self.maxSpeed = 100
  self.detectionRange = 500
  self.attackRange = attackRange
  self.isMele = isMele
  
  --Initialize sprites sheets and animation lists
  self.sprite = love.graphics.newImage("sprites/Tarma Idle.png")
  self.spriteScale = 1
  self.forward = Vector.new(fx or 1,fy or 0)
  
  
  self.currentAnimation = 1
  self.enemySpriteSheet = love.graphics.newImage('sprites/Torso_Sandra_Spritesheet.png')
  g = anim8.newGrid(54, 32, self.enemySpriteSheet:getWidth(), self.enemySpriteSheet:getHeight())
  g72 = anim8.newGrid(54, 72, self.enemySpriteSheet:getWidth(), self.enemySpriteSheet:getHeight(), 0, 160)
  self.enemyAnimations = {anim8.newAnimation(g('1-12',1), 0.04),--RUNNING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g('1-10',2), 0.03),--SHOOTING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g('1-6',3), 0.15),--IDLE (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g('1-14',4), 0.15),--MORIR (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
  } --3r Valor: Velocitat de la animació
  
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
  
  self.playerDistance = self.x - player.x
  
  --TODO: Right movement
  --here we are going to create some keyboard events
  if self.playerDistance < self.detectionRange then
    
    if player.body:getX() < enem.body:getX()
    
    self.forward.x = 1
    self.currentAnimation = 2
    
    if VelocityX < self.maxSpeed then
      objects.player.body:applyLinearImpulse(self.speed * dt, 0)
    end
    
    
  --TODO: Left movement
  elseif love.keyboard.isDown("left") then
    self.forward.x = -1
    self.currentAnimation = 2
    
    if VelocityX > -self.maxSpeed then
      objects.player.body:applyLinearImpulse(-self.speed * dt, 0)
    end
  end
  
  --Vector que agafa la velocitat en X i Y del personatge
  self.velocity = Vector.new(objects.player.body:getLinearVelocity())
  
  
  --Shooting
  if love.keyboard.isDown("z") then
    if canShoot then
      if love.keyboard.isDown("up") then
        self.forward.y = -1
        self.shootingUp = true
        self.currentTorsoAnimation = 6
        self.torsoOffsetY = 41 --Solució temporal al canviar el offset per disparar a dalt i abaix
      else
        self.shootingUp = false
        self.forward.y = 0
        self.currentTorsoAnimation = 2
        self.torsoOffsetY = 1  --Solució temporal al canviar el offset per disparar a dalt i abaix
      end
      self.torsoAnimations[self.currentTorsoAnimation]:gotoFrame(1)
      self.torsoAnimations[self.currentTorsoAnimation]:resume()
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