---@meta _



---Inherits from Panel (Addresslist->Panel->WinControl->Control->Component->Object)
---@class Addresslist: Panel
--@operator index(integer): MemoryRecord # Default accessor
---@field LoadedTableVersion integer # Returns the tableVersion of the last loaded table
---@field Count integer # The number of records in the table
---@field SelCount integer # The number of records that are selected
---@field SelectedRecord MemoryRecord | nil # The main selected record
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
AddressList = {}

---@return MemoryRecord | nil # The memory record that the mouse points at. Nil if none is highlighted.
function AddressList.MouseHighlightedRecord() end

---Called when the user initiates a description column change on a record.
---@param addresslist Addresslist
---@param memoryRecord MemoryRecord
---@return boolean # Return true if you handle it, false for normal behaviour
function AddressList.OnDescriptionChange(addresslist, memoryRecord) end

---Called when the user initiates an address column change on a record.
---@param addresslist Addresslist
---@param memoryRecord MemoryRecord
---@return boolean # Return true if you handle it, false for normal behaviour
function AddressList.OnAddressChange(addresslist, memoryRecord) end

---Called when the user initiates a type column change on a record.
---@param addresslist Addresslist
---@param memoryRecord MemoryRecord
---@return boolean # Return true if you handle it, false for normal behaviour
function AddressList.OnTypeChange(addresslist, memoryRecord) end

---Called when the user initiates a value column change on a record.
---@param addresslist Addresslist
---@param memoryRecord MemoryRecord
---@return boolean # Return true if you handle it, false for normal behaviour
function AddressList.OnValueChange(addresslist, memoryRecord) end

---Called when the user initiates a memory record AA script edit. 
---
---This function will be responsible for changing the memory record
---@param addresslist Addresslist
---@param memoryRecord MemoryRecord
function AddressList.OnAutoAssemblerEdit(addresslist, memoryRecord) end

---@return integer
function AddressList.getCount() end

---@param index integer
---@return MemoryRecord | nil
function AddressList.getMemoryRecord(index) end

---@param description string
---@return MemoryRecord | nil # a MemoryRecord object
function AddressList.getMemoryRecordByDescription(description) end

---@param ID integer
---@return MemoryRecord | nil
function AddressList.getMemoryRecordByID(ID) end

---Creates an generic cheat table entry and add it to the list
---@return MemoryRecord
function AddressList.createMemoryRecord() end

---@return MemoryRecord[] # a table containing all the selected records
function AddressList.getSelectedRecords() end

---Will show the GUI window to change the description of the selected entry
function AddressList.doDescriptionChange() end

---Will show the GUI window to change the address of the selected entry
function AddressList.doAddressChange() end

---Will show the GUI window to change the type of the selected entries
function AddressList.doTypeChange() end

---Will show the GUI window to change the value of the selected entries
function AddressList.doValueChange() end

---Gets the main selected memory record 
---@return MemoryRecord
function AddressList.getSelectedRecord() end

---Sets the currently selected memory record. This will unselect all other entries
---@param memoryRecord MemoryRecord
function AddressList.setSelectedRecord(memoryRecord) end

---Disables all memory records without executing their [Disable] section
function AddressList.disableAllWithoutExecute() end

---Rebuilds the description to record lookup table
function AddressList.rebuildDescriptionCache() end


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
