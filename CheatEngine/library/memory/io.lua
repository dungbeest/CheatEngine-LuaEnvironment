---@meta

-------------------------- Memory Ops -------------------------

---@alias CopyMethod
---| 0 # Copy from target process to target process
---| 1 # Copy from target process to CE Memory
---| 2 # Copy from CE Memory to target process
---| 3 # Copy from CE Memory to CE Memory

---Copies memory from the given address to the destination address.
---@param sourceAddress SymbolAddress The address to copy from
---@param size integer The size of the memory block to copy
---@param destinationAddress? SymbolAddress # If no destinationAddress is given(or nil), CE will allocate a random address for you
---@param method? CopyMethod # An enum defining the copy semantics, nil is treated same as 0.
---@return Address | nil # The address of the copy on success, nil on failure
function copyMemory(
  sourceAddress, size, destinationAddress, method
) return 0 end

---@alias CompareMethod
---| 0 # Target to Target
---| 1 # Address1=Target Address2=CE
---| 2 # Address1=CE Address2=CE

---Compares the memory in the blocks at address1 and address2.
---@param address1 SymbolAddress # The first address
---@param address2 SymbolAddress # The second address
---@param size integer # The size of the memory block to compare
---@param method CompareMethod # An enum defining the comparison semantics
---@return boolean # True if the memory blocks are the same
---@return integer # An index (number of bytes from the start addresses) where the first disparity is if the blocks are different
function compareMemory(address1, address2, size, method)
    return false, 0
end

--------------------------- Bytes -----------------------------

---Reads the bytes at the given address.
---@param address SymbolAddress # Address to read the bytes from
---@param byteCount integer # Number of bytes to read
---@param returnAsTable? boolean # If ReturnAsTable is true it will return a table instead of multiple bytes
---@return ByteTable | byte ... # The read out bytes at the given address
function readBytes(address, byteCount, returnAsTable)
  if returnAsTable then return 0, 0, 0, 0 else return {0, 0, 0, 0} end
end

---Similar to readBytes but applies to Cheat Engine process' own memory.
---
---Reads the bytes at the given address.
---@param address SymbolAddress # Address to read the bytes from
---@param byteCount integer # Number of bytes to read
---@param returnAsTable? boolean # If ReturnAsTable is true it will return a table instead of multiple bytes
---@return ByteTable | byte ... # The read out bytes at the given address
---@see readBytes
function readBytesLocal(address, byteCount, returnAsTable)
    if returnAsTable then return 0, 0, 0, 0 else return {0, 0, 0, 0} end
end

---Write the given bytes to the given address from variable argument bytes.
---@param address SymbolAddress # Address to write the bytes to
---@param ... byte # Bytes to write
function writeBytes(address, ...) end

---Write the given bytes to the given address from a table.
---@param address SymbolAddress # Address to write the bytes to
---@param table ByteTable # Bytes to write
function writeBytes(address, table) end


---Similar to writeBytes but applies to Cheat Engine process' own memory.
---
---Write the given bytes to the given address from variable argument bytes.
---@param address SymbolAddress # Address to write the bytes to
---@param ... byte # Bytes to write
---@see writeBytes
function writeBytesLocal(address, ...) return true end

---Similar to writeBytes but applies to Cheat Engine process' own memory.
---
---Write the given bytes to the given address from a table.
---@param address SymbolAddress # Address to write the bytes to
---@param table ByteTable # Bytes to write
---@see writeBytes
function writeBytesLocal(address, table) return true end


------------------- Numeric and String ------------------------

-------------------------- Reads ------------------------------

---Reads a 8-bit integer from the specified address
---@param address SymbolAddress # Address to read the byte from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFE = 254 = -2)
---@return byte # The read out byte at the given address
function readByte(address, signed) return 0 end

---Similar to readByte but applies to Cheat Engine process' own memory.
---Reads a 8-bit integer from the specified address
---@param address SymbolAddress # Address to read the byte from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFE = 254 = -2)
---@return byte # The read out byte at the given address
---@see readByte
function readByteLocal(address, signed) return 0 end


---Reads a 8-bit integer from the specified address
---@param address SymbolAddress # Address to read the byte from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFE = 254 = -2)
---@return byte # The read out byte at the given address
function readShortInteger(address, signed) return 0 end


---Similar to readShortInteger but applies to Cheat Engine process' own memory.
---Reads a 8-bit integer from the specified address
---@param address SymbolAddress # Address to read the byte from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFE = 254 = -2)
---@return byte # The read out byte at the given address
---@see readShortInteger
function readShortIntegerLocal(address, signed) return 0 end


---Reads a 16-bit integer from the specified address
---@param address SymbolAddress # Address to read the integer from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFFFE = 65534 = -2)
---@return word # The read out integer (word in x86) at the given address
function readSmallInteger(address, signed) return 0 end

---Similar to readSmallInteger but applies to Cheat Engine process' own memory.
---Reads a 16-bit integer from the specified address
---@param address SymbolAddress # Address to read the integer from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFFFE = 65534 = -2)
---@return word # The read out integer (word in x86) at the given address
---@see readSmallInteger
function readSmallIntegerLocal(address, signed) return 0 end


---Reads a 32-bit integer from the specified address
---@param address SymbolAddress # Address to read the integer from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFFFFFFFE = 4294967294 = -2)
---@return dword # The read out integer (dword in x86) at the given address
function readInteger(address, signed) return 0 end

---Similar to readInteger but applies to Cheat Engine process' own memory.
---Reads a 32-bit integer from the specified address
---@param address SymbolAddress # Address to read the integer from
---@param signed? boolean # whether to return the value as signed (e.g. 0xFFFFFFFE = 4294967294 = -2)
---@return dword # The read out integer (dword in x86) at the given address
---@see readInteger
function readIntegerLocal(address, signed) return 0 end


---Reads a 64-bit integer from the specified address
---
---Qword cannot be returned as unsigned because it's the max native size for lua integer.
---@param address SymbolAddress # Address to read the integer from
---@return qword # The read out integer (qword in x86) at the given address
function readQword(address) return 0 end


---Similar to readQword but applies to Cheat Engine process' own memory.
---Reads a 64-bit integer from the specified address
---
---Qword cannot be returned as unsigned because it's the max native size for lua integer.
---@param address SymbolAddress # Address to read the integer from
---@return qword # The read out integer (qword in x86) at the given address
---@see readQword
function readQwordLocal(address) return 0 end


---Reads an integer pointer from the specified address
---
---In a 64-bit target this equals readQword. 
---
---In a 32-bit target readInteger.
---@param address SymbolAddress # Address to read the integer from
---@return dword | qword # The read out integer (dword in x86 or qword in x64) at the given address
function readPointer(address) return 0 end

---Similar to readPointer but applies to Cheat Engine process' own memory.
---Reads an integer pointer from the specified address
---
---In a 64-bit target this equals readQword. 
---
---In a 32-bit target readInteger.
---@param address SymbolAddress # Address to read the integer from
---@return dword | qword # The read out integer (dword in x86 or qword in x64) at the given address
---@see readPointer
function readPointerLocal(address) return 0 end


---Reads a single precision floating point value from the specified address
---@param address SymbolAddress # Address to read the float from
---@return float # The read out single precision floating point value at the given address
function readFloat(address) return 0.0 end


---Similar to readFloat but applies to Cheat Engine process' own memory.
---Reads a single precision floating point value from the specified address
---@param address SymbolAddress # Address to read the float from
---@return float # The read out single precision floating point value at the given address
---@see readFloat
function readFloatLocal(address) return 0.0 end


---Reads a double precision floating point value from the specified address
---@param address SymbolAddress # Address to read the double from
---@return double # The read out double precision floating point value at the given address
function readDouble(address) return 0.0 end


---Similar to readDouble but applies to Cheat Engine process' own memory.
---Reads a double precision floating point value from the specified address
---@param address SymbolAddress # Address to read the double from
---@return double # The read out double precision floating point value at the given address
---@see readDouble
function readDoubleLocal(address) return 0.0 end


---Reads a string till it encounters a 0-terminator.
---@param address SymbolAddress # Address to read the string from
---@param maxLength integer # maximum length of the string to read. Set low so you won't freeze for too long, set to 6000 if you don't care too much. 
---@param wideChar? boolean # Set to true if the text is encoded using a widechar formatting
---@return string # A null-terminated string.
function readString(address, maxLength, wideChar) return "" end

---Similar to readString but applies to Cheat Engine process' own memory.
---Reads a string till it encounters a 0-terminator.
---@param address SymbolAddress # Address to read the string from
---@param maxLength integer # maximum length of the string to read. Set low so you won't freeze for too long, set to 6000 if you don't care too much. 
---@param wideChar? boolean # Set to true if the text is encoded using a widechar formatting
---@return string # A null-terminated string.
---@see readString
function readStringLocal(address, maxLength, wideChar) return "" end


-------------------------- Writes -----------------------------

---Writes a 8-bit integer to the specified address.
---@param address SymbolAddress # Address to write the byte to
---@param value byte # Byte to write
---@return boolean # True on success
function writeShortInteger(address, value) return true end

---Similar to writeShortInteger but applies to Cheat Engine process' own memory.
---Writes a 8-bit integer to the specified address.
---@param address SymbolAddress # Address to write the byte to
---@param value byte # Byte to write
---@return boolean # True on success
---@see writeShortInteger
function writeShortIntegerLocal(address, value) return true end


---Writes a 8-bit integer to the specified address.
---@param address SymbolAddress # Address to write the byte to
---@param value byte # Byte to write
---@return boolean # True on success
function writeByte(address, value) return true end

---Similar to writeByte but applies to Cheat Engine process' own memory.
---Writes a 8-bit integer to the specified address.
---@param address SymbolAddress # Address to write the byte to
---@param value byte # Byte to write
---@return boolean # True on success
---@see writeByte
function writeByteLocal(address, value) return true end


---Writes a 16-bit integer to the specified address.
---@param address SymbolAddress # Address to write the word to
---@param value word # Word to write
---@return boolean # True on success
function writeSmallInteger(address, value) return true end

---Similar to writeSmallInteger but applies to Cheat Engine process' own memory.
---Writes a 16-bit integer to the specified address.
---@param address SymbolAddress # Address to write the word to
---@param value word # Word to write
---@return boolean # True on success
---@see writeSmallInteger
function writeSmallIntegerLocal(address, value) return true end


---Writes a 32-bit integer to the specified address.
---@param address SymbolAddress # Address to write the dword to
---@param value dword # Dword to write
---@return boolean # True on success
function writeInteger(address, value) return true end

---Similar to writeInteger but applies to Cheat Engine process' own memory.
---Writes a 32-bit integer to the specified address.
---@param address SymbolAddress # Address to write the dword to
---@param value dword # Dword to write
---@return boolean # True on success
---@see writeInteger
function writeIntegerLocal(address, value) return true end


---Writes a 64-bit integer to the specified address.
---@param address SymbolAddress # Address to write the qword to
---@param value qword # Qword to write
---@return boolean # True on success
function writeQword(address, value) return true end


---Similar to writeQword but applies to Cheat Engine process' own memory.
---Writes a 64-bit integer to the specified address.
---@param address SymbolAddress # Address to write the qword to
---@param value qword # Qword to write
---@return boolean # True on success
---@see writeQword
function writeQwordLocal(address, value) return true end


---Writes an integer pointer to the specified address.
---
---In a 64-bit target this equals writeQword. 
---
---In a 32-bit target writeInteger.
---@param address SymbolAddress # Address to write the pointer (dword in x86 or qword in x64) to
---@param value dword | qword # The pointer (dword in x86 or qword in x64) to write
---@return boolean # True on success
function writePointer(address, value) return true end


---Similar to writePointer but applies to Cheat Engine process' own memory.
---Writes an integer pointer to the specified address.
---
---In a 64-bit target this equals writeQword. 
---
---In a 32-bit target writeInteger.
---@param address SymbolAddress # Address to write the pointer (dword in x86 or qword in x64) to
---@param value dword | qword # The pointer (dword in x86 or qword in x64) to write
---@return boolean # True on success
---@see writePointer
function writePointerLocal(address, value) return true end


---Writes a single precision floating point to the specified address.
---@param address SymbolAddress # Address to write the float to
---@param value float # The single precision floating point value to write
---@return boolean # True on success
function writeFloat(address, value) return true end

---Similar to writeFloat but applies to Cheat Engine process' own memory.
---Writes a single precision floating point to the specified address.
---@param address SymbolAddress # Address to write the float to
---@param value float # The single precision floating point value to write
---@return boolean # True on success
---@see writeFloat
function writeFloatLocal(address, value) return true end

---Writes a double precision floating point to the specified address.
---@param address SymbolAddress # Address to write the double to
---@param value double # The double precision floating point value to write
---@return boolean # True on success
function writeDouble(address, value) return true end

---Similar to writeDouble but applies to Cheat Engine process' own memory.
---Writes a double precision floating point to the specified address.
---@param address SymbolAddress # Address to write the double to
---@param value double # The double precision floating point value to write
---@return boolean # True on success
---@see writeDouble
function writeDoubleLocal(address, value) return true end


---Write a string to the specified address.
---@param address SymbolAddress # Address to write the string to
---@param string string # The string to write
---@param wideChar? boolean # Set to true if the text is encoded using a widechar formatting
---@return boolean # True on success
function writeString(address, string, wideChar) return true end


---Similar to writeString but applies to Cheat Engine process' own memory.
---Write a string to the specified address.
---@param address SymbolAddress # Address to write the string to
---@param string string # The string to write
---@param wideChar? boolean # Set to true if the text is encoded using a widechar formatting
---@return boolean # True on success
---@see writeString
function writeStringLocal(address, string, wideChar) return true end


------------------------Memory Regions-------------------------


---Each entry consists out of: BaseAddress, AllocationBase, AllocationProtect, RegionSize, State, Protect, Type
---@class MemoryRegion
---@field BaseAddress Address #
---@field AllocationBase integer #
---@field AllocationProtect integer #
---@field RegionSize integer #
---@field State integer #
---@field Protect integer #
---@field Type integer #


---@return MemoryRegion[] # An indexed table containing the  entire memory layout.
function enumMemoryRegions()
  return {
    {
      BaseAddress = 0,
      AllocationBase = 0,
      AllocationProtect = 0,
      RegionSize = 0,
      State = 0,
      Protect = 0,
      Type = 0
    }
  }
end

---Writes the given memory block to a file.
---@param fileName path # File path to write to
---@param sourceAddress SymbolAddress # Address to write from
---@param size integer # Size of the memory block
---@return integer # Number of bytes written
function writeRegionToFile(fileName, sourceAddress, size)
  return 0
end

---Reads an entire memory block from a file to the given address.
---@param fileName path # File path to read from
---@param destinationAddress SymbolAddress # Address to read from
---@return integer # Number of bytes read
function readRegionFromFile(fileName, destinationAddress)
  return 0
end

---A table containing information about each module in the current process, or the specified processid
---@class ModuleInfo
---@field Name string # String containing the modulename
---@field Address Address # Integer representing the address the module is loaded at
---@field Is64Bit boolean # Boolean set to true if it's a 64-bit module
---@field PathToFile path # Path to the location this module is loaded from

---Enumerates all modules loaded by a process.
---@param processID? integer # The process ID to scan for modules. If not defined, defaults to current opened process
---@return ModuleInfo[] # The modules loaded by the process
function enumModules(processID)
  return {
    {
      Name = "",
      Address = 0,
      Is64Bit = true,
      PathToFile = ""
    }
  }
end



---MD5 digest of a block of memory.
---@param address SymbolAddress # The address to start from
---@param size integer # Size of block of memory
---@return string # MD5 digest string
function md5memory(address, size) return "" end

---MD5 digest of a file.
---@param pathToFile path # Path to file
---@return string # MD5 digest string
function md5file(pathToFile) return "" end


---@param string string # The string to hash
---@return string # An md5 hash string from the provided string
function stringToMD5String(string) return "" end

---@param address SymbolAddress # Address to get comment from
---@return string # The user defined comment at the specified address
function getComment(address) return "" end

---Sets a userdefined comment at the specified address. %s is used to display the autoguess value if there is one
---@param address SymbolAddress # Address to set comment on
---@param text string # User defined comment string to set
function setComment(address, text) end


---???
---@class Header

---Gets the user defined header at the specified address.
---@param address SymbolAddress # Address to get header from
---@return Header # The user defined header at specified address
function getHeader(address) return {} end

---Sets the userdefined header at the specified address.
---@param address SymbolAddress # Address to set header to
function setHeader(address) end
