function findScreen(target)
  for s in screen do
    for key,value in pairs(s.outputs) do
      if target == key then
        return screen[target].index
      end
    end
  end
  return nil
end

tyrannical.tags = {
    {
        name        = " ⌘ Term",                 -- Call the tag "Term"
        init        = true,                   -- Load the tag on startup
        exclusive   = true,                   -- Refuse any other type of clients (by classes)
        layout      = awful.layout.suit.tile, -- Use the tile layout
        screen      = findScreen('eDP1') or 1,
        force_screen = true,
        instance    = {"dev", "ops"},         -- Accept the following instances. This takes precedence over 'class'
        class       = { --Accept the following classes, refuse everything else (because of "exclusive=true")
            "xterm" ,"urxvtc", "urxvt" , "aterm","URxvt","XTerm","konsole","terminator","gnome-terminal"
        },
        gap_single_client  = true,
    gap                = 5,
    } ,
    {
        name = " Fs",
        init        = true,
        exclusive   = true,
        screen      = {findScreen('eDP1') or 1,findScreen('DP1') or 1},
        layout      = awful.layout.suit.tile,
        --exec_once   = {"pcmanfm"}, --When the tag is accessed for the first time, execute this command
        class  = {
            "Thunar", "Konqueror", "Dolphin", "ark", "Nautilus","emelfm", "pcmanfm", "Pcmanfm", "spacefm"

        }
    },
    {
        name = " ⌥ Dev",
        init        = true,
        exclusive   = true,
        screen      = {findScreen('DP1') or 1,findScreen('eDP1') or 1},
        force_screen = true,
        layout      = awful.layout.suit.max                          ,
        class ={ 
            "Kate", "KDevelop", "Codeblocks", "Code::Blocks" , "DDD", "kate4", "subl3"
        }
    } ,
    {
        name        = " 🌐 www",
        init        = true,
        screen      = findScreen('DP1') or 1,
        --screen      = screen['DP1'] or screen['eDP1'],
      --icon        = "~net.png",                 -- Use this icon for the tag (uncomment with a real path)
        layout      = awful.layout.suit.max,      -- Use the max layout
        class = {
            "Opera"         , "Firefox"        , "Rekonq"    , "Dillo"        , "Arora",
            "Chromium"      , "nightly"        , "minefield",  "google-chrome", "Google-chrome"  }
    } ,
    {
        name = "Files",
        init        = true,
        exclusive   = true,
        screen      = 1,
        --screen      = screen['DP1'] or screen['eDP1'],
     --   exec_once   = {"dolphin"}, --When the tag is accessed for the first time, execute this command
        class  = {
            "Thunar", "Konqueror", "Dolphin", "ark", "Nautilus","emelfm"
        }
    } ,
    
    {
        name        = "Doc",
        init        = false, -- This tag wont be created at startup, but will be when one of the
                             -- client in the "class" section will start. It will be created on
                             -- the client startup screen
        --screen      = screen['DP1'] or screen['eDP1'],
        layout      = awful.layout.suit.max,
        class       = {
            "Assistant"     , "Okular"         , "Evince"    , "EPDFviewer"   , "xpdf",
            "Xpdf"          ,                                        }
    } ,
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
--[[tyrannical.properties.intrusive = {
    "ksnapshot"     , "pinentry"       , "gtksu"     , "kcalc"        , "xcalc"               ,
    "feh"           , "Gradient editor", "About KDE" , "Paste Special", "Background color"    ,
    "kcolorchooser" , "plasmoidviewer" , "Xephyr"    , "kruler"       , "plasmaengineexplorer",
}]]--

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
    "MPlayer"      , "pinentry"        , "ksnapshot"  , "pinentry"     , "gtksu"          ,
    "xine"         , "feh"             , "kmix"       , "kcalc"        , "xcalc"          ,
    "yakuake"      , "Select Color$"   , "kruler"     , "kcolorchooser", "Paste Special"  ,
    "New Form"     , "Insert Picture"  , "kcharselect", "mythfrontend" , "plasmoidviewer" 
}

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {
    "Xephyr"       , "ksnapshot"       , "kruler"
}

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.centered = {
    "kcalc"
}

tyrannical.settings.block_children_focus_stealing = true --Block popups ()
tyrannical.settings.group_children = true --Force popups/dialogs to have the same tags as the parent clien
