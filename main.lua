function love.load()
  require('entity')
  require('aabb')

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  pause = pause
  dt = 0.02

  entity:remove(entity.ball)
  entity:remove(entity.paddle)
  entity:add(entity.ball,width/2,height/2,20,20,460,0,2)              -- ball
  entity:add(entity.paddle,40,height/2 - 120/2,20,120,0,0,2)          -- left paddle
  entity:add(entity.paddle,width - 60,height/2 - 120/2,20,120,0,0,2)  -- right paddle
end

function love.update()
  if not pause then
    aabb:pong(entity.ball,entity.paddle,dt)
    entity:move_b(entity.ball,dt)
    entity:move_a(entity.paddle[1],600,'w','s',dt)
    entity:move_a(entity.paddle[2],600,'up','down',dt)
  end
end

function love.draw()
  entity:draw_a(entity.ball)
  entity:draw_b(entity.paddle)

  love.graphics.setNewFont('Bit/Bit.ttf',30)
  love.graphics.print(lscore..' : '..rscore, width/2 - 30,10)

  if pause then 
    love.graphics.rectangle('fill',5,5,10,30)
    love.graphics.rectangle('fill',20,5,10,30)
  end
end

function love.keypressed(k)
  if k == 'escape' then love.event.quit()
  elseif k == 'r' then love.load() lscore = 0 rscore = 0
  elseif k == 'p' or k == 'space' then pause = not pause end
end
