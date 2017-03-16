local utils = require('menubar/utils')
--naughty.notify({text = utils.lookup_icon("chrome")})
awful.rules.rules = awful.util.table.join(
  awful.rules.rules,
  {
    {
      rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },

    -- Floating clients.
    {
      rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Arandr",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Wpa_gui",
          "pinentry",
          "veromix",
          "xtightvncviewer"
        },
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      },
      properties = {
        floating = true
      }
    },
    {
      rule_any = {
        class = {
          "subl3",
          "Subl3"
        },
      },
      properties = {
        icon = "/usr/share/icons/Paper/16x16/apps/sublime.png",
      }
    },
    -- Add titlebars to normal clients and dialogs
    { 
      rule_any = {
        type = { 
          "normal",
          "dialog"
        }
      },
      properties = {
        titlebars_enabled = true
      }
    },
  }
)