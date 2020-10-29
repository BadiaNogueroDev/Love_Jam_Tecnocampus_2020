Object = require "lib/classic"

Vector = require "lib/vector"

anim8 = require "lib/anim8"

local cameraController = cameraController or require "scripts/cameraController"

local player = player or require "scripts/player"

actorList = {}

function love.load()
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  love.graphics.setDefaultFilter("nearest", "nearest")

  
  --PHYSICS FUNCTIONS
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  
  objects = {} -- table to hold all our physical objects
 
  --let's create the ground
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 1280/2, 720-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
  objects.ground.shape = love.physics.newRectangleShape(1280, 50) --make a rectangle with a width of 650 and a height of 50
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape) --attach shape to body
 
  objects.platform = {}
  objects.platform.body = love.physics.newBody(world, 1280/2, 663-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
  objects.platform.shape = love.physics.newRectangleShape(120, 50) --make a rectangle with a width of 650 and a height of 50
  objects.platform.fixture = love.physics.newFixture(objects.platform.body, objects.platform.shape) --attach shape to body
 
  --let's create a couple blocks to play around with
  objects.block1 = {}
  objects.block1.body = love.physics.newBody(world, 200, 550, "dynamic")
  objects.block1.shape = love.physics.newRectangleShape(0, 0, 50, 100)
  objects.block1.fixture = love.physics.newFixture(objects.block1.body, objects.block1.shape, 5) -- A higher density gives it more mass.
 
  objects.block2 = {}
  objects.block2.body = love.physics.newBody(world, 200, 400, "dynamic")
  objects.block2.shape = love.physics.newRectangleShape(0, 0, 100, 50)
  objects.block2.fixture = love.physics.newFixture(objects.block2.body, objects.block2.shape, 2)
  
  --initial graphics setup
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
  love.window.setMode(1280, 720) --set the window dimensions to 650 by 650 with no fullscreen, vsync on, and no antialiasing
  
  --ELEMENTS IN SCENE
  
  p = player:extend()
  p:new()
  
  camera = cameraController:extend()
  camera:new()
end

function love.update(dt)
  world:update(dt) --this puts the world into motion
  
  cameraController:update(dt)
  
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
  
  p:update(dt)
end

function love.draw()
  cameraController:draw()
  p:draw(cam)
end