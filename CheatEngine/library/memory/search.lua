---@meta

---Flags that indicate memory protection status.
---> X = Executable memory
---
---> W = Writable memory 
---
---> C = Copy On Write. 
---
--- Add a + to indicate that flag MUST be set and a - to indicate that that flag MUST NOT be set. (* sets it to don't care).
---
---Examples:
---> "+W-C" => Writable memory exluding copy on write and doesn't care about the Executable flag
---
---> "+X-C-W" => Find readonly executable memory
---
---> "+W" => Finds all writable memory and don't care about copy on write or execute
---
---> "" => Find everything (is the same as "*X*C*W" )
---@alias ProtectionFlags string
---|'""' # Find everything (is the same as "*X*C*W" )
---|'"*W"'
---|'"+W"'
---|'"-W"'
---|'"*X"'
---|'"+X"'
---|'"-X"'
---|'"*C"'
---|'"+C"'
---|'"-C"'
---|'"*W*C"'
---|'"*W+C"'
---|'"*W-C"'
---|'"+W*C"'
---|'"+W+C"'
---|'"+W-C"'
---|'"-W*C"'
---|'"-W+C"'
---|'"-W-C"'
---|'"*W*X"'
---|'"*W+X"'
---|'"*W-X"'
---|'"+W*X"'
---|'"+W+X"'
---|'"+W-X"'
---|'"-W*X"'
---|'"-W+X"'
---|'"-W-X"'
---|'"*C*X"'
---|'"*C+X"'
---|'"*C-X"'
---|'"+C*X"'
---|'"+C+X"'
---|'"+C-X"'
---|'"-C*X"'
---|'"-C+X"'
---|'"-C-X"'
---|'"*W*C*X"'
---|'"*W*C+X"'
---|'"*W*C-X"'
---|'"*W+C*X"'
---|'"*W+C+X"'
---|'"*W+C-X"'
---|'"*W-C*X"'
---|'"*W-C+X"'
---|'"*W-C-X"'
---|'"+W*C*X"'
---|'"+W*C+X"'
---|'"+W*C-X"'
---|'"+W+C*X"'
---|'"+W+C+X"'
---|'"+W+C-X"'
---|'"+W-C*X"'
---|'"+W-C+X"'
---|'"+W-C-X"'
---|'"-W*C*X"'
---|'"-W*C+X"'
---|'"-W*C-X"'
---|'"-W+C*X"'
---|'"-W+C+X"'
---|'"-W+C-X"'
---|'"-W-C*X"'
---|'"-W-C+X"'
---|'"-W-C-X"'


---The type of alignment to coerce an AOB into.
---
---alignmentParam is a string which either holds the value the addresses must be dividable by or what the last digits of the address must be.
---@alias AOBAlignmentType byte
---| 0 # No alignment check
---| 1 # Address must be dividable by alignmentParam
---| 2 # Address must end with alignmentParam


---Scans for a unique AOB for the given address.
---@param address SymbolAddress # The address at which to start the search
---@return string # The AOB as a string
---@return integer # An offset (in bytes) applied in case the AOB returned doesn't start at the given address
function getUniqueAOB(address) return "", 0 end


---Scans the currently opened process.
---@param ... byte | any # Bytes to scan. Byte values of higher than 255 or anything not an integer will be seen as a wildcard
---@return Stringlist # A Stringlist object containing all the results. Don't forget to free this list when done
function AOBScan(...) return {} end

---see above but here you just input one string
---@param aobString string # The AOB pattern to search for as a string
---@param protectionFlags? ProtectionFlags # The filter flags to apply to search in different memory regions (see ProtectionFlags)
---@param alignmentType? AOBAlignmentType # The alignment type for use with alignment param
---@param alignmentParam? string # A string which either holds the value the addresses must be dividable by or what the last digits of the address must be.
---@return Stringlist # A Stringlist object containing all the results. Don't forget to free this list when done
function AOBScan(
    aobString, protectionFlags, alignmentType, alignmentParam
) return {} end

---Scans for the AOB String.
---@param aobString string # The AOB pattern to search for as a string
---@param protectionFlags? ProtectionFlags # The filter flags to apply to search in different memory regions (see ProtectionFlags)
---@param alignmentType? AOBAlignmentType # The alignment type for use with alignment param
---@param alignmentParam? string # A string which either holds the value the addresses must be dividable by or what the last digits of the address must be.
---@return string | nil # The first result it finds or nil if nothing is found. Make sure it the AOB is unique as it will return the first result found which can be any random match
function AOBScanUnique(
    aobString, protectionFlags, alignmentType, alignmentParam
) return "" end

---Scans for the AOB String in the designated module.
---@param moduleName string # The name of the module to search in
---@param aobString string # The AOB pattern to search for as a string
---@param protectionFlags? ProtectionFlags # The filter flags to apply to search in different memory regions (see ProtectionFlags)
---@param alignmentType? AOBAlignmentType # The alignment type for use with alignment param
---@param alignmentParam? string # A string which either holds the value the addresses must be dividable by or what the last digits of the address must be.
---@return string | nil # The first result it finds or nil if nothing is found. Make sure it the AOB is unique as it will return the first result found which can be any random match
function AOBScanModuleUnique(
    moduleName, aobString, protectionFlags,
    alignmentType, alignmentParam
) return "" end

