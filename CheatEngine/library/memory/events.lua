---@meta

---If function is defined it will be called before an action has been performed.
---
---Active property is about to change to newState.
---
---The action can be: running auto assembler script (ENABLE or DISABLE section), freezing and unfreezing.
---@param memoryRecord MemoryRecord #
---@param newState boolean #
function onMemRecPreExecute(memoryRecord, newState) end

---If function is defined it will be called after an action.
---
---Active property was supposed to change to newState.
---If 'succeeded' is true it means that Active state has changed and is newState. 
---
---newState and succeeded are read only.
---
---The action can be: running auto assembler script (ENABLE or DISABLE section), freezing and unfreezing.
---@param memoryRecord MemoryRecord #
---@param newState boolean #
---@param succeeded boolean #
function onMemRecPostExecute(
    memoryRecord, newState, succeeded
) end
