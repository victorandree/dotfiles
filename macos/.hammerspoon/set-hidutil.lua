-- Swaps § and ` keys for ISO keyboards
-- Reference codes: https://developer.apple.com/library/archive/technotes/tn2450/_index.html
ACCENT_TO_NON_US = {
  HIDKeyboardModifierMappingSrc=0x700000035,
  HIDKeyboardModifierMappingDst=0x700000064
}

NON_US_TO_ACCENT = {
  HIDKeyboardModifierMappingSrc=0x700000064,
  HIDKeyboardModifierMappingDst=0x700000035
}

LEFT_ALT_TO_LEFT_GUI = {
  HIDKeyboardModifierMappingSrc=0x7000000E2,
  HIDKeyboardModifierMappingDst=0x7000000E3,
}

LEFT_GUI_TO_LEFT_ALT = {
  HIDKeyboardModifierMappingSrc=0x7000000E3,
  HIDKeyboardModifierMappingDst=0x7000000E2,
}

RIGHT_ALT_TO_LEFT_GUI = {
  HIDKeyboardModifierMappingSrc=0x7000000E6,
  HIDKeyboardModifierMappingDst=0x7000000E7,
}

RIGHT_GUI_TO_LEFT_ALT = {
  HIDKeyboardModifierMappingSrc=0x7000000E7,
  HIDKeyboardModifierMappingDst=0x7000000E6,
}

-- Figure these out by running `hidutil list` and looking under `Devices`
INTERNAL_KEYBOARD = {VendorID=0x5ac, ProductID=0x276}
INTERNAL_KEYBOARD_M1 = {VendorID=0x5ac, ProductID=0x341}
FUNC_KEYBOARD = {VendorID=0x195d, ProductID=0x2030}
FILCO_KEYBOARD = {VendorID=0x4d9, ProductID=0x4545}
RAZER_KEYBOARD = {VendorID=0x1532, ProductID=0x248}
RAZER_KEYBOARD_USB = {VendorID=0x1532, ProductID=0x249}

-- Each entry describes a HID property to set for a matching device
PROPERTIES = {
  [INTERNAL_KEYBOARD]={
    ACCENT_TO_NON_US,
    NON_US_TO_ACCENT
  },
  [INTERNAL_KEYBOARD_M1]={
    ACCENT_TO_NON_US,
    NON_US_TO_ACCENT
  },
  [FUNC_KEYBOARD]={
    ACCENT_TO_NON_US,
    NON_US_TO_ACCENT,
    LEFT_ALT_TO_LEFT_GUI,
    LEFT_GUI_TO_LEFT_ALT
  },
  [FILCO_KEYBOARD]={
    LEFT_ALT_TO_LEFT_GUI,
    LEFT_GUI_TO_LEFT_ALT,
    RIGHT_ALT_TO_LEFT_GUI,
    RIGHT_GUI_TO_LEFT_ALT
  },
  [RAZER_KEYBOARD]={
    LEFT_ALT_TO_LEFT_GUI,
    LEFT_GUI_TO_LEFT_ALT,
    RIGHT_ALT_TO_LEFT_GUI,
    RIGHT_GUI_TO_LEFT_ALT
  },
  [RAZER_KEYBOARD_USB]={
    LEFT_ALT_TO_LEFT_GUI,
    LEFT_GUI_TO_LEFT_ALT,
    RIGHT_ALT_TO_LEFT_GUI,
    RIGHT_GUI_TO_LEFT_ALT
  }
}

function encodeSetHidutil (matching, set)
  return (
    "hidutil property " ..
    "--matching '" .. hs.json.encode(matching) .. "' " ..
    "--set '" .. hs.json.encode({UserKeyMapping=set}) .. "'"
  )
end

function setHidutil ()
  for matching, set in pairs(PROPERTIES) do
    hs.execute(encodeSetHidutil(matching, set))
  end
end


watcher = hs.caffeinate.watcher.new(function(event)
  if (event == hs.caffeinate.watcher.systemDidWake)
  then
    setHidutil()
  end
end)

watcher:start()

usb_watcher = hs.usb.watcher.new(function(event)
  if event["eventType"] ~= "added" then
    return
  end

  for matching, set in pairs(PROPERTIES) do
    if (
      matching["VendorID"] ~= event["vendorID"] or
      matching["ProductID"] ~= event["productID"]
    )
    then
      goto next
    end

    -- Add a small delay to let the device get setup
    hs.timer.doAfter(1, function ()
      hs.execute(encodeSetHidutil(matching, set))
    end)

    ::next::
  end
end)

usb_watcher:start()
