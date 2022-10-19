---This class can be used to read out and set settings of cheat engine and of plugins, and store your own data.
---@class Settings
--@operator [] : Same as Value[]
---@field Path path # Gets/Sets the current subkey (nil if main)
---@field Value table<string, any> # A table access into the settings. e.g: Value["Count"]=12  .Setting vcalue to nil will delete it
---@field getBinaryValue fun(name: string, stream?: Stream): ByteTable # Gets binary data from the registry value. Adds it after the current 'position'
---@field setBinaryValue fun(name: string, stream: Stream, size?: integer) | fun(name: string, bytes: ByteTable) # Sets binary data in the registry value. If size is given, write from the current position. If not, or size=0, writes from position 0 to the end


---This will cause cheat engine to reload the settings from the registry and apply them
function reloadSettingsFromRegistry() end


---Creates a new settings object.
---
---Note: Keep in mind that it returns a new object each call, even if the same name is used multiple times.
---@param path? path # If path is nil it will point to the Cheat Engine main settings (Registry). If path is provided the settings currently accessed will be the one at the subkey provided.
---@return Settings # A Settings object
function getSettings(path) return {} end
