---@meta


---@enum ASMPreferences
CE_defines_asm_preferences = {
  apNone  = 0,
  apShort = 1,
  apLong  = 2,
  apFar   = 3,
}

---Affects relative offset instructions to prefer different offset sizes. Short jumps for example are faster and more compact than long jumps.
---@alias ASMPreference
---| 0 # apNone
---| 1 # apShort
---| 2 # apLong
---| 3 # apFar

---???
---@class DisableInfo


---Assembles a single line of code and returns a byte array of the generated code.
---@param line string # Line of code
---@param address? SymbolAddress # The address to assemble this code at
---@param assemblePreference? ASMPreferences # What relative offset instructions to prefer.
---@param skipRangeCheck? boolean # Whether will skip range checks if true and just assembles it, no matter of how wrong the result will be. Defaults to false
---@return ByteTable # The generated byte code.
function assemble(
  line, address, assemblePreference, skipRangeCheck
) return { 0 } end

---Disassembles the instruction at a given address.
---@param address SymbolAddress # Address to disassemble code
---@return string # a string in the format of "address - bytes - opcode : extra"
function disassemble(address) return "" end

---Splits a disassembled string into its 4 possible components.
---
---See disassemble
---@param disassembledString string # A disassembled string in the format of "address - bytes - opcode : extra"
---@return string # The address of the instruction
---@return string # The bytes of the instruction
---@return string # The opcode of the instruction
---@return string # The extra field of the instruction
---@see disassemble
function splitDisassembledString(disassembledString)
  return "", "", "", ""
end

---Disassembles the instruction at the supplied address and returns the number of bytes.
---@param address SymbolAddress # Address to disassemble code
---@return integer # The size of an instruction
function getInstructionSize(address) return 0 end

---@param address SymbolAddress # Address to disassemble code
---@return Address # The address of the previous opcode (this is just an estimated guess)
function getPreviousOpcode(address) return 0 end



---Runs the auto assembler with the given text.
---@param script string # AA Script to assemble
---@param targetSelf? boolean # If targetself is set it will assemble into Cheat Engine itself
---@param disableInfo? DisableInfo # If disableInfo is provided the [Disable] section of the AA Script will be handled
---@return boolean # True on success
---@return DisableInfo | nil # When successful, returns a table you can use when disabling
---@overload fun(script: string, disableInfo?: DisableInfo): boolean, DisableInfo
function autoAssemble(script, targetSelf, disableInfo)
  return true, {}
end

---Checks the script for syntax errors.
---@param script string # AA Script to assemble
---@param enable boolean # 
---@param targetSelf? boolean # If targetself is set it will assemble into Cheat Engine itself
---@return boolean # True on success, False with an error message on failure
---@return string | nil # Error message on failure
function autoAssembleCheck(script, enable, targetSelf) end

---Compiles C code.
---@param code string # C code to compile
---@param address? SymbolAddress # Address to compile into
---@param targetSelf? boolean # If targetself is set it will assemble into Cheat Engine itself
---@return Address[] | nil # a table with the addresses of the symbols on success, or nil with a secondary result containing the error message
---@return string | nil # Error message on failure
---@overload fun(scripts: string[], address?: SymbolAddress, targetSelf?: boolean): Address[] | nil, string | nil
function compile(code, address, targetSelf)
  return { 0 }, ""
end

---Compiles C code as an indexed list of files
---@param fileList path[] # The indexed list of C source files
---@param address? SymbolAddress # Address to compile into
---@param targetSelf? boolean # If targetself is set it will assemble into Cheat Engine itself
---@return Address[] | nil # a table with the addresses of the symbols on success, or nil with a secondary result containing the error message
---@return string | nil # Error message on failure
function compileFiles(fileList, address, targetSelf)
  return { 0 }, ""
end

---Compiles the TCC library functions some C code may need to function internally
function compileTCCLib() end

---Adds an extra default include path for the compile() function
---@param path path # Path to the extra include for C compilation
function addCIncludePath(path) end

---Removes a specific path previously added with addCIncludePath
---@param path path # Path of the extra include to remove from C include path
function removeCIncludePath(path) end

---Compiles C# code. 
---
---NOTE: This requires .NET 4 to be installed, even if the target is mono.  Tip: Handy with injectDotNetDLL
---@param code string # C# code
---@param references string[] # A list of c# assemblies this code may reference
---@param coreAssembly? string # Core c# assembly to use
---@return path # The autogenerated filename. This file will be deleted when CE closes (or next time another CE closes and it's not in use anymore)
function compileCS(code, references, coreAssembly) return "" end
