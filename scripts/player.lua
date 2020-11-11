player = Object:extend()

local bullet = bullet or require "scripts/bullet"

function player:new(x, y, character)
  --Initialize the propierties position
  self.posX = x
  self.posY = y
  self.character = character
  self.speed = 1000
  self.maxSpeed = 100
  self.jumpForce = -120
  self.torsoOffsetY = 1
  self.shootingUp = false
  self.lookingDown = false
  self.lookingUp = false
  self.zUp = true --Variable per evitar disparar mantenint premut la lletra z
  self.alive = true
  self.dying = false
  self.respawnTime = 3
  self.respawnTimeLeft = 0
  self.invencibleTime = 5
  self.invencibleTimeLeft = 0
  self.invencible = false
  
  --Initialize sprites sheets and animation lists
  self.characterWidth = 25
  self.characterHeight = 36
  self.spriteScale = 1
  self.forward = Vector.new(fx or 1,fy or 0)
  self.airborn = true --El personatge esta al aire
  
  self.currentTorsoAnimation = 1
  self.torsoSpriteSheet = love.graphics.newImage('sprites/Torso_'.. self.character ..'_Spritesheet.png')
  g = anim8.newGrid(54, 32, self.torsoSpriteSheet:getWidth(), self.torsoSpriteSheet:getHeight())
  g72 = anim8.newGrid(54, 72, self.torsoSpriteSheet:getWidth(), self.torsoSpriteSheet:getHeight(), 0, 160)
  g46 = anim8.newGrid(54, 46, self.torsoSpriteSheet:getWidth(), self.torsoSpriteSheet:getHeight(), 0, 304)
  gHMG = anim8.newGrid(64, 32, self.torsoSpriteSheet:getWidth(), self.torsoSpriteSheet:getHeight(), 0, 350) --GRID DE LA HEAVY MACHINE GUN
  gHMGup = anim8.newGrid(64, 38, self.torsoSpriteSheet:getWidth(), self.torsoSpriteSheet:getHeight(), 0, 478) --GRID DE LA HEAVY MACHINE GUN MIRANT A DALT
  gHMGshoot = anim8.newGrid(64, 78, self.torsoSpriteSheet:getWidth(), self.torsoSpriteSheet:getHeight(), 0, 516) --GRID DE LA HEAVY MACHINE GUN DISPARANT A DALT I ABAIX
  self.torsoAnimations = {anim8.newAnimation(g('1-12',1), 0.04),          --1 RUNNING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g('1-10',2), 0.03),          --2 SHOOTING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g('1-6',3), 0.15),           --3 IDLE (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g('1-6',4), 0.1),            --4 JUMPING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g('5-10',5), 0.15),          --5 LOOKING UP (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g72('1-10',1), 0.03),        --6 SHOOTING UP (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g72('7-7',2), 0.03),         --7 LOOKING DOWN (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g72('1-7',2), 0.04),         --8 SHOOTING DOWN (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          --HEAVY MACHINE GUN     
                          anim8.newAnimation(gHMG('1-12',1), 0.04),       --9 RUNNING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(gHMG('1-12',2), 0.04),       --10 SHOOTING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(gHMG('1-6',3), 0.15),        --11 IDLE (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(gHMG('1-6',4), 0.1),         --12 JUMPING (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(gHMGup('1-6',1), 0.15),      --13 LOOKING UP (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(gHMGshoot('1-12',1), 0.04),  --14 SHOOTING UP (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(gHMGshoot('9-9',2), 0.03),   --15 LOOKING DOWN (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(gHMGshoot('1-9',2), 0.04),   --16 SHOOTING DOWN (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          anim8.newAnimation(g46('1-10',1), 0.09)         --17 DIE (1r Valor: Rang de frames. 2n Valor: Fila del sheet)
                          
  } --3r Valor: Velocitat de la animació
  
  self.currentLegsAnimation = 1
  self.legsSpriteSheet = love.graphics.newImage('sprites/Legs_'.. character ..'_Spritesheet.png')
  g32 = anim8.newGrid(32, 32, self.legsSpriteSheet:getWidth(), self.legsSpriteSheet:getHeight())
  self.legsAnimations = { anim8.newAnimation(g32('1-1',1), 0.15),--IDLE
                          anim8.newAnimation(g32('2-13',3), 0.04),--RUNNING
                          anim8.newAnimation(g32('1-6',2), 0.1)--JUMPING
  }
  
  --Player in the physics system
  objects.player = {}
  objects.player.body = love.physics.newBody(world, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  objects.player.shape = love.physics.newRectangleShape(0, 0, self.characterWidth, self.characterHeight) --the ball's shape has a radius of 20
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1) -- Attach fixture to body and give it a density of 1.
  objects.player.body:setLinearDamping(2)
  objects.player.body:setGravityScale(2)
  objects.player.body:setFixedRotation(true)
  
  --Player in the hitbox system

  self.targetHitbox = {}
  self.targetHitbox.body = love.physics.newBody(hitboxes, self.posX, self.posY, "dynamic") --place the body somewhere in the world and make it dynamic, so it can move around
  self.targetHitbox.shape = love.physics.newRectangleShape(0, 0, self.characterWidth + 2, self.characterHeight + 2) --the ball's shape has a radius of 20
  self.targetHitbox.fixture = love.physics.newFixture(self.targetHitbox.body, self.targetHitbox.shape, 1) -- Attach fixture to body and give it a density of 1.
  self.targetHitbox.fixture:setSensor(true)
	self.targetHitbox.fixture:setUserData("player")
  table.insert(objects, self.targetHitbox)
  
  --Player shooting
  self.shooting = false --El personatge esta disparant
  self.shot = false --El personatge ja ha disparat la bala
  self.fireRate = 0.15
  self.nextFire = 0 --Timer, se li sumara dt fins arribar a fireRate
  
  self.HMG = false --HEAVY MACHINE GUN ACITVA
  
  self.ammo = 0
end

function player:update(dt)
  if self.alive then
    self.VelocityX, self.VelocityY = objects.player.body:getLinearVelocity()
    
    if self.ammo <= 0 then
      self.HMG = false
    end
    
    --Solució temporal al canviar el offset per disparar a dalt i abaix
    if self.shootingUp and not self.HMG then
      self.torsoOffsetY = 41
    elseif self.shootingUp and self.HMG then
      self.torsoOffsetY = 48
    elseif self.lookingUp and not self.airborn then
      self.torsoOffsetY = 10
    elseif self.lookingDown then
      self.torsoOffsetY = -5
    else
      self.torsoOffsetY = 1
    end
    
      --here we are going to create some keyboard events
    if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
      self.forward.x = 1
      self.currentLegsAnimation = 2
      if self.VelocityX < self.maxSpeed then
        objects.player.body:applyLinearImpulse(self.speed/200, 0)
        --objects.player.body:applyLinearImpulse(self.speed * dt, 0)
      end
      if not self.shooting and not self.HMG then
        self.currentTorsoAnimation = 1
      elseif not self.shooting and self.HMG then
        self.currentTorsoAnimation = 9
      end
    elseif love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
      self.forward.x = -1
      self.currentLegsAnimation = 2
      if self.VelocityX > -self.maxSpeed then
        objects.player.body:applyLinearImpulse(-self.speed/200, 0)
        --objects.player.body:applyLinearImpulse(-self.speed * dt, 0)
      end
      if not self.shooting and not self.HMG then
        self.currentTorsoAnimation = 1
      elseif not self.shooting and self.HMG then
        self.currentTorsoAnimation = 9
      end
    else if not self.airborn then --Si el personatge no esta al aire i no s'esta movent
      if not self.shooting and not self.HMG then --Ni esta disparant
        self.currentTorsoAnimation = 3
      elseif not self.shooting and self.HMG then
        self.currentTorsoAnimation = 11
      end
        self:changeLegsAnimation(1) --Testing
      end
    end
    
    --En proces: Que el miri cap a dalt
    if love.keyboard.isDown("up") then
      if not self.shooting and not self.HMG then
        self.currentTorsoAnimation = 5
      elseif not self.shooting and self.HMG then
        self.currentTorsoAnimation = 13
        self.lookingUp = true
        if not self.airborn then
          self.torsoOffsetY = 10
        end
      end
    elseif love.keyboard.isDown("down") and self.airborn then
      if not self.shooting then
        self.lookingDown = true
        if not self.HMG then
          self.currentTorsoAnimation = 7
          self.torsoOffsetY = -5 --Solució temporal al canviar el offset per disparar a dalt i abaix
        elseif self.HMG then
          self.currentTorsoAnimation = 15
          self.torsoOffsetY = -5
        end
      end
    elseif not self.shooting then
      self.torsoOffsetY = 1
      self.lookingDown = false
      self.lookingUp = false
    end
    
    --Vector que agafa la velocitat en X i Y del personatge
    self.velocity = Vector.new(objects.player.body:getLinearVelocity())
    
    if love.keyboard.isDown("space") and canJump then
      canJump = false
      
      if not self.airborn then --Si esta tocant a terre
        objects.player.body:setLinearVelocity(objects.player.body:getLinearVelocity(x, y))
        objects.player.body:applyLinearImpulse(0, self.jumpForce)
        
        self:changeLegsAnimation(3)
        
        if not self.shooting then
          if not self.HMG then
            self.currentTorsoAnimation = 4
          elseif self.HMG then
            self.currentTorsoAnimation = 12
          end
          self.torsoAnimations[self.currentTorsoAnimation]:gotoFrame(1)
          self.torsoAnimations[self.currentTorsoAnimation]:resume()
        end
      end
    elseif not love.keyboard.isDown("space") then
      canJump = true
    end
    
    if self.velocity.y > -0.01 and self.velocity.y < 0.01 then
      self.airborn = false
    else
      self.airborn = true
      self.currentLegsAnimation = 3
      
      if not self.shooting and not self.lookingDown then
        if not self.HMG then
          self.currentTorsoAnimation = 4
        elseif self.HMG then
          self.currentTorsoAnimation = 12
        end
      end
      
      --Para que la animacion de salto no haga loop
      if self.legsAnimations[self.currentLegsAnimation]:getCurrentFrameCounter() == self.legsAnimations[self.currentLegsAnimation]:getTotalFrameCounter() then
        self.legsAnimations[self.currentLegsAnimation]:pauseAtEnd()
      end
      if self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == self.torsoAnimations[self.currentTorsoAnimation]:getTotalFrameCounter() then
        self.torsoAnimations[self.currentTorsoAnimation]:pauseAtEnd()
      end
    end
    
    --Shooting
    if love.keyboard.isDown("z") then
      if canShoot and self.zUp then
        if love.keyboard.isDown("up") then
          self.forward.y = -1
          self.shootingUp = true
          if not self.HMG then
            self.currentTorsoAnimation = 6
            self.torsoOffsetY = 41 --Solució temporal al canviar el offset per disparar a dalt i abaix
          elseif self.HMG then
            self.currentTorsoAnimation = 14
            self.torsoOffsetY = 47
          end
          self.lookingDown = false
        elseif love.keyboard.isDown("down") and self.airborn then
          self.shootingUp = false
          self.lookingDown = true
          self.forward.y = 1
          if not self.HMG then
            self.currentTorsoAnimation = 8
            self.torsoOffsetY = -5 --Solució temporal al canviar el offset per disparar a dalt i abaix
          elseif self.HMG then
            self.currentTorsoAnimation = 16
            self.torsoOffsetY = -5
          end
        else
          if not self.HMG then
            self.currentTorsoAnimation = 2
          elseif self.HMG then
            self.currentTorsoAnimation = 10
          end
          self.shootingUp = false
          self.lookingUp = false
          self.lookingDown = false
          self.forward.y = 0
          --self.currentTorsoAnimation = 2
          self.torsoOffsetY = 1  --Solució temporal al canviar el offset per disparar a dalt i abaix
        end
        self.torsoAnimations[self.currentTorsoAnimation]:gotoFrame(1)
        self.torsoAnimations[self.currentTorsoAnimation]:resume()
        self.nextFire = 0
        canShoot = false
        self.shot = false
        self.shooting = true
      end
      self.zUp = false
    else
      self.zUp = true
    end
    
    --Coordinar el spawn de la bala amb el moment de la animacio que li toca
    if not self.HMG then
      if self.shooting and not self.shot and self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == 3 then
        b = bullet:extend()
        b:new(objects.player.body:getX(), objects.player.body:getY(), self.forward, "Normal")
        --table.insert(playerBulletList, b)
        table.insert(playerBulletList, b)
    
        self.shot = true
      elseif self.shooting and self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == self.torsoAnimations[self.currentTorsoAnimation]:getTotalFrameCounter() then
        self.shooting = false
        self.shootingUp = false
        self.lookingDown = false
      end
    elseif self.HMG then
      if self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() % 2 == 1 then
        self.shot = false
      end
      if self.shooting and not self.shot and (self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == 2 or self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == 4 or self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == 6 or self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == 8) then
        b = bullet:extend()
        b:new(objects.player.body:getX(), objects.player.body:getY()+ 8, self.forward, "Heavy")
        --table.insert(playerBulletList, b)
        table.insert(playerBulletList, b)
        self.ammo = self.ammo - 1
        self.shot = true
      elseif self.shooting and self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == self.torsoAnimations[self.currentTorsoAnimation]:getTotalFrameCounter() then
        self.shooting = false
        self.shootingUp = false
        self.lookingDown = false
      end
    end
  else
    if not self.dying then
      self.torsoOffsetY = 1
      self.currentTorsoAnimation = 17
      self.torsoAnimations[self.currentTorsoAnimation]:gotoFrame(1)
      self.torsoAnimations[self.currentTorsoAnimation]:resume()
      self.dying = true
      objects.player.body:setLinearVelocity(0, 0)
      objects.player.body:applyLinearImpulse(-60 * self.forward.x, -80)
      self.respawnTimeLeft = 0
      self.invencible = true
    end
    if self.torsoAnimations[self.currentTorsoAnimation]:getCurrentFrameCounter() == self.torsoAnimations[self.currentTorsoAnimation]:getTotalFrameCounter() then
      self.torsoAnimations[self.currentTorsoAnimation]:pauseAtEnd()
    end
    if self.respawnTimeLeft >= self.respawnTime then
      self:respawn()
    else
      self.respawnTimeLeft = self.respawnTimeLeft + dt
    end
  end
  
  --Temps de recarrega per tornar a disparar
  self.nextFire = self.nextFire + dt
  if self.nextFire >= self.fireRate then
    canShoot = true
  end
  
  --Periode d'invulnerabilitat
  
  if self.invencible then
    if self.invencibleTimeLeft >= self.invencibleTime then
      self.invencible = false
      self.invencibleTimeLeft = 0
    end
    self.invencibleTimeLeft = self.invencibleTimeLeft + dt
  end
  
  --Fa que funcioni el update del anim8
  for i=1,#self.legsAnimations do
    self.legsAnimations[i]:update(dt)
  end
  
  for i=1,#self.torsoAnimations do
    self.torsoAnimations[i]:update(dt)
  end
  
  self.targetHitbox.body:setPosition(objects.player.body:getPosition()) --Posar la hitbox fixe al objecte
end

function player:draw()
  cam:draw(function(l, t, w, h)
    love.graphics.setColor(1,1,1)
    --love.graphics.polygon("line", self.targetHitbox.body:getWorldPoints(self.targetHitbox.shape:getPoints())) --DEBUG HITBOX
    --love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints())) --DEBUG PHYSICS HITBOX
    
    if self.alive then
      self.legsAnimations[self.currentLegsAnimation]:draw(self.legsSpriteSheet, objects.player.body:getX(), objects.player.body:getY(), 0 ,self.forward.x,1, self.characterWidth/2 + 5, 3)
      self.torsoAnimations[self.currentTorsoAnimation]:draw(self.torsoSpriteSheet, objects.player.body:getX(), objects.player.body:getY(), 0 ,self.forward.x,1, self.characterWidth/2 + 4, self.characterHeight/2 + self.torsoOffsetY)
    elseif self.respawnTimeLeft < 1 or self.respawnTimeLeft % 0.4 > 0.3 then
      self.torsoAnimations[self.currentTorsoAnimation]:draw(self.torsoSpriteSheet, objects.player.body:getX(), objects.player.body:getY(), 0 ,self.forward.x,1, self.characterWidth/2 + 4, self.characterHeight/2 + self.torsoOffsetY)
    end
  end)
end

function player:changeTorsoAnimation(number)
  if not self.shooting then
    self.currentTorsoAnimation = torso
  end
end

function player:changeLegsAnimation(number)
  self.currentLegsAnimation = number
  self.legsAnimations[self.currentLegsAnimation]:gotoFrame(1)
  self.legsAnimations[self.currentLegsAnimation]:resume()
end

function player:takeDamage()
  if not self.invencible then
    self.alive = false
  end
end

function player:respawn()
  objects.player.body:setY(objects.player.body:getY() - 100)
  objects.player.body:setLinearVelocity(0, 1)
  self.HMG = false
  self.alive = true
  self.dying = false
  self.invencible = true
  self.invencibleTimeLeft = 0
  self.respawnTimeLeft = 0
  self.currentTorsoAnimation = 1
  self.currentLegsAnimation = 1
end

return player