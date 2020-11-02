bullet = Object:extend()

function bullet:new(x, y, forward, index)
  --Initialize the player position
  self.position = Vector.new(x, y)
  self.posX = x
  self.posY = y
  self.speed = 1000
  self.maxSpeed = 100
  self.sprite = love.graphics.newImage("sprites/Handgun bullet.png")
  self.spriteScale = 1
  self.weaponOffsetX = 30
  self.weaponOffsetY = 20
  self.index = index
  if forward.y == 0 then
    self.forward = Vector.new(forward.x, 0)
    self.position.x = self.position.x + self.weaponOffsetX * self.forward.x
    self.position.y = self.position.y - 5
  else
    self.forward = Vector.new(0, forward.y)
    self.position. y = self.position.y + self.weaponOffsetX * self.forward.y
  end
  --print("X: "..self.forward.x)
  --print("Y: "..self.forward.y)
end

function bullet:update(dt)
  self.position = self.position + self.forward * self.speed * dt
  
  if self.position.x < 0 or self.position.x > 2000 then --Si excede de los limites establecidos se borra de la lista que hace el update y el draw
    table.remove(playerBulletList, 1)
  end
end

function bullet:draw(cam)
  --love.graphics.rectangle("fill", self.position.x, self.position.y, 5 + 10 * math.abs(self.forward.x), 5 + 10 * math.abs(self.forward.y))
  --love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  print("bullet")
  love.graphics.setColor(1, 1, 1)
  if self.forward.y == 0 then
    love.graphics.draw(self.sprite, self.position.x, self.position.y, 0, 1, self.spriteScale,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  else
    love.graphics.draw(self.sprite, self.position.x, self.position.y, math.rad(90), 1, self.spriteScale,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  end
end

return bullet