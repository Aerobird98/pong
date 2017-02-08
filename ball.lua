ball = {}
ball.a = 0 -- width --
ball.b = 0 -- height --
ball.x = 0
ball.y = 0
ball.xvel = 0
ball.yvel = 0
ball.lscore = 0
ball.rscore = 0

function ball:reset()
  self.a = 20 -- width --
  self.b = self.a -- height --
  self.x = width/2
  self.y = height/2
  self.xvel = 460
  self.yvel = 0
end

function ball:bounce(dt)
  -- Get the ball x,y coords, add the corresponding velocity and multiply it with delta time,
  -- this is necessary to move the ball, then we will need to add a value to the velocity
  self.x = self.x + self.xvel * dt
  self.y = self.y + self.yvel * dt

  -- Setup paddle collision
  ball:leftcol(paddle[1],dt)
  ball:rightcol(paddle[2],dt)

  -- Wall collision
  -- left --
  if self.x < 0 - self.a then
    ball:reset()
    self.rscore = self.rscore + 1
  -- right --
  elseif self.x > width + self.a then
    ball:reset()
    self.lscore = self.lscore + 1
  end
    -- up --
  if self.y < 0 + self.a then
    self.xvel = self.xvel
    self.yvel = -self.yvel
  -- down --
  elseif self.y > height - self.b then
    self.xvel = self.xvel
    self.yvel = -self.yvel
  end
end

-- Left collision check (with paddle)
function ball:leftcol(e,dt)
  if self.y + self.b/2 > e.y
    and self.y - self.b/2 < e.y + e.b
    and self.x - self.a/2 > e.x + e.a
    and self.x - self.a/2 + self.xvel * dt < e.x + e.a then

    self.xvel = -self.xvel
    self.yvel = self.yvel + math.random(100,160)
  end
end

-- Right collision check (with paddle)
function ball:rightcol(e,dt)
  if self.y + self.b/2 > e.y 
    and self.y - self.b/2 < e.y + e.b 
    and self.x + self.a/2 < e.x 
    and self.x + self.a/2 + self.xvel * dt > e.x then

    self.xvel = -self.xvel
    self.yvel = self.yvel + math.random(100,160)
  end
end

function ball:draw()
  love.graphics.setColor(0,0,0) -- Black
  love.graphics.rectangle('fill',self.x - self.a/2,self.y - self.b/2,self.a,self.b)
end