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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  insert(os.date("!%Y-%m-%dT%H:%M:%S.000Z"))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "I", function()
  insert("ecac5c9e-153c-4887-af27-0db914198ec1")
end)

function insert (x)
  local pasteboardContents = hs.pasteboard.getContents()
  hs.pasteboard.setContents(x)
  hs.eventtap.keyStroke({"cmd"}, "v")
  hs.pasteboard.setContents(pasteboardContents)
end

function lockApVolume (volume)
  -- redirect stderr to stdout so we can catch what went wrong
  command = string.format("diskutil ap lock %s 2>&1", volume)
  output, status = hs.execute(command)

  if (status) then
    hs.alert.show(string.format("Locked %s", volume))
  else
    hs.alert.show(trim(output))
  end
end

