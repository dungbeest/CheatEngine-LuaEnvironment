---@meta _

---Connects to the given host and port. 
---
---On success, most commands subsequent will be handled by the server. Like processlist, memory reading, etc...
---@param hostName string # The hostname to connect to
---@param port integer # The port to connect to
---@return boolean # Whether the connection succeed
function connectToCEServer(hostName, port) end
