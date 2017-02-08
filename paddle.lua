paddle = {}
paddle.id = 0
paddle.a = 0 -- width --
paddle.b = 0 -- height --
paddle.x = 0
paddle.y = 0
paddle.yvel = 0
paddle.yvelValue = 600

-- For adding a new paddle, with an 'x' & 'y' coords,'a' width & 'b' height
function paddle:add(x,y,a,b,id)
  table.insert(paddle,{x = x,y = y,a = a,b = b,id = id})
end

-- For moving the paddle
function paddle:move(dt)
  for i,v in ipairs(paddle) do
    -- Get the paddle y coords, add the corresponding velocity and multiply it with delta time,
    -- this is necessary to move the paddle,
    -- then we will need to add a value to the velocity.
    v.y = v.y + self.yvel * dt

    -- Move left-paddle with the w & s keys in the y-axis
    if v.id == 1 then
      if love.keyboard.isDown('w') then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif love.keyboard.isDown('s') then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      else
        self.yvel = 0
      end
    end

    -- Move right-paddle with the up & down keys in the y-axis
    if v.id == 2 then
      if love.keyboard.isDown('up') then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif love.keyboard.isDown('down') then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      else
        self.yvel = 0
      end
    end

    -- Touch input
    local touches = love.touch.getTouches()
    for i, id in ipairs(touches) do
    local x,y = love.touch.getPosition(id)
      -- Move the left-paddle
      if x < width/2 and y < height/2 and v.id == 1 then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif x < width/2 and y > height/2 and v.id == 1 then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      end
      -- Move the Right-paddle
      if x > width/2 and y < height/2 and v.id == 2 then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif x > width/2 and y > height/2 and v.id == 2 then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      end
    end

    -- For keeping the paddle in wiew
    -- up --
    if v.y > height - self.b then
      v.y = height - self.b
    -- down --
    elseif v.y < 0 then
      v.y = 0
    end
  end
end

--[[ Ai
-- still to smart ;)
function paddle:ai()
  self.id = 1
  paddle[self.id].y = ball.y - self.b/2

  -- For keeping the ai in wiew
  -- up --
  if paddle[self.id].y > height - self.b then
    paddle[self.id].y = height - self.b
  -- down --
  elseif paddle[self.id].y < 0 then
    paddle[self.id].y = 0
  end
end]]

-- For drawing the paddle
function paddle:draw()
  for i,v in ipairs(paddle) do
    love.graphics.setColor(0,0,0) -- Black
    love.graphics.rectangle('fill',v.x,v.y,v.a,v.b)
  end
end

