---@meta

---Inherits from Object (Strings->Object) (Mostly an abstract class)
---@class Strings: Object
---@field LineBreak string # The character(s) to count as a linebreak
---@field Text string # All the strings in one string
---@field Count integer # The number of strings in this list
---@field String string[] # Array to access one specific string in the list
---@field Data integer[] - Array to access the data of a specific string in the list
---@field clear fun() # Deletes all strings in the list
---@field add fun(string: string, data?: integer): integer # Adds a string to the list. Returns the index
---@field addText fun(strings: string) # Adds multiple strings at once
---@field delete fun(index: integer) # Deletes a string from the list
---@field getText fun(): string # Returns all the strings as one big string
---@field setText fun(string: string) # Sets the strings of the given strings object to the given text (can be multiline)
---@field indexOf fun(string: string): integer # Returns the index of the specified string. Returns -1 if not found
---@field insert fun(index: integer, string: string) # Inserts a string at a specific spot moving the items after it
---@field getCount fun(): integer # Returns the number is strings in the list
---@field remove fun(string: string) # Removes the given string from the list
---@field loadFromFile fun(fileName: path, ignoreEncoding?: boolean) # Load the strings from a textfile. If ignoreEncoding is false then the file will be loaded with the best encoding the loader can guess. ignoreEncoding defaults to true
---@field saveToFile fun(fileName: path) # Save the strings to a textfile
---@field getString fun(index: integer): string # Gets the string at the given index
---@field setString fun(index: integer, string: string) # Replaces the string at the given index
---@field getData fun(index: integer) # Returns the integer value stored in the string
---@field setData fun(index: integer, data: integer) # Sets the integer value stored in the string
---@field beginUpdate fun() # Stops updates from triggering other events (prevents flashing)
---@field endUpdate fun() # Call after beginUpdate




---Inherits from Strings (Stringlist->Strings->Object)
---@class Stringlist: Strings
---@field Sorted boolean # Determines if the list should be sorted
---@field Duplicates DuplicatesTypes # Determines how duplicates should be handled when the list is sorted
---@field CaseSensitive boolean # Determines if the list is case sensitive or not.
---@field getDuplicates fun(): DuplicatesTypes # Returns the duplicates property
---@field setDuplicates fun(duplicates: DuplicatesTypes) # Sets the duplicates property
---@field getSorted fun(): boolean # Returns true if the list has the sorted property
---@field setSorted fun(sorted: boolean) # Sets the sorted property
---@field getCaseSensitive fun(): boolean # Returns true if the case sensitive property is set
---@field setCaseSensitive fun(caseSensitive: boolean) # Sets the case sensitive property
