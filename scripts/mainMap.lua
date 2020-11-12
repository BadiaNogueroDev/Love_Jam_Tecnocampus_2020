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
  
  self.leftWall = {}
  self.leftWall.body = love.physics.newBody(world, -2, 400) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (15360/2, 560)
  self.leftWall.shape = love.physics.newRectangleShape(2, 400) --make a rectangle with a width of 15360 and a height of 80
  self.leftWall.fixture = love.physics.newFixture(self.leftWall.body, self.leftWall.shape) --attach shape to body
  table.insert(mapElements, self.leftWall)
  
  self.rightWall = {}
  self.rightWall.body = love.physics.newBody(world, 15360 + 2, 400) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (15360/2, 560)
  self.rightWall.shape = love.physics.newRectangleShape(2, 500) --make a rectangle with a width of 15360 and a height of 80
  self.rightWall.fixture = love.physics.newFixture(self.rightWall.body, self.rightWall.shape) --attach shape to body
  table.insert(mapElements, self.rightWall)
  
  --self.ground = {}
  --self.ground.body = love.physics.newBody(hitboxes, 15360/2, 560)
  --self.ground.shape = love.physics.newRectangleShape(15360, 80) --make a rectangle with a width of 15360 and a height of 80
  --self.ground.fixture = love.physics.newFixture(self.ground.body, self.ground.shape) --attach shape to body
  --table.insert(mapElements, self.ground)
  
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
  self.platform.body = love.physics.newBody(world, 5160, 478)
  self.platform.shape = love.physics.newRectangleShape(80, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 5260, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 5820, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 5900, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 5980, 398)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6080, 358)
  self.platform.shape = love.physics.newRectangleShape(80, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6180, 358)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6260, 358)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6340, 358)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6420, 358)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6560, 340)
  self.platform.shape = love.physics.newRectangleShape(160, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6580, 380)
  self.platform.shape = love.physics.newRectangleShape(200, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6600, 420)
  self.platform.shape = love.physics.newRectangleShape(240, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6620, 460)
  self.platform.shape = love.physics.newRectangleShape(280, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 6640, 500)
  self.platform.shape = love.physics.newRectangleShape(320, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 7260, 500)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 7280, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 7380, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 7860, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 7940, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8020, 398)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8060, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8100, 398)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8140, 358)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8260, 358)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8300, 398)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8400, 438)
  self.platform.shape = love.physics.newRectangleShape(160, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 8540, 480)
  self.platform.shape = love.physics.newRectangleShape(40, 80)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 9360, 500)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 9380, 460)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 9460, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 9500, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 9580, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 9720, 438)
  self.platform.shape = love.physics.newRectangleShape(80, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 10020, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 10100, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 10220, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 10340, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11540, 500)
  self.platform.shape = love.physics.newRectangleShape(760, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11540, 460)
  self.platform.shape = love.physics.newRectangleShape(680, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11560, 420)
  self.platform.shape = love.physics.newRectangleShape(560, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11560, 380)
  self.platform.shape = love.physics.newRectangleShape(480, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11560, 380)
  self.platform.shape = love.physics.newRectangleShape(480, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11560, 340)
  self.platform.shape = love.physics.newRectangleShape(360, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11580, 300)
  self.platform.shape = love.physics.newRectangleShape(280, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11620, 260)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11620, 220)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 11980, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12120, 398)
  self.platform.shape = love.physics.newRectangleShape(160, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12180, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12260, 438)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12360, 398)
  self.platform.shape = love.physics.newRectangleShape(80, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12380, 478)
  self.platform.shape = love.physics.newRectangleShape(40, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12540, 500)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12560, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12580, 420)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12580, 420)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12820, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12900, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 12980, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13060, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13140, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13220, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13300, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13380, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13460, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13540, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13620, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13700, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13780, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13860, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 13940, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14020, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14100, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14180, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14260, 402)
  self.platform.shape = love.physics.newRectangleShape(120, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14620, 380)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14600, 420)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14580, 460)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(world, 14560, 500)
  self.platform.shape = love.physics.newRectangleShape(160, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  --TESTING
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 780, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  self.platform.fixture:setUserData("wall")
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 820, 480)
  self.platform.shape = love.physics.newRectangleShape(40, 80)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  self.platform.fixture:setUserData("wall")
  table.insert(mapElements, self.platform)

  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 1100, 480)
  self.platform.shape = love.physics.newRectangleShape(40, 80)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  self.platform.fixture:setUserData("wall")
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 2440, 500)
  self.platform.shape = love.physics.newRectangleShape(640, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  self.platform.fixture:setUserData("wall")
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 2440, 460)
  self.platform.shape = love.physics.newRectangleShape(560, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  self.platform.fixture:setUserData("wall")
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 2460, 420)
  self.platform.shape = love.physics.newRectangleShape(440, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 2440, 380)
  self.platform.shape = love.physics.newRectangleShape(320, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 2460, 340)
  self.platform.shape = love.physics.newRectangleShape(200, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 2440, 300)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 3460, 500)
  self.platform.shape = love.physics.newRectangleShape(280, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 3460, 460)
  self.platform.shape = love.physics.newRectangleShape(200, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 3480, 420)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 4460, 500)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 4480, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 4860, 478)
  self.platform.shape = love.physics.newRectangleShape(440, 4)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
      
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 6560, 340)
  self.platform.shape = love.physics.newRectangleShape(160, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 6580, 380)
  self.platform.shape = love.physics.newRectangleShape(200, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 6600, 420)
  self.platform.shape = love.physics.newRectangleShape(240, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 6620, 460)
  self.platform.shape = love.physics.newRectangleShape(280, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 6640, 500)
  self.platform.shape = love.physics.newRectangleShape(320, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 7260, 500)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 7280, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 7380, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 8540, 480)
  self.platform.shape = love.physics.newRectangleShape(40, 80)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 9360, 500)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 9380, 460)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 9580, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 10020, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11540, 500)
  self.platform.shape = love.physics.newRectangleShape(760, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11540, 460)
  self.platform.shape = love.physics.newRectangleShape(680, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11560, 420)
  self.platform.shape = love.physics.newRectangleShape(560, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11560, 380)
  self.platform.shape = love.physics.newRectangleShape(480, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11560, 380)
  self.platform.shape = love.physics.newRectangleShape(480, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11560, 340)
  self.platform.shape = love.physics.newRectangleShape(360, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11580, 300)
  self.platform.shape = love.physics.newRectangleShape(280, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11620, 260)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 11620, 220)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 12540, 500)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 12560, 460)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 12580, 420)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 12580, 420)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 12900, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 13060, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 13220, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 13380, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 13540, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 13700, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 13860, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 14020, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 14180, 500)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 14620, 380)
  self.platform.shape = love.physics.newRectangleShape(40, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 14600, 420)
  self.platform.shape = love.physics.newRectangleShape(80, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 14580, 460)
  self.platform.shape = love.physics.newRectangleShape(120, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  self.platform = {}
  self.platform.body = love.physics.newBody(hitboxes, 14560, 500)
  self.platform.shape = love.physics.newRectangleShape(160, 40)
  self.platform.fixture = love.physics.newFixture(self.platform.body, self.platform.shape)
  table.insert(mapElements, self.platform)
  
  --initial graphics setup
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
end

return mainMap