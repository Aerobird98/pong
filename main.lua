function love.load()
  require('paddle')
  require('ball')

  -- Globals
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  pause = true
  dt = 0.02

  ball:reset()

  -- Add paddles
  paddle:add(40,height/2 - 120/2,20,120,2)
  paddle:add(width - 60,height/2 - 120/2,20,120,1)
end

function love.update()
  -- Specify the window width & height in here to make it responsive --------------
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  paddle[2].x = width - 60 -- updtate paddle-right's x position, if resize happens
  ---------------------------------------------------------------------------------

  if not pause then
    ball:bounce(dt)
    paddle:move(dt)
    --paddle:ai()
  end
end

function love.draw()
  -- Draw entityes...
  paddle:draw()
  ball:draw()

  -- Draw other stuff...
  love.graphics.setColor(0,0,0) -- Black
  love.graphics.setBackgroundColor(255,255,255) -- White
  love.graphics.setNewFont('Milkshake/Milkshake.ttf',30)
  love.graphics.print(ball.lscore..' :  '..ball.rscore, width/2 - 40, 5)
  love.graphics.print('v.1.0.4', 5, height - 40)

  if pause then 
    love.graphics.rectangle('fill',5,5,10,30)
    love.graphics.rectangle('fill',20,5,10,30)
  end
end

function love.keypressed(k)
  if k == 'escape' then
    love.event.quit()
  elseif k == 'r' then
    ball:reset()
    paddle:reset()
    pause = true
    ball.lscore = 0
    ball.rscore = 0
  elseif k == 'p' or k == 'space' then pause = not pause end
end