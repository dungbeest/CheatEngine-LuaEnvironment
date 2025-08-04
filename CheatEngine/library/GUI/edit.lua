---@meta


---Inherits from WinControl (Edit->WinControl->Control->Component->Object)
---@class Edit
---@field Text string # The current contents of the editfield
---@field CaretPos Locations2D # The position of the caret
---@field PasswordChar string # When not set to char 0 this will make the edit field show the character instead of the given text
---@field SelText string # The current selected contents of the edit field 
---@field SelStart integer # The starting index of the current selection (zero-indexed)
---@field SelLength integer # The length of the current selection.
---@field OnChange function # The function to call when the editfield is changed
---@field OnKeyPress function # The function to call for the KeyPress event.
---@field OnKeyUp function # The function to call for the KeyUp event.
---@field OnKeyDown function # The function to call for the KeyDown event.
local Edit = {}

function Edit.clear() end

function Edit.copyToClipboard() end

function Edit.cutToClipboard() end

function Edit.pasteFromClipboard() end

function Edit.selectAll() end

---@param start integer
---@param length? integer
function Edit.select(start, length) end

---Set the control's current selection.
---
---If no length is specified, selects everything after start.
---@param start integer
---@param length? integer
function Edit.select(start, length) end

function Edit.clearSelection() end

function Edit.getSelText() end

function Edit.getSelStart() end

function Edit.getSelLength() end

function Edit.getOnChange() end

---@param OnChange function #
function Edit.setOnChange(OnChange) end

function Edit.getOnKeyPress() end

---@param OnKeyPress function #
function Edit.setOnKeyPress(OnKeyPress) end

function Edit.getOnKeyUp() end

---@param OnKeyUp function #
function Edit.setOnKeyUp(OnKeyUp) end

function Edit.getOnKeyDown() end

---@param OnKeyDown function #
function Edit.setOnKeyDown(OnKeyDown) end


---@alias SynEditMode integer
---| 0 # Lua Highlighting
---| 1 # Auto Assembler Highlighting



---Inherits from Edit (Memo->Edit->WinControl->Control->Component->Object)
---@class Memo
---@field Lines Strings # Strings object for this memo
---@field WordWrap boolean # Set if words at the end of the control should go to the next line
---@field WantTabs boolean # Set if tabs will add a tab to the memo. False if tab will go to the next control
---@field WantReturns boolean # Set if returns will send a event or not
---@field Scrollbars ScrollStyles # Set the type of the scrollbars to show
local Memo = {}

---@param line string
function Memo.append(line) end

---@return Strings # A Strings class with text lines.
function Memo.getLines() end

---@return boolean
function Memo.getWordWrap() end

---@param wordWrap boolean
function Memo.setWordWrap(wordWrap) end

---@return boolean
function Memo.getWantTabs() end

---@param wantTabs boolean
function Memo.setWantTabs(wantTabs) end

---@return boolean
function Memo.getWantReturns() end

---@param wantReturns boolean
function Memo.setWantReturns(wantReturns) end

---@return ScrollStyles
function Memo.getScrollbars() end

---Sets the scrollbars. 
---
---Horizontal only takes affect when wordwrap is disabled.
---@param scrollStyle ScrollStyles
function Memo.setScrollbars(scrollStyle) end


---???
---@class Gutter

---@class SynEdit 
---@field Lines Stringlist # Contains the text
---@field Gutter Gutter # Gutter object
---@field ReadOnly boolean # Set to true for read only
---@field SelStart integer #
---@field SelEnd integer #
---@field SelText string #
---@field CanPaste boolean #
---@field CanRedo boolean #
---@field CanUndo boolean #
---@field CharWidth integer # READONLY
---@field LineHeight integer # READONLY
local SynEdit = {}

function SynEdit.CopyToClipboard() end

function SynEdit.CutToClipboard() end

function SynEdit.PasteFromClipboard() end

function SynEdit.ClearUndo() end

function SynEdit.Redo() end

function SynEdit.Undo() end

function SynEdit.MarkTextAsSaved() end

function SynEdit.ClearSelection() end

function SynEdit.SelectAll() end


---Creates a Memo class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the Memo component. Owner can be any object inherited from WinControl
---@return Memo # The new Memo object
function createMemo(owner) return {} end

---Creates a SynEdit object.
---@generic T: Object
---@param owner T # The control that will own the SynEdit component. Owner can be any object inherited from Object
---@param mode? SynEditMode
---@return SynEdit # The new SynEdit object
function createSynEdit(owner, mode) return {} end


---Creates an Edit class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the Edit component. Owner can be any object inherited from WinControl
---@return Edit # The new Edit object
function createEdit(owner) return {} end
