---@meta _


---Inherits from Object (TableFile->Object)
---@class TableFile: Object
---@field Name string #
---@field Stream MemoryStream #
local TableFile = {}

---Deletes this file from your table.
function TableFile.delete() end

---Save file from table to a file path on disk
---@param fileName path
function TableFile.saveToFile(fileName) end

---Gets a MemoryStream object
---@return MemoryStream
function TableFile.getData() end

---@param pathToFile path # Path to file
---@return integer # The 64-bit file version 
---@return FullVersion # A table that has split up the file version into major, minor, release and build
function getFileVersion(pathToFile) end

---@param pathToFile path # Path to file
---@return string # The filename of the path
function extractFileName(pathToFile) end


---@param pathToFile path # Path to file
---@return string # the file extension of the path
function extractFileExt(pathToFile) end

---@param pathToFile path # Path to file
---@return string # The filename of the path, without the extension
function extractFileNameWithoutExt(pathToFile) end

---@param pathToFile path # Path to file
---@return path # The path with the filename removed 
function extractFilePath(pathToFile) end

---@return path # The path to the temp folder
function getTempFolder() end

---@param pathToFile path # Path to file
---@return boolean # true if a file exists at that path
function fileExists(pathToFile) end

---@param pathToFile path # Path to file
---@return boolean # True if a file existed at that path and was successfully deleted
function deleteFile(pathToFile) end


---@param path path # Path to search for files
---@param searchMask? string # Pattern to filter searches
---@param SearchSubDirs? boolean # Whether to search sub-directories
---@param dirAttrib? integer # Extra directory attribute to filter
---@return string[] # An indexed table with filenames
function getFileList(
  path, searchMask, SearchSubDirs, dirAttrib
) return { "" } end

---@param path path # Path to search for directories
---@param searchSubDirs? boolean # Whether to search sub-directories
---@return string[] # An indexed table with directory names
function getDirectoryList(path, searchSubDirs) end



---@param fileName string # Name of file to find in cheat table
---@return TableFile # The TableFile class object for the saved file
function findTableFile(fileName) end

---Add a new file to your table. 
---
---If no filepath is specified, it will create a blank file. 
---
---Otherwise, it will read the contents from disk.
---@param fileName string # Name of file to add to table
---@param filePath? path # Path to file on disk
---@return TableFile # The new TableFile class object
function createTableFile(fileName, filePath) end
