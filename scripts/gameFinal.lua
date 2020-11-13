local gameFinal = Object:extend()

function gameFinal:new()
  self.alpha = 0
  self.timer = 0
  
	self.image = love.graphics.newImage("sprites/Black.png")
  self.textSprite = {"sprites/final1.png", "sprites/final2.png"}
  self.finalAudio = love.audio.newSource("sound/audio_final.ogg", 'stream')
  self.finalAudio:setVolume(0.4)
  
  self.audioPlayed = false
  self.showImage = false
  self.blinkTimer = 0
  self.blinkTimerMax = 0.4
  self.blinkCounter = 0
  
  self.gameFinished = false
end

function gameFinal:update(dt)
  if self.gameFinished then
    self.timer = self.timer + dt
    self.alpha = self.alpha + self.timer/255
    if self.alpha >= 1 then
      
      if not self.audioPlayed then
        self:playMissionEnd()
      end
      
      self.blinkTimer = self.blinkTimer + dt
      
      if self.blinkTimer >= self.blinkTimerMax then
        self.blinkTimer = 0
        if self.showImage then
          self.showImage = false
        else
          self.showImage = true
          self.blinkCounter = self.blinkCounter + 1
        end
      end
      
      if not self.finalAudio:isPlaying() then
        love.event.quit()
      end
    end
  end
end

function gameFinal:draw()
  if self.gameFinished then
    love.graphics.setColor(0, 0, 0, self.alpha)
    love.graphics.draw(self.image)
    love.graphics.setColor(1,1,1,1)
  end
  
  if self.showImage then
    if self.blinkCounter <= 4 then
      self.textImage = love.graphics.newImage(self.textSprite[1])
    else
      self.textImage = love.graphics.newImage(self.textSprite[2])
    end
    love.graphics.draw(self.textImage)
    --print (self.blinkCounter)
  end
end

function gameFinal:playMissionEnd()
  sound.inGameMusic:stop()
  sound.bossMusic:stop()
  self.finalAudio:play()
  self.audioPlayed = true
end

return gameFinal