---@meta



---Inherits from Panel (Addresslist->Panel->WinControl->Control->Component->Object)
---@class Addresslist: Panel
--@operator index(integer): MemoryRecord # Default accessor
---@field LoadedTableVersion integer # Returns the tableVersion of the last loaded table
---@field Count integer # The number of records in the table
---@field SelCount integer # The number of records that are selected
---@field SelectedRecord MemoryRecord # The main selected record
---@field MemoryRecord MemoryRecord[] # Array to access the individual memory records
---@field CheckboxActiveSelectedColor Colors #
---@field CheckboxActiveColor Colors #
---@field CheckboxSelectedColor Colors #
---@field CheckboxColor Colors #
---@field SelectedBackgroundColor Colors #
---@field SelectedSecondaryBackgroundColor Colors #
---@field ExpandSignColor Colors #
---@field IncreaseArrowColor Colors #
---@field DecreaseArrowColor Colors #
---@field MouseHighlightedRecord fun(): MemoryRecord | nil # Returns the memoryrecord that the mouse points at. nil if nothing
---@field OnDescriptionChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates a description column change on a record. Return true if you handle it, false for normal behaviour
---@field OnAddressChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates an address column change on a record. Return true if you handle it, false for normal behaviour
---@field OnTypeChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates a type column change on a record. Return true if you handle it, false for normal behaviour
---@field OnValueChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates a value column change on a record. Return true if you handle it, false for normal behaviour
---@field OnAutoAssemblerEdit fun(addresslist: Addresslist, memoryRecord) # Called when the user initiates a memoryrecord AA script edit.  This function will be responsible for changing the memory record
---@field getCount fun(): integer #
---@field getMemoryRecord fun(index: integer): MemoryRecord #
---@field getMemoryRecordByDescription fun(description: string): MemoryRecord | nil # Returns a MemoryRecord object
---@field getMemoryRecordByID fun(ID: integer): MemoryRecord | nil #
---@field createMemoryRecord fun(): MemoryRecord # Creates an generic cheat table entry and add it to the list
---@field getSelectedRecords fun(): MemoryRecord[] # Returns a table containing all the selected records
---@field doDescriptionChange fun() # Will show the GUI window to change the description of the selected entry
---@field doAddressChange fun() # Will show the GUI window to change the address of the selected entry
---@field doTypeChange fun() # Will show the GUI window to change the type of the selected entries
---@field doValueChange fun() # Will show the GUI window to change the value of the selected entries
---@field getSelectedRecord fun(): MemoryRecord # Gets the main selected memory record
---@field setSelectedRecord fun(memoryRecord: MemoryRecord) # Sets the currently selected memory record. This will unselect all other entries
---@field disableAllWithoutExecute fun() # Disables all memory records without executing their [Disable] section
---@field rebuildDescriptionCache fun() # Rebuilds the description to record lookup table


---The address list of the main Cheat Engine GUI
---@type Addresslist
AddressList = {
  LoadedTableVersion = 0,
  Count = 0,
  SelCount = 0,
  SelectedRecord = {
    ID = 0,
    Index = 0,
    Description = "",
    Address = "",
    AddressString = "",
    OffsetCount = 0,
    Offset = {},
    OffsetText = {},
    CurrentAddress = 0,
    VarType = "vtByte",
    Type = vtByte,
    String = {
      Size = 0,
      Unicode = true,
      Codepage = true
    },
    Binary = {
      Startbit = 0,
      Size = 0
    },
    Aob = {
      Size = 0,
    },
    CustomTypeName = "",
    Script = "",
    Value = "",
    NumericalValue = 0,
    Selected = true,
    Active = true,
    Color = 0,
    ShowAsHex = true,
    ShowAsSigned = true,
    AllowIncrease = true,
    AllowDecrease = true,
    Collapsed = true,
    IsGroupHeader = true,
    IsAddressGroupHeader = true,
    IsReadable = true,
    Options = "moHideChildren",
    DropDownLinked = true,
    DropDownLinkedMemrec = "",
    DropDownList = createStringList(),
    DropDownReadOnly = true,
    DropDownDescriptionOnly = true,
    DisplayAsDropDownListItem = true,
    DropDownCount = 0,
    DropDownValue = {},
    DropDownDescription = {},
    Count = 0,
    Child = {},
    Parent = AddressList.createMemoryRecord(),
    HotkeyCount = 0,
    Hotkey = {},
    Async = true,
    AsyncProcessing = true,
    AsyncProcessingTime = 0,
    HasMouseOver = true,
    OnActivate = function(memoryRecord, before, currentState) return true end,
    OnDeactivate = function(memoryRecord, before, currentState)return true end, 
    OnDestroy = function() end,
    OnGetDisplayValue = function(memoryRecord, value) return true, "" end,
    OnChangedValue = function(memoryRecord, oldValue, newValue) end,
    OnChangedValueByUser = function(memoryRecord, oldValue, newValue) end,
    DontSave = false,
    getDescription = function() return "" end,
    setDescription = function(description) end,
    getAddress = function() return "", {} end,
    setAddress = function(address) end,
    getOffsetCount = function() return 0 end,
    setOffsetCount = function(offsets) end,
    getOffset = function(index) return 0 end,
    setOffset = function(index, value) end,
    getCurrentAddress = function() return 0 end,
    appendToEntry = function(memoryRecord) end,
    getHotkey = function(index) return {} end,
    getHotkeyByID = function(id) return {} end,
    reinterpret = function() end,
    createHotkey = function(keys, action, value, description) return {} end,
    disableWithoutExecute = function() end,
    beginEdit = function() end,
    endEdit = function() end,
    MemoryRecord = {},
    CheckboxActiveSelectedColor = clBlack,
    CheckboxActiveColor = clBlack,
    CheckboxSelectedColor = clBlack,
    CheckboxColor = clBlack,
    SelectedBackgroundColor = clBlack,
    SelectedSecondaryBackgroundColor = clBlack,
    ExpandSignColor = clBlack,
    IncreaseArrowColor = clBlack,
    DecreaseArrowColor = clBlack,
    MouseHighlightedRecord = function() return nil end,
    OnDescriptionChange = function(addresslist, memoryRecord) return true end,
    OnAddressChange = function(addresslist, memoryRecord) return true end,
    OnTypeChange = function(addresslist, memoryRecord) return true end,
    OnValueChange = function(addresslist, memoryRecord) return true end,
    OnAutoAssemblerEdit = function(addresslist, memoryRecord) end,
    getCount = function() return 0 end,
    getMemoryRecord = function(index) return AddressList.createMemoryRecord() end,
    getMemoryRecordByDescription = function(description) return nil end,
    getMemoryRecordByID = function(ID) return nil end,
    createMemoryRecord = function() return AddressList.createMemoryRecord() end,
    getSelectedRecords = function() return {} end,
    doDescriptionChange = function() end,
    doAddressChange = function() end,
    doTypeChange = function() end,
    doValueChange = function() end,
    getSelectedRecord = function() return AddressList.createMemoryRecord() end,
    setSelectedRecord = function(memoryRecord) end,
    disableAllWithoutExecute = function() end,
    rebuildDescriptionCache = function() end
  },
  MemoryRecord = {},
  CheckboxActiveSelectedColor = clBlack,
  CheckboxActiveColor = clBlack,
  CheckboxSelectedColor = clBlack,
  CheckboxColor = clBlack,
  SelectedBackgroundColor = clBlack,
  SelectedSecondaryBackgroundColor = clBlack,
  ExpandSignColor = clBlack,
  IncreaseArrowColor = clBlack,
  DecreaseArrowColor = clBlack,
  MouseHighlightedRecord = function() return nil end,
  OnDescriptionChange = function(addresslist, memoryRecord) return true end,
  OnAddressChange = function(addresslist, memoryRecord) return true end,
  OnTypeChange = function(addresslist, memoryRecord) return true end,
  OnValueChange = function(addresslist, memoryRecord) return true end,
  OnAutoAssemblerEdit = function(addresslist, memoryRecord) end,
  getCount = function() return 0 end,
  getMemoryRecord = function(index) return AddressList.createMemoryRecord() end,
  getMemoryRecordByDescription = function(description) return nil end,
  getMemoryRecordByID = function(ID) return nil end,
  createMemoryRecord = function() return AddressList.SelectedRecord end,
  getSelectedRecords = function() return {} end,
  doDescriptionChange = function() end,
  doAddressChange = function() end,
  doTypeChange = function() end,
  doValueChange = function() end,
  getSelectedRecord = function() return AddressList.createMemoryRecord() end,
  setSelectedRecord = function(memoryRecord) end,
  disableAllWithoutExecute = function() end,
  rebuildDescriptionCache = function() end,
}

---@return Addresslist # The cheat table addresslist object
function getAddressList() return AddressList end

-----------------------------Addresslist functions------------------------------------

---@param addresslist Addresslist # The addresslist to operate on
---@return integer # Number of nodes in Addresslist
function addresslist_getCount(addresslist) return 0 end

---@param addresslist Addresslist # The addresslist to operate on
---@return MemoryRecord[] # An array containing all the selected records in Addresslist
function addresslist_getSelectedRecords(addresslist) return {} end

---@param addresslist Addresslist # The addresslist to operate on
---@param key integer | string # Index of record in Addresslist. If a string is supplied, it's treated just like addresslist_getMemoryRecordByDescription
---@return MemoryRecord # A memory record
function addresslist_getMemoryRecord(addresslist, key) return {} end


---@param addresslist Addresslist # The addresslist to operate on
---@param description string # Description of record in Addresslist
---@return MemoryRecord # A memory record
function addresslist_getMemoryRecordByDescription(addresslist, description) return {} end


---@param addresslist Addresslist # The addresslist to operate on
---@param id integer # ID of record in Addresslist.
---@return MemoryRecord # A memory record
function addresslist_getMemoryRecordByID(addresslist, id) return {} end


---@param addresslist Addresslist # The addresslist to operate on
---@return MemoryRecord # A newly created memory record
function addresslist_createMemoryRecord(addresslist) return {} end

---@param addresslist Addresslist # The addresslist to operate on
---@return MemoryRecord # The selected memory record
function addresslist_getSelectedRecord(addresslist) return {} end

---Set selected record to match the provided memory record.
---@param addresslist Addresslist # The addresslist to operate on
---@param memoryRecord MemoryRecord # The memory record to set the selected record to
---@return MemoryRecord # The selected memory record
function addresslist_setSelectedRecord(addresslist, memoryRecord) return {} end

---Makes addresslist update descriptions.
---@param addresslist Addresslist # The addresslist to operate on
function addresslist_doDescriptionChange(addresslist) end

---Makes addresslist update addresses.
---@param addresslist Addresslist # The addresslist to operate on
function addresslist_doAddressChange(addresslist) end

---Makes addresslist update types.
---@param addresslist Addresslist # The addresslist to operate on
function addresslist_doTypeChange(addresslist) end
