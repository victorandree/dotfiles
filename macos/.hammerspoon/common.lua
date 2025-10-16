-- Create "init.lua" in Hammerspoon and include this file to get started
-- I.e. `require "common"`

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "R", function()
  hs.reload()
end)

-- Inserts a random number 1 through 9
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  r = string.lower(hs.math.randomFromRange(1, 9))
  insert(r)
end)

-- Cmd+Alt+Ctrl+U: Generate a random UUIDv4
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  recentuuid = string.lower(hs.host.uuid())
  insert(recentuuid)
end)

-- Cmd+Alt+Ctrl+I: Reuse the most recently generated UUID
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "I", function()
  insert(recentuuid)
end)

-- Cmd+Alt+Ctrl+T: Insert current UTC time
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  insert(os.date("!%Y-%m-%dT%H:%M:%S.000Z"))
end)

-- Cmd+Alt+Ctrl+J: Escape a string for JSON
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  local pasteboardContents = hs.pasteboard.getContents()
  pasteboardContents = string.gsub(pasteboardContents, '\n', '\\n')
  pasteboardContents = string.gsub(pasteboardContents, '"', '\\"')
  insert(pasteboardContents)
end)

-- Cmd+Alt+Shift+J: Unescape a JSON string
hs.hotkey.bind({"cmd","alt","shift"}, "J", function()
  local pasteboardContents = hs.pasteboard.getContents()
  pasteboardContents = string.gsub(pasteboardContents, '\\n', '\n')
  pasteboardContents = string.gsub(pasteboardContents, '\\"', '"')
  insert(pasteboardContents)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", function()
  setHidutil()
end)

-- Cmd+Alt+Shift+V: Normalize newlines. Really should normalize all whitespace.
hs.hotkey.bind({"cmd", "alt", "shift"}, "V", function()
  local text = hs.pasteboard.getContents()

  if not text then return end

  -- Replace single newlines that have text before and after
  -- with spaces, but preserve paragraph breaks (double newlines)
  local unwrapped = text:gsub("(%S)\n(%S)", "%1 %2")

  insert(unwrapped)
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
