bossFireball = Object:extend()

function bossFireball:new(x, y, forward)
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
  
  self.currentAnimation = 1
  self.spriteSheet = love.graphics.newImage('sprites/Enemy Bullets.png')
  gEnemy = anim8.newGrid(37, 34, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
  self.animation = {anim8.newAnimation(gEnemy('1-16',6), 0.07),
                    anim8.newAnimation(gEnemy('11-16',6), 0.07)}
  
  self.bulletHitbox = {}
  self.bulletHitbox.body = love.physics.newBody(hitboxes, self.position.x, self.position.y, "dynamic")
  self.bulletHitbox.shape = love.physics.newRectangleShape(0, 0, 10, 10)
  self.bulletHitbox.fixture = love.physics.newFixture(self.bulletHitbox.body, self.bulletHitbox.shape, 1)
  self.bulletHitbox.fixture:setSensor(true)
	self.bulletHitbox.fixture:setUserData(self)
  table.insert(objects, self.bulletHitbox)
  
  self.bulletHitbox.body:applyLinearImpulse((objects.player.body:getX() - self.posX) / 65, -10)
  --print("X: "..self.forward.x)
  --print("Y: "..self.forward.y)
end

function bossFireball:update(dt)
  self.position.x = self.bulletHitbox.body:getX()
  self.position.y = self.bulletHitbox.body:getY()
  
  self.bulletHitbox.body:setPosition(self.position.x, self.position.y)
  --Si excede de los limites establecidos se borra de la lista que hace el update y el draw
  if self.position.y > 700 or self.position.x < objects.player.body:getX() - 450 or self.position.x > objects.player.body:getX() + 450 then
    self:destroyBullet()
  end
  
  if self.animation[self.currentAnimation]:getCurrentFrameCounter() == self.animation[self.currentAnimation]:getTotalFrameCounter() then
    self.currentAnimation = 2
  end
  
  self.animation[self.currentAnimation]:update(dt)
end

function bossFireball:draw(cam)  
  love.graphics.setColor(1,1,1)
  --love.graphics.polygon("line", self.bulletHitbox.body:getWorldPoints(self.bulletHitbox.shape:getPoints())) --DEBUG PHYSICS HITBOX
  
  self.animation[self.currentAnimation]:draw(self.spriteSheet, self.position.x, self.position.y, 0, 1, 1, 37/2, 34/2)
end

function bossFireball:destroyBullet()
  for _,v in ipairs(enemyBulletList) do
    if v == self then
      table.remove(enemyBulletList, _)
      self.bulletHitbox.body:destroy()
    end
  end
end

return bossFireball