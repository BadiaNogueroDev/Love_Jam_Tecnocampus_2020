local gamera = require "lib/gamera"

cameraController = Object:extend()

cam = gamera.new(0,0,15360,600)

function cameraController:new()
--CAMERA FUNCTIONS
  cam:setWindow(0,0,1280,720)
  cam:setScale(3.0)
  
  cameraOffSetX = w / 30
  cameraOffSetY = -10
  
  self.smoothTime = 0.2
  
  self.forward = Vector.new(cam:getPosition())
  cam:setPosition((self.forward.x - (self.forward.x-objects.player.body:getX() - cameraOffSetX)), self.forward.y - (self.forward.y-objects.player.body:getY() + cameraOffSetY))
end

function cameraController:update(dt) 
  self.forward = Vector.new(cam:getPosition())
  
  if objects.player.body:getY() - cameraOffSetY - self.forward.y > -26 and objects.player.body:getY() - cameraOffSetY - self.forward.y < 50 or p.invencibleTimeLeft > 1 then
    cam:setPosition((self.forward.x - (self.forward.x-objects.player.body:getX() - cameraOffSetX) * math.min(dt*6, 1)), self.forward.y)
  else
    cam:setPosition((self.forward.x - (self.forward.x-objects.player.body:getX() - cameraOffSetX) * math.min(dt*6, 1)), self.forward.y - (self.forward.y-objects.player.body:getY() + cameraOffSetY) * math.min(dt*2, 1))
  end
end

function cameraController:draw()
  cam:draw(function(l, t, w, h)
    -- draw camera stuff here
  
  for _,v in ipairs(playerBulletList) do
    v:draw()
  end
  
  for _,v in ipairs(mapElements) do
    love.graphics.polygon("fill", v.body:getWorldPoints(v.shape:getPoints()))
  end
  
  for _,v in ipairs(enemyBulletList) do
    v:draw()
  end
  end)
end

return cameraController