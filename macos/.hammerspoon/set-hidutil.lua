-- Calls `hidutil` on wake to swap § and `

MATCHING = '{"VendorID": 1452, "ProductID": 630}'
SET = '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":30064771172,"HIDKeyboardModifierMappingDst":30064771125},{"HIDKeyboardModifierMappingSrc":30064771125,"HIDKeyboardModifierMappingDst":30064771172}]}'

function setHidutil ()
  hs.execute("hidutil property --matching '" .. MATCHING .. "' --set '" .. SET .. "'")
end


watcher = hs.caffeinate.watcher.new(function(event)
  if (event == hs.caffeinate.watcher.systemDidWake)
  then
    setHidutil()
  end
end)

watcher:start()
