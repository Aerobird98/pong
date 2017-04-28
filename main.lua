function love.load()
  require('paddle')
  require('ball')

  -- Globals
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  pause = pause
  dt = 0.02
  lscore = 0
  rscore = 0

  ball:reset(ball,width/2,height/2,20,20)
  paddle:remove(paddle)
  paddle:add(paddle,40,height/2 - 120/2,20,120) -- left paddle
  paddle:add(paddle,width - 60,height/2 - 120/2,20,120) -- right paddle
end

function love.update()
  if not pause then
    ball:bounce(ball,paddle,dt)
    paddle:ctrl(paddle,dt)
  end
end

function love.draw()
  -- Draw entitys...
  paddle:draw(paddle)
  ball:draw(ball)

  -- Draw other stuff...
  love.graphics.setColor(0,0,0) -- Black
  love.graphics.setBackgroundColor(255,255,255) -- White
  love.graphics.setNewFont('Milkshake/Milkshake.ttf',30)
  love.graphics.print(lscore..' :  '..rscore, width/2 - 40, 5)
  love.graphics.print('v.1.1.0', 5, height - 40)

  if pause then 
    love.graphics.rectangle('fill',5,5,10,30)
    love.graphics.rectangle('fill',20,5,10,30)
  end
end

function love.keypressed(k)
  if k == 'escape' then
    love.event.quit()
  elseif k == 'r' then
    love.load()
  elseif k == 'p' or k == 'space' then pause = not pause end
end