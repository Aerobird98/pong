# pong

I created this game in the weekend just for practice, it is written in lua (entirely from scratch) using the **awesome** <a href="https://love2d.org/">löve2d</a> framework (mobile is supported!).

Pong is one of the first computer games that ever created, originally developed by Allan Alcorn and released in 1972 by Atari corporations. This simple clone features two paddles and a ball, a player gets score once the opponent misses a ball. The game can be played with two human players, or one player against a computer controlled paddle (AI is still in the TODO list).

- Move the `left-paddle` with the `w & s` keys and the `right-paddle` with the `arrow keys(up & down)`,
- Press `esc` to quit the game,
- Press `r` to reset the ball & clear scores.

You need [löve2d](https://love2d.org/) version `0.10.2.0` to run or build this project

## How to build (...)

- Clone or download this repository
- zip all files & rename the zipped folder to a `.love` file extension (if you have löve2d installed, just double click to it)
- Navigate to `> cd c:/pong` in the console
- Please note,that you need [löve2d](https://love2d.org/) version `0.10.2.0`, as mentioned above
- ...and run this command: `> copy /b love.exe + pong.love pong.exe`
- Then you can hack the `.exe` file properties with [this tool](http://angusj.com/resourcehacker/).

> [this tool](https://mothereff.in/lua-minifier) can minify the scripts, to make them even smaller in size.

## Contributing(...)

This project created just for practice, but if you want, feel free to fork and open a pull request or submit a bug.

**TODO list:**

- Make AI,
- Improve ball physics,
- Create menu & let the player choose between game modes (two-player, single-player).
- etc...

## License
pong is licensed under the [MIT license](https://raw.githubusercontent.com/Aerobird98/pong/master/LICENSE.txt).



