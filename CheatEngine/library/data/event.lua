---@meta _



---Inherits from Object (Event->Object)
---@class Event: Object
local Event = {}

function Event.resetEvent() end

function Event.setEvent() end

---Waits for the event to be set.
---@param timeout integer
---@return EventWaitResult
function Event.waitFor(timeout) end


---Returns an event object
function createEvent(ManualReset, InitialState) return {} end

