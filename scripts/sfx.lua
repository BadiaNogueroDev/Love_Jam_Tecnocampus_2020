sfx = Object:extend()

sfxPlayer = { "sound/Players/Bala1.wav",              --1
              "sound/Players/Bala2.wav",              --2
              "sound/Players/Pasos.wav",              --3
              "sound/Players/Recarga.wav",            --4   
              "sound/Players/Marco_Henric_Death.wav", --5
              "sound/Players/Sandra_Death.wav",       --6
              "sound/Players/Bala3.wav",              --7
              "sound/Players/Walking1.wav",           --8
              "sound/Players/Walking2.wav"}           --9

sfxEnemies = {"sound/UFO/Bala_UFO.wav",               --1
              "sound/UFO/UFO_Spawn.wav",              --2
              "sound/UFO/UFO_Hurt.wav",               --3
              "sound/UFO/UFO_Death.wav",              --4
              "sound/Zombie/Zombie_Bala.wav" ,        --5
              "sound/Zombie/Zombie_Death.wav",        --6
              "sound/Zombie/Zombie_Death2.wav",       --7
              "sound/Zombie/Zombie_Death3.wav",       --8
              "sound/Zombie/Zombie_Death4.wav" ,      --9
              "sound/Zombie/Zombie_Grunt.wav",        --10
              "sound/Zombie/Zombie_Hurt.wav",         --11
              "sound/Zombie/Zombie_Hurt2.wav",        --12
              "sound/Zombie/Zombie_Hurt3.wav" ,       --13
              "sound/Zombie/Zombie_Hurt4.wav",}       --14
              

sfxMusic = "sound/Music/Zoom_Down.ogg"

sfxAnnouncer = {"sound/Heavy_Machine_Gun.wav"}

function sfx:new()
  ----------------------------PLAYER----------------------------
  
  -----------------------------Balas----------------------------
  self.playerBala = love.audio.newSource(sfxPlayer[1], 'stream')
  self.playerBala:setVolume(0.4)
  --self.playerBala.play()
  --LA BALA DE LOS PJS TIOS
  
  self.playerBala2 = love.audio.newSource(sfxPlayer[2], 'stream')
  self.playerBala2:setVolume(0.4)
  --self.playerBala2.play()
  --LA BALA DE SANDRA
  
  self.playerBala3 = love.audio.newSource(sfxPlayer[7], 'stream')
  self.playerBala3:setVolume(0.4)
  --LA BALA DE LA HEAVY MACHINE GUN
  
  self.playerRecarga = love.audio.newSource(sfxPlayer[4], 'stream')
  self.playerRecarga:setVolume(0.2)
  --self.playerRecarga.play()
  --Por si dejas de disparar (?)
  
  -----------------------------Movement-------------------------
  --self.playerMovement = love.audio.newSource(sfxPlayer[3], 'stream')
  --self.playerMovement:setVolume(0.2)
  --self.playerMovement.play()
  --Movimiento de pjs (suena a botas, poner flojito)
  
  -----------------------------Death----------------------------
  --self.playerManDeath = love.audio.newSource(sfxPlayer[5], 'stream')
  --self.playerManDeath:setVolume(0.4)
  --self.playerManDeath.play()
  --Death sound de los personajes chicos
  
  --self.playerWomanDeath = love.audio.newSource(sfxPlayer[6], 'stream')
  --self.playerWomanDeath:setVolume(0.4)
  --self.playerWomanDeath.play()
  --Death sound de Sandra
  
   ----------------------------ENEMIES--------------------------

   -----------------------------UFO-----------------------------
  --self.enemyUFOBala = love.audio.newSource(sfxEnemies[3], 'stream')
  --self.enemyUFOBala:setVolume(0.4)
  --self.enemyUFOBala.play()
  --LAs BALAs DE LOS UFOs
  
  --self.enemyUFOMovement = love.audio.newSource(sfxEnemies[4], 'stream')
  --self.enemyUFOMovement:setVolume(0.4)
  --self.enemyUFOMovement.play()
  --El movimiento DE LOS UFOs
  
   ----------------------------Zombie---------------------------
  --self.enemyZombieBala = love.audio.newSource(sfxEnemies[5], 'stream')
  --self.enemyZombieBala:setVolume(0.4)
  --self.enemyZombieBala.play()
  --LA BALA DE LOS Zombies
  
  --self.enemyZombieDeath = love.audio.newSource(sfxEnemies[math.random(6,9)], 'stream')
  --self.enemyZombieDeath:setVolume(0.4)
  --self.enemyZombieHurt.play()
  --Las diferentes muertes de los zombies
  
  --self.enemyZombieSpawn = love.audio.newSource(sfxEnemies[10], 'stream')
  --self.enemyZombieSpawn:setVolume(0.4)
  --self.enemyZombieSpawn.play()
  --Sonido de spawn de los zombies
  
  --self.enemyZombieHurt = love.audio.newSource(sfxEnemies[math.random(11,14)], 'stream')
  --self.enemyZombieHurt:setVolume(0.4)
  --self.enemyZombieHurt.play()
  --Al hacer daño a un Zombie
  
  --------------------------Announcer--------------------------
  self.announcer = love.audio.newSource(sfxAnnouncer[1], 'stream')
  self.announcer:setVolume(0.2)
  
  ----------------------------Music----------------------------
  --------------------------In Game Music----------------------

  self.inGameMusic = love.audio.newSource(sfxMusic, 'stream')
  self.inGameMusic:setVolume(0.4)
  self.inGameMusic:setLooping(true)
  --Musica del juego

  end

function sfx:shoot(bullet)
  if bullet == 1 then
    self.playerBala:stop()
    self.playerBala:play()
  else
    self.playerBala3:stop()
    self.playerBala3:play()
  end
end

function sfx:announcerHMG()
  self.announcer:play()
end

return sfx