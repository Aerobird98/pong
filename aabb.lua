aabb = {}
rscore = 0
lscore = 0

function aabb:pong(e,f,dt)
  local load = love.load
  for i = 1, #e do
    for j = 1, #f do
      if e[i].x + e[i].a/2 > f[j].x and e[i].x - e[i].a/2 < f[j].x + f[j].a
        or e[i].y + e[i].b/2 > f[j].y and e[i].y - e[i].b/2 < f[j].y + f[j].b then
        -- left col --
        if e[i].x - e[i].a/2 > f[j].x + f[j].a
          and e[i].x - e[i].a/2 + e[i].xvel * dt < f[j].x + f[j].a
          or e[i].xvel < 0 and e[i].x - e[i].a/2 == f[j].x + f[j].a then
          e[i].xvel = -e[i].xvel
          e[i].yvel = e[i].yvel
        -- right col --
        elseif e[i].x + e[i].a/2 < f[j].x
          and e[i].x + e[i].a/2 + e[i].xvel * dt > f[j].x
          or e[i].xvel > 0 and e[i].x + e[i].a/2 == f[j].x then
          e[i].xvel = -e[i].xvel
          e[i].yvel = e[i].yvel
        end
      end
    end
    -- left & right wall col --
    if e[i].x < 0 - e[i].a then load() rscore = rscore + 1
    elseif e[i].x > width + e[i].a then load() lscore = lscore + 1
    -- up & down wall col --
    elseif e[i].y < 0 + e[i].a or e[i].y > height - e[i].b then
      e[i].xvel = e[i].xvel
      e[i].yvel = -e[i].yvel
    end
  end
end
