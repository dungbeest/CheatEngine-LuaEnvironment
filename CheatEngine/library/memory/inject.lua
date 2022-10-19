---@meta

---Inside Cheat Engine, call a method in a .NET class declared as:
---
---public static int methodname(string parameters).
---
---For the target process version, look into injectDotNetDLL.
---@param pathToDLL path # Path to the DLL containing the method
---@param namespace string # The namespace of the method
---@param className string # The name of the class of the method
---@param methodName string # The method's name
---@param parameters string # The parameters to pass the method in a string
---@return integer # The result of the method invocation
function dotNetExecuteClassMethod(pathToDLL, namespace, className, methodName, parameters) return 0 end


---Injects a dll or dylib.
---
---Same as injectLibrary.
---@param fileName path # The path to file to inject
---@param skipSymbolReloadWait? boolean # Whether to skip waiting for symbol reload
---@return boolean # Whether injection was successful
---@see injectLibrary
function injectDLL(fileName, skipSymbolReloadWait) return true end

---Injects a dll or dylib.
---
---Same as injectDLL.
---@param fileName path # The path to file to inject
---@param skipSymbolReloadWait? boolean # Whether to skip waiting for symbol reload
---@return boolean # Whether injection was successful
---@see injectDLL
function injectLibrary(fileName, skipSymbolReloadWait) return true end

---Injects a .Net DLL.
---
---Specifically targeting a main method.
---@param dllPath path # Path to DLL to inject
---@param fullClassName string # Name of the class to target
---@param methodName string # Method to target
---@param parameterString string # A string with space separated parameters to pass to method
---@param timeout? integer # Milliseconds to wait before timing out
---@return boolean # Whether the method was successfully injected
function injectDotNetDLL(
  dllPath, fullClassName, methodName,
  parameterString, timeout
) return true end


---Executes a stdcall function with 1 parameter at the given address in the target process and wait for it to return.
---@param address SymbolAddress # Address to execute at
---@param parameter? any # A parameter to pass to stdcall function
---@param timeout? integer # Milliseconds to wait before timing out
---@return any # The result of the function that was called
function executeCode(address, parameter, timeout) return 0 end

---Executes a stdcall function with 1 parameter at the given address in the target process and wait for it to return.
---@param address SymbolAddress # Address to execute at
---@param parameter? any # A parameter to pass to stdcall function
---@return any # The result of the function that was called
function executeCodeLocal(address, parameter) return 0 end

---@alias CallMethod integer
---| 0 # stdcall
---| 1 # cdecl

---@alias ParameterType integer
---| 0 # integer
---| 1 # float
---| 2 # double
---| 3 # ascii string (will get converted to a pointer to that string)
---| 4 # wide string (will get converted to a pointer to that string)

---@param callMethod CallMethod # Type of method call to use
---@param timeout integer # Number of milliseconds to wait for a result. nil or -1, infinitely. 0 is no wait (will not free the call memory, so beware of its memory leak)
---@param address SymbolAddress # Address to execute
---@param params table<ParameterType, any> # Table containing the value type, and the value
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeCodeEx(
  callMethod, timeout, address, params
) return 0 end

---@param callMethod CallMethod # Type of method call to use
---@param timeout integer # Number of milliseconds to wait for a result. nil or -1, infinitely. 0 is no wait (will not free the call memory, so beware of its memory leak)
---@param address SymbolAddress # Address to execute
---@param ... any # If parameters are provided without types, CE will guess the type based on the provided type
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeCodeEx(
  callMethod, timeout, address, ...
) return 0 end

---@alias RegisterNumber integer
---| 0 # R/EAX
---| 1 # R/ECX
---| 2 # R/EDX
---| 3 # R/EBX
---| 4 # R/ESP
---| 5 # R/EBP
---| 6 # R/ESI
---| 7 # R/EDI
---| 8 # R8
---| 9 # R9
---| 10 # R10
---| 11 # R11
---| 12 # R12
---| 13 # R13
---| 14 # R14
---| 15 # R15

---@alias ClassInstanceExecute table<RegisterNumber, integer | nil>


---Executes a method.
---If instance is nil it is the same as executeCodeEx.
---@param callMethod CallMethod # Type of method call to use
---@param timeout integer # Number of milliseconds to wait for a result. nil or -1, infinitely. 0 is no wait (will not free the call memory, so beware of its memory leak)
---@param address SymbolAddress # Address to execute
---@param classExecute ClassInstanceExecute # The register to use and the class instance to execute the method on.
---@param params table<ParameterType, any> # Table containing the value type, and the value
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeMethod(
  callMethod, timeout, address, classExecute, params
) return 0 end

---Executes a method.
---If instance is nil it is the same as executeCodeEx.
---@param callMethod CallMethod # Type of method call to use
---@param timeout integer # Number of milliseconds to wait for a result. nil or -1, infinitely. 0 is no wait (will not free the call memory, so beware of its memory leak)
---@param address SymbolAddress # Address to execute
---@param classExecute ClassInstanceExecute # The register to use and the class instance to execute the method on.
---@param ... any # If parameters are provided without types, CE will guess the type based on the provided type
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeMethod(
  callMethod, timeout, address, classExecute, ...
) return 0 end


---Executes a method.
---Since no register number is provided then ECX(1) is picked.
---If instance is nil it is the same as executeCodeEx.
---@param callMethod CallMethod # Type of method call to use
---@param timeout integer # Number of milliseconds to wait for a result. nil or -1, infinitely. 0 is no wait (will not free the call memory, so beware of its memory leak)
---@param address SymbolAddress # Address to execute
---@param classInstance integer | nil # The class instance to execute the method on.
---@param params table<ParameterType, any> # Table containing the value type, and the value
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeMethod(
  callMethod, timeout, address, classInstance, params
) return 0 end

---Executes a method.
---Since no register number is provided then ECX(1) is picked.
---If instance is nil it is the same as executeCodeEx.
---@param callMethod CallMethod # Type of method call to use
---@param timeout integer # Number of milliseconds to wait for a result. nil or -1, infinitely. 0 is no wait (will not free the call memory, so beware of its memory leak)
---@param address SymbolAddress # Address to execute
---@param classInstance integer | nil # The class instance to execute the method on.
---@param ... any # If parameters are provided without types, CE will guess the type based on the provided type
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeMethod(
  callMethod, timeout, address, classInstance, ...
) return 0 end

---Executes a function call.
---@param address SymbolAddress # Address to execute
---@param params table<ParameterType, any> # Table containing the value type, and the value
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeCodeLocalEx(address, params) return 0 end

---Executes a function call.
---@param address SymbolAddress # Address to execute
---@param ... any # If parameters are provided without types, CE will guess the type based on the provided type
---@return integer # The E/RAX value returned by the called function (if no timeout or other interruption)
function executeCodeLocalEx(address, ...) return 0 end
