function beginCallback(fixture1, fixture2, contact)
  
  --if fixture1:getUserData() == "pickUp" and fixture2:getUserData() == "player" or fixture2:getUserData() == "pickUp" and fixture1:getUserData() == "player" then
  --  pUp:destroy()
  --else
  if p.alive then
    for _,v in ipairs(pickUpsList) do
      if (fixture1:getUserData() == v and fixture2:getUserData() == "player") or (fixture2:getUserData() == v and fixture1:getUserData() == "player") then
        v:destroy()
      end
    end
  end
  
  for _,v in ipairs(playerBulletList) do
    if fixture1:getUserData() == v or fixture2:getUserData() == v then
      if fixture1:getUserData() == "wall" or fixture2:getUserData() == "wall" then
        v:destroyBullet()
      else
        for _,k in ipairs(actorList) do
          if fixture1:getUserData() == k or fixture2:getUserData() == k then
            v:destroyBullet()
            --v.alive = false
            k:takeDamage()
          end
        end
      end
    end
  end
  
  for _,v in ipairs(enemyBulletList) do
    if (fixture1:getUserData() == v and fixture2:getUserData() == "wall") or (fixture2:getUserData() == v and fixture1:getUserData() == "wall") then
      v:destroyBullet()
    elseif (fixture1:getUserData() == v and fixture2:getUserData() == "player") or (fixture2:getUserData() == v and fixture1:getUserData() == "player") then
      v:destroyBullet()
      --p:takeDamage()
    end
  end
  
  for _,v in ipairs(actorList) do
    if (fixture1:getUserData() == v and fixture2:getUserData() == "player") or (fixture2:getUserData() == v and fixture1:getUserData() == "player") then
      p:takeDamage()
    end
  end
	--end
  
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