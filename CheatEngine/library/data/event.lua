---@meta



---Inherits from Object (Event->Object)
---@class Event: Object
---@field resetEvent fun() #
---@field setEvent fun() #
---@field waitFor fun(timeout: integer): EventWaitResult # Waits for the event to be set. Returns 


---Returns an event object
function createEvent(ManualReset, InitialState) return {} end

