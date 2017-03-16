local sound_widget = require('lib/soundtastic/widget')
local sound_bar = require('lib/soundtastic/bar')
local Pulse      = require("lib.soundtastic.pactl")


sound_widget = sound_widget({
  settings = function ()
    local text = ''
    local img = ''

    if sound_now.mute == 'yes' then
      text = '[M]'
      img = 'audio-volume-muted'
    else
      text = tostring(sound_now.volume) .. '%'
      img = 'audio-volume-low'
      if sound_now.volume >= 100 then
        img = 'audio-volume-high'
      elseif sound_now.volume >= 50 then
        img = 'audio-volume-medium'
      end
    end
    widget.text = text
    sound_bar.update(sound_now.volume, "/home/alejandro/test.svg")
  end
})

sound_widget:connect_signal("mouse::enter", function() sound_bar.visible = true end)
sound_widget:connect_signal("mouse::leave", function() sound_bar.visible = false end)

sound_bar.getBar():connect_signal(
  "button::press",
  function(a,b,c,d,e,f)
    local vol = '0'
    if d == 1 then
      vol = tostring((b/f.height * 100))
    else
      if d == 4 then
        vol = "+5"
      elseif d == 5 then
        vol = "-5"
      elseif d==2 or d==3 then
        vol = "toggle"
      end
    end
    Pulse.sink:setVolume(vol)
  end
)

return sound_widget