---@meta _


---Symbol Table
---@class SymbolListSymbol
---@field modulename string #
---@field searchkey string #
---@field address Address #
---@field symbolsize integer #

---A table which can be used to fill in a return type and parameters for function calls.
---@class SymbolListExtraData
---@field returntype string #
---@field parameters string #



---This class can be used to look up an address to a symbolname, and a symbolname to an address
---
---It can also be registered with the internal symbol handler of cheat engine
---
---This class makes use of a special "Symbol" table construction that contains size and optionally other data
---@class SymbolList
---@field PID integer # The process id it refers to
---@field Name string # A name that can be set to make it easier to identify
local SymbolList = {}

function SymbolList.clear() end

---Searches the list for the given address. 
---The address does not have to match the exact address,
---as long as it falls within a range.
---@param address Address
function SymbolList.getSymbolFromAddress(address) end

---@param searchKey string
function SymbolList.getSymbolFromString(searchKey) end

---@param moduleName string
---@param modulePath string
---@param address Address
---@param size integer
---@param is64bit boolean
function SymbolList.addModule(moduleName, modulePath, address, size, is64bit) end

---@param modulename string
function SymbolList.deleteModule(modulename) end

---@param address Address
function SymbolList.deleteModule(address) end

---Adds a symbol to the symbol list.
---@param modulename string
---@param searchkey string
---@param address Address
---@param symbolsize integer
---@param skipAddressToSymbolLookup? boolean
---@param extradata? SymbolListExtraData
function SymbolList.addSymbol(
  modulename, searchkey, address,
  symbolsize, skipAddressToSymbolLookup, extradata
) end

---@param searchkey string
function SymbolList.deleteSymbol(searchkey) end

---@param address Address
function SymbolList.deleteSymbol(address) end

---Registers the current symbol list with the symbol handler
function SymbolList.register() end

---Unregisters the current symbol list from the symbol handler
function SymbolList.unregister() end


---@return ModuleInfo[] # An indexed table with all the modules
function SymbolList.getModuleList() end

---@return table<string, Address> # An unindexed table with each symbol being an element containing an address.
function SymbolList.getSymbolList() end


---Creates an empty symbollist
function createSymbolList() return {} end
---Returns the symhandler internal symbol list (Note: This does not contain .net, modulelist, or other info)
function getMainSymbolList() return {} end
---Returns a table containing all the registered symbollists
function enumRegisteredSymbolLists() return {} end
