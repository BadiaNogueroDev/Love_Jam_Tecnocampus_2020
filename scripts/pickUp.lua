pickUp = Object:extend()

function pickUp:new(x, y)
  self.posX = x
  self.posY = y
  self.sprite = love.graphics.newImage("sprites/Heavy Machine Gun.png")
  
  --Enemy in the physics system
  self.enemy = {}
  self.enemy.body = love.physics.newBody(world, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.enemy.shape = love.physics.newRectangleShape(0, 0, self.sprite:getWidth(), self.sprite:getHeight()) --the ball's shape has a radius of 20
  self.enemy.fixture = love.physics.newFixture(self.enemy.body, self.enemy.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.enemy.body:setGravityScale(1)
  table.insert(objects, self.enemy)
  
  --Enemy hitbox in the physics system
  self.targetHitbox = {}
  self.targetHitbox.body = love.physics.newBody(hitboxes, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.targetHitbox.shape = love.physics.newRectangleShape(0, 0, self.sprite:getWidth() + 4, self.sprite:getHeight() + 4) --the ball's shape has a radius of 20
  self.targetHitbox.fixture = love.physics.newFixture(self.targetHitbox.body, self.targetHitbox.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.targetHitbox.fixture:setSensor(true)
	self.targetHitbox.fixture:setUserData(self)
  table.insert(objects, self.targetHitbox)

end

function pickUp:update(dt) 
  --print(objects.target.body:getWorldPoints(objects.target.shape:getPoints()))
  self.targetHitbox.body:setPosition(self.enemy.body:getPosition()) --Posar la hitbox fixe al objecte
end

function pickUp:draw()
  cam:draw(function(l, t, w, h)
    --love.graphics.setColor(1,1,1)
    --love.graphics.polygon("fill", self.target.body:getWorldPoints(self.target.shape:getPoints())) --DEBUG PHYSICS HITBOX
    --love.graphics.polygon("line", self.targetHitbox.body:getWorldPoints(self.targetHitbox.shape:getPoints())) --DEBUG HITBOX
    love.graphics.draw(self.sprite, self.targetHitbox.body:getX(), self.targetHitbox.body:getY(), 0, 1, 1,self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  end)
end

function pickUp:destroy()
  for _,v in ipairs(pickUpsList) do
    if v == self then
      if not p.HMG then
        sound:announcerHMG()
      else
        sound.playerRecarga:play()
      end
      table.remove(pickUpsList, _)
      self.targetHitbox.body:destroy()
      self.enemy.body:destroy()
    end
  end
  
  p.ammo = p.ammo + 50
  p.HMG = true
end

return pickUp