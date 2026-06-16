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
INTERNAL_KEYBOARD_MBP_2021 = {VendorID=0x5ac, ProductID=0x342}
MAGIC_KEYBOARD_BT = {VendorID=0x4c, ProductID=0x29a}
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
  [INTERNAL_KEYBOARD_MBP_2021]={
    ACCENT_TO_NON_US,
    NON_US_TO_ACCENT
  },
  [MAGIC_KEYBOARD_BT]={
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

-- Returns the raw `hidutil --get UserKeyMapping` output for a device.
-- Empty/no "UserKeyMapping" rows means the device isn't currently connected
-- (hidutil sees devices on any transport: SPI, USB and Bluetooth).
function getHidutilMapping (matching)
  local output = hs.execute(
    "hidutil property " ..
    "--matching '" .. hs.json.encode(matching) .. "' " ..
    "--get UserKeyMapping"
  )
  return output or ""
end

-- `hidutil --get` reports the key codes in decimal, so a mapping like
-- {Src=0x700000035, Dst=0x700000064} shows up as a block of the form:
--     HIDKeyboardModifierMappingDst = 30064771172;
--     HIDKeyboardModifierMappingSrc = 30064771125;
-- Returns true if `output` contains a block matching the expected pair.
function mappingPresent (output, mapping)
  local wantDst = string.format("%d", mapping.HIDKeyboardModifierMappingDst)
  local wantSrc = string.format("%d", mapping.HIDKeyboardModifierMappingSrc)
  for dst, src in output:gmatch(
    "HIDKeyboardModifierMappingDst%s*=%s*(%d+);%s*" ..
    "HIDKeyboardModifierMappingSrc%s*=%s*(%d+)"
  ) do
    if dst == wantDst and src == wantSrc then
      return true
    end
  end
  return false
end

-- True if a device is connected but missing one or more of its expected
-- mappings (e.g. a Bluetooth keyboard that just reconnected and lost them).
function deviceNeedsUpdate (matching, set)
  local output = getHidutilMapping(matching)

  -- Not connected right now; nothing to do.
  if not output:find("UserKeyMapping") then
    return false
  end

  for _, mapping in ipairs(set) do
    if not mappingPresent(output, mapping) then
      return true
    end
  end
  return false
end

-- Re-apply mappings only for connected devices that have drifted from what we
-- expect. The full sweep is cheap (~a handful of `hidutil` calls) and
-- idempotent, so it's safe to trigger from several event sources.
function reconcileHidutil ()
  for matching, set in pairs(PROPERTIES) do
    if deviceNeedsUpdate(matching, set) then
      hs.execute(encodeSetHidutil(matching, set))
    end
  end
end

-- One reconcile now plus a few delayed retries. Devices -- especially
-- Bluetooth keyboards -- reconnect lazily after a wake/unlock, so a single
-- immediate pass tends to race the reconnect and lose; the retries close that
-- window without us having to guess exactly when the device is ready.
RECONCILE_RETRY_DELAYS = {0, 1, 3, 6} -- seconds

function reconcileBurst ()
  for _, delay in ipairs(RECONCILE_RETRY_DELAYS) do
    if delay == 0 then
      reconcileHidutil()
    else
      hs.timer.doAfter(delay, reconcileHidutil)
    end
  end
end

-- (1) USB keyboard plugged in. reconcile checks every device, so we don't
-- bother filtering on which device the event was for.
usb_watcher = hs.usb.watcher.new(function(event)
  if event.eventType == "added" then
    reconcileBurst()
  end
end)
usb_watcher:start()

-- (2) Wake / screen unlock. Bluetooth keyboards reconnect a moment later, which
-- the retry burst catches.
caffeinate_watcher = hs.caffeinate.watcher.new(function(event)
  if (event == hs.caffeinate.watcher.systemDidWake or
      event == hs.caffeinate.watcher.screensDidUnlock) then
    reconcileBurst()
  end
end)
caffeinate_watcher:start()

-- (3) Safety net. A Bluetooth keyboard that reconnects with no observable event
-- -- e.g. it sleeps after inactivity and wakes when you start typing -- emits
-- nothing Hammerspoon (or macOS, with device identity redacted as <private> in
-- the unified log) can watch. The events above handle wake/unlock/USB, so this
-- poll only has to cover that one case. The sweep is cheap (~88ms of hidutil
-- calls), so a short interval is fine; it bounds the wrong-key window.
SAFETY_POLL_INTERVAL = 30 -- seconds

reconcileHidutil()
safety_timer = hs.timer.doEvery(SAFETY_POLL_INTERVAL, reconcileHidutil)
safety_timer:start()
