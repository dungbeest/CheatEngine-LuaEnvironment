---@meta _



---Inherits from Object (GenericHotkey->Object)
---@class GenericHotkey: Object
---@field DelayBetweenActivate integer # Interval in milliseconds that determines the minimum time between hotkey activations. If 0, the global delay is used
---@field onHotkey function # The function to call when the hotkey is pressed
local GenericHotkey = {}

---@return VirtualKeyCodes ...
function GenericHotkey.getKeys() end

---@param ... VirtualKeyCodes
function GenericHotkey.setKeys(...) end

---@param onHotkey function
function GenericHotkey.setOnHotkey(onHotkey) end

---@return function
function GenericHotkey.getOnHotkey() end



---The memory record hotkey class is mainly readonly with the exception of the event properties to be used to automatically create trainers.
---
---Use the generic hotkey class if you wish to create your own hotkeys.
---
---Inherits from Object (MemoryRecordHotkey->Object)
---@class MemoryRecordHotkey: Object
---@field Owner MemoryRecord # The memoryrecord this hotkey belongs to (ReadOnly)
---@field Keys VirtualKeyCode[] # Table containing the keys(combination) for this hotkey
---@field action MemoryRecordHotkeyAction # The action that should happen when this hotkey triggers
---@field value string # Value used depending on what kind of hotkey is used
---@field ID integer # Unique id of this hotkey (ReadOnly)
---@field Description string # The description of this hotkey  
---@field HotkeyString string # The hotkey formatted as a string (ReadOnly)
---@field ActivateSound string # Tablefile name of a WAV file inside the table which will get played on activate events
---@field DeactivateSound string # Tablefile name of a .WAV file inside the table which will get played on deactivate events
local MemoryRecordHotkey = {}


---Function to be called when a hotkey has been pressed and the action has been performed
---@param sender any
function MemoryRecordHotkey.OnHotkey(sender) end

---Executes the hotkey as if it got triggered by the keyboard
function MemoryRecordHotkey.doHotkey() end

---@enum HotkeyHandlerStates
CE_defines.hotkey_handler_states = {
  htsActive     = 0,
  htsMemrecOnly = 1,
  htsNoMemrec   = 2,
  htsDisabled   = 3,
}

---@alias HotkeyHandlerState integer
---| 0 # **htsActive** -> Active
---| 1 # **htsMemrecOnly** -> Memory records only
---| 2 # **htsNoMemrec** -> Everything except memory records
---| 3 # **htsDisabled** -> Disabled

---@alias HotkeyHandlerStateString string
---| '"htsActive"' # Active
---| '"htsMemrecOnly"' # Memory records only
---| '"htsNoMemrec"' # Everything except memory records
---| '"htsDisabled"' # Disabled


---Inherits from Thread (HotkeyHandlerThread->Thread)
---@class HotkeyHandlerThread: Thread
---@field state HotkeyHandlerState #


---An initialized GenericHotkey class object. 
---
---Maximum of 5 keys.
---@param onHotkey function #
---@param ... VirtualKeyCode #
---@return GenericHotkey #
function createHotkey(onHotkey, ...) return {} end


---An initialized GenericHotkey class object. 
---
---Maximum of 5 keys.
---@param onHotkey function #
---@param keys VirtualKeyCode[] #
---@return GenericHotkey #
function createHotkey(onHotkey, keys) return {} end


---@return HotkeyHandlerThread # The hotkey handler thread used internally by CE
function getHotkeyHandlerThread() return {} end
