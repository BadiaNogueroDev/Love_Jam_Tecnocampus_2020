bullet = Object:extend()

function bullet:new(x, y, forward)
  --Initialize the player position
  self.position = Vector.new(x, y)
  self.posX = x
  self.posY = y
  self.speed = 1000  --Initialize the paddle speed
  self.maxSpeed = 100
  self.sprite = love.graphics.newImage("sprites/Handgun bullet.png")
  self.spriteScale = 1
  self.weaponOffset = 15
  if forward.y == 0 then
    self.forward = Vector.new(forward.x, 0)
  else
    self.forward = Vector.new(0, forward.y)
  end
  --print("X: "..self.forward.x)
  --print("Y: "..self.forward.y)
end

function bullet:update(dt)
  self.position = self.position + self.forward * self.speed * dt
end

function bullet:draw(cam)
  --love.graphics.rectangle("fill", self.position.x, self.position.y, 5 + 10 * math.abs(self.forward.x), 5 + 10 * math.abs(self.forward.y))
  --love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  love.graphics.setColor(1, 1, 1)
  if self.forward.y == 0 then
    love.graphics.draw(self.sprite, self.position.x + self.weaponOffset * self.forward.x, self.position.y, 0, 1, self.spriteScale,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  else
    love.graphics.draw(self.sprite, self.position.x, self.position.y + self.weaponOffset * self.forward.y, math.rad(90), 1, self.spriteScale,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  end
end

return bullet