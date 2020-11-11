sfx = Object:extend()

sfxPlayer = {"sound/Players/Bala1.wav" , "sound/Players/Bala2.wav", "sound/Players/Pasos.wav", "sound/Players/Recarga.wav", "sound/Players/Marco_Henric_Death.wav", "sound/Players/Sandra_Death.wav"}

sfxEnemies = {"sound/UFO/Bala_UFO.wav", "sound/UFO/Bala_UFO2.wav", "sound/UFO/Bala_UFO3.wav", "sound/UFO/UFO_Movement.wav", "sound/Zombie/Zombie_Bala.wav" , "sound/Zombie/Zombie_Death.wav", "sound/Zombie/Zombie_Death2.wav", "sound/Zombie/Zombie_Death3.wav", "sound/Zombie/Zombie_Death4.wav" , "sound/Zombie/Zombie_Grunt.wav", "sound/Zombie/Zombie_Hurt.wav", "sound/Zombie/Zombie_Hurt2.wav", "sound/Zombie/Zombie_Hurt3.wav" ,"sound/Zombie/Zombie_Hurt4.wav" }

sfxMusic = {"sound/Music/Blue_Water_Fangs.wav","sound/Music/Intrigue.wav","sound/Music/Judgment.wav","sound/Music/Speeder.wav","sound/Music/Unused_Tune.wav","sound/Music/Zoom_Down.wav"}

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
  
  self.playerRecarga = love.audio.newSource(sfxPlayer[4], 'stream')
  self.playerRecarga:setVolume(0.4)
  --self.playerRecarga.play()
  --Por si dejas de disparar (?)
  
  -----------------------------Movement-------------------------
  self.playerMovement = love.audio.newSource(sfxPlayer[3], 'stream')
  self.playerMovement:setVolume(0.2)
  --self.playerMovement.play()
  --Movimiento de pjs (suena a botas, poner flojito)
  
  -----------------------------Death----------------------------
  self.playerManDeath = love.audio.newSource(sfxPlayer[5], 'stream')
  self.playerManDeath:setVolume(0.4)
  --self.playerManDeath.play()
  --Death sound de los personajes chicos
  
  self.playerWomanDeath = love.audio.newSource(sfxPlayer[6], 'stream')
  self.playerWomanDeath:setVolume(0.4)
  --self.playerWomanDeath.play()
  --Death sound de Sandra
  
   ----------------------------ENEMIES--------------------------

   -----------------------------UFO-----------------------------
  self.enemyUFOBala = love.audio.newSource(sfxEnemies[math.random(1,3)], 'stream')
  self.enemyUFOBala:setVolume(0.4)
  --self.enemyUFOBala.play()
  --LAs BALAs DE LOS UFOs
  
  self.enemyUFOMovement = love.audio.newSource(sfxEnemies[4], 'stream')
  self.enemyUFOMovement:setVolume(0.4)
  --self.enemyUFOMovement.play()
  --El movimiento DE LOS UFOs
  
   ----------------------------Zombie---------------------------
  self.enemyZombieBala = love.audio.newSource(sfxEnemies[5], 'stream')
  self.enemyZombieBala:setVolume(0.4)
  --self.enemyZombieBala.play()
  --LA BALA DE LOS Zombies
  
  self.enemyZombieDeath = love.audio.newSource(sfxEnemies[math.random(6,9)], 'stream')
  self.enemyZombieDeath:setVolume(0.4)
  --self.enemyZombieHurt.play()
  --Las diferentes muertes de los zombies
  
  self.enemyZombieSpawn = love.audio.newSource(sfxEnemies[10] 'stream')
  self.enemyZombieSpawn:setVolume(0.4)
  --self.enemyZombieSpawn.play()
  --Sonido de spawn de los zombies
  
  self.enemyZombieHurt = love.audio.newSource(sfxEnemies[11], 'stream')
  self.enemyZombieHurt:setVolume(0.4)
  --self.enemyZombieHurt.play()
  --Al hacer daño a un Zombie
  
  ----------------------------Music----------------------------
  --------------------------In Game Music----------------------

   self.inGameMusic = love.audio.newSource(sfxMusic[6], 'stream')
   self.inGameMusic:setVolume(0.4)
   self.inGameMusic:setLooping(true)
   --self.inGameMusic.play()
  --Musica del juego

  end

return sfx