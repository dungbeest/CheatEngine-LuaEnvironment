---@meta


---Abstract class that LuaPipeServer and LuaPipeclient inherit from. 
---
---It implements the data transmission methods.
---Inherits from Object (LuaPipe->Object)
---@class LuaPipe: Object
---@field Connected boolean # True if the pipe is connected
---@field lock fun() # Acquire a re-entrant lock on this pipe until unlock is called. If lock can not be acquired, wait. Recursive calls are allowed
---@field unlock fun() # Release a re-entrant lock on this pipe
---@field writeBytes fun(bytes: ByteTable, size?: integer): integer | nil # Writes the provided byte table to the pipe. if size is not provided, the whole table is sent. Returns the number of bytes sent, or nil on failure
---@field readBytes fun(size: integer): ByteTable | nil # Teturns a byte table from the pipe, or nil on failure
---@field readDouble fun(): double | nil # Read a double from the pipe, nil on failure
---@field readFloat fun(): float | nil # Read a float from the pipe, nil on failure
---@field readQword fun(): qword | nil # Read an 8 byte value from the pipe, nil on failure
---@field readDword fun(): dword | nil # Read a 4 byte value from the pipe, nil on failure
---@field readWord fun(): word | nil # Read a 2 byte value from the pipe, nil on failure
---@field readByte fun(): byte | nil # Read a byte from the pipe, nil on failure
---@field readString fun(size: integer): string | nil # Reads a string from the pipe, nil on failure.  (Can support 0-byte chars)
---@field readWideString fun(size: integer): string | nil # Reads a widestring from the pipe, nil on failure
---@field writeDouble fun(v: double): integer | nil # Writes a double to the pipe. Returns the number of bytes sent, nil on failure
---@field writeFloat fun(v: float): integer | nil # Writes a float to the pipe. Returns the number of bytes sent, nil on failure
---@field writeQword fun(v: qword): integer | nil # Writes an 8 byte value to the pipe. Returns the number of bytes sent, nil on failure
---@field writeDword fun(v: dword): integer | nil # Writes a 4 byte value to the pipe. Returns the number of bytes sent, nil on failure
---@field writeWord fun(v: word): integer | nil # Writes a word to the pipe. Returns the number of bytes sent, nil on failure
---@field writeByte fun(v: byte): integer | nil # Writes a byte to the pipe. Returns the number of bytes sent, nil on failure
---@field writeString fun(str: string, include0Terminator?: boolean): integer | nil # Writes a string to the pipe. If include0Terminator is false or not provided it will not write the 0 terminator byte.  Returns the number of bytes written, or nil on failure
---@field writeWideString fun(str: string, include0terminator?: boolean): integer | nil # Writes a widestring to the pipe. If include0terminator is false or not provided it will not write the 0 terminator bytes. Returns the number of bytes written, or nil on failure


---Class implementing a client that connects to a pipe.
---
---Inherits from LuaPipe (LuaPipeClient->LuaPipe->Object)
---@class LuaPipeClient: LuaPipe


---Class launching the server side of a pipe.
---
---Inherits from LuaPipe (LuaPipeServer->LuaPipe->Object)
---@class LuaPipeServer: LuaPipe
---@field valid boolean # Returns true if the pipe has been created properly. False on failure (e.g wrong pipename)
---@field handle integer # The handle of the pipe serverside (this can be used with duplicateHandle to get a handle into the target process)
---@field acceptConnection fun() # Waits for a client to connect to this pipe (Warning: Freezes the thread this is executed in)


---Inherits from Object (Internet->Object)
---@class Internet: Object
---@field Header string # The additional header to be sent with the next getURL request
---@field getURL fun(path: path): string | nil # Returns a string containing the contents of the url. nil on failure
---@field postURL fun(path: path, urlEncodedData: string): string | nil # Posts the given data to the path and returns the results


---Inherits from Thread (RemoteThread->Thread)
---@class RemoteThread: Thread
---@field Result integer # The 32-bit value returned by the thread 
---@field waitForThread fun(timeout?: integer | nil) # Waits for the thread to finish. Timeout is time in milliseconds. If nil, the timeout is infinite. If 0, it returns without wait


---@class ExecuteCodeExStub

---The remoteExecute class creates an executor thread inside the target process waiting for commands to execute specific functions
---
---An executor can only run one piece of code at a time, but you can have more than one executor
---@class RemoteExecutor
---@field executeStub fun(stub: ExecuteCodeExStub, parameters: any[], timeout: integer, waitUntilDone: boolean) # 



---Opens a pipe with the given name. 
---
---LuaClient.dll functions:  (STDCALL calling machanic, C-Style)
---* BOOL CELUA_Initialize(char *name)
---
---> Initializes CELUA environment
---* UINT_PTR CELUA_ExecuteFunction(char *luacode, UINT_PTR parameter)
---
---> This function executes a lua function with parameters (*parameter*) and with the luacode as body. 
---
---> **parameter** will be treated as an integer.
---
---> In short: `function(parameter) <luacode> end`.
---
---> The return value of this function is the return value of the lua function (integer)
---
---* UINT_PTR CELUA_ExecuteFunctionAsync(char *luacode, UINT_PTR parameter) 
---
---> See **CELUA_ExecuteFunction** but runs in the server thread instead of passing it to the main GUI and then wait for its return
---* integer CELUA_GetFunctionReferenceFromName(char *functionname) 
---
---> Returns a reference ID you can pass on to **CELUA_ExecuteFunctionByReference**
---* UINT_PTR CELUA_ExecuteFunctionByReference(int refid, int paramcount, PVOID *parameters, BOOL async)
---
---> This functions executes the function specified by reference id. If async is true, the code will run in a seperate thread instead of the main thread
---
---> **paramcount** is the number of parameters to pass on to the function.
---
---> **parameters** is a pointer to a list of integers.  32-bit in 32-bit targets, 64-bit in 64-bit targets.
---@param name string # The name of the pipe. The LuaClient.dll needs this name to connect to Cheat Engine
---@return LuaPipeServer # A lua pipe server
function openLuaServer(name) return {} end


---@param pipeName string # The name to give the pipe
---@param timeout integer # Timeout is number of milliseconds before it disconnects on read/write operations. 0 or nil means never
---@return LuaPipeClient | nil # A LuaPipeClient connected to the given pipename. Nil if the connection fails.
function connectToPipe(pipeName, timeout) return {} end

---Creates a LuaPipeServer which can be connected to by a pipe client.
---@param pipeName string # The name to give the pipe
---@param inputSize? integer # Input size defines how much data can be in the input buffer before the writer halts. Default input size is 4096
---@param outputSize? integer # Output size defines how much data can be in the output buffer before the writer halts. Default output size is 4096
---@return LuaPipeServer | nil # A LuaPipeServer which can be connected to by a pipe client
function createPipe(pipeName, inputSize, outputSize) return {} end



---@param string string # The string provided will be the name of the client provided
---@return Internet # An Internet class object.
function getInternet(string) return {} end

---Creates a Remote Thread object.
---@param address Address #
---@param parameter integer #
---@return RemoteThread #
function createRemoteThread(address, parameter) return {} end


---@class ExecuteOptions
---@field type integer # = 5 ??? 
---@field size integer # 
---@field isOutputOnly boolean #
---@field isInputOnly boolean #

---Creates an ExecuteCodeExStub object which the executor can execute.
---@param callMethod CallMethod #
---@param address Address #
---@param classRegisterNr RegisterNumber #
---@param typeNr ParameterType #
---@param options ExecuteOptions #
---@return ExecuteCodeExStub #
function createExecuteMethodStub(callMethod, address, classRegisterNr, typeNr, options) return {} end


---Creates an ExecuteCodeExStub object which the executor can execute.
---@param callMethod CallMethod #
---@param address Address #
---@param typeNr ParameterType #
---@param options ExecuteOptions #
---@return ExecuteCodeExStub #
function createExecuteCodeExStub(callMethod, address, typeNr, options) return {} end


---Creates a new remote executor.
---@return RemoteExecutor # A new remote executor
function createRemoteExecutor() return {} end
