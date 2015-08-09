
local beautiful    = require("beautiful")
local wibox        = require("wibox")
local naughty      = require("naughty")
local helpers       = require("lain/helpers")



local awesome_tag_stats_dir = "/home/gargantua/.config/awesome/tag_stats/"


local setmetatable = setmetatable

-- File system disk space usage
-- lain.widgets.tt
local tt = {}
local my_info = {}

local notification  = nil
tt_notification_preset = { fg = beautiful.fg_normal }

function tt:hide()
    if notification ~= nil then
        naughty.destroy(notification)
        notification = nil
    end
end

function tt:show(t_out)
    tt:hide()

    notification = naughty.notify({
        preset = tt_notification_preset,
        text = my_info.ws,
        timeout = t_out,
    })
end

local function worker(args)
    local args      = args or {}
    local timeout   = args.timeout or 100
    local partition = args.partition or "/"
    local settings  = args.settings or function() end

    tt.widget = wibox.widget.textbox('')

    helpers.set_map(partition, false)

    function update()
        local d = string.gsub(os.date("%x"), "/", "-") 
        local path = awesome_tag_stats_dir .. "days/" .. d
        local f = io.open(path, "w+")

        if f then
            t = io.read("*all")
            my_info.ws = t
            f:close()
        end

        widget = tt.widget
          
    end

    tt.widget:connect_signal('mouse::enter', function () tt:show(0) end)
    tt.widget:connect_signal('mouse::leave', function () tt:hide() end)

    helpers.newtimer(partition, timeout, update)

    return setmetatable(tt, { __index = tt.widget })
end

return setmetatable(tt, { __call = function(_, ...) return worker(...) end })
