mainMap = Object:extend()

function mainMap:new()
  --PHYSICS FUNCTIONS

  
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
  
  --initial graphics setup
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
end

function mainMap:update(dt)
  
end

function mainMap:draw()
  
end

return mainMap