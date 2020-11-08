Object = require "lib/classic"

Vector = require "lib/vector"

anim8 = require "lib/anim8"

local cameraController = cameraController or require "scripts/cameraController"

local player = player or require "scripts/player"

local menu = menu or require "scripts/menu"

local mainMap = mainMap or require "scripts/mainMap"

local hitboxController = hitboxController or require "scripts/hitboxController"

local t = target or require "scripts/target"

actorList = {}

playerBulletList = {}

objects = {}

function love.load()
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  
  hitboxes = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  hitboxes:setCallbacks(beginCallback, endCallback)
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  love.graphics.setDefaultFilter("nearest", "nearest") --Es el "point no filter" de Unity: hace que el pixel art no se le aplique filtro
  
  love.window.setMode(w, h)

  --m = menu
  --m:new()
  
  --inGame = false
  startGame("Charles")
end

function love.update(dt)
  world:update(dt) --this puts the world into motion
  hitboxes:update(dt)
  
  if inGame then
    cameraController:update(dt)
    map:update(dt)
    p:update(dt)
    t:update(dt)
    for _,v in ipairs(actorList) do
      v:update(dt)
    end
    for _,v in ipairs(playerBulletList) do
      v:update(dt)
    end
  else
    m:update(dt)
  end
end

function love.draw()
  if inGame then
    cameraController:draw()
    p:draw(cam)
    for _,v in ipairs(actorList) do
      v:draw()
    end
  else
    m:draw()
  end
end

function startGame(character)
  --ELEMENTS IN-GAME
  map = mainMap
  map:new()
  
  p = player
  p:new(200, 350, character)
  
  --t = target:extend()
  --t:new(600, 200)
  --table.insert(actorList, t)

  --t = target:extend()
  --t:new(500, 200)
  --table.insert(actorList, t)

  --t = target:extend()
  --t:new(700, 200)
  --table.insert(actorList, t)
  
  camera = cameraController
  camera:new()
  
  inGame = true
end

function mainMenu()
  inGame = false
  m:new()
end