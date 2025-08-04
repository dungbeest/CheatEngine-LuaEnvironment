---@meta _


---Inherits from Object (Stream->Object)
---@class Stream: Object
---@field Size integer #
---@field Position integer #
local Stream = {}

---Copies count bytes from the given stream to this stream
---@param stream Stream
---@param count integer
function Stream.copyFrom(stream, count) end

---This increases the position of the stream.
---@param count integer
---@return ByteTable A byte table containing the bytes of the stream.
function Stream.read(count) end

---Writes the given bytetable to the stream.
---@param byteTable ByteTable
---@param count? integer
function Stream.write(byteTable, count) end

---@return byte
function Stream.readByte() end

---@param byte byte
function Stream.writeByte(byte) end

---@return word
function Stream.readWord() end

---@param word word
function Stream.writeWord(word) end

---@return dword
function Stream.readDword() end

---@param dword dword
function Stream.writeDword(dword) end

---@return qword
function Stream.readQword() end

---@param qword qword
function Stream.writeQword(qword) end

---@return string
function Stream.readAnsiString() end

---@param string string
function Stream.writeAnsiString(string) end


---Inherits from Stream (MemoryStream->Stream->Object)
---@class MemoryStream: Stream
---@field Memory Address # The address in Cheat Engine's memory this stream is loaded (READONLY, tends to change on size change)
local MemoryStream = {}

---Replaces the contents in the memory stream with the contents of a file on disk.
---@param fileName path
function loadFromFile(fileName) end

---Writes the contents of the memory stream to the specified file.
---@param fileName path
function saveToFile(fileName) end

---Replaces the contents in the memory stream with the contents of a file on disk. 
---@param fileName path
---@return boolean # On success returns true, else false with a secondary return the error message.
---@return string | nil # secondary return of error message
function loadFromFileNoError(fileName) end

---Writes the contents of the memory stream to the specified file.
---@param fileName path
---@return boolean # On success returns true, else false with a secondary return the error message.
---@return string | nil # secondary return of error message
function saveToFileNoError(fileName) end

---Inherits from Stream (HandleStream->Stream->Object)
---@class HandleStream: Stream

---Inherits from HandleStream (FileStream->HandleStream->Stream->Object)
---@class FileStream: HandleStream


---Inherits from Stream (StringStream->Stream->Object)
---@class StringStream: Stream
---@field DataString string # The internal string


---@return MemoryStream # A new MemoryStream
function createMemoryStream() return {} end

---Creates a file stream object.
---@param fileName path # Path to file
---@param mode FileStreamModes # File permission mode 
---@return FileStream # A new file stream object
function createFileStream(fileName, mode) return {} end


---@param string string # The string to wrap as a stream
---@return StringStream # A new string stream object
function createStringStream(string) return {} end
