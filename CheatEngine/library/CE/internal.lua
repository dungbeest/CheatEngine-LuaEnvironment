---@meta _


---Bitfield type. Use a bitwise or of any of the options to enable multiple ones at a time.
---@alias dbvmWatchOptions integer
---| 0 # Log the same RIP multiple times (if different registers)
---| 1 # Ignore the size field and log everything in the specified page
---| 2 # Logs record the floating point state
---| 4 # Logs contain a 4KB stack snapshot
---| 8 # Does nothing
---| 16 # If the number of recorded entries gets bigger than the internal entry count, grow the list instead of discarding the entries
---| 32 # <reserved>
---| 64 # DBVMBP. Not a watch! When triggered changes RIP to Optional1 if in UserMode and Optional2 if in Kernelmode.  These addresses need to contain an 0xcc (int3) . If 0 RIP will not be changed, and also not if the current state is not interuptable. Look at dbvm_bp_* functions for more information

---Set the field to nil, or don't define them, if you don't want to change the corresponding registers.
---@class ChangeRegisterInfo
---@field newCF integer | boolean | nil # Carry flag (false = 0, true = 1) 
---@field newPF integer | boolean | nil # Parity flag (false = 0, true = 1) 
---@field newAF integer | boolean | nil # Adjust/Auxiliary flag (false = 0, true = 1) 
---@field newZF integer | boolean | nil # Zero flag (false = 0, true = 1) 
---@field newSF integer | boolean | nil # Signed flag (false = 0, true = 1) 
---@field newOF integer | boolean | nil # Overflow flag (false = 0, true = 1)
---@field newRAX integer | nil # RAX register
---@field newRBX integer | nil # RBX register
---@field newRCX integer | nil # RCX register
---@field newRDX integer | nil # RDX register
---@field newRSI integer | nil # RSI register
---@field newRDI integer | nil # RDI register
---@field newRBP integer | nil # RBP register
---@field newRSP integer | nil # RSP register
---@field newRIP integer | nil # RIP register
---@field newR8 integer | nil # R8 register
---@field newR9 integer | nil # R9 register
---@field newR10 integer | nil # R10 register
---@field newR11 integer | nil # R11 register
---@field newR12 integer | nil # R12 register
---@field newR13 integer | nil # R13 register
---@field newR14 integer | nil # R14 register
---@field newR15 integer | nil # R15 register


---???
---@class BreakpointState

---???
---@class BreakpointInfoShort

---???
---@class BreakpointInfoFull

---???
---@class CR3Log


---Probably similar to ContextTable.
---@class WatchEventData
---@see ContextTable

---???
---@class ThreadEvent

---Probably similar to ContextTable.
---@class TraceEntry
---@see ContextTable

---Options table passed to trace dbvm methods.
---@class TraceOptions
---@field logFPU boolean # Whether to activate logging for Floating Point Unit registers and flags.
---@field logStack boolean # Whether to activate logging for the stack during a trace.

---@alias TraceStatus integer
---| 0 # No trace configured 
---| 1 # Trace configured but not started yet
---| 2 # Trace configured and started
---| 3 # Trace done

---@alias FunctionId integer
---| 0 # OpenProcess compatible address defines: windows_OpenProcess, dbk_OpenProcess
---| 1 # ReadProcessMemory compatible address defines: windows_ReadProcessMemory, dbk_ReadProcessMemory, dbk_ReadPhysicalMemory, dbvm_ReadPhysicalMemory
---| 2 # WriteProcessMemory compatible address defines: windows_WriteProcessMemory, dbk_WriteProcessMemory, dbk_WritePhysicalMemory, dbvm_WritePhysicalMemory
---| 3 # VirtualQueryEx compatible address defines: windows_VirtualQueryEx, dbk_VirtualQueryEx, VirtualQueryExPhysical


---@return boolean # True if the dbk driver is loaded in memory. False if it failed for whatever reason (e.g 64-bit and not booted with unsigned driver support)
function dbk_initialize() end

---Switches the internal pointer of the OpenProcess api to dbk_OpenProcess.
function dbk_useKernelmodeOpenProcess() end

---Switches the internal pointer to the ReadProcessMemory and WriteProcessMemory apis to dbk_ReadProcessMemory and dbk_WriteProcessMemory.
function dbk_useKernelmodeProcessMemoryAccess() end

---Switches the internal pointer to the QueryVirtualMemory api to dbk_QueryVirtualMemory.
function dbk_useKernelmodeQueryMemoryRegions() end

---Changes all memory access to physical memory.
function dbk_usePhysicalMemoryAccess() end

---@param state boolean # When set to true CE's memory scanner will skip hardware device owned memory. Default state is true
function dbk_setSaferPhysicalMemoryScanning(state) end

---@param address Address #
---@param size integer #
---@return ByteTable #
function dbk_readPhysicalMemory(address, size) end

---@param address Address #
---@param byteTable ByteTable #
---@return boolean #
function dbk_writePhysicalMemory(address, byteTable) end

---@param processId integer
---@return integer # Returns the pointer of the EProcess structure of the selected processid
function dbk_getPEProcess(processId) end

---@param threadId integer
---@return integer # Gets the pointer to the EThread structure
function dbk_getPEThread(threadId) end

---Reads the msr
---@param msr any # ???
function dbk_readMSR(msr) end

---Writes the msr
---@param msr any # ???
---@param msrvalue any # ???
function dbk_writeMSR(msr, msrvalue) end

---Executes a routine from kernelmode (e.g a routine written there with auto assembler)
---@param address Address #
---@param parameter Address | any # Can be a value or an address. It's up to your code how it's handled
function dbk_executeKernelMemory(address, parameter) end


---Initializes the dbvm functions (dbk_initialize also calls this) offloados is a boolean that when set will offload the system onto dbvm if it's not yet running (and only IF the dbk driver is loaded)
---@param offloados? boolean
---@param reason? string
function dbvm_initialize(offloados, reason) end

---Sets the keys to operate DBVM.  Key1 and Key3 are pointersize, key2 is 32-bit. 
---
---Note that if key1 or key3 are 64-bit wide, 32-bit CE can not use DBVM.
---@param key1 pointer #
---@param key2 integer #
---@param key3 pointer #
---@return boolean # True if DBVM is working, and automatically updates the current DBVM keys in CE and the driver if DBVM was already connected (e.g default keys)
function dbvm_setKeys(key1, key2, key3) end

---@return integer # The total memory free for DBVM, and the total number of full pages as secondary result
function dbvm_getMemory() end

---Adds memory to DBVM (one page is 4096 bytes)
---@param pageCount integer #
function dbvm_addMemory(pageCount) end

---See dbk_readMSR but then using dbvm
---@param msr any
function dbvm_readMSR(msr) end

---See dbk_writeMSR
---@param msr any # ???
---@param value any # ???
function dbvm_writeMSR(msr, value) end

---@return integer # The real Control Register 4 state
function dbvm_getCR4() return 0 end

---@param address Address #
---@param size integer #
---@return ByteTable #
function dbvm_readPhysicalMemory(address, size) end

---@param address Address #
---@param byteTable ByteTable #
function dbvm_writePhysicalMemory(address, byteTable) end

---Starts watching writes to the given address range
---@param physicalAddress Address
---@param byteSize? integer
---@param options? dbvmWatchOptions
---@param internalEntryCount? integer
---@param optional1 Address
---@param optional2 Address
---@return integer # On success, an ID to use with dbvm_watch_retrievelog and dbvm_watch_disable
function dbvm_watch_writes(
  physicalAddress, byteSize, options, 
  internalEntryCount, optional1, optional2
) return 0 end


---See dbvm_watch_writes but then for reads and writes.
---
---Starts watching reads to the given address range.
---@param physicalAddress Address
---@param byteSize? integer
---@param options? dbvmWatchOptions
---@param internalEntryCount? integer
---@param optional1 Address
---@param optional2 Address
---@return integer # On success, an ID to use with dbvm_watch_retrievelog and dbvm_watch_disable
function dbvm_watch_reads(
  physicalAddress, byteSize, options, 
  internalEntryCount, optional1, optional2
) return 0 end


---See dbvm_watch_writes but then for executesfunction
---
---Starts watching reads to the given address range.
---@param physicalAddress Address
---@param byteSize? integer
---@param options? dbvmWatchOptions
---@param internalEntryCount? integer
---@param optional1 Address
---@param optional2 Address
---@return integer # On success, an ID to use with dbvm_watch_retrievelog and dbvm_watch_disable
function dbvm_watch_executes(
  physicalAddress, byteSize, options, 
  internalEntryCount, optional1, optional2
) return 0 end


---@param id integer # A logging id for watch data. Returned by dbvm_watch_reads, dbvm_watch_executes or dbvm_watch_writes
---@return WatchEventData[] # An array of watch event data. (Context of the system at the time of the event, like registers)
function dbvm_watch_retrievelog(id) end

---Disables the watch operation
---@param id integer # A logging id for watch data. Returned by dbvm_watch_reads, dbvm_watch_executes or dbvm_watch_writes
function dbvm_watch_disable(id) end


---Hides an executable memory range (4096 bytes) from snooping eyes.
---
---Note: It is recommended to cause a copy-on-write on the target first, else this will affect all processes that have this memory block loaded.
---@param physicalBase Address
---@param virtualBase? Address
function dbvm_cloak_activate(physicalBase, virtualBase) end

---Disables the cloak and restores the executable memory to what the system thinks it is.
---@param physicalBase Address
function dbvm_cloak_deactivate(physicalBase) end

---Reads the memory that will get executed. 
---@param physicalBase Address
---@return ByteTable # On success returns a 4096 byte long byte table starting from the base of the page (remember, lua indexes start at 1, so offset 0 is index 1)
function dbvm_cloak_readOriginal(physicalBase) end

---Writes the memory that will get executed. 
---@param physicalBase Address #
---@param byteTable ByteTable # A 4096 byte long byte table starting from the base of the page (remember, lua indexes start at 1, so offset 0 is index 1)
function dbvm_cloak_writeOriginal(physicalBase, byteTable) end

---Sets a breakpoint at the given position. 
---
---When a breakpoint hits the registers will be changed according to the changeRegisterInfo table.
---@param physicalAddress Address
---@param changeRegisterInfo ChangeRegisterInfo
---@param virtualAddress? Address
---@return boolean #
function dbvm_changeregonbp(physicalAddress, changeRegisterInfo, virtualAddress) end

---Disables the changeregonbp breakpoint on an address.
---@param physicalAddress Address
function dbvm_removechangeregonbp(physicalAddress) end

---Sets a int3 breakpoint at the given address after cloaking that page and when hit does a trace.
---@param physicalAddress Address #
---@param stepCount integer #
---@param virtualAddress Address #
---@param secondaryOptions TraceOptions #
function dbvm_traceonbp(physicalAddress, stepCount, virtualAddress, secondaryOptions) end

---@return TraceStatus status # The trace status
---@return integer count # Number of steps the trace currently holds
---@return integer maxCount # The maximum number of steps to limit the trace
function dbvm_traceonbp_getstatus() end

---Requests the trace to stop.
function dbvm_traceonbp_stoptrace() end

---Disables the current trace and removes all results.
---@param pa any # ???
---@param force boolean #
function dbvm_traceonbp_remove(pa, force) end

---Retrieve the trace log for the current trace.
---@return TraceEntry[] # An array of trace entries. (Context of the system at the time of the event, like registers)
function dbvm_traceonbp_retrievelog() end

---@return integer # The number of breakpoint slots currently available
function dbvm_bp_getBrokenThreadListSize() end

---@param id integer # Event id
---@return BreakpointInfoShort # A table with information about the specific breakpoint
function dbvm_bp_getBrokenThreadEventShort(id) end

---@param id integer # Event id
---@return BreakpointInfoFull # A bigger table with full information for a specific breakpoint (fpu and stack)
function dbvm_bp_getBrokenThreadEventFull(id) end

---Sets the state of the frozen thread
---@param id integer # Event id
---@param state BreakpointState #
function dbvm_bp_setBrokenThreadEventFull(id, state) end

---Resumes the specific thread.
---@param id integer # Breakpoint Id
---@param continueMethod BreakpointContinueMethod # 
function dbvm_bp_resumeBrokenThread(id, continueMethod) end

---Returns the process id and thread id of the provided threadEvent. 
---
---On failure processid will be nil, and thread id will contain text.
---@param threadEvent ThreadEvent #
---@return integer | nil processId #
---@return integer | string threadId #
function dbvm_bp_getProcessAndThreadIDFromEvent(threadEvent) end

---Tells DBVM to record (up to 512) unique CR3 values it encounters
function dbvm_log_cr3_start() end

---Stops the logging.
---@return CR3Log # The results of CR3 logging as a table
function dbvm_log_cr3_stop() end

---Changes the speed the timestamp counter goes up (similar to speedhack in a process but affects the whole system including the clock)
---@param speed number # Timestamp counter multiplier
function dbvm_speedhack_setSpeed(speed) end

---Adjust the TSC.
---
---A high timeout can make your system unstable.
---@param enabled boolean # Whether to adjust TSC (default true with timeout 2000)
---@param timeout integer # The timeout is the number of actual TSC to watch else the actual time is given. 
---@return integer | nil # If enabled, will return a small(20-30) timestamp between multiple rdtsc/rdtscp instructions.
function dbvm_setTSCAdjust(enabled, timeout) end

---@return integer # Control Register 0
function dbk_getCR0() end

---@return integer # Control Register 3 of the currently opened process (Note: This will also work without dbk when only dbvm is loaded)
function dbk_getCR3() end

---@return integer # Control Register 4
function dbk_getCR4() end

---@param address Address # A virtual address
---@return Address # The physical address of the given address
function dbk_getPhysicalAddress(address) end

---@param state boolean # Set to true if you do not wish to initiate copy-on-write behaviour
function dbk_writesIgnoreWriteProtection(state) end


---Looks up the physical address for the given virtual address in the given pagetable base.
---@param CR3 integer # The CR3 register
---@param address Address # The virtual address
---@return Address | nil # The physical address or nil if not paged
function getPhysicalAddressCR3(CR3, address) end

---Reads the virtual memory of the given process's CR3 value. Returns a bytetable on success, nil if fail to read (paged out)
---@param CR3 integer # The CR3 register
---@param address Address # The virtual address
---@param size integer #
---@return ByteTable #
function readProcessMemoryCR3(CR3, address, size) end

---Reads the virtual memory of the given process's CR3 value
---@param CR3 integer # The CR3 register
---@param address Address # The virtual address
---@param bytetable ByteTable #
function writeProcessMemoryCR3(CR3, address, bytetable) end


---Allocates a block of nonpaged memory and returns the address.
---@param size integer #
---@return Address #
function allocateKernelMemory(size) end

---Frees the given memory region.
---@param address Address #
function freeKernelMemory(address) end

---maps a specific address to the usermode context from the given PID to the given PID. If the PID is 0 or not specified, the cheat engine process is selected. This functions returns 2 results. Address and MDL. The MDL you will need for unmapMemory()
---@param address Address
---@param size integer
---@param fromPID? integer
---@param toPID? integer
---@return integer, MemoryDescriptorList #
function mapMemory(address, size, fromPID, toPID) end

---@param address Address
---@param mdl MemoryDescriptorList
function unmapMemory(address, mdl) end


---Registers a callback when an api pointer is changed (can happen when the user clicks ok in settings, or when dbk_use*** is used. Does NOT happen when setAPIPointer is called)
---@param onAPIPointerChange function #
function onAPIPointerChange(onAPIPointerChange) end


---Sets the pointer of the given api to the given address. The address can be a predefined address set at initialization by Cheat Engine, or an address you got from an autoassembler script or injected dll (When Cheat Engine itself was targeted)
---@param functionId FunctionId #
---@param address Address #
function setAPIPointer(functionId, address) end


---Address of the NtOpenProcess implementation in DBK32
---@type Address
dbk_NtOpenProcess = 0


---The dbvm_ addresses should only be used with auto assembler scripts injected into Cheat Engine
---
---Address of function. DWORD; stdcall calling convention;
---@type Address
dbvm_block_interrupts = 0

---The dbvm_ addresses should only be used with auto assembler scripts injected into Cheat Engine
---
---Address of function. DWORD; stdcall calling convention;
---@type Address
dbvm_raise_privilege = 0

---The dbvm_ addresses should only be used with auto assembler scripts injected into Cheat Engine
---
---Address of function. DWORD; stdcall calling convention;
---@type Address
dbvm_restore_interrupts = 0


---The dbvm_ addresses should only be used with auto assembler scripts injected into Cheat Engine
---
---Address of function(cs,ss,ds,es,fs,gs: dword): DWORD; stdcall calling convention;
---@type Address
dbvm_changeselectors = 0
