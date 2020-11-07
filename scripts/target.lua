target = Object:extend()

local bullet = bullet or require "scripts/bullet"

function target:new(x, y)
  --Initialize the propierties position
  self.posX = x or 650
  self.posY = y or 600
  self.speed = 1000
  self.maxSpeed = 100
  self.jumpForce = -150
  self.shootingUp = false
  
  self.characterWidth = 29
  self.characterHeight = 38
  self.spriteScale = 1
  self.forward = Vector.new(fx or 1,fy or 0)
  
  self.type = "enemy"
  
  --Enemy in the physics system
  self.target = {}
  self.target.body = love.physics.newBody(world, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.target.shape = love.physics.newRectangleShape(0, 0, self.characterWidth, self.characterHeight) --the ball's shape has a radius of 20
  self.target.fixture = love.physics.newFixture(self.target.body, self.target.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.target.body:setLinearDamping(2)
  self.target.body:setGravityScale(2)
  self.target.body:setFixedRotation(true)
  table.insert(objects, self.target)
  
  --Enemy hitbox in the physics system
  self.targetHitbox = {}
  self.targetHitbox.body = love.physics.newBody(hitboxes, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.targetHitbox.shape = love.physics.newRectangleShape(0, 0, self.characterWidth - 1, self.characterHeight - 1) --the ball's shape has a radius of 20
  self.targetHitbox.fixture = love.physics.newFixture(self.targetHitbox.body, self.targetHitbox.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.targetHitbox.fixture:setSensor(true)
	self.targetHitbox.fixture:setUserData("enemy")
  table.insert(objects, self.targetHitbox)
  
  --Player shooting
  self.shooting = false --El personatge esta disparant
  self.shot = false --El personatge ja ha disparat la bala
  self.fireRate = 0.2
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
end

function target:update(dt) 
  --print(objects.target.body:getWorldPoints(objects.target.shape:getPoints()))
  self.targetHitbox.body:setPosition(self.target.body:getPosition()) --Posar la hitbox fixe al objecte
end

function target:draw()
  cam:draw(function(l, t, w, h)
    love.graphics.setColor(1,1,1)
    love.graphics.polygon("fill", self.target.body:getWorldPoints(self.target.shape:getPoints())) --DEBUG PHYSICS HITBOX
    love.graphics.polygon("line", self.targetHitbox.body:getWorldPoints(self.targetHitbox.shape:getPoints())) --DEBUG HITBOX
  end)
end

return player