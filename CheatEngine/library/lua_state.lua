---@meta

---Creates a new clean lua state that will be used. 
---
---NOTE: Does not destroy the old one, so will leak memory. 
function resetLuaState() end


---Retrieves a global variable by key in the main lua state.
---Only basic types are supported. 
---
---Handy for new lua state threads.
---@param string string # The variable key
---@return any # The given variable from the main lua state
function getGlobalVariable(string) end

---Sets a global variable by key in the main lua state.
---
---Only basic types are supported.
---@param string string # The variable key
---@param var any # The value to set
function setGlobalVariable(string, var) end

---Create an integer reference for a lua object
---
---Useful for objects that can only store integers and need to reference lua objects.
---@param object any # lua object to create a reference to
---@return integer # an integer reference that you can use with getRef.
---@see Component.Tag
function createRef(object) end

---Retrieve a lua object by an integer reference created by createRef().
---@param ref integer # The reference integer created via createRef
---@return any # Whatever lua object the reference points to
---@see createRef
function getRef(ref) end

---Destroy a reference to a lua object created by createRef().
---@param ref integer # The reference integer created via createRef
---@see createRef
function destroyRef(ref) end

---Converts a given function into an encoded string that you can pass on to decodeFunction.
---@param f fun() # The function to encode
---@return string # The function as an encoded string
---@see decodeFunction
function encodeFunction(f) end

---Converts an encoded string back into a function.  
---
---Note that the string must be made on the same architecture as it is currently running. 32-bit can only load 32-bit, 64-bit can only load 64-bit.
---
---So either have two scripts ready, or limit to only one architecture. (Like .EXE trainers)
---@param string string # The encoded function from encodeFunction()
---@return fun() # The decoded function
---@see encodeFunction
function decodeFunction(string) end

---Similar to encodeFunction but uses a script instead of 
---a function, and lets you specify which lua DLL to use.
---
---NOTE: Still can't use 32-bit DLL's in 64-bit and vice versa.
---@param string string # The script to encode
---@param pathToDLL? path # Path to lua DLL
---@return string # The script as an encoded string
function encodeFunctionEx(string, pathToDLL) end
