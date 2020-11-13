local gameFinal = Object:extend()

function gameFinal:new()
  self.alpha = 0
  self.timer = 0
  self.maxtimerIn = 1
  
	self.image = love.graphics.newImage("sprites/Black.png")
  
  --self.finalVideo = love.graphics.newVideo("videos/TCM Slug Final.ogv")--Guardar video en una variable
  
  self.gameFinished = false
  self.canPlayVideo = true
end

function gameFinal:update(dt)
if objects.player.body:getX() > 14700 or self.gameFinished then
    collectgarbage()
    self.gameFinished = true
    self.timer = self.timer + dt
    self.alpha = self.alpha + self.timer/255
    if self.alpha >= 1 then
      if self.canPlayVideo then
        self.canPlayVideo = false --Per que nomes es reprodueixi una vegada
        self:playMissionEnd()
      end
      if not finalVideo:isPlaying() then
        mainMenu()
      end
    end
  end
  if love.keyboard.isDown("p") and self.canPlayVideo then
    self.gameFinished = true
  end
end

function gameFinal:draw()
  if self.gameFinished and not finalVideo:isPlaying() then
    love.graphics.setColor(0, 0, 0, self.alpha)
    love.graphics.draw(self.image)
    love.graphics.setColor(1,1,1,1)
  end
  
  if finalVideo:isPlaying() then
    love.graphics.draw(finalVideo)
  end
end

function gameFinal:playMissionEnd()
  finalVideo:play() --Reproducir video
  sound.inGameMusic:stop()
end

return gameFinal