local hud = Object:extend()

function hud:new(x, y, name)
  self.x = x
  self.y = y
  self.sprite = love.graphics.newImage("sprites/"..name.."_UI.png")
  self.pistola = love.graphics.newImage("sprites/Pistola_UI.png")
  self.heavy = love.graphics.newImage("sprites/Heavy_UI.png")
  
  self.numbers = {love.graphics.newImage("sprites/0.png"),
                  love.graphics.newImage("sprites/1.png"),
                  love.graphics.newImage("sprites/2.png"),
                  love.graphics.newImage("sprites/3.png"),
                  love.graphics.newImage("sprites/4.png"),
                  love.graphics.newImage("sprites/5.png"),
                  love.graphics.newImage("sprites/6.png"),
                  love.graphics.newImage("sprites/7.png"),
                  love.graphics.newImage("sprites/8.png"),
                  love.graphics.newImage("sprites/9.png")}
end

function hud:draw()
  love.graphics.draw(self.sprite, self.x, self.y)

  if p.HMG then
    love.graphics.draw(self.heavy, self.x, self.y) --HEAVY MACHINE GUN
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.numbers[1 + math.floor(p.ammo/ 100)], 120, 65, 0, 1, 1, 13, 13) --Centenes
    love.graphics.draw(self.numbers[1 + math.floor(p.ammo % 100 / 10)], 144, 65, 0, 1, 1, 13, 13) --Desenes
    love.graphics.draw(self.numbers[1 + math.floor(p.ammo % 10)], 168, 65, 0, 1, 1, 13, 13) --Unitats
  else
    love.graphics.draw(self.pistola, self.x, self.y) --PISTOLA
  end

end

return hud