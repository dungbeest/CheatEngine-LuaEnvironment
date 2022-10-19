---@meta

---Debug globals variables
---EFLAGS


---32-bit globals

---@type dword
EAX = 0

---@type dword
EBX = 0

---@type dword
ECX = 0

---@type dword
EDX = 0

---@type dword
EDI = 0

---@type dword
ESI = 0

---@type dword
EBP = 0

---@type dword
ESP = 0

---@type dword
EIP = 0


---64-bit only globals 

---@type qword
RAX = 0

---@type qword
RBX = 0

---@type qword
RCX = 0

---@type qword
RDX = 0

---@type qword
RDI = 0

---@type qword
RSI = 0

---@type qword
RBP = 0

---@type qword
RSP = 0

---@type qword
RIP = 0

---@type qword
R8 = 0

---@type qword
R9 = 0

---@type qword
R10 = 0

---@type qword
R11 = 0

---@type qword
R12 = 0

---@type qword
R13 = 0

---@type qword
R14 = 0

---@type qword
R15 = 0


---128-bit vector globals

---32-bit available

---@type qword
XMM0 = 0

---@type qword
XMM1 = 0

---@type qword
XMM2 = 0

---@type qword
XMM3 = 0

---@type qword
XMM4 = 0

---@type qword
XMM5 = 0

---@type qword
XMM6 = 0

---@type qword
XMM7 = 0

---64-bit available

---@type qword
XMM8 = 0

---@type qword
XMM9 = 0

---@type qword
XMM10 = 0

---@type qword
XMM11 = 0

---@type qword
XMM12 = 0

---@type qword
XMM13 = 0

---@type qword
XMM14 = 0

---@type qword
XMM15 = 0


---80-bit Floating point globals

---@type number
FP0 = 0

---@type number
FP1 = 0

---@type number
FP2 = 0

---@type number
FP3 = 0

---@type number
FP4 = 0

---@type number
FP5 = 0

---@type number
FP6 = 0

---@type number
FP7 = 0


---Debug related routines:

---When a breaking breakpoint hits (that includes single stepping) and the lua function debugger_onBreakpoint() is defined it will be called and the global variables EAX, EBX, .... will be filled in.
---@return integer # Return 0 if you want the user interface to be updated and anything else if not (e.g: You continued from the breakpoint in your script)
function debugger_onBreakpoint() return 0 end



---Creates a process. 
---@param path path # Path to dll/executable with entryPoint to create process
---@param parameters? string # Parameter string to pass to new process
---@param debug? boolean # If true process will be created using the windows debugger
---@param breakOnEntryPoint? boolean # If true process will cause a breakpoint to occur on entrypoint
function createProcess(
    path, parameters, debug, breakOnEntryPoint
) end

---@alias DebugInterface integer
---| 0 # Default interface
---| 1 # Windows Debug interface
---| 2 # VEH Debug interface
---| 3 # Kernel Debug interface

---Starts the debugger for the currently opened process (won't ask the user).
---@param interface? DebugInterface # Debug interface to use. Defaults to default interface
function debugProcess(interface) end

---@return boolean # If the debugger has been started
function debug_isDebugging() return true end

---@return DebugInterface | nil # The current debuggerinterface used. nil means no debugging active
function debug_getCurrentDebuggerInterface() return 0 end

---@return boolean # If there is a possibility the target can stop on a breakpoint (Cheat Engine version 6.4+)
function debug_canBreak() return true end


---@return boolean # If the debugger is currently halted on a thread
function debug_isBroken() return true end

---@return boolean # If the debugger was single stepping an instruction earlier
function debug_isStepping() return true end

---@return Address[] # A lua table containing all the breakpoint addresses
function debug_getBreakpointList() return {} end

---Breaks the thread with the specific threadID
---@param threadID integer # ThreadID for the thread to break (Note: The thread may not break instantly and may have to be awakened first)
function debug_breakThread(threadID) end

---This will cause breakpoints on the provided thread to be ignored.
---@param threadID integer # ThreadID for the thread to suspend breaks on
function debug_addThreadToNoBreakList(threadID) end

---Remove a thread from the list of threads ignoring breakpoints.
---@param threadID integer # ThreadID for the thread to restore breaks on
function debug_removeThreadFromNoBreakList(threadID) end



---Sets a breakpoint of a specific size at the given address for the specified thread. if trigger is bptExecute then size is ignored. If trigger is ignored then it will be of type bptExecute, which obviously also ignores the size then as well.  (Other triggers are bptAccess and bptWrite)
---@param threadID integer #
---@param address SymbolAddress #
---@param size? integer #
---@param trigger? BreakpointTrigger #
---@param breakPointMethod? BreakpointMethod #
---@param callback? function #
function debug_setBreakpointForThread(
    threadID, address, size, trigger,
    breakPointMethod, callback
) end

---comment
---@param address SymbolAddress #
---@param size? integer #
---@param trigger? string #
---@param breakPointMethod? BreakpointMethod #
---@param callback? function #
---@overload fun(address: SymbolAddress, size?: integer, trigger?: string, callback: function)
---@overload fun(address: SymbolAddress, callback: function)
function debug_setBreakpoint(
    address, size, trigger,
    breakPointMethod, callback
) end

---If the given address is a part of a breakpoint it will be removed.
---@param address SymbolAddress # The address to remove a breakpoint at
function debug_removeBreakpoint(address) end

---If the debugger is currently waiting to continue you can continue with this.
---@param continueMethod BreakpointContinueMethod # The method to continue the debug
function debug_continueFromBreakpoint(continueMethod) end


---XMM registers can be from 0 to 15 on 64-bit platforms or 0 to 7 on 32-bit platforms.
---@alias XMMRegister integer
---| 0 # XMM0
---| 1 # XMM1
---| 2 # XMM2
---| 3 # XMM3
---| 4 # XMM4
---| 5 # XMM5
---| 6 # XMM6
---| 7 # XMM7
---| 8 # XMM8
---| 9 # XMM9
---| 10 # XMM10
---| 11 # XMM11
---| 12 # XMM12
---| 13 # XMM13
---| 14 # XMM14
---| 15 # XMM15

---@param xmmRegister XMMRegister # The xmm register to get
---@return Address # The address of the specified xmm register of the thread that is currently stopped. This is a LOCAL Cheat Engine address. Use Local memory access functions to read and modify
function debug_getXMMPointer(xmmRegister) return 0 end


---The following routines describe last branch recording. These functions only work when kernelmode debugging is used and using windows XP (vista and later work less effective or not at all because the operating system interferes.  Might also be intel specific. A dbvm upgrade in the future might make this work for windows vista and later)


---@param boolean boolean # When set the Kernel debugger will try to record the last branch(es) taken before a breakpoint happens
function debug_setLastBranchRecording(boolean) end


---@return integer # The maximum branch record your cpu can store (-1 if none)
function debug_getMaxLastBranchRecord() return 0 end


---@param index integer # Index of last branch record to get
---@return integer # The value of the Last Branch Record at the given index (when handling a breakpoint)
function debug_getLastBranchRecord(index) return 0 end


---Defines a module load event handler.
---
---This routine is called when a module is loaded. 
---
---Only works for the windows debugger.
---@param moduleName string # The module name of the module loaded for debug
---@param baseAddress Address # The base address of the module loaded
---@return integer # Return 1 if you want to cause the debugger to break
function debugger_onModuleLoad(moduleName, baseAddress) return 0 end


---Changing registers:
---When the debugger is waiting to continue you can change the register variables.
---When you continue those register values will be set in the thread's context




---Fills the global variables for the regular registers with current context.
---
---If the target is currently stopped on a breakpoint, but not done through an onBreakpoint function, the context won't be set.
---
---You can get and set the context back with these functions before execution continues.
---@param extraRegisters boolean # If true will also set FP0 to FP7 and XMM0 to XMM15.
function debug_getContext(extraRegisters) end

---Uses the global variables for the regular registers to set context for debug session.
---
---If the target is currently stopped on a breakpoint, but not done through an onBreakpoint function, the context won't be set.
---
---You can get and set the context back with these functions before execution continues.
---@param extraRegisters boolean # If true will also set FP0 to FP7 and XMM0 to XMM15.
function debug_setContext(extraRegisters) end

---Will refresh the userinterface to reflect the new context if the debugger was stopped on a breakpoint.
function debug_updateGUI() end


---Detaches the debugger from the target process (if it was attached).
function detachIfPossible() end

