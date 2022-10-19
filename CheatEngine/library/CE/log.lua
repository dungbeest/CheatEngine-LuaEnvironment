---@meta 

---@class WriteLogEntry
---@field address Address #
---@field original ByteTable #
---@field new ByteTable #

---The writelog is the log that keeps all writes (when enabled).
---@class WriteLog
---@field status boolean
---@field logsize integer 
---@field getLog fun(): table # Returns an indexed table with the write logs. each entry has a table with the fields: address, original and new
