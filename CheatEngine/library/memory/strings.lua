---@meta _


---@param string string # String to split
---@param separator string # Characters to use as separator
---@return string # A single string until the separator is found.
function string.split(string, separator) end

---@param string string # String to search
---@param endWith string # String to search for as suffix
---@return boolean # If the string ends with the given string.
function string.endsWith(string, endWith) end

---@param string string # String to search
---@param startsWith string # String to search for as prefix
---@return boolean # If the string starts with the given string
function string.startsWith(string, startsWith) end


---@param strings Strings # Strings object to operate on
---@param string string # String to add to strings object
function strings_add(strings, string) end

---Clears the strings object of all strings.
---@param strings Strings # Strings object to operate on
function strings_clear(strings) end

---Deletes a single string at a specific index from strings object.
---@param strings Strings # Strings object to operate on
---@param index integer # Index of string to delete
function strings_delete(strings, index) end

---@param strings Strings # Strings object to operate on
---@return string # Gets all the strings as a single text string from strings object
function strings_getText(strings) end

---@param strings Strings # Strings object to operate on
---@param text string # Sets the strings object internal strings as a single text string
function strings_setText(strings, text) end

---@param strings Strings # Strings object to operate on
---@param string string # A string to search for
---@return integer # The index of the specified string. -1 if not found
function strings_indexOf(strings, string) end

---@param strings Strings # Strings object to operate on
---@param index integer # Index to insert at
---@param string string # String to insert
function strings_insert(strings, index, string) end

---@param strings Strings # Strings object to operate on
---@return integer # Number of strings in strings object
function strings_getCount(strings) end

---Remove string from strings object. If string doesn't exist in strings object it's a no-op.
---@param strings Strings # Strings object to operate on
---@param string string # String to remove in strings object
function strings_remove(strings, string) end

---@param strings Strings # Strings object to operate on
---@param index integer # Index of string to get
---@return string # The string at index supplied 
function strings_getString(strings, index) end

---@param strings Strings # Strings object to operate on
---@param index integer # Index to set string at
---@param string string # String to set in strings object
function strings_setString(strings, index, string) end

---@param strings Strings # Strings object to operate on
---@param file path # Path to file to load strings content into strings object supplied
function strings_loadFromFile(strings, file) end

---@param strings Strings # Strings object to operate on
---@param file path # Path to file to save strings object to
function strings_saveToFile(strings, file) end


---Creates a stringlist class object (for whatever reason, lua strings are probably easier to use)
---@return Stringlist # A new empty stringlist object
function createStringlist() end

---Creates a stringlist class object (for whatever reason, lua strings are probably easier to use)
---@return Stringlist # A new empty stringlist object
function createStringList() end

---@param stringlist Stringlist # Stringlist to operate on
---@return DuplicatesType # The type of handling of duplicates for this stringlist
function stringlist_getDuplicates(stringlist) end

---@param stringlist Stringlist # Stringlist to operate on
---@param duplicates DuplicatesType # The type of handling of duplicates to set
function stringlist_setDuplicates(stringlist, duplicates) end

---@param stringlist Stringlist # Stringlist to operate on
---@return boolean # Whether the stringlist is sorted
function stringlist_getSorted(stringlist) end

---@param stringlist Stringlist # Stringlist to operate on
---@param sorted boolean # Whether to set the stringlist as sorted
function stringlist_setSorted(stringlist, sorted) end

---@param stringlist Stringlist # Stringlist to operate on
---@return boolean # Whether the stringlist is case sensitive
function stringlist_getCaseSensitive(stringlist) end

---@param stringlist Stringlist # Stringlist to operate on
---@param caseSensitive boolean # Whether to set the stringlist as case sensitive
function stringlist_setCaseSensitive(stringlist, caseSensitive) end
