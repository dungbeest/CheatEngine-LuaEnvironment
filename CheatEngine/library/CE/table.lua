---@meta

---Closes Cheat Engine completely.
function closeCE() end

---Makes all normal Cheat Engine windows invisible (e.g trainer table).
function hideAllCEWindows() end

---Shows the main cheat engine window.
function unhideMainCEwindow() end


---@return float # A floating point value specifying the version of cheat engine
function getCEVersion() return 0.0 end


---@return integer # A raw integer that represents the full version data of the cheat engine version
---@return FullVersion # A table containing major, minor, release and build number of cheat engine version.
function getCheatEngineFileVersion() return 0, { major = 0, minor = 0, release = 0, build = 0 } end

---@alias OS integer
---| 0 # Windows
---| 1 # Mac

---@return OS
function getOperatingSystem() return 0 end

---@return boolean # True if CE is running in windows Dark Mode. Has no effect on mac
function darkMode() end

---Prevents basic memory scanners from opening the cheat engine process (Not that useful)
function activateProtection() end

---Prevents normal memory scanners from reading the Cheat Engine process (kernelmode).
---@param altitude? integer # ???
---@param secondaryProcessID? integer # Lets you protect another process. E.g the game itself, so they can't easily see what you change
function enableDRM(altitude, secondaryProcessID) end

---Changes the protection of a block of memory to writable and executable.
---@param address SymbolAddress # The address of the start of the block
---@param size integer # The size of the block of memory starting from the address supplied
function fullAccess(address, size) end

---A triplet corresponding to the classic access permission model.
---
---Has a field for each of the three permissions: 
---
---R for read, W for write, X for execute.
---@class PermissionsOpts
---@field R boolean # read permission
---@field W boolean # write permission
---@field X boolean # execute permission

---Sets the given protection on the address range.
---
---Note, some systems do not support X and W to be true at the same time.
---@param address SymbolAddress # The address of the start of the block
---@param size integer # The size of the block of memory starting from the address supplied
---@param opts PermissionsOpts # Options under the classic RWX permission model
function setMemoryProtection(address, size, opts) end

---Loads a .ct or .cetrainer.
---@param fileName path # The table or trainer's file name
---@param merge? boolean # If provided and set to true it will not clear the old table
function loadTable(fileName, merge) end

---Loads a table from a stream object.
---@param stream Stream # A stream object
---@param merge? boolean # If provided and set to true it will not clear the old table
---@param ignoreLUAScriptDialog boolean
function loadTable(stream, merge, ignoreLUAScriptDialog) end

---Saves the current table.
---@param fileName path # The table or trainer's file name
---@param protect? boolean # If protect is provided and set to true and the filename has the .CETRAINER extension, it will protect it from reading normally
---@param dontDeactivateDesignerForms? boolean
function saveTable(
    fileName, protect, dontDeactivateDesignerForms
) end

---Saves the current table to a stream object.
---@param stream Stream # A stream object
---@param dontDeactivateDesignerForms? boolean
function saveTable(stream, dontDeactivateDesignerForms) end

---If the current CE install has a valid cheat engine signature, this will sign the specific table with that signature (will pop up the password request).
---@param fileName path # The table or trainer's file name
function signTable(fileName) end

