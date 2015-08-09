--[[
                                             
     Powerarrow Darker Awesome WM config 2.0 
     github.com/copycat-killer               
                                             
--]]

theme                               = {}

themes_dir                          = os.getenv("HOME") .. "/.config/awesome/themes/arrow"

theme.wallpaper                     = os.getenv("HOME") .. "./config/global_wallpaper_symlink"

theme.font                          = "neep 7"

theme.fg_normal                     = "#999999"
theme.fg_focus                      = "#bcbcff"
theme.fg_urgent                     = "#CC9393"
theme.bg_normal                     = "#151515"
theme.bg_focus                      = "#151515"
theme.arrows 						= '#25252599'
theme.bg_urgent                     = "#1A1A1A"

theme.useless_gap_width = 8

theme.border_width                  = "0"
theme.border_focus                  = "#505050"
theme.border_normal                 = "#404040"
theme.border_marked                 = "#CC9393"

theme.taglist_fg_focus = "#bbbbbb99"
theme.taglist_bg_focus = "#11111199"
theme.taglist_fg_empty = "#888888"
theme.taglist_fg_occupied = "#555555"
theme.taglist_bg_occupied = "#11111199"


theme.textbox_widget_margin_top     = 1
theme.notify_fg                     = theme.fg_normal
theme.notify_bg                     = theme.bg_normal
theme.notify_border                 = theme.border_focus
theme.awful_widget_height           = 14
theme.awful_widget_margin_top       = 2
theme.mouse_finder_color            = "#CC9393"
theme.menu_height                   = "14"
theme.menu_width                    = "140"

theme.submenu_icon                  = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/icons/square_unsel.png"

theme.layout_tile                   = themes_dir .. "/icons/tile.png"
theme.layout_tilegaps               = themes_dir .. "/icons/tilegaps.png"
theme.layout_tileleft               = themes_dir .. "/icons/tileleft.png"
theme.layout_tilebottom             = themes_dir .. "/icons/tilebottom.png"
theme.layout_tiletop                = themes_dir .. "/icons/tiletop.png"
theme.layout_fairv                  = themes_dir .. "/icons/fairv.png"
theme.layout_fairh                  = themes_dir .. "/icons/fairh.png"
theme.layout_spiral                 = themes_dir .. "/icons/spiral.png"
theme.layout_dwindle                = themes_dir .. "/icons/dwindle.png"
theme.layout_max                    = themes_dir .. "/icons/max.png"
theme.layout_fullscreen             = themes_dir .. "/icons/fullscreen.png"
theme.layout_magnifier              = themes_dir .. "/icons/magnifier.png"
theme.layout_floating               = themes_dir .. "/icons/floating.png"

theme.arrl                          = themes_dir .. "/icons/arrl.png"
theme.arrl_dl                       = themes_dir .. "/icons/arrl_dl.png"
theme.arrl_ld                       = themes_dir .. "/icons/arrl_ld.png"

theme.widget_ac                     = themes_dir .. "/icons/ac.png"
theme.widget_battery                = themes_dir .. "/icons/battery.png"
theme.widget_battery_low            = themes_dir .. "/icons/battery_low.png"
theme.widget_battery_empty          = themes_dir .. "/icons/battery_empty.png"
theme.widget_mem                    = themes_dir .. "/icons/mem.png"
theme.widget_cpu                    = themes_dir .. "/icons/cpu.png"
theme.widget_temp                   = themes_dir .. "/icons/temp.png"
theme.widget_net                    = themes_dir .. "/icons/net.png"
theme.widget_hdd                    = themes_dir .. "/icons/hdd.png"
theme.widget_music                  = themes_dir .. "/icons/note.png"
theme.widget_music_on               = themes_dir .. "/icons/note_on.png"
theme.widget_vol                    = themes_dir .. "/icons/vol.png"
theme.widget_vol_low                = themes_dir .. "/icons/vol_low.png"
theme.widget_vol_no                 = themes_dir .. "/icons/vol_no.png"
theme.widget_vol_mute               = themes_dir .. "/icons/vol_mute.png"
theme.widget_mail                   = themes_dir .. "/icons/mail.png"
theme.widget_mail_on                = themes_dir .. "/icons/mail_on.png"


theme.titlebar_close_button_focus               = themes_dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = themes_dir .. "/icons/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active        = themes_dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = themes_dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = themes_dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = themes_dir .. "/icons/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active       = themes_dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = themes_dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = themes_dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = themes_dir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active     = themes_dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = themes_dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = themes_dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = themes_dir .. "/icons/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active    = themes_dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = themes_dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.layout_txt_tile               = "[tile]"
theme.layout_txt_tileleft           = "[tileleft]"
theme.layout_txt_tilebottom         = "[tilebottom]"
theme.layout_txt_tiletop            = "[tiletop]"
theme.layout_txt_fairv              = "[fairv]"
theme.layout_txt_fairh              = "[fairh]"
theme.layout_txt_spiral             = "[dwindle]"
theme.layout_txt_dwindle            = "[max]"
theme.layout_txt_max                = "[fullscreen]"
theme.layout_txt_fullscreen         = "[fullscreen]"
theme.layout_txt_magnifier          = "[magnifier]"
theme.layout_txt_floating           = "[float]"

-- lain related
theme.useless_gap_width             = 10
theme.layout_txt_cascade            = "[cascade]"
theme.layout_txt_cascadetile        = "[cascadetile]"
theme.layout_txt_centerwork         = "[centerwork]"
theme.layout_txt_termfair           = "[termfair]"
theme.layout_txt_centerfair         = "[centerfair]"
theme.layout_txt_uselessfair        = "[uselessfair]"
theme.layout_txt_uselessfairh       = "[uselessfair_h]"
theme.layout_txt_uselesspiral       = "[uselesspiral]"
theme.layout_txt_uselessdwindle     = "[uselessdwindle]"
theme.layout_txt_uselesstile        = "[uselesstile]"
theme.layout_txt_uselesstileleft    = "[uselesstileleft]"
theme.layout_txt_uselesstiletop     = "[uselesstiletop]"
theme.layout_txt_uselesstilebottom  = "[uselesstilebottom]"

theme.tasklist_sticky               = "[S]"
theme.tasklist_ontop                = "[T]"
theme.tasklist_floating             = "[F]"
theme.tasklist_maximized_horizontal = "[M]"
theme.tasklist_maximized_vertical   = "[V]"
theme.tasklist_disable_icon         = false


return theme
