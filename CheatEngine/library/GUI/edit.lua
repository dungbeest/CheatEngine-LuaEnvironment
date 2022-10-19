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
---@field clear fun() #
---@field copyToClipboard fun() #
---@field cutToClipboard fun() #
---@field pasteFromClipboard fun() #
---@field selectAll fun() #
---@field select fun(start: integer, length?: integer) #
---@field selectText fun(start: integer, length?: integer) # Set the control's current selection. If no length is specified, selects everything after start.
---@field clearSelection fun() #
---@field getSelText fun() #
---@field getSelStart fun() #
---@field getSelLength fun() #
---@field getOnChange fun() #
---@field setOnChange fun(OnChange: function) #
---@field getOnKeyPress fun() #
---@field setOnKeyPress fun(OnKeyPress: function) #
---@field getOnKeyUp fun() #
---@field setOnKeyUp fun(OnKeyUp: function) #
---@field getOnKeyDown fun() #
---@field setOnKeyDown fun(OnKeyDown: function) #


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
---@field append fun(line: string) #
---@field getLines fun(): Strings # Returns a Strings class with text lines
---@field getWordWrap fun(): boolean #
---@field setWordWrap fun(wordWrap: boolean) #
---@field getWantTabs fun(): boolean #
---@field setWantTabs fun(wantTabs: boolean) #
---@field getWantReturns fun(): boolean #
---@field setWantReturns fun(wantReturns: boolean) #
---@field getScrollbars fun(): ScrollStyles #
---@field setScrollbars fun(scrollStyle: ScrollStyles) # Sets the scrollbars. Horizontal only takes affect when wordwrap is disabled 


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
---@field CopyToClipboard fun() #
---@field CutToClipboard fun() #
---@field PasteFromClipboard fun() #
---@field ClearUndo fun() #
---@field Redo fun() #
---@field Undo fun() #
---@field MarkTextAsSaved fun() #
---@field ClearSelection fun() #
---@field SelectAll fun() #


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
