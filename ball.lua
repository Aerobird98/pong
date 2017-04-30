ball = {}

function ball:reset(e,x,y,a,b)
  e.x = x
  e.y = y
  e.a = a -- width --
  e.b = b -- height --
  e.xvel = 460
  e.yvel = 0
end

function ball:bounce(e,f,dt)
  e.x = e.x + e.xvel * dt
  e.y = e.y + e.yvel * dt

  -- left & right wall col --
  if e.x < 0 - e.a then
    ball:reset(e,width/2,height/2,20,20)
    rscore = rscore + 1
  elseif e.x > width + e.a then
    ball:reset(e,width/2,height/2,20,20)
    lscore = lscore + 1
  -- up & down wall col --
  elseif e.y < 0 + e.a or e.y > height - e.b then
    e.xvel = e.xvel
    e.yvel = -e.yvel
  end
end

-- collision check (with paddle)
function ball:col(e,f,dt)
  if e.y + e.b/2 > f.y
    and e.y - e.b/2 < f.y + f.b
    and e.x - e.a/2 > f.x + f.a
    and e.x - e.a/2 + e.xvel * dt < f.x + f.a
    or e.y + e.b/2 > f.y 
    and e.y - e.b/2 < f.y + f.b
    and e.x + e.a/2 < f.x
    and e.x + e.a/2 + e.xvel * dt > f.x then

    e.xvel = -e.xvel
    e.yvel = e.yvel + math.random(100,160)
  end
end

function ball:draw(e)
  love.graphics.rectangle('fill',e.x - e.a/2,e.y - e.b/2,e.a,e.b)
end