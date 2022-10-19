---@meta

---Gets the mouse position (x, y coordinates).
---@return integer # The x (width) coordinates of the mouse along the screen
---@return integer # The y (height) coordinates of the mouse along the screen
function getMousePos() return 0, 0 end

---Sets the mouse position (x, y coordinates).
---@param x integer # The x (width) coordinates of the mouse along the screen
---@param y integer # The y (height) coordinates of the mouse along the screen
function setMousePos(x,y) end



---Checks if key is pressed.
---@param key VirtualKeyCodes # A key code to check
---@return boolean # Whether the specified key is currently pressed
function isKeyPressed(key) return true end

---Causes the supplied key to go into held/down state.
---@param key VirtualKeyCodes # A key code to hold
function keyDown(key) end

---Causes the supplied key to go into released/up state.
---@param key VirtualKeyCodes # A key code to release
function keyUp(key) end

---Simulates a key press of the supplied key.
---@param key VirtualKeyCodes # A key code to press
function doKeyPress(key) end

---The mouse_event windows API.
---
---Check MSDN for information on how to use.
---@source https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-mouse_event
---@param flags MouseEventFlag #
---@param x? dword #
---@param y? dword #
---@param data? dword #
---@param extra? integer #
function mouse_event(flags, x, y, data, extra) end

---Converts a shortcut to its textual representation.
---@param shortCut integer # A shortcut value
---@return string # The textual representation of the given shortut value (integer) (CE version 6.4+)
function shortCutToText(shortCut) return "" end

---Converts a textual representation of shortcut to its integer value.
---@param shortCutString string
---@return integer # A shortcut integer that the given string represents.  (CE version 6.4+)
function textToShortCut(shortCutString) return 0 end

---Converts a key combo to its string representation.
---@param ... VirtualKeyCodes # A variable number of key codes to combine.
---@return string # A string representation of the given keys like the hotkey handler does
---@overload fun(keys: VirtualKeyCodes[]): string # A key table overload
function convertKeyComboToString(...) return "" end

---Writes the given text to the clipboard.
---@param text string # Text to write
function writeToClipboard(text) end

---Reads the text from the clipboard.
---@return string # Text that was read from clipboard
function readFromClipboard() return "" end

---@alias ControllerID byte
---| 0 # First Slot Controller
---| 1 # Second Slot Controller
---| 2 # Third Slot Controller
---| 3 # Fourth Slot Controller

---@class XBoxControllerState
---@field ControllerID ControllerID # The id of the controller (between 0 and 3)
---@field PacketNumber integer # The packet id of the state you see. (use to detect changes)
---@field GAMEPAD_DPAD_UP boolean # D-PAD Up
---@field GAMEPAD_DPAD_DOWN boolean # D-PAD Down
---@field GAMEPAD_DPAD_LEFT boolean # D-PAD Left
---@field GAMEPAD_DPAD_RIGHT boolean # D-PAD Right
---@field GAMEPAD_START boolean # Start button
---@field GAMEPAD_BACK boolean # Back button
---@field GAMEPAD_LEFT_THUMB boolean # Left thumb stick down
---@field GAMEPAD_RIGHT_THUMB boolean # Right thumb stick down
---@field GAMEPAD_LEFT_SHOULDER boolean # Left shoulder button
---@field GAMEPAD_RIGHT_SHOULDER boolean # Right shoulder button
---@field GAMEPAD_A boolean # A button
---@field GAMEPAD_B boolean # B button 
---@field GAMEPAD_X boolean # X button
---@field GAMEPAD_Y boolean # Y button
---@field LeftTrigger byte # Left trigger axis (integer ranging from 0 to 255)
---@field RightTrigger byte # Right trigger axis (integer ranging from 0 to 255)
---@field ThumbLeftX word # Horizontal position of the left thumbstick (-32768 to 32767)
---@field ThumbLeftY word # Vertical position of the left thumbstick (-32768 to 32767)
---@field ThumbRightX word # Horizontal position of the right thumbstick (-32768 to 32767)
---@field ThumbRightY word # Vertical position of the right thumbstick (-32768 to 32767)

---Fetches the state of the connected xbox controller.
---@param controllerID? integer # A controller ID to specify to fetch a particular controller state
---@return XBoxControllerState # A table containing the XBox controller state
function getXBox360ControllerState(controllerID) return {
    ControllerID = 0,
    PacketNumber = 0,
    GAMEPAD_DPAD_UP = true,
    GAMEPAD_DPAD_DOWN = true,
    GAMEPAD_DPAD_LEFT = true,
    GAMEPAD_DPAD_RIGHT = true,
    GAMEPAD_START = true,
    GAMEPAD_BACK = true,
    GAMEPAD_LEFT_THUMB = true,
    GAMEPAD_RIGHT_THUMB = true,
    GAMEPAD_LEFT_SHOULDER = true,
    GAMEPAD_RIGHT_SHOULDER = true,
    GAMEPAD_A = true,
    GAMEPAD_B = true,
    GAMEPAD_X = true,
    GAMEPAD_Y = true,
    LeftTrigger = 0,
    RightTrigger = 0,
    ThumbLeftX = 0,
    ThumbLeftY = 0,
    ThumbRightX = 0,
    ThumbRightY = 0,
} end

---Sets the speed of the left and right vibrating motor inside the controller. Range (0 to 65535 where 0 is off).
---@param ControllerID ControllerID # The ID of the controller to set vibration for
---@param leftMotor word # Speed to set left motor
---@param rightMotor word # Speed to set right motor
function setXBox360ControllerVibration(ControllerID, leftMotor, rightMotor) end
