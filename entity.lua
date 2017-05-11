entity = {0,0,0}
entity.ball = {0,0,0,0,0,0,0,0}
entity.paddle = {0,0,0,0,0,0,0,0}
entity.colors = {
  -- black & white:
  {000,000,000}, --                 -> id = 1
  {255,255,255}, --                 -> id = 2
}

function entity:add(e,x,y,a,b,xvel,yvel,id)
  table.insert(e,{x=x,y=y,a=a,b=b,xvel=xvel,yvel=yvel,id=id})
end

function entity:remove(e)
  local remove = table.remove 
  for i = 1, #e do remove(e) end
end

function entity:move_a(e,u,d,dt)
  local yvel = 600
  e.y = e.y + e.yvel * dt

  if love.keyboard.isDown(u) then
    e.yvel = -yvel -- add value to the y-velocity ('-' is up)
  elseif love.keyboard.isDown(d) then
    e.yvel = yvel -- add value to the y-velocity ('+' is down)
  else e.yvel = 0 end

  -- for keeping the paddles in wiew
  if e.y > height - e.b then e.y = height - e.b
  elseif e.y < 0 then e.y = 0 end
end

function entity:move_b(e,dt)
  for i = 1, #e do
    e[i].x = e[i].x + e[i].xvel * dt
    e[i].y = e[i].y + e[i].yvel * dt
  end
end

function entity:draw_a(e)
  local setcolor = love.graphics.setColor
  local rectangle = love.graphics.rectangle
  for i = 1, #e do
    setcolor(entity.colors[e[i].id][1],entity.colors[e[i].id][2],entity.colors[e[i].id][3])
    rectangle('fill',e[i].x - e[i].a/2,e[i].y - e[i].b/2,e[i].a,e[i].b)
  end
end

function entity:draw_b(e)
  local setcolor = love.graphics.setColor
  local rectangle = love.graphics.rectangle
  for i = 1, #e do
    setcolor(entity.colors[e[i].id][1],entity.colors[e[i].id][2],entity.colors[e[i].id][3])
    rectangle('fill',e[i].x,e[i].y,e[i].a,e[i].b)
  end
end
