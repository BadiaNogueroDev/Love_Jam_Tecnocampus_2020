Object = require "lib/classic"

Vector = require "lib/vector"

anim8 = require "lib/anim8"

local cameraController = cameraController or require "scripts/cameraController"

local player = player or require "scripts/player"

local menu = menu or require "scripts/menu"

local mainMap = mainMap or require "scripts/mainMap"

local hitboxController = hitboxController or require "scripts/hitboxController"

local t = target or require "scripts/target"

local enemyPlacement = enemyPlacement or require "scripts/enemyPlacement"

local hud = hud or require "scripts/hud"

local gameFinal = gameFinal or require "scripts/gameFinal"

local sfx = sfx or require "scripts/sfx"

actorList = {}

playerBulletList = {}

enemyBulletList = {}

pickUpsList = {}

objects = {}

finalVideo = love.graphics.newVideo("videos/TCM Slug Final.ogv")--Guardar video en una variable

function love.load()
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  
  hitboxes = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  hitboxes:setCallbacks(beginCallback, endCallback)
  
  font = love.graphics.newFont("fonts/Kemco Pixel Bold.ttf", 45)
  love.graphics.setFont(font)
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  love.graphics.setDefaultFilter("nearest", "nearest") --Es el "point no filter" de Unity: hace que el pixel art no se le aplique filtro
  
  love.window.setMode(w, h)
  
  math.randomseed(os.time())

  --m = menu
  --m:new()
  --
  --inGame = false
  startGame("Henry") --Descomentar para entrar al juego sin menú principal
end

function love.update(dt)
  world:update(dt) --this puts the world into motion
  hitboxes:update(dt)
  
  if inGame then
    cameraController:update(dt)
    p:update(dt)
    gFinal:update(dt)
    placement:update(dt)
    for _,v in ipairs(actorList) do
      v:update(dt)
    end
    for _,v in ipairs(pickUpsList) do
      v:update(dt)
    end
    for _,v in ipairs(playerBulletList) do
      v:update(dt)
    end
    for _,v in ipairs(enemyBulletList) do
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
    for _,v in ipairs(pickUpsList) do
      v:draw()
    end
    hud:draw()
    gFinal:draw()
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
  
  hud = hud
  hud:new(10, 10, character)
  
  gFinal = gameFinal
  gFinal:new()
  
  placement = enemyPlacement
  placement:new()
  
  camera = cameraController
  camera:new()
  
  sound = sfx
  sound:new()
  sound.inGameMusic:play()
  
  video = nil
  
  videoSelection = nil
  
  inGame = true --Descomentar para entrar al juego sin menú principal
end

function mainMenu()
  inGame = false
  
  m:new()
  
  actorList = {}

  playerBulletList = {}
  
  enemyBulletList = {}
  
  pickUpsList = {}
  
  objects = {}
end