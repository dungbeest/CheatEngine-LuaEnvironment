---@meta _

---This class can be used to read out and set settings of cheat engine and of plugins, and store your own data.
---@class Settings
--@operator [] : Same as Value[]
---@field Path path # Gets/Sets the current subkey (nil if main)
---@field Value table<string, any> # A table access into the settings. e.g: Value["Count"]=12. Setting value to nil will delete it
local Settings = {}

---Gets binary data from the registry value. Adds it to the stream after the current 'position'
---@param name string
---@param stream Stream
---@return ByteTable
function Settings.getBinaryValue(name, stream) end

---Sets binary data in the registry value from the stream. 
---If size is given, write from the current stream position. 
---If not, or size=0, writes from position 0 to the end
---@param name string
---@param stream Stream
---@param size? integer
function Settings.setBinaryValue(name, stream, size) end


---Sets binary data in the registry value from the bytetable. 
---@param name string
---@param bytes ByteTable
function Settings.setBinaryValue(name, bytes) end

---This will cause cheat engine to reload the settings from the registry and apply them
function reloadSettingsFromRegistry() end


---Creates a new settings object.
---
---Note: Keep in mind that it returns a new object each call, even if the same name is used multiple times.
---@param path? path # If path is nil it will point to the Cheat Engine main settings (Registry). If path is provided the settings currently accessed will be the one at the subkey provided.
---@return Settings # A Settings object
function getSettings(path) return {} end
