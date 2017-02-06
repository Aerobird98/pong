function love.load()
  require('paddle')
  require('ball')

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  debug = false

  paddle:add(40,height/2 - paddle.b/2,paddle.a,paddle.b,2)
  paddle:add(width - (40 + paddle.a),height/2 - paddle.b/2,paddle.a,paddle.b,1)
end

function love.update()
  ball:bounce()
  paddle:move()
  --paddle:ai()
end

function love.draw()
    -- For debug
  if debug == true then
    love.graphics.setColor(0,0,0) -- Black
    love.graphics.setNewFont('Milkshake/Milkshake.ttf',30)
    love.graphics.print('> ball-xpos:  '..ball.x,10,10)
    love.graphics.print('> ball-ypos:  '..ball.y,10,50)
    love.graphics.print('> ball-xvel:  '..ball.xvel,10,90)
    love.graphics.print('> ball-yvel:  '..ball.yvel,10,130)
  end

  -- Entities...
  paddle:draw()
  ball:draw()

  -- Other stuff...
  love.graphics.setColor(0,0,0) -- Black
  love.graphics.setBackgroundColor(255,255,255) -- White
  love.graphics.setNewFont('Milkshake/Milkshake.ttf',30)
  love.graphics.print(ball.lscore..' :  '..ball.rscore, width/2 - 40, 5)
  love.graphics.print('v.1.0.0', 5, height - 40)
end

function love.keypressed(k)
  if k == 'escape' then
    love.event.quit()
  elseif k == 'r' then
    ball:reset()
  end
end