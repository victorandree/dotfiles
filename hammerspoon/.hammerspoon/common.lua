-- Create "init.lua" in Hammerspoon and include this file to get started
-- I.e. `require "common"`

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "R", function()
  hs.reload()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  insert(string.lower(hs.host.uuid()))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "I", function()
  insert(string.sub(string.lower(hs.host.uuid()), 0, 8))
end)

function insert (x)
  local pasteboardContents = hs.pasteboard.getContents()
  hs.pasteboard.setContents(x)
  hs.eventtap.keyStroke({"cmd"}, "v")
  hs.pasteboard.setContents(pasteboardContents)
end
