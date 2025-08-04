---@meta

---@enum DisplayTypes
CE_defines.display_types = {
  dtByte      = 0,
  dtByteDec   = 1,
  dtWord      = 2,
  dtWordDec   = 3,
  dtDword     = 4,
  dtDwordDec  = 5,
  dtQword     = 6,
  dtQwordDec  = 7,
  dtSingle    = 8,
  dtDouble    = 9,
}

---@alias DisplayType integer
---| 0 # dtByte -> 
---| 1 # dtByteDec ->
---| 2 # dtWord ->
---| 3 # dtWordDec ->
---| 4 # dtDword ->
---| 5 # dtDwordDec ->
---| 6 # dtQword ->
---| 7 # dtQwordDec ->
---| 8 # dtSingle ->
---| 9 # dtDouble ->


---@alias DisplayTypeString string
---| '"dtByte"' # 
---| '"dtByteDec"' #
---| '"dtWord"' #
---| '"dtWordDec"' #
---| '"dtDword"' #
---| '"dtDwordDec"' #
---| '"dtQword"' #
---| '"dtQwordDec"' #
---| '"dtSingle"' #
---| '"dtDouble"' #

---Inherits from Form (Memoryview->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class Memoryview: Form
---@field DisassemblerView Disassemblerview # The disassembler view class of this memory view object
---@field HexadecimalView Hexadecimal # The hexadecimal view class of this memory view object


---Inherits from Object (DisassemblerviewLine->Object)
---@class DisassemblerviewLine: Object
---@field Address string # The current address of this line
---@field Owner Disassemblerview # The Disassembler View that owns this line
local DisassemblerviewLine = {}

---Called when a line is about to be rendered.
---@param address Address
---@param addressString string
---@param byteString string
---@param opcodeString string
---@param parameterString string
---@param specialString string
---@return string addressString
---@return string byteString
---@return string opcodeString
---@return string parameterString
---@return string specialString
function DisassemblerviewLine.OnDisassemblerViewOverride(
  address, addressString, byteString,
  opcodeString, parameterString, specialString
) return '','','','','' end


---The visual disassembler used on the memory view window properties.
---
---Inherits from Panel (Disassemblerview->Panel->CustomControl->WinControl->Control->Component->Object)
---@class Disassemblerview: Panel
---@field SelectedAddress Address # The currently selected address in the disassemblerview
---@field SelectedAddress2 Address # The secondary selected address in the disassemblerview
---@field TopAddress Address # The first address to show
---@field ShowJumplines boolean # Determines if the jump lines should be shown
---@field HideFocusRect boolean # If set to true the focus rectangle won't be shown
---@field SpaceAboveLines integer #
---@field SpaceBelowLines integer #
---@field Osb Bitmap # Background picture of the disassemblerview
local Disassemblerview = {}

---Function to call when the selection has changed.
---@param sender any
---@param address Address
---@param address2 Address
function Disassemblerview.OnSelectionChange(sender, address, address2) end

---Function to call when you wish to provide the disassembler view with an extra image containing data you wish to show. 
---
---This function is called once to get an image to show above the instruction, and once to get an image to show under the instruction and optional comments. 
---
---The image for both calls must be different objects as rendering will only be done when both calls have been completed. 
---If no coordinates are given the image will be centered above/below the instruction.
---@param sender DisassemblerviewLine
---@param address Address
---@param aboveInstruction boolean
---@param selected boolean
---@return RasterImage | nil image
---@return integer | nil x
---@return integer | nil y
function Disassemblerview.OnExtraLineRender(sender, address, aboveInstruction, selected) end



---The visual hexadecimal object used on the memory view window properties.
---
---Inherits from Panel (Hexadecimal->Panel->CustomControl->WinControl->Control->Component->Object)
---@class Hexadecimal: Panel
---@field Address Address # The top address
---@field HasSelection boolean # True if something is selected
---@field SelectionStart integer #
---@field SelectionStop integer #
---@field DisplayType DisplayType # The type being shown
local Hexadecimal = {}

---@param hexView Hexadecimal
---@param address Address
function Hexadecimal.OnAddressChange(hexView, address) end

---@param hexView Hexadecimal
---@param address Address
---@param address2 Address
function Hexadecimal.OnByteSelect(hexView, address, address2) end

---Called when a character is being rendered. 
---
---Use this to change it or change the canvas fonts (Warning: slow).
---@param sender any
---@param address Address
---@param text string
---@return string
function Hexadecimal.OnCharacterRender(sender, address, text) end

---Called when a value (depending on the display type) is being rendered. 
---
---Use this to change it or change the canvas fonts (Warning: slow)
---@param sender any
---@param address Address
---@param text string
---@return string
function Hexadecimal.OnValueRender(sender, address, text) end


---Creates a new memory view window. 
---
---This window will not receive debug events. 
---
---Use getMemoryViewForm() function to get the main memoryview window
---@return Memoryview # A new memory view window
function createMemoryView() return {} end
