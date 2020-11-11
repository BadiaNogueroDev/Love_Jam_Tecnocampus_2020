hud = Object:extend()

function hud:new(x, y, name)
  self.x = x
  self.y = y
  self.sprite = love.graphics.newImage("sprites/"..name.."_UI.png")
  self.pistola = love.graphics.newImage("sprites/Pistola_UI.png")
  self.heavy = love.graphics.newImage("sprites/Heavy_UI.png")
end

function hud:update(dt)
end

function hud:draw()
  love.graphics.draw(self.sprite, self.x, self.y)

  if p.HMG then
  love.graphics.draw(self.heavy, self.x, self.y) --HEAVY MACHINE GUN
  love.graphics.setColor(0,0,0)
  love.graphics.print(p.ammo, 110, 55)
  love.graphics.setColor(1, 1, 1)
  else
  love.graphics.draw(self.pistola, self.x, self.y) --PISTOLA
  end

end

return hud