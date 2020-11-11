local gameFinal = Object:extend()

function gameFinal:new()
  self.alpha = 0
  self.timer = 0
  self.maxtimerIn = 1
  
	self.image = love.graphics.newImage("sprites/Black.png")
  
  self.finalVideo = love.graphics.newVideo("videos/TCM Slug Final.ogv")--Guardar video en una variable
  
  self.gameFinished = false
end

function gameFinal:update(dt)  
  if objects.player.body:getX() < 150 then
    self.gameFinished = true
    self.timer = self.timer + dt
    self.alpha = self.alpha + self.timer/255
    if self.alpha >= 1 then
      --Video de mision complete + tornar al menu principal
      self.finalVideo:play() --Reproducir video
    end
  end
end

function gameFinal:draw()
  love.graphics.setColor(0, 0, 0, self.alpha)
	love.graphics.draw(self.image)
  love.graphics.setColor(1,1,1,1)
  
  if self.alpha >= 1 and self.finalVideo:isPlaying() then
    love.graphics.draw(self.finalVideo, 0, 0) 
  end
end

return gameFinal