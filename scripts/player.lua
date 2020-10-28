player = Object:extend()

local bullet = bullet or require "scripts/bullet"

local animation

function player:new(x, y)
  --Initialize the player position
  self.posX = x
  self.posY = y
  self.speed = 1000  --Initialize the paddle speed
  self.maxSpeed = 100
  self.jumpForce = -150
  self.sprite = love.graphics.newImage("sprites/Tarma Idle.png")
  self.spriteScale = 1
  self.forward = Vector.new(fx or 1,fy or 0)
  self.airborn = true
  
  self.currentAnimation = 1
  sprite = love.graphics.newImage('sprites/Sandra_Sprite_Sheet.png')
  g41 = anim8.newGrid(41, 41, sprite:getWidth(), sprite:getHeight())
  g48 = anim8.newGrid(41, 48, sprite:getWidth(), sprite:getHeight(),0 , 82)
  
  animations = {anim8.newAnimation(g41('1-16',1), 0.15),--IDLE
                anim8.newAnimation(g41('4-16',2), 0.07),--RUNNING
                anim8.newAnimation(g48('1-6',1), 0.1), --JUMPING
                anim8.newAnimation(g48('5-6',1), 0.07)  --JUMPING LOOP
    
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
  self.fireRate = 0.2
  self.nextFire = 0
end

function player:update(dt)
    --here we are going to create some keyboard events
  if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    self.forward.x = 1
    self.currentAnimation = 2
    if objects.player.body:getLinearVelocity() < self.maxSpeed then
      objects.player.body:applyLinearImpulse(self.speed * dt, 0)
    end
  elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
    self.forward.x = -1
    self.currentAnimation = 2
    if objects.player.body:getLinearVelocity() > -self.maxSpeed then
      objects.player.body:applyLinearImpulse(-self.speed * dt, 0)
    end
  else if not self.airborn then
      self.currentAnimation = 1
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
      self.currentAnimation = 3
      animations[self.currentAnimation]:gotoFrame(1)
      animations[self.currentAnimation]:resume()
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
    self.currentAnimation = 3
  end
  
  --Shooting
  if love.keyboard.isDown("z") then
    if canShoot then
      self.nextFire = 0
      b = bullet:extend()
      b:new(objects.player.body:getX(), objects.player.body:getY(), self.forward)
      table.insert(actorList, b)
      canShoot = false
    end
  end
  self.nextFire = self.nextFire + dt
  
  if self.nextFire >= self.fireRate then
    canShoot = true
  end
  
  for i=1,#animations do
    animations[i]:update(dt)
  end
end

function player:draw()
  cam:draw(function(l, t, w, h)
    love.graphics.setColor(1,1,1)
    --love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints())) --DEBUG PHYSICS HITBOX
    animations[self.currentAnimation]:draw(sprite, objects.player.body:getX(), objects.player.body:getY(), 0 ,self.forward.x,1, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
    --love.graphics.draw(self.sprite, objects.player.body:getX() +10, objects.player.body:getY(), 0, self.forward.x * self.spriteScale, self.spriteScale,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  end)
end

return player