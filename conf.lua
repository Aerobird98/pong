function love.conf(t)
  -- To make the console output display live in Sublime text
  io.stdout:setvbuf('no')

  -- To display window title
  t.window.title = 'pong - by Aerobird98'

  t.version = '0.10.2' -- Löve2d version

  -- Set the window size
  t.window.width = 800
  t.window.height = 600
  t.window.resizable = true
  t.window.vsync = true

  t.modules.audio = false
  t.modules.event = true
  t.modules.graphics = true
  t.modules.image = false
  t.modules.joystick = false
  t.modules.keyboard = true
  t.modules.math = true
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
