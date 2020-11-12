local gameFinal = Object:extend()

function gameFinal:new()
  self.alpha = 0
  self.timer = 0
  self.maxtimerIn = 1
  
	self.image = love.graphics.newImage("sprites/Black.png")
  
  self.finalVideo = love.graphics.newVideo("videos/TCM Slug Final.ogv")--Guardar video en una variable
  
  self.gameFinished = false
  self.canPlayVideo = true
end

function gameFinal:update(dt)  
  if objects.player.body:getX() > 14000 then
    self.gameFinished = true
    self.timer = self.timer + dt
    self.alpha = self.alpha + self.timer/255
    if self.alpha >= 1 then
      if self.canPlayVideo then
        sound.inGameMusic:stop()
        self.finalVideo:play() --Reproducir video
        self.canPlayVideo = false --Per que nomes es reprodueixi una vegada
      end
      if not self.finalVideo:isPlaying() then
        mainMenu()
      end
    end
  end
end

function gameFinal:draw()
  if objects.player.body:getX() > 14000 and not self.finalVideo:isPlaying() then
    love.graphics.setColor(0, 0, 0, self.alpha)
    love.graphics.draw(self.image)
    love.graphics.setColor(1,1,1,1)
  end
  
  if self.finalVideo:isPlaying() then
    love.graphics.draw(self.finalVideo)
    --print("hola")
  end
end

return gameFinal