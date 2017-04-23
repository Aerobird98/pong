paddle = {}
paddle.id = 0
paddle.a = 0 -- width --
paddle.b = 0 -- height --
paddle.x = 0
paddle.y = 0
paddle.yvel = 0
paddle.yvelValue = 600

function paddle:reset()
  for i = 1, #self do
    self[2].x = width - 60
    self[2].y = height/2 - 120/2
    self[1].x = 40
    self[1].y = height/2 - 120/2
  end
end

-- For adding a new paddle, with an 'x' & 'y' coords,'a' width & 'b' height
function paddle:add(x,y,a,b,id)
  table.insert(self,{x = x,y = y,a = a,b = b,id = id})
end

-- For moving the paddle
function paddle:move(dt)
  for i = 1, #self do
    -- Get the paddle y coords, add the corresponding velocity and multiply it with delta time,
    -- this is necessary to move the paddle,
    -- then we will need to add a value to the velocity.
    self[i].y = self[i].y + self.yvel * dt

    -- Move left-paddle with the w & s keys in the y-axis
    if self[i].id == 1 then
      if love.keyboard.isDown('w') then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif love.keyboard.isDown('s') then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      else self.yvel = 0 end
    end

    -- Move right-paddle with the up & down keys in the y-axis
    if self[i].id == 2 then
      if love.keyboard.isDown('up') then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif love.keyboard.isDown('down') then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      else self.yvel = 0 end
    end

    -- Touch input
    local touches = love.touch.getTouches()
    for i = 1, #touches do
    local x,y = love.touch.getPosition(#touches)
      -- Move the left-paddle
      if x < width/2 and y < height/2 and self[i].id == 1 then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif x < width/2 and y > height/2 and self[i].id == 1 then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      end
      -- Move the Right-paddle
      if x > width/2 and y < height/2 and self[i].id == 2 then
        -- add value to the y-velocity ('-' is up)
        self.yvel = -self.yvelValue
      elseif x > width/2 and y > height/2 and self[i].id == 2 then
        -- add value to the y-velocity ('+' is down)
        self.yvel = self.yvelValue
      end
    end

    -- For keeping the paddle in wiew
    -- up --
    if self[i].y > height - self[i].b then
      self[i].y = height - self[i].b
    -- down --
    elseif self[i].y < 0 then
      self[i].y = 0
    end
  end
end

-- For drawing the paddle
function paddle:draw()
  for i = 1, #self do
    love.graphics.setColor(0,0,0) -- Black
    love.graphics.rectangle('fill',self[i].x,self[i].y,self[i].a,self[i].b)
  end
end

