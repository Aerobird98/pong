function love.conf(t)
  -- To display window title
  t.window.title = 'pong 1.1.0 - by Aerobird98'

  t.version = '0.10.2' -- Löve2d version

  -- Set the window size
  t.window.width = 800
  t.window.height = 600
  t.window.resizable = true
  t.window.vsync = true

  -- Add/Remove love2d modules
  t.modules.audio = false
  t.modules.event = true
  t.modules.graphics = true
  t.modules.image = false
  t.modules.joystick = false
  t.modules.keyboard = true
  t.modules.math = false
  t.modules.mouse = false
  t.modules.physics = false
  t.modules.sound = false
  t.modules.system = false
  t.modules.timer = false
  t.modules.touch = true
  t.modules.video = false
  t.modules.window = true
  t.modules.thread = false
end
