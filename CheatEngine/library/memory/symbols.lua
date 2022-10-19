---@meta

---Will download the PDB files of Windows and load them (Takes a long time the first time)
function enableWindowsSymbols() end

---Will check the option for kernelmode symbols in memory view (Gets only the exports unless enableWindowsSymbols() is used)
function enableKernelSymbols() end


---@param string Symbol # The symbol to interpret. Can be a modulename or an export.
---@param localCE? boolean # Set to true if you wish to query the symbol table of the Cheat Engine process
---@return Address # The address of a symbol
function getAddress(string, localCE) return 0 end

---Similar to getAddress when errorOnLookup is false, but returns nil instead. 
---@param string Symbol # The symbol to interpret. Can be a modulename or an export.
---@param localCE? boolean # Set to true if you wish to query the symbol table of the Cheat Engine process
---@param shallow? boolean #
---@return Address | nil # The address of a symbol, or nil if not found.
function getAddressSafe(string, localCE, shallow) return 0 end


---The given address as a string. 
---
---Can be a registered symbolname, modulename+offset, or just a hexadecimal string depending on what address is supplied and flags
---@param address Address # The address to query the symbol list for
---@param moduleNames? boolean # If module names should be included in search and string. Defaults to true
---@param symbols? boolean # If symbols should be included in search and string. Defaults to true
---@param sections? boolean # If sections should be included in search and string. Defaults to false
---@return string # The address as a string interpretable by the symbol handler
function getNameFromAddress(address, moduleNames, symbols, sections) return "" end

---@param address SymbolAddress # The address to check
---@return boolean # if the given address is inside a module
function inModule(address) return true end

---@param address SymbolAddress # The address to check
---@return boolean # if the given address is inside a system module
function inSystemModule(address) return true end

---@return Stringlist # The common ModuleList stringlist. (Do not free this one)
function getCommonModuleList() return {} end


---@param symbolName Symbol # The symbol to interpret. Can be a modulename or an export.
---@return SymbolList # A table as defined by the SymbolList class object (modulename, searchkey, address, size)
function getSymbolInfo(symbolName) return {} end

---@param moduleName SymbolAddress # The base address of a module (use getAddress to get the base address).
---@return integer # The size in bytes of a given module
function getModuleSize(moduleName) return 0 end

---@param address SymbolAddress # The address of a RTTI structure
---@return string | nil # The classname of a given structure based on RTTI information (assuming it can be found, returns nil if not or unknown)
function getRTTIClassName(address) return "" end

---Reinitializes the symbolhandler. 
---
---(E.g. when new modules have been loaded)
---@param waitUntilDone? boolean # Whether to wait until symbol handler is completely reinitialize. Defaults to true
function reinitializeSymbolhandler(waitUntilDone) end

---Reinitializes only the DotNet part of the symbol list. 
---
---(E.g. after an ILCode has been JITed) (6.4+)
---@param moduleName SymbolAddress # The base address of a module (use getAddress to get the base address)
function reinitializeDotNetSymbolhandler(moduleName) end

---Reinitializes the selfsymbolhandler. 
---
---(E.g. when new modules have been loaded to CE process)
---@param waitUntilDone? boolean # Whether to wait until symbol handler is completely reinitialize. Defaults to true
function reinitializeSelfSymbolhandler(waitUntilDone) end

---Waits until the sections have been enumerated.
function waitForSections() end

---Waits until all DLL Exports are loaded.
function waitForExports() end

---Waits until all .NET symbols are loaded (this includes DLL Exports).
function waitForDotNet() end

---Waits until all PDB symbols are loaded (this includes DLL Exports and .NET).
function waitForPDB() end

---Set whether to interrupt symbol enum to query the debughelp symbol handler about a specific symbol.
---
---This can take a while.
---
---Starts set to false by default.
---@param state boolean # Whether to activate or deactivate
function searchPDBWhileLoading(state) end

---Set whether address lookups in stringform will raise an error if it can not be looked up.
---
---This includes symbolnames that are not defined and pointers that are bad. 
---
---If set to false it will return 0 in those cases.
---(Useful for pointers that don't work 100% of the time)
---
---Starts set to true by default.
---@param state boolean # Whether to activate or deactivate
---@return boolean # The previous state
function errorOnLookupFailure(state) return true end

---Set whether looking up a symbol will wait for the symbol to be loaded.
---
---Starts set to true by default.
---@param state boolean # Whether to activate or deactivate
function waitforsymbols(state) end

---Registers a user defined symbol. 
---@param symbolName string # The symbol name
---@param address SymbolAddress # The address to register the symbol at
---@param doNotSave? boolean # If set to true this symbol will not get saved when the table is saved
function registerSymbol(symbolName, address, doNotSave) end

---Unregisters a user defined symbol. 
---@param symbolName string # The symbol name
function unregisterSymbol(symbolName) end

---@alias SymbolInfo { symbolname: string, address: SymbolAddress, OPTIONAL: {allocsize: integer, processid: integer, donotsave: boolean }}

---@return SymbolInfo # A table with elements containing {symbolname, address, OPTIONAL {allocsize, processid, donotsave}}
function enumRegisteredSymbols() return {} end

---Deletes all symbols registered with registerSymbols, both in AA and Lua scripts (Does not remove registered symbolLists).
function deleteAllRegisteredSymbols() end
