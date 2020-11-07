mainMap = Object:extend()

function mainMap:new()
  --PHYSICS FUNCTIONS

  mapElements = {} -- table to hold all our physical objects
 
  --let's create the ground
  self.ground = {}
  self.ground.body = love.physics.newBody(world, 15360/2, 560) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (15360/2, 560)
  self.ground.shape = love.physics.newRectangleShape(15360, 80) --make a rectangle with a width of 15360 and a height of 80
  self.ground.fixture = love.physics.newFixture(self.ground.body, self.ground.shape) --attach shape to body
  table.insert(mapElements, self.ground)
 
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 780, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 820, 480)
  self.platform.shape = love.physics.newRectangleShape(40, 80)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 1020, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 1100, 480)
  self.platform.shape = love.physics.newRectangleShape(40, 80)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 2440, 500)
  self.platform.shape = love.physics.newRectangleShape(640, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 2440, 460)
  self.platform.shape = love.physics.newRectangleShape(560, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 2460, 420)
  self.platform.shape = love.physics.newRectangleShape(440, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 2440, 380)
  self.platform.shape = love.physics.newRectangleShape(320, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 2460, 340)
  self.platform.shape = love.physics.newRectangleShape(200, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 2440, 300)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 3460, 500)
  self.platform.shape = love.physics.newRectangleShape(280, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 3460, 460)
  self.platform.shape = love.physics.newRectangleShape(200, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 3480, 420)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 3680, 362)
  self.platform.shape = love.physics.newRectangleShape(240, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 3880, 322)
  self.platform.shape = love.physics.newRectangleShape(80, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 4460, 500)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 4480, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 4860, 478)
  self.platform.shape = love.physics.newRectangleShape(440, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 5082, 440)
  self.platform.shape = love.physics.newRectangleShape(4, 80)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 5060, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 5180, 398)
  self.platform.shape = love.physics.newRectangleShape(200, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 4480, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 4480, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 4480, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 4480, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  
  --initial graphics setup
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
  
  
end

function mainMap:update(dt)
  
end

function mainMap:draw()
  
end

return mainMap