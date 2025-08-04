---@meta _

---Fills a Strings inherited object with the processlist of the system.
---
---Format: %x-pidname
---@param strings Strings # A strings object to populate with process strings (format: %x-pidname)
function getProcessList(strings) end

---@alias ProcessListInfo table<integer, string>

---@return ProcessListInfo # A table with the processlist (Format: {pid: integer = name: string})
function getProcessList() end


---Fills a List object with the thread list of the currently opened process. 
---
---Format: %x
---@param list table # A List object to populate with the thread list (format: %x)
function getThreadList(list) end

---Each handle entry has fields: ProcessID, ObjectTypeIndex, HandleAttributes, HandleValue, Object and GrantedAccess. 
---
---Note: Object will be invalid if you use the 32-bit CE on a 64-bit windows.
---@class HandleInfo
---@field ProcessID integer #
---@field ObjectTypeIndex integer #
---@field Object integer #
---@field GrantedAccess integer #
---@field HandleValue integer #
---@field HandleAttributes integer #

---@alias HandleFilter integer
---| 0 # Do not filter anything
---| 1 # Filter target process handles only
---| 2 # Filter handles to target process
---| 3 # Filter handles to ce process

---@param filter? HandleFilter # Which class of handles to filter
---@return HandleInfo[] # A table with all the handles in the system
function getHandleList(filter) end



---Closes the handle of a process.
---@param handle integer # The handle ID
---@param processID? integer # The process to close the handle on (defaults to current opened process)
function closeRemoteHandle(handle, processID) end

---Duplicates the provided CE based handle into the target process (You still need tell the target about this handle, like an injected dll data block)
---@param handle integer # The handle ID
function duplicateHandle(handle) end

---@alias HandleDuplicationMode integer
---| 0 # Duplicates the provided CE based handle into the target process
---| 1 # Duplicates the target process handle into CE's process

---Duplicates the provided CE based handle
---@param handle integer # The handle ID
---@param mode HandleDuplicationMode # How to duplicate handle (where from and where to)
function duplicateHandle(handle, mode) end


---Copies the handle from the given process to the target process.
---@param handle integer # The handle ID
---@param fromPID integer # The process to copy the handle from
---@param toPID integer # The process to copy the handle to
function duplicateHandle(handle, fromPID, toPID) end

---If this function is defined it will be called whenever cheat engine opens a process.
---
---Note: The the same process might be opened multiple times in a row internally.
---
---Note 2: This function is called before attachment is fully done. You can call reinitializeSymbolhandler() to force the open to complete, but it will slow down process opens. Alternatively, you could launch a timer which will run when the opening has finished
---@param processID integer # The process ID of the process being opened
---@deprecated Favor MainForm.OnProcessOpened instead
---@see MainForm.OnProcessOpened
function onOpenProcess(processID) end



---If defined this function will be called twice when a table gets loaded. Once before the loading, and once after.
---@param before boolean # Whether the function has been called before or after table load.
function onTableLoad(before) end


---@return integer # The currently opened process. If none is open, returns 0
function getOpenedProcessID() end

---@return integer # The handle of the currently opened process
function getOpenedProcessHandle() end

---@param name string # The process' name
---@return integer # The process ID for a process with the associated name. If no process with such a name exists returns 0
function getProcessIDFromProcessName(name) end

---Causes Cheat Engine to open the process with the supplied process ID.
---@param processID integer # The ID of the process to open
function openProcess(processID) end

---Causes cheat engine to find and open the given process
---@param processName string # The name of the process to find and open
function openProcess(processName) end

---Executes a given command.
---@param command string # The name of the command to execute
---@param parameters? string[] # The parameters to pass to command
---@param folder? path # The path will be the current working directory for command
---@param showCommand? boolean # Whether to show command
function shellExecute(
  command, parameters, folder, showCommand
) end

---Executes the given command (Should not open a console window).
---
---If pathToExecuteIn is not provided the path will be the current working directory of Cheat Engine.
---@param exePath path # The executable path
---@param parameters string[] # Parameters to supply the executable
---@param pathToExecuteIn? path # The path will be the current working directory for command
---@return string # The output of the command as a string
---@return integer # The exit code as an integer
function runCommand(exePath, parameters, pathToExecuteIn) end

---Calls the given function from the main thread.
---@param callback fun(...: any): ...: any # The function to execute in the main thread
---@param ... any # The parameters to pass to the callback function
---@return any ... # the return values of the given function
function synchronize(callback, ...) return ... end

---Calls the given function from the main thread. 
---
---Does not wait for the result. 
---
---Note: Be sure to synchronize and call checkSynchronize() before freeing the calling thread.
---@param callback fun(...: any): ...: any # The function to execute in the main thread
---@param ... any # The parameters to pass to the callback function
---@return any ... # the return values of the given function
function queue(callback,...) return ... end


---Call this from an infinite loop in the main thread when using threading and synchronize calls. 
---
---This will execute any queued synchronize calls.
---@param timeout? integer # millisecond timeout before interrupting queued synchronize calls.
function checkSynchronize(timeout) end

---Pauses for the number of specified milliseconds (1000= 1 sec...)
---@param milliseconds integer # Milliseconds to pause for
function sleep(milliseconds) end

---Pauses the current opened process.
function pause() end

---Resumes the current opened process
function unpause() end
