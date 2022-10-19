---@meta

---Causes cheat engine to open the file with memory access as if it's a process.
---@param fileName string # Name of the file 
---@param is64bit? boolean # Whether the file should be opened in 64-bit mode
---@param startAddress? SymbolAddress # The address to open the file at
function openFileAsProcess(fileName, is64bit, startAddress) end

---@return integer # The size of the opened file
function getOpenedFileSize() return 0 end

---Saves the changes of the opened file.
---@param fileName? string # set file name if you want a different file
function saveOpenedFile(fileName) end


---Loads the given plugin.
---@param dllNameOrPath path # Path to plugin
---@return integer | nil # nil on failure. On success returns a value of 0 or greater
function loadPlugin(dllNameOrPath) return 0 end

---Loads a font from a memory stream.
---@param memoryStream Stream #
---@return integer # An id (handle) to the font for use with unloadLoadedFont
---@see unloadLoadedFont
function loadFontFromStream(memoryStream) return 0 end

---Unload a previously loaded font.
---@param id integer # An id (handle) to the font to unload
---@see loadFontFromStream
function unloadLoadedFont(id) end



---@return boolean # Whether Cheat Engine is 64-bit, false if 32-bit
function cheatEngineIs64Bit() return true end

---@return boolean # Whether the target process is 64-bit, false if 32-bit
function targetIs64Bit() return true end


---@return path # The folder Cheat Engine is located at
function getCheatEngineDir() return "" end

---@return integer # The process ID of Cheat Engine
function getCheatEngineProcessID() return 0 end

---@return path # The autorun path
function getAutorunPath() return "" end


---@return integer # The process ID of the process that is currently on top
function getForegroundProcess() return 0 end



---Sets the size cheat engine will deal with pointers in bytes. (Some 64-bit processes can only use 32-bit addresses)
---@param size integer # size of the pointer to set
function setPointerSize(size) end

---Gets the current pointer size.
---@return integer # Pointer size used (either 32-bit or 64-bit unless custom size is set)
function getPointerSize() return 0 end

---@alias ASMMode integer
---| 0 # 32-bit
---| 1 # 64-bit

---@param mode ASMMode
function setAssemblerMode(mode) end

---@return integer # The number of CPUs
function getCPUCount() return 0 end

---@class CPUIDRegisterInfo
---@field EAX integer # The value of EAX register returned after a cpuid instruction
---@field EBX integer # The value of EBX register returned after a cpuid instruction
---@field ECX integer # The value of ECX register returned after a cpuid instruction
---@field EDX integer # The value of EDX register returned after a cpuid instruction

---A table with CPUID info (EAX, EBX, ECX, EDX).
---
---Check x86 cpuid instruction for details.
---@param EAX integer # Value to set to EAX register for cpuid instruction
---@param ECX integer # Value to set to ECX register for cpuid instruction
---@return CPUIDRegisterInfo # The values of registers for the cpuid instruction
function cpuid(EAX,ECX)
  return {
    EAX = 0,
    EBX = 0,
    ECX = 0,
    EDX = 0
  }
end

---Enables/disables the passive garbage collector.
---@param state boolean # Whether to enable/disable the passive GC
function gc_setPassive(state) end

---Enables/disables the active garbage collector and lets you configure the interval and minimum size.
---@param state boolean # Whether to enable/disable the active GC
---@param interval integer # Interval to run the GC at
---@param minSize integer # Minimum heap size to run the GC
function gc_setActive(state, interval, minSize) end



---Retrieves the specified system metric or system configuration setting
---
---@source https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getsystemmetrics
---@param index SystemMetricsIndex # The system metric or configuration to retrieve
---@return integer # The configuration value or 0 if not applicable
function getSystemMetrics(index) return 0 end

---@return integer # The Dots/Pixels Per Inch of the screen
function getScreenDPI() return 0 end

---@return integer # The screen height
function getScreenHeight() return 0 end

---@return integer # The screen width
function getScreenWidth() return 0 end

---@return integer # The work area height
function getWorkAreaHeight() return 0 end


---@return integer # The work area width
function getWorkAreaWidth() return 0 end

---@return Canvas # A Canvas object you can use to write to the screen (Note: Not as useful as you may think)
function getScreenCanvas() return {} end

---@param x integer # Coordinate on the screen along the x axis
---@param y integer # Coordinate on the screen along the y axis
---@return integer # The rgb value of the pixel at the specific screen coordinate
function getPixel(x,y) return 0 end

---@return integer # The current tick count since OS was started. Each tick is one millisecond
function getTickCount() return 0 end

---Lets the main event handler process the new messages (allows for new button clicks).
function processMessages() end

---@return boolean # Whether the current code is running inside the main thread (CE version 6.4+)
function inMainThread() return true end


---Enables the speed hack if needed and sets the specific speed.
---@param speed number # Sets the specific speed
function speedhack_setSpeed(speed) end

---Gets the last set speed hack speed.
---@return number # The last set speed hack speed
function speedhack_getSpeed() return 0.0 end


---Sets the state of the cheatengine task in the taskbar.
---@param state TaskProgressState #
function setProgressState(state) end

---Sets the state of the Cheat Engine task progress status.
---@param current integer #
---@param max integer #
function setProgressValue(current, max) end

---@param name string # The user registry environment variable name 
---@return string # The environment variable stored in the user registry environment
function getUserRegistryEnvironmentVariable(name) return "" end

---Sets the environment variable stored in the user registry environment.
---
---This will cause at least the shell to update so you don't have to reboot. (It's always recommended to reboot though).
---@param name string # The user registry environment variable name 
---@param string string #  The value to set environment variable to
function setUserRegistryEnvironmentVariable(name, string) end

---Sets the global keypoll interval. The interval determines the speed of how often CE checks if a key has been pressed or not. Lower is more accurate, but eats more cpu power
---@param integer integer # The global keypoll interval to set
function setGlobalKeyPollInterval(integer) end

---Sets the minimum delay between the activation of the same hotkey in milliseconds. Affects all hotkeys that do not set their own minimum delay
---@param integer integer # Minimum delay to set between the activation of the same hotkey milliseconds
function setGlobalDelayBetweenHotkeyActivation(integer) end

---@class BinUtilsConfig
---@field Name string # The displayed name in the binutils menu in memview
---@field Description string # The description for this toolset
---@field Architecture string # Used by the objdump -m<architecture>  (required)
---@field ASParam string # Extra parameters to pass on to AS (optional)
---@field LDParam string # Extra parameters to pass on to LD
---@field OBJDUMPParam string # Extra parameters to pass on to OBJDUMP
---@field OnDisassemble function # A lua function that gets called each time an address is disassembled. The return value will be passed on to OBJDUMP
---@field Path path # File path to the binutils set
---@field Prefix string # CPU instruction / OS ABI Prefix  (e.g: "arm-linux-androideabi-")
---@field DisassemblerCommentChar string # Depending on which target you're disassembling, the comment character can be different. (ARM=";"  x86='#' )



---Registers a binutils toolset with CE (for assembling and disassembling in other cpu instruction sets)
---@param config BinUtilsConfig # A table containing several fields that describe the tools, and lets you specify extra parameters
function registerBinUtil(config) end
