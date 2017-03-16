local spawn_with_shell = require("awful").spawn.with_shell

spawn_with_shell("setxkbmap -layout 'es,es' -model pc105")
spawn_with_shell("xset -b")
spawn_with_shell("xrdb -merge /home/alejandro/.config/base16-xresources/xresources/base16-default-dark-256.Xresources && xrdb -merge /home/alejandro/.urxvt.Xresources")
