---@meta


---Inherits from Object (Stream->Object)
---@class Stream: Object
---@field Size integer #
---@field Position integer #
---@field copyFrom fun(stream: Stream, count: integer) # Copies count bytes from the given stream to this stream
---@field read fun(count: integer): ByteTable - Returns a byte table containing the bytes of the stream. This increases the position
---@field write fun(byteTable: ByteTable, count?: integer) # Writes the given bytetable to the stream
---@field readByte fun(): byte #
---@field writeByte fun(byte: byte) #
---@field readWord fun(): word #
---@field writeWord fun(word: word) #
---@field readDword fun(): dword #
---@field writeDword fun(dword: dword) #
---@field readQword fun(): qword #
---@field writeQword fun(qword: qword) #
---@field readAnsiString fun(): string #
---@field writeAnsiString fun(string: string) #


---Inherits from Stream (MemoryStream->Stream->Object)
---@class MemoryStream: Stream
---@field Memory Address # The address in Cheat Engine's memory this stream is loaded (READONLY, tends to change on size change)
---@field loadFromFile fun(fileName: path) # Replaces the contents in the memory stream with the contents of a file on disk
---@field saveToFile fun(fileName: path) # Writes the contents of the memory stream to the specified file
---@field loadFromFileNoError fun(fileName: path): boolean, string # Replaces the contents in the memory stream with the contents of a file on disk. On success returns true, else false with a secondary return the error message
---@field saveToFileNoError fun(fileName: path): boolean, string # Writes the contents of the memory stream to the specified file. On success returns true, else false with a secondary return the error message

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
