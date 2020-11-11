flyingEnemyBullet = Object:extend()

function flyingEnemyBullet:new(x, y, name)
  --Initialize the player position
  self.position = Vector.new(x, y)
  self.posX = x
  self.posY = y
  self.speed = 250
  self.maxSpeed = 100
  self.weaponOffsetX = 0
  self.weaponOffsetY = 0
  
  self.type = "enemyAttack"
  
  self.currentAnimation = 1
  self.spriteSheet = love.graphics.newImage('sprites/UFO_Sprite_Sheet.png')
  gUFO = anim8.newGrid(11, 34, self.spriteSheet:getWidth(), self.spriteSheet:getHeight(), 0, 80)
  self.animations = {anim8.newAnimation(gUFO('1-3',1), 0.15)}--IDLE
  
  self.bulletHitbox = {}
  self.bulletHitbox.body = love.physics.newBody(hitboxes, self.position.x, self.position.y, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.bulletHitbox.shape = love.physics.newRectangleShape(0, 0, 10, 10)
  self.bulletHitbox.fixture = love.physics.newFixture(self.bulletHitbox.body, self.bulletHitbox.shape, 0) -- Attach fixture to body and give it a density of 1.
  self.bulletHitbox.body:setGravityScale(0)
  self.bulletHitbox.fixture:setSensor(true)
	self.bulletHitbox.fixture:setUserData(self)
  table.insert(objects, self.bulletHitbox)
  --print("X: "..self.forward.x)
  --print("Y: "..self.forward.y)
end

function flyingEnemyBullet:update(dt)
  --print(self.bulletHitbox.body:getPosition())
  self.position.y = self.position.y + self.speed * dt
  
  self.bulletHitbox.body:setPosition(self.position.x, self.position.y)
  --Si excede de los limites establecidos se borra de la lista que hace el update y el draw
  if self.position.y > 550 then
    self:destroyBullet()
  end
end

function flyingEnemyBullet:draw(cam)  
  love.graphics.setColor(1,1,1)
  love.graphics.polygon("line", self.bulletHitbox.body:getWorldPoints(self.bulletHitbox.shape:getPoints())) --DEBUG PHYSICS HITBOX
  
  self.animations[self.currentAnimation]:draw(self.spriteSheet, self.position.x, self.position.y, 0, 1, 1, 11/2, 34/2)
end

function flyingEnemyBullet:destroyBullet()
  for _,v in ipairs(enemyBulletList) do
    if v == self then
      table.remove(enemyBulletList, _)
      --print("removed")
      self.bulletHitbox.body:destroy()
    end
  end
end

function flyingEnemyBullet:printPosition()
  print(self.bulletHitbox.body:getPosition())
end

return flyingEnemyBullet