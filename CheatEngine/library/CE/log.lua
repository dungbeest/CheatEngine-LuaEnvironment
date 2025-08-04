---@meta _

---@class WriteLogEntry
---@field address Address #
---@field original ByteTable #
---@field new ByteTable #

---The writelog is the log that keeps all writes (when enabled).
---@class WriteLog
---@field status boolean
---@field logsize integer 
local WriteLog = {}

---@return WriteLogEntry[] # An indexed table with the write logs
function WriteLog.getLog() end
