hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "R", function()
  hs.reload()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  insert(string.lower(hs.host.uuid()))
end)

function insert (x)
  local pasteboardContents = hs.pasteboard.getContents()
  hs.pasteboard.setContents(x)
  hs.eventtap.keyStroke({"cmd"}, "v")
  hs.pasteboard.setContents(pasteboardContents)
end
