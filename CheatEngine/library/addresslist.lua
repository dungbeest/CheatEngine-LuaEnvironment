---@meta


---The address list of the main Cheat Engine GUI
---@type Addresslist
AddressList = {}

---@return Addresslist # The cheat table addresslist object
function getAddressList() return {} end

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
