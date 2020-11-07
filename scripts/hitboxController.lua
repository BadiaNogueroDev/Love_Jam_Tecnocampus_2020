function beginCallback(fixture1, fixture2, contact)
	if fixture1:getUserData() == "enemy" and fixture2:getUserData() == b or fixture2:getUserData() == "enemy" and fixture1:getUserData() == b then
    --print("Shot")
	end
  
  if fixture1:getUserData() == b or fixture2:getUserData() == b then
    b:destroyBullet()
    print("Enemy hit")
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