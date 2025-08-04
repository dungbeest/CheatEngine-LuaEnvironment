---@meta _

---Inherits from Object (Strings->Object) (Mostly an abstract class)
---@class Strings: Object
---@field LineBreak string # The character(s) to count as a linebreak
---@field Text string # All the strings in one string
---@field Count integer # The number of strings in this list
---@field String string[] # Array to access one specific string in the list
---@field Data integer[] - Array to access the data of a specific string in the list
local Strings = {}

---Deletes all strings in the list
function Strings.clear() end

---Adds a string to the list.
---@param string string
---@param data? integer
---@return integer # The index of the string in strings
function Strings.add(string, data) end

---Adds multiple strings at once to the end of current strings buffer.
---@param strings string # A multiline string which will be broken by linebreaks.
function Strings.addText(strings) end

---Deletes a string from the list.
---@param index integer
function Strings.delete(index) end

---@return string # All the strings as one big string.
function Strings.getText() end

---Sets the strings of the given strings object to the given text (can be multiline).
---@param string string # A potentially multiline string which will be broken by linebreaks.
function Strings.setText(string) end

---@param string string
---@return integer # The index of the specified string, -1 if not found.
function Strings.indexOf(string) end

---Inserts a string at a specific spot, moving the items after it back.
---@param index integer
---@param string string
function Strings.insert(index, string) end

---@return integer # The number of strings in the strings buffer.
function Strings.getCount() end

---Removes the given string from the list.
---@param string string
function Strings.remove(string) end

---Load the strings from a textfile. 
---@param fileName path
---@param ignoreEncoding? boolean # If false then the file will be loaded with the best encoding the loader can guess. Defaults to true
function Strings.loadFromFile(fileName, ignoreEncoding) end

---Save the strings to a textfile.
---@param fileName path
function Strings.saveToFile(fileName) end

---Gets the string at the given index.
---@param index integer
---@return string
function Strings.getString(index) end

---Replaces the string at the given index.
---@param index integer
---@param string string
function Strings.setString(index, string) end


---@param index integer
---@return integer # the integer value stored alongside the string at index
function Strings.getData(index) end

---Sets the integer value stored alongside the string at the given index.
---@param index integer
---@param data integer
function Strings.setData(index, data) end

---Stops updates from triggering other events (prevents flashing)
function Strings.beginUpdate() end

---Call after beginUpdate
function Strings.endUpdate() end




---Inherits from Strings (Stringlist->Strings->Object)
---@class Stringlist: Strings
---@field Sorted boolean # Determines if the list should be sorted
---@field Duplicates DuplicatesTypes # Determines how duplicates should be handled when the list is sorted
---@field CaseSensitive boolean # Determines if the list is case sensitive or not.
local Stringlist = {}

---@return DuplicatesTypes # how duplicates should be handled if the list is sorted.
function Stringlist.getDuplicates() end

---Sets the duplicates property.
---@param duplicates DuplicatesTypes
function Stringlist.setDuplicates(duplicates) end

---@return boolean # Whether the list should be sorted
function Stringlist.getSorted() end

---@param sorted boolean # Whether the list should be sorted
function Stringlist.setSorted(sorted) end

---@return boolean # Whether the list should be case sensitive.
function Stringlist.getCaseSensitive() end

---@param caseSensitive boolean # Whether the list should be case sensitive.
function Stringlist.setCaseSensitive(caseSensitive) end
