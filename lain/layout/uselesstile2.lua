--[[

     Licensed under GNU General Public License v2
      * (c) 2014       projektile, worron
      * (c) 2013       Luke Bonham
      * (c) 2009       Donald Ephraim Curtis
      * (c) 2008       Julien Danjolu

     With gaps between windows two times wider
     (like xmonad)

--]]

local tag       = require("awful.tag")
local beautiful = require("beautiful")
local ipairs    = ipairs
local math      = { floor = math.floor,
                    ceil  = math.ceil,
                    max   = math.max,
                    min   = math.min }
local tonumber  = tonumber

local uselesstile = {}

-- Transformation functions
local function flip(canvas, geometry)
    return {
        -- vertical only
        x = 2 * canvas.x + canvas.width - geometry.x - geometry.width,
        y = geometry.y,
        width = geometry.width,
        height = geometry.height
    }
end

local function swap(geometry)
    return { x = geometry.y, y = geometry.x, width = geometry.height, height = geometry.width }
end

-- Find geometry for column/row tiling
local function cut_area(wa, total, index, is_horizontal)
    local wa = is_horizontal and swap(wa) or wa
    local height = wa.height / total

    local area = {
        x = wa.x,
        y = wa.y + (index - 1) * height,
        width = wa.width,
        height = height
    }

    if is_horizontal then area = swap(area) end

    return area
end

-- Client geometry correction depending on useless gap and window border
local function size_correction(c, geometry, useless_gap, swap)
    if swap then
        geometry.width  = math.max(geometry.width  - 2 * c.border_width - 3*useless_gap, 1)
    else
        geometry.width  = math.max(geometry.width  - 2 * c.border_width - 2*useless_gap, 1)
    end

    geometry.height = math.max(geometry.height - 2 * c.border_width - 2*useless_gap, 1)
    geometry.x = geometry.x + useless_gap / 2
    geometry.y = geometry.y + useless_gap / 2
end

-- Tile group of clients in given area
-- @canvas need for proper transformation only
local function tile_column(canvas, area, list, useless_gap, transformation)
    for i, c in ipairs(list) do
        local g = cut_area(area, #list, i)

        -- swap workarea dimensions
        if transformation.flip then g = flip(canvas, g) end
        if transformation.swap then g = swap(g) end

        -- useless gap and border correction
        size_correction(c, g, useless_gap, transformation.swap)

        if not transformation.swap then
            g.width = g.width + useless_gap
        else
            g.width = g.width + useless_gap
        end

        c:geometry(g)
    end
end

--Main tile function
local function tile(p, orientation)

    -- Theme vars
    local useless_gap = beautiful.useless_gap_width or 0
    local global_border = beautiful.global_border_width or 0

    -- Aliases
    local wa = p.workarea
    local cls = p.clients
    local t = tag.selected(p.screen)

    -- Nothing to tile here
    if #cls == 0 then return end

    -- Get tag prop
    local nmaster = math.min(tag.getnmaster(t), #cls)
    local mwfact = tag.getmwfact(t)

    if nmaster == 0 then
        mwfact = 0
    elseif nmaster == #cls then
        mwfact = 1
    end

    -- Workarea size correction depending on useless gap and global border
    wa.height = wa.height - 2 * global_border - useless_gap
    wa.width  = wa.width -  2 * global_border - useless_gap
    wa.x = wa.x + useless_gap / 2 + global_border
    wa.y = wa.y + useless_gap / 2 + global_border

    -- adjustments for bottom/top
    if orientation == 'bottom' or orientation == 'top' then
        wa.width = wa.width - useless_gap
        wa.height = wa.height + useless_gap
    end

    -- Find which transformation we need for given orientation
    local transformation = {
        swap = orientation == 'top' or orientation == 'bottom',
        flip = orientation == 'left' or orientation == 'top'
    }

    -- Swap workarea dimensions if orientation vertical
    if transformation.swap then wa = swap(wa) end

    -- Split master and other windows
    local cls_master, cls_other = {}, {}

    for i, c in ipairs(cls) do
        if i <= nmaster then
            table.insert(cls_master, c)
        else
            table.insert(cls_other, c)
        end
    end

    -- Tile master windows
    local master_area = {
        x = wa.x,
        y = wa.y,
        width  = nmaster > 0 and wa.width * mwfact or 0,
        height = wa.height + useless_gap
    }

    -- Tile other windows
    local other_area = {
        x = wa.x + master_area.width + useless_gap,
        y = wa.y,
        width  = wa.width - master_area.width - useless_gap,
        height = wa.height + useless_gap
    }

    -- adjustments for bottom/top
    if orientation == 'bottom' or orientation == 'top' then
        master_area.height = master_area.height + useless_gap

        other_area.x = other_area.x - useless_gap
        other_area.width = other_area.width + useless_gap
        other_area.height = other_area.height + useless_gap
    end

    tile_column(wa, master_area, cls_master, useless_gap, transformation)

    -- get column number for other windows
    local ncol = math.min(tag.getncol(t), #cls_other)

    -- split other windows to column groups
    local last_small_column = ncol - #cls_other % ncol
    local rows_min = math.floor(#cls_other / ncol)

    local client_index = 1
    for i = 1, ncol do
        local position = transformation.flip and ncol - i + 1 or i
        local rows = i <= last_small_column and rows_min or rows_min + 1
        local column = {}

        for j = 1, rows do
            table.insert(column, cls_other[client_index])
            client_index = client_index + 1
        end

		-- and tile
		local column_area = cut_area(other_area, ncol, position, true)
        tile_column(wa, column_area, column, useless_gap, transformation)
    end
end

-- Layout constructor
local function construct_layout(name, orientation)
    return {
        name = name,
        -- @p screen number to tile
        arrange = function(p) return tile(p, orientation) end
    }
end

-- Build layouts with different tile direction
uselesstile.right  = construct_layout("uselesstile", "right")
uselesstile.left   = construct_layout("uselesstileleft", "left")
uselesstile.bottom = construct_layout("uselesstilebottom", "bottom")
uselesstile.top    = construct_layout("uselesstiletop", "top")

-- Module aliase
uselesstile.arrange = uselesstile.right.arrange
uselesstile.name = uselesstile.right.name

return uselesstile