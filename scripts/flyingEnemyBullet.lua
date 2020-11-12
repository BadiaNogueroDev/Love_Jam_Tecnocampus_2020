flyingEnemyBullet = Object:extend()

function flyingEnemyBullet:new(x, y, forward, animation)
  --Initialize the player position
  self.position = Vector.new(x, y)
  self.posX = x
  self.posY = y
  self.speed = 250
  self.maxSpeed = 100
  self.weaponOffsetX = 0
  self.weaponOffsetY = 0
  self.forward = Vector.new(forward.x, forward.y)
  self.type = "enemyAttack"
  
  self.currentAnimation = animation
  self.spriteSheet = love.graphics.newImage('sprites/Enemy Bullets.png')
  gEnemy = anim8.newGrid(37, 34, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
  self.animations = {anim8.newAnimation(gEnemy('1-5',1), 0.07), --1 POTA
                     anim8.newAnimation(gEnemy('1-3',2), 0.15)  --2 LASER
  }
  
  self.bulletHitbox = {}
  self.bulletHitbox.body = love.physics.newBody(hitboxes, self.position.x, self.position.y, "dynamic")
  self.bulletHitbox.shape = love.physics.newRectangleShape(0, 0, 10, 10)
  self.bulletHitbox.fixture = love.physics.newFixture(self.bulletHitbox.body, self.bulletHitbox.shape, 1)
  self.bulletHitbox.fixture:setSensor(true)
	self.bulletHitbox.fixture:setUserData(self)
  table.insert(objects, self.bulletHitbox)
  --print("X: "..self.forward.x)
  --print("Y: "..self.forward.y)
end

function flyingEnemyBullet:update(dt)
  --print(self.bulletHitbox.body:getPosition())
  self.position = self.position + self.forward * self.speed * dt
  
  self.bulletHitbox.body:setPosition(self.position.x, self.position.y)
  --Si excede de los limites establecidos se borra de la lista que hace el update y el draw
  if self.position.y > 550 or self.position.x < objects.player.body:getX() - 250 or self.position.x > objects.player.body:getX() + 250 then
    self:destroyBullet()
  end
  
  for i=1,#self.animations do
    self.animations[i]:update(dt)
  end
end

function flyingEnemyBullet:draw(cam)  
  love.graphics.setColor(1,1,1)
  --love.graphics.polygon("line", self.bulletHitbox.body:getWorldPoints(self.bulletHitbox.shape:getPoints())) --DEBUG PHYSICS HITBOX
  
  if self.forward.x == 0 then
    self.animations[self.currentAnimation]:draw(self.spriteSheet, self.position.x, self.position.y, 0, 1, 1, 37/2, 34/2)
  else
    self.animations[self.currentAnimation]:draw(self.spriteSheet, self.position.x, self.position.y, 0, -self.forward.x, 1, 37/2, 34/2)
  end
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