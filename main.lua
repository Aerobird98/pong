function love.load()
  require('paddle')
  require('ball')

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
    for i = 1, #paddle do ball:col(ball,paddle[i],dt) end
    ball:bounce(ball,paddle,dt)
    paddle:move(paddle[1],600,'w','s',dt)
    paddle:move(paddle[2],600,'up','down',dt)
  end
end

function love.draw()
  paddle:draw(paddle)
  ball:draw(ball)

  love.graphics.setNewFont('Bit/Bit.ttf',30)
  love.graphics.print(lscore..' : '..rscore, width/2 - 40,10)

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