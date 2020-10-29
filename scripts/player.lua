player = Object:extend()

local bullet = bullet or require "scripts/bullet"

function player:new(x, y)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.speed = 1000
  self.maxSpeed = 100
  self.jumpForce = -150
  
  --Initialize sprites sheets and animation lists
  self.sprite = love.graphics.newImage("sprites/Tarma Idle.png")
  self.spriteScale = 1
  self.forward = Vector.new(fx or 1,fy or 0)
  self.airborn = true
  
  self.currentTorsoAnimation = 1
  self.torsoSpriteSheet = love.graphics.newImage('sprites/Torso_Sandra_Spritesheet.png')
  g = anim8.newGrid(54, 32, self.torsoSpriteSheet:getWidth(), self.torsoSpriteSheet:getHeight())
  self.torsoAnimations = {anim8.newAnimation(g('1-12',1), 0.07),--RUNNING
                          anim8.newAnimation(g('1-10',2), 0.03),--SHOOTING
                          anim8.newAnimation(g('1-6',3), 0.15),--IDLE
                          anim8.newAnimation(g('1-6',4), 0.1) --JUMPING
    }
    
  self.currentLegsAnimation = 1
  self.legsSpriteSheet = love.graphics.newImage('sprites/Legs_Sandra_Spritesheet.png')
  g32 = anim8.newGrid(32, 32, self.legsSpriteSheet:getWidth(), self.legsSpriteSheet:getHeight())
  self.legsAnimations = { anim8.newAnimation(g32('1-1',1), 0.15),--IDLE
                          anim8.newAnimation(g32('2-13',3), 0.07),--RUNNING
                          anim8.newAnimation(g32('1-6',2), 0.1)--JUMPING
    }
  
  --Player in the physics system
  objects.player = {}
  objects.player.body = love.physics.newBody(world, 850, 600, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  objects.player.shape = love.physics.newRectangleShape(0, 0, self.sprite:getWidth(), self.sprite:getHeight()) --the ball's shape has a radius of 20
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1) -- Attach fixture to body and give it a density of 1.
  objects.player.body:setLinearDamping(2)
  objects.player.body:setGravityScale(2)
  objects.player.body:setFixedRotation(true)
  
  --Player shooting
  self.shooting = false
  self.shot = false
  self.fireRate = 0.2
  self.nextFire = 0
end

function player:update(dt)
    --here we are going to create some keyboard events
  if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    self.forward.x = 1
    self.currentLegsAnimation = 2
    if objects.player.body:getLinearVelocity() < self.maxSpeed then
      objects.player.body:applyLinearImpulse(self.speed * dt, 0)
    end
    if not self.shooting then
      self.currentTorsoAnimation = 1
    end
  elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
    self.forward.x = -1
    self.currentLegsAnimation = 2
    if objects.player.body:getLinearVelocity() > -self.maxSpeed then
      objects.player.body:applyLinearImpulse(-self.speed * dt, 0)
    end
    if not self.shooting then
      self.currentTorsoAnimation = 1
    end
  else if not self.airborn then
    if not self.shooting then
      self.currentTorsoAnimation = 3
    end
      self:changeLegsAnimation(1)
    end
  end
  
  if love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
    self.forward.y = -1
  else
    self.forward.y = 0
    
  end
  
  self.velocity = Vector.new(objects.player.body:getLinearVelocity())
  
  if love.keyboard.isDown("space") and canJump then
    if not self.airborn then
      canJump = false
      objects.player.body:setLinearVelocity(objects.player.body:getLinearVelocity(x, y))
      objects.player.body:applyLinearImpulse(0, self.jumpForce)
      
      self:changeLegsAnimation(3)
      
      if not self.shooting then
      self.currentTorsoAnimation = 4
      self.torsoAnimations[self.currentTorsoAnimation]:gotoFrame(1)
      self.torsoAnimations[self.currentTorsoAnimation]:resume()
      end
    end
  elseif not love.keyboard.isDown("space") then
    canJump = true
  end
  
  if self.velocity.y > -0.01 and self.velocity.y < 0.01 then
    if self.airborn then
      self.airborn = false
    end
  else
    self.airborn = true
    self.currentLegsAnimation = 3
    
    if not self.shooting then
      self.currentTorsoAnimation = 4
    end
    
    if self.legsAnimations[self.currentLegsAnimation]:getCurrentFrameCounter() == self.legsAnimations[self.currentLegsAnimation]:getTotalFrameCounter() then
      self.legsAnimations[self.currentLegsAnimation]:pauseAtEnd()
    end
    if self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == self.torsoAnimations[self.currentTorsoAnimation]:getTotalFrameCounter() then
      self.torsoAnimations[self.currentTorsoAnimation]:pauseAtEnd()
    end
  end
  
  --Shooting
  if love.keyboard.isDown("z") then
    if canShoot then
      self.currentTorsoAnimation = 2
      self.torsoAnimations[self.currentTorsoAnimation]:gotoFrame(1)
      self.torsoAnimations[self.currentTorsoAnimation]:resume()
      self.nextFire = 0
      canShoot = false
      self.shot = false
      self.shooting = true
    end
  end
  
  if self.shooting and not self.shot and self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == 3 then
    b = bullet:extend()
    b:new(objects.player.body:getX(), objects.player.body:getY(), self.forward)
    table.insert(actorList, b)
    self.shot = true
    print(self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter())
  elseif self.shooting and self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == self.torsoAnimations[self.currentTorsoAnimation]:getTotalFrameCounter() then
    self.shooting = false
    print("finish")
  end
  
  self.nextFire = self.nextFire + dt
  
  if self.nextFire >= self.fireRate then
    canShoot = true
  end
  
  for i=1,#self.legsAnimations do
    self.legsAnimations[i]:update(dt)
  end
  
  for i=1,#self.torsoAnimations do
    self.torsoAnimations[i]:update(dt)
  end
end

function player:draw()
  cam:draw(function(l, t, w, h)
    love.graphics.setColor(1,1,1)
    --love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints())) --DEBUG PHYSICS HITBOX
    self.legsAnimations[self.currentLegsAnimation]:draw(self.legsSpriteSheet, objects.player.body:getX(), objects.player.body:getY(), 0 ,self.forward.x,1, self.sprite:getWidth()/2 - 1, 3)
    self.torsoAnimations[self.currentTorsoAnimation]:draw(self.torsoSpriteSheet, objects.player.body:getX(), objects.player.body:getY(), 0 ,self.forward.x,1, self.sprite:getWidth()/2 - 2, self.sprite:getHeight()/2 + 1)
  end)
end

function player:changeTorsoAnimation(number)
  if not self.shooting then
    self.currentTorsoAnimation = torso
  end
    
end

function player:changeLegsAnimation(number)
  self.currentLegsAnimation = number
  self.legsAnimations[self.currentLegsAnimation]:gotoFrame(1)
  self.legsAnimations[self.currentLegsAnimation]:resume()
end

return player