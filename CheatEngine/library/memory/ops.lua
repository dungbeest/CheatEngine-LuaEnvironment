---@meta _

---Binary OR.
---@param int1 integer # First integer
---@param int2 integer # Second integer
---@return integer # The OR result
function bOr(int1, int2) end

---Binary XOR.
---@param int1 integer # First integer
---@param int2 integer # Second integer
---@return integer # The XOR result
function bXor(int1, int2) end

---Binary AND.
---@param int1 integer # First integer
---@param int2 integer # Second integer
---@return integer # The AND result
function bAnd(int1, int2) end

---Binary SHR (shift right).
---@param int1 integer # Integer to shift
---@param int2 integer # Number to shift by
---@return integer # The SHR result
function bShr(int1, int2) end

---Binary SHL (shift left).
---@param int1 integer # Integer to shift
---@param int2 integer # Number to shift by
---@return integer # The SHL result
function bShl(int1, int2) end


---Binary NOT.
---@param int integer # Integer to invert (2's-Complement)
---@return integer # The NOT result
function bNot(int) end
