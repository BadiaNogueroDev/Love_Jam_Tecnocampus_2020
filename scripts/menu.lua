menu = Object:extend()

mouse = {} --Guarda las cordenadas del mouse

function menu:new(x, y, forward)
  --INTRO
  video = love.graphics.newVideo("videos/TCM Slug Menu Intro.ogv")--Guardar video en una variable
  video:play() --Reproducir video
  
  videoSelection = love.graphics.newVideo("videos/TCM Slug Character Selection.ogv")
  
  videoLoading = love.graphics.newVideo("videos/TCM Loading Screen.ogv")
  
  --BACKGROUND DEL MENÚ
  background = love.graphics.newImage("sprites/Menu_Background.png") --Guardar imagen en una variable
  
  howToImage = love.graphics.newImage("sprites/how_to_play.png")
  
  howToMusic = love.audio.newSource("sound/how_to_play.ogg", 'stream')
  howToMusic:setVolume(0.6)
  
  selectionBackground = love.graphics.newImage("sprites/Character_Selection.png")
  
  selectionMusic = love.audio.newSource("sound/Character Select.ogg", "stream")
  selectionMusic:setVolume(0.6)
  
  --BOTONES DEL MENÚ
  startButton = love.graphics.newImage("sprites/Start_Button.png")
  self.startList = {startButton, w/2, 7 * h/10, 4, function() self.howTo = true howToMusic:play() end} --Lista con imagen, posX, posY, scale y función del bóton
  
  exitButton = love.graphics.newImage("sprites/Exit_Button.png")
  self.exitList = {exitButton, w/2, 8.5 * h/10, 3, function() os.exit() end}
  
  --BOTONES DEL CHARACTER SELECTION
  selectionButtons = {}
  
  character1 = love.graphics.newImage("sprites/Marco_Character_Selection.png")
  self.character1List = {character1, 210, 440, 1, function() startGame("Marco") selectionMusic:stop() self.selection = false self.loading = true videoLoading:play() end}
  table.insert(selectionButtons, self.character1List)
  
  character2 = love.graphics.newImage("sprites/Henry_Character_Selection.png")
  self.character2List = {character2, 500, 440, 1, function() startGame("Henry") selectionMusic:stop() self.selection = false self.loading = true videoLoading:play() end}
  table.insert(selectionButtons, self.character2List)
  
  character3 = love.graphics.newImage("sprites/Sandra_Character_Selection.png")
  self.character3List = {character3, 782, 440, 1, function() startGame("Sandra") selectionMusic:stop() self.selection = false self.loading = true videoLoading:play() end}
  table.insert(selectionButtons, self.character3List)
  
  character4 = love.graphics.newImage("sprites/Charles_Character_Selection.png")
  self.character4List = {character4, 1069, 440, 1, function() startGame("Charles") selectionMusic:stop() self.selection = false self.loading = true videoLoading:play() end}
  table.insert(selectionButtons, self.character4List)
  
  --BOOL PARA ACTIVAR CHRACTER SELECTION
  self.howTo = false
  
  self.selection = false
  
  self.loading = false
  --
  self.mouseUp = false --Bool para solo captar el mouse down en el primer update de pulsar
  
  self.timer = 0
  self.alpha = 0
end

function menu:update(dt)
  mouse.x, mouse.y = love.mouse.getPosition()  -- This gets the x and y coordinates of the mouse and 
  
  if not inGame and self.selection then
    if self.mouseUp then
      for _,v in ipairs(selectionButtons) do
        self:useButton(selectionButtons[_])
      end
    end
  elseif self.loading and not videoLoading:isPlaying() then
      sound.inGameMusic:play()
      self.loading = false
      inGame = true
      videoLoading:pause()
  elseif not inGame and not self.loading and not self.howTo then
    if not video:isPlaying() then
      self:useButton(self.startList)
      self:useButton(self.exitList)
    end
  elseif self.howTo then
    if self.alpha < 255 then
      self.timer = self.timer + dt
      self.alpha = self.alpha + self.timer/255
    end
    if love.mouse.isDown(1) then
      if self.mouseUp then
        self.selection = true 
        howToMusic:stop()
        videoSelection:play() 
        selectionMusic:play()
      end
      self.mouseUp = false
    end
  end
  
  if love.mouse.isDown(1) then
    self.mouseUp = false
  else
    self.mouseUp = true
  end
end

function menu:draw()
  love.graphics.setColor(1,1,1)
  if not ingame and self.selection then
    love.graphics.draw(videoSelection, 0, 0) --Dibujar videdo
    if not videoSelection:isPlaying() then
      for _,v in ipairs(selectionButtons) do
        love.graphics.draw(v[1], v[2], v[3], 0, v[4], v[4], v[1]:getWidth()/2, v[1]:getHeight()/2)
      end
      love.graphics.draw(selectionBackground) --Dibujar background
    end
  elseif self.loading then
    love.graphics.draw(videoLoading, 0, 0)
  elseif self.howTo then
    love.graphics.setColor(1,1,1,self.alpha)
    love.graphics.draw(howToImage)
  elseif not inGame then
      love.graphics.draw(video, 0, 0) --Dibujar videdo
    if not video:isPlaying() then
      love.graphics.draw(background) --Dibujar background
      love.graphics.draw(self.exitList[1], self.exitList[2], self.exitList[3], 0, self.exitList[4], self.exitList[4], self.exitList[1]:getWidth()/2, self.exitList[1]:getHeight()/2)
      if os.time() % 2 == 0 then
        love.graphics.draw(self.startList[1], self.startList[2], self.startList[3], 0, self.startList[4], self.startList[4], self.startList[1]:getWidth()/2, self.startList[1]:getHeight()/2)
      end
    end
  end
end

function menu:collision(image, posX, posY, scale) --Función que detecta la colision de los botones y devuelve true
  self.DeltaX = mouse.x - Max(posX - (image:getWidth()/2 * scale), Min(mouse.x, posX + (image:getWidth()/2 * scale)))
  self.DeltaY = mouse.y - Max(posY - (image:getHeight()/2 * scale), Min(mouse.y, posY + (image:getHeight()/2 * scale)))

  if self.DeltaX == 0 and self.DeltaY == 0 then
    return true
  else
    return false
  end
end

function menu:useButton(list) --Función que llama al función collision para modificar texto y si se da clic se efectua la función de la lista
  if menu:collision(list[1], list[2], list[3], list[4]) and love.mouse.isDown(1) then
    list[5]()
  end
end

function menu:characterSelection()
  
end

function Max(a, b)
  if a > b then return a
  else return b
  end
end

function Min(a, b)
  if a > b then return b
  else return a
  end
end

function menu:delete()
  
end

return menu