entity = {}
entity.ball = {}
entity.paddle = {}
entity.colors = {
  -- black & white:
  { 0.0, 0.0, 0.0 }, -- black           -> id = 1
  { 1.0, 1.0, 1.0 }, -- white           -> id = 2
}

function entity:add(e,x,y,a,b,xvel,yvel,id)
  table.insert(e,{x=x,y=y,a=a,b=b,xvel=xvel,yvel=yvel,id=id})
end

function entity:remove(e)
  for i = 1, #e do table.remove(e) end
end

function entity:move_a(e,yvel,u,d,dt)
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
  for i = 1, #e do
    love.graphics.setColor(entity.colors[e[i].id][1] * 255,entity.colors[e[i].id][2] * 255,entity.colors[e[i].id][3] * 255)
    love.graphics.rectangle('fill',e[i].x - e[i].a/2,e[i].y - e[i].b/2,e[i].a,e[i].b)
  end
end

function entity:draw_b(e)
  for i = 1, #e do
    love.graphics.setColor(entity.colors[e[i].id][1] * 255,entity.colors[e[i].id][2] * 255,entity.colors[e[i].id][3] * 255)
    love.graphics.rectangle('fill',e[i].x,e[i].y,e[i].a,e[i].b)
  end
end
