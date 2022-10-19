---@meta


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
---@field clear fun() #
---@field getSymbolFromAddress fun(address: Address) # Searches the list for the given address. The address does not have to match the exact address. As long as it falls withing the range
---@field getSymbolFromString fun(searchKey: string) #
---@field addModule fun(moduleName: string, modulePath: string, address: Address, size: integer, is64bit: boolean) #
---@field deleteModule fun(moduleName: string) | fun(address: Address) #
---@field addSymbol fun(modulename, searchkey, address, symbolsize, skipAddressToSymbolLookup?: boolean, extradata?: SymbolListExtraData) # Adds a symbol to the symbollist
---@field deleteSymbol fun(searchKey: string) | fun(address: Address) #
---@field register fun() # Registers the current symbol list with the symbol handler
---@field unregister fun() # Unregisters the current symbol list from the symbol handler
---@field getModuleList fun(): ModuleInfo[] # Returns an indexed table with all the modules
---@field getSymbolList fun(): table<string, Address> # Returns an unindexed table with each symbol being an element containing an address



---Creates an empty symbollist
function createSymbolList() return {} end
---Returns the symhandler internal symbol list (Note: This does not contain .net, modulelist, or other info)
function getMainSymbolList() return {} end
---Returns a table containing all the registered symbollists
function enumRegisteredSymbolLists() return {} end
