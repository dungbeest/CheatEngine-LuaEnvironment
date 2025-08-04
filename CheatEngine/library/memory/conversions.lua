---@meta _

---Extends the bits so that if it's MSB bit is set, it will be negative.
---@param value integer #
---@param mostSignificantBit integer #
---@return integer # The sign extended integer
function signExtend(value, mostSignificantBit) end

---Converts a word to a byte table.
---@param number word # Word to convert
---@return ByteTable # Bytes of the underlying word
function wordToByteTable(number) end

---Converts a dword to a byte table.
---@param number dword # Dword to convert
---@return ByteTable # Bytes of the underlying dword
function dwordToByteTable(number) end

---Converts a qword to a byte table.
---@param number qword # Qword to convert
---@return ByteTable # Bytes of the underlying qword
function qwordToByteTable(number) end

---Converts a float to a byte table.
---@param number float # Float to convert
---@return ByteTable # Bytes of the underlying float
function floatToByteTable(number) end

---Converts a double to a byte table.
---@param number double # Double to convert
---@return ByteTable # Bytes of the underlying double
function doubleToByteTable(number) end

---Converts an extended to a byte table.
---@param number extended # Extended to convert
---@return ByteTable # Bytes of the underlying extended
function extendedToByteTable(number) end

---Converts a string to a byte table.
---@param string string # string to convert
---@return ByteTable # Bytes of the underlying string
function stringToByteTable(string) end

---Converts a string to a widestring and converts that to a byte table.
---@param string string # string to convert
---@return ByteTable # Bytes of the underlying string
function wideStringToByteTable(string) end



---Converts a byte table to a word.
---@param table ByteTable # Byte table to convert
---@param signed? boolean # Whether to return the word as a signed integer. Defaults to false.
---@return word # Word interpreted from byte table
function byteTableToWord(table, signed) end

---Converts a byte table to a dword.
---@param table ByteTable # Byte table to convert
---@param signed? boolean # Whether to return the dword as a signed integer. Defaults to false.
---@return dword # Dword interpreted from byte table
function byteTableToDword(table, signed) end

---Converts a byte table to a qword.
---@param table ByteTable # Byte table to convert
---@return qword # Qword interpreted from byte table
function byteTableToQword(table) end

---Converts a byte table to a float.
---@param table ByteTable # Byte table to convert
---@return float # Float interpreted from byte table
function byteTableToFloat(table) end

---Converts a byte table to a double.
---@param table ByteTable # Byte table to convert
---@return double # Double interpreted from byte table
function byteTableToDouble(table) end

---Converts a byte table to an extended and converts that to a double
---@param table ByteTable # Byte table to convert
---@return double # Double converted from extended interpreted from byte table
function byteTableToExtended(table) end

---Converts a byte table to a string.
---@param table ByteTable # Byte table to convert
---@return string # String interpreted from byte table
function byteTableToString(table) end

---Converts a byte table to a widestring and converts that to a string.
---@param table ByteTable # Byte table to convert
---@return string # String converted from widestring interpreted from byte table.
function byteTableToWideString(table) end

---Note: GUI components mainly show in UTF-8, some other functions use ANSI, try to find out which ones...

---Converts a string in ANSI encoding to UTF-8.
---@param string string ANSI string to convert
---@return string # UTF-8 converted string
function ansiToUtf8(string) end

---Converts a string in UTF-8 encoding to ANSI.
---@param string string UTF-8 string to convert
---@return string # ANSI converted string
function utf8ToAnsi(string) end

---Converts a given integer to a userdata variable.
---@param i integer # The integer to convert
---@return userdata # The integer as a userdata variable
---@see userDataToInteger
function integerToUserData(i) end

---Converts a given userdata variable to an integer.
---@param UserDataVar userdata # The userdata to extract as an integer
---@return integer # The userdata as an integer
---@see integerToUserData
function userDataToInteger(UserDataVar) end
