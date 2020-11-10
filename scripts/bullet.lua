bullet = Object:extend()

function bullet:new(x, y, forward, name)
  --Initialize the player position
  self.position = Vector.new(x, y)
  self.posX = x
  self.posY = y
  self.speed = 1000
  self.maxSpeed = 100
  self.sprite = love.graphics.newImage("sprites/"..name.." bullet.png")
  self.spriteScale = 1
  self.weaponOffsetX = 30
  self.weaponOffsetY = 20
  
  self.type = "attack"
  
  self.forward = Vector.new(forward.x, forward.y)
  
  if self.forward.y == 0 then
    self.position.x = self.position.x + self.weaponOffsetX * self.forward.x
    self.position.y = self.position.y - 7
    if name == "Heavy" then
      self.forward = Vector.new(forward.x, math.rad(math.random(-2, 2)))
    end
  else
    self.position.y = self.position.y + self.weaponOffsetX * self.forward.y
    self.position.y = self.position.y - 10
    self.forward.x = 0
    if name == "Heavy" then
      self.forward.x = math.rad(math.random(-2, 2))
    end
  end

  self.bulletHitbox = {}
  self.bulletHitbox.body = love.physics.newBody(hitboxes, self.position.x, self.position.y, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.bulletHitbox.shape = love.physics.newRectangleShape(0, 0, 10, 10) --the ball's shape has a radius of 20
  self.bulletHitbox.fixture = love.physics.newFixture(self.bulletHitbox.body, self.bulletHitbox.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.bulletHitbox.fixture:setSensor(true)
	self.bulletHitbox.fixture:setUserData(self)
  table.insert(objects, self.bulletHitbox)
end

function bullet:update(dt)
  self.position = self.position + self.forward * self.speed * dt
  
  self.bulletHitbox.body:setPosition(self.position.x, self.position.y)
  --Si excede de los limites establecidos se borra de la lista que hace el update y el draw
  if self.position.x < objects.player.body:getX() - 250 or self.position.x > objects.player.body:getX() + 250 or self.position.y < 0 or self.position.y > 600 then
    self:destroyBullet()
  end
end

function bullet:draw(cam)
  --love.graphics.polygon("line", self.bulletHitbox.body:getWorldPoints(self.bulletHitbox.shape:getPoints())) --DEBUG PHYSICS HITBOX
  if self.forward.y <= 0.2 and self.forward.y >= -0.2 then
    love.graphics.draw(self.sprite, self.position.x, self.position.y, 0, self.forward.x, 1 ,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  else
    love.graphics.draw(self.sprite, self.position.x, self.position.y, math.rad(90), self.forward.y, 1,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  end
end

function bullet:destroyBullet()
  for _,v in ipairs(playerBulletList) do
    if v == self then
      table.remove(playerBulletList, _)
      self.bulletHitbox.body:destroy()
    end
  end
end

return bullet