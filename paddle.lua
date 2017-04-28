paddle = {}

-- For adding a new paddle, with an 'x' & 'y' coords,'a' width & 'b' height
function paddle:add(e,x,y,a,b)
  table.insert(e,{x=x,y=y,a=a,b=b,yvel=0,yvelv=600})
end

function paddle:remove(e)
  for i = 1, #e do table.remove(e) end
end

-- For controlling the paddles
function paddle:ctrl(e,dt)
  for i = 1, #e do
    e[i].y = self[i].y + self[i].yvel * dt

    -- Move left-paddle with the w & s keys in the y-axis
    if love.keyboard.isDown('w') then
      -- add value to the y-velocity ('-' is up)
      e[1].yvel = -e[i].yvelv
    elseif love.keyboard.isDown('s') then
      -- add value to the y-velocity ('+' is down)
      e[1].yvel = e[i].yvelv
    else e[1].yvel = 0 end

    -- Move right-paddle with the up & down keys in the y-axis
    if love.keyboard.isDown('up') then
      -- add value to the y-velocity ('-' is up)
      e[2].yvel = -e[i].yvelv
    elseif love.keyboard.isDown('down') then
      -- add value to the y-velocity ('+' is down)
      e[2].yvel = e[i].yvelv
    else e[2].yvel = 0 end

    -- touch input
    local touches = love.touch.getTouches()
    for i = 1, #touches do
      local x,y = love.touch.getPosition(#touches)
      -- Move the left-paddle
      if x < width/2 and y < height/2 then
        -- add value to the y-velocity ('-' is up)
        self[1].yvel = -self[i].yvelv
      elseif x < width/2 and y > height/2 then
        -- add value to the y-velocity ('+' is down)
        self[1].yvel = self[i].yvelv
      else self[1].yvel = 0 end

      -- Move the Right-paddle
      if x > width/2 and y < height/2 then
        -- add value to the y-velocity ('-' is up)
        self[2].yvel = -self[i].yvelv
      elseif x > width/2 and y > height/2 then
        -- add value to the y-velocity ('+' is down)
        self[2].yvel = self[i].yvelv
      else self[2].yvel = 0 end
    end

    -- For keeping the paddles in wiew
    if e[i].y > height - e[i].b then e[i].y = height - e[i].b
    elseif e[i].y < 0 then e[i].y = 0 end end
end

-- For drawing the paddle
function paddle:draw(e)
  for i = 1, #e do
    love.graphics.setColor(0,0,0) -- Black
    love.graphics.rectangle('fill',e[i].x,e[i].y,e[i].a,e[i].b)
  end
end
