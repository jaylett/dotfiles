logger = hs.logger.new("conf", 'info')

--[[
Set width as proportion of screen width.

Ctrl-cmd-alt+ number keys 1-5.
]]

function size_to_column_width(win, columns)
      local f = win:frame()
      local d = hs.window.desktop()
      local df = d:frame()
      local col_width = df.w / columns
      f.w = col_width
      win:setFrame(f)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad1", function()
      local win = hs.window.focusedWindow()
      size_to_column_width(win, 1)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad2", function()
      local win = hs.window.focusedWindow()
      size_to_column_width(win, 2)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad3", function()
      local win = hs.window.focusedWindow()
      size_to_column_width(win, 3)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad4", function()
      local win = hs.window.focusedWindow()
      size_to_column_width(win, 4)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad5", function()
      local win = hs.window.focusedWindow()
      size_to_column_width(win, 5)
end)
--[[
Set height as proportion of screen height.

Ctrl-cmd-alt+ number keys 7-9.
]]

function size_to_row_height(win, columns)
      local f = win:frame()
      local d = hs.window.desktop()
      local df = d:frame()
      local col_height = df.h / columns
      f.h = col_height
      win:setFrame(f)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad7", function()
      local win = hs.window.focusedWindow()
      size_to_row_height(win, 1)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad8", function()
      local win = hs.window.focusedWindow()
      size_to_row_height(win, 2)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad9", function()
      local win = hs.window.focusedWindow()
      size_to_row_height(win, 3)
end)

--[[
Set x position to closest column boundary.

Ctrl-cmd-alt+ pad enter
]]

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "padenter", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      --logger.i(string.format("current (x, w) = (%i, %i)", f.x, f.w))
      f.x = math.floor(f.x / f.w + 0.5) * f.w
      --logger.i(string.format("setting x to %i", f.x))
      win:setFrame(f)
end)

--[[
Move window by its width (alt-ctrl + left/right).
]]

hs.hotkey.bind({"alt", "ctrl"}, "left", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.x = f.x - f.w
      win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "right", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.x = f.x + f.w
      win:setFrame(f)
end)

--[[
Move window by its height (alt-ctrl + up/down).
]]

hs.hotkey.bind({"alt", "ctrl"}, "up", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.y = f.y - f.h
      win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "down", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.y = f.y + f.h
      win:setFrame(f)
end)

--[[
Slam the window around: ctrl-cmd-alt+ arrow keys will slam to the
screen boundary.
]]

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.x = 0
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.y = 0
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local d = hs.window.desktop()
      local df = d:frame()
      f.x = df.x2 - f.w
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "down", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      local d = hs.window.desktop()
      local df = d:frame()
      f.y = df.y2 - f.h
      win:setFrame(f)
end)

--[[
Shrink/expand the window width: cmd-alt-ctrl+number pad +-
]]

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad-", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.w = f.w - 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad+", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.w = f.w + 10
      win:setFrame(f)
end)

--[[
Shrink/expand the window height: cmd-alt-ctrl+number pad /*
]]

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad/", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.h = f.h - 10
      win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "pad*", function()
      local win = hs.window.focusedWindow()
      local f = win:frame()
      f.h = f.h + 10
      win:setFrame(f)
end)

--[[
Interpolate

Find the next window in the direction of the arrow key, and
move this window to the other side of it.
]]
