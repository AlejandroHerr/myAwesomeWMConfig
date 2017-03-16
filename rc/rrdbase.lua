
--[[
                                                  
     Licensed under GNU General Public License v2 
      * (c) 2014, Luke Bonham                     
                                                  
--]]

local newtimer     = require("vendor.lain.helpers").newtimer
local async        = require("vendor.lain.asyncshell")
local wibox        = require("wibox")

local setmetatable = setmetatable

-- Basic template for custom widgets (asynchronous version)
-- lain.widgets.abase

local function worker(args)
    local abase    = {}
    local args     = args or {}
    local timeout  = args.timeout or 1
    local rrd      = args.rrd or ""
    local settings = args.settings or function() end
    local cmd = "rrdtool lastupdate " .. rrd .. ".rrd | tail -1 | sed 's/^.*: //'"
    abase.widget = wibox.widget.textbox('')

    function abase.update()
        async.request(cmd, function(f)
            output = f
            if output ~= abase.prev then
                widget = abase.widget
                settings()
                abase.prev = output
            end
        end)
    end

    newtimer(cmd, timeout, abase.update)

    return setmetatable(abase, { __index = abase.widget })
end

return setmetatable({}, { __call = function(_, ...) return worker(...) end })
