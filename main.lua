function love.load()
  require('paddle')
  require('ball')

  -- Globals
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  dt = 0.02

  ball:reset()

  -- Add paddles
  paddle:add(40,height/2 - 120/2,20,120,2)
  paddle:add(width - (40 + 20),height/2 - 120/2,20,120,1)
end

function love.update()
  ball:bounce(dt)
  paddle:move(dt)
  --paddle:ai()
end

function love.draw()
  -- Draw entities...
  paddle:draw()
  ball:draw()

  -- Draw other stuff...
  love.graphics.setColor(0,0,0) -- Black
  love.graphics.setBackgroundColor(255,255,255) -- White
  love.graphics.setNewFont('Milkshake/Milkshake.ttf',30)
  love.graphics.print(ball.lscore..' :  '..ball.rscore, width/2 - 40, 5)
  love.graphics.print('v.1.0.2', 5, height - 40)
end

function love.keypressed(k)
  if k == 'escape' then
    love.event.quit()
  elseif k == 'r' then
    ball:reset()
  end
end