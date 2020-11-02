menu = Object:extend()

mouse = {} --Guarda las cordenadas del mouse

function menu:new(x, y, forward)
  video = love.graphics.newVideo("videos/TCM Slug Menu Intro.ogv")--Guardar video en una variable
  video:play() --Reproducir video
  background = love.graphics.newImage("sprites/Menu_Background.png") --Guardar imagen en una variable
  
  startButton = love.graphics.newImage("sprites/Start_Button.png")
  self.startList = {startButton, w/2, 7 * h/10, 4, function() startGame() end} --Lista con imagen, posX, posY, scale y función del bóton
  
  exitButton = love.graphics.newImage("sprites/Exit_Button.png")
  self.exitList = {exitButton, w/2, 8.5 * h/10, 3, function() os.exit() end}
end

function menu:update(dt)
  if not inGame then
    mouse.x, mouse.y = love.mouse.getPosition()  -- This gets the x and y coordinates of the mouse and 
    if not video:isPlaying() then
      self:useButton(self.startList)
      self:useButton(self.exitList)
    end
  end
end

function menu:draw()
  if not inGame then
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

function menu:collision(image, posX, posY) --Función que detecta la colision de los botones y devuelve true
  self.DeltaX = mouse.x - Max(posX - (image:getWidth()/2), Min(mouse.x, posX + (image:getWidth()/2)))
  self.DeltaY = mouse.y - Max(posY - (image:getWidth()/2), Min(mouse.y, posY + (image:getWidth()/2)))

  if self.DeltaX == 0 and self.DeltaY == 0 then
    return true
  else
    return false
  end
end

function menu:useButton(list) --Función que llama al función collision para modificar texto y si se da clic se efectua la función de la lista
  if menu:collision(list[1], list[2], list[3]) and love.mouse.isDown(1) then
    list[5]()
  end
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

return menu