local gameFinal = Object:extend()

function gameFinal:new()
  self.alpha = 0
  self.timer = 0
  
	self.image = love.graphics.newImage("sprites/Black.png")
  self.textSprite = {"sprites/final1.png", "sprites/final2.png"}
  self.pressAnyKey = love.graphics.newImage("sprites/Press Any Key.png")
  self.finalAudio = love.audio.newSource("sound/audio_final.ogg", 'stream')
  self.finalAudio:setVolume(0.4)
  
  self.audioPlayed = false
  self.showImage = false
  self.blinkTimer = 0
  self.blinkTimerMax = 0.4
  self.blinkCounter = 0
  
  self.gameFinished = false
  self.readyToQuit = false
  
  self.fadeOut = false
  self.fadeIn = true
end

function gameFinal:update(dt)
  if self.gameFinished then
    if self.readyToQuit then
      if self.fadeOut then
        self.alpha = self.alpha - dt/2
        if self.alpha <= 0 then
          self.fadeIn = true
          self.fadeOut = false
        end
      else
        self.alpha = self.alpha + dt/2
        if self.alpha >= 1 then
          self.fadeIn = false
          self.fadeOut = true
        end
      end
    else
      self.timer = self.timer + dt/3
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
          --self:quitGame()
          self.readyToQuit = true
          self.alpha = 0
        end
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
  
  if not self.readyToQuit then
    if self.showImage then
      if self.blinkCounter <= 4 then
        self.textImage = love.graphics.newImage(self.textSprite[1])
      else
        self.textImage = love.graphics.newImage(self.textSprite[2])
      end
      love.graphics.draw(self.textImage)
      --print (self.blinkCounter)
    end
  else
    love.graphics.draw(self.image)
    love.graphics.setColor(1, 1, 1, self.alpha)
    love.graphics.draw(self.textImage)
    love.graphics.draw(self.pressAnyKey, w/2, h - 70, 0, 1, 1, self.pressAnyKey:getWidth()/2)
    love.graphics.setColor(1, 1, 1, 1)
  end
end

function love.keypressed()
  if gFinal == nil then
  else
    if gFinal.readyToQuit then
      gFinal.quitGame()
    end
  end
end

function gameFinal:playMissionEnd()
  sound.inGameMusic:stop()
  sound.bossMusic:stop()
  self.finalAudio:play()
  self.audioPlayed = true
end

function gameFinal:quitGame()
  --love.event.quit()
  os.exit()
end

return gameFinal