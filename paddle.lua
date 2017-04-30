paddle = {}

function paddle:add(e,x,y,a,b)
  table.insert(e,{x=x,y=y,a=a,b=b,yvel=0})
end

function paddle:remove(e)
  for i = 1, #e do table.remove(e) end
end

function paddle:move(e,yvel,u,d,dt)
  e.y = e.y + e.yvel * dt

  if love.keyboard.isDown(u) then
    e.yvel = -yvel -- add value to the y-velocity ('-' is up)
  elseif love.keyboard.isDown(d) then
    e.yvel = yvel -- add value to the y-velocity ('+' is down)
  else e.yvel = 0 end

  -- touch input
  local touches = love.touch.getTouches()
  for i = 1, #touches do
    local x,y = love.touch.getPosition(#touches)
    if x < width/2 and y < height/2 then
      e.yvel = -yvel -- add value to the y-velocity ('-' is up)
    elseif x < width/2 and y > height/2 then
      e.yvel = yvel -- add value to the y-velocity ('+' is down)
    else e.yvel = 0 end
  end

  -- for keeping the paddles in wiew
  if e.y > height - e.b then e.y = height - e.b
  elseif e.y < 0 then e.y = 0 end
end

-- For drawing the paddle
function paddle:draw(e)
  for i = 1, #e do
    love.graphics.rectangle('fill',e[i].x,e[i].y,e[i].a,e[i].b)
  end
end
