function beginCallback(fixture1, fixture2, contact)
	if fixture1:getUserData() == "enemy" and fixture2:getUserData() == b or fixture2:getUserData() == "enemy" and fixture1:getUserData() == b then
    --print("Shot")
	end
  
  for _,v in ipairs(actorList) do
    if fixture1:getUserData() == b and fixture2:getUserData() == v or fixture2:getUserData() == b and fixture1:getUserData() == v then
      b:destroyBullet()
      --v.alive = false
      v.health = v.health - 1
      print("Enemy hit")
    end
  end
  
  if (fixture1:getUserData() == enemyBullet and fixture2:getUserData() == "player") or (fixture2:getUserData() == enemyBullet and fixture1:getUserData() == "player") then
    enemyBullet:destroyBullet()
    --enemyBullet:printPosition()
    print("Player hit")
  end
  
  if fixture1:getUserData() == "enemy" and fixture2:getUserData() == "player" or fixture2:getUserData() == "enemy" and fixture1:getUserData() == "player" then
    print("Take Damage")
	end
end

function endCallback(fixture1, fixture2, contact)
	if fixture1:getUserData() == "sensor" or fixture2:getUserData() == "sensor" then
		
	end

	-- The contact handling in 0.8.0 is buggy. Do a full garbage collection to prevent some nasty crash.
	contact = nil
	collectgarbage()
end

--function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
--  return x1 < x2+w2 and
--         x2 < x1+w1 and
--         y1 < y2+h2 and
--         y2 < y1+h1
--end