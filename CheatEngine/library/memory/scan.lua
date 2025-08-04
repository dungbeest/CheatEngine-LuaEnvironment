---@meta _

---???
---@class SaveResultHandler

---@alias MemScanType string
---| '"stNewScan"' #
---| '"st v   "' # 
---| '"stNextScan"' #

---@alias MemScanRegionPreference string
---| '"scanDontCare"' #
---| '"scanExclude"' #
---| '"scanInclude"' #


---A table with fields: TotalAddressesToScan, CurrentlyScanned, ResultsFound
---@class MemScanProgress
---@field TotalAddressesToScan integer #
---@field CurrentlyScanned integer #
---@field ResultsFound integer #

---Inherits from Object (MemScan->Object)
---@class MemScan: Object
---@field LastScanWasRegionScan boolean # Returns true is the previous scan was an unknown initial value
---@field LastScanValue string #
---@field LastScanType MemScanType # 
---@field ScanresultFolder string # Path where the results are stored  
---@field FoundList FoundList # The found list currently attached to this memscan object
---@field OnlyOneResult boolean # If this is set to true memscan will stop scanning after having found the first result, and written the address to "Result"
---@field IsUnique boolean # Same as OnlyOneResult but will use multiple threads, so if the value is not unique you will be given a random address
---@field Result integer # If OnlyOneResult is used this will contain the address after a scan has finished
---@field CodePage boolean #
---@field ScanOption MemScanOption # 
---@field VariableType VariableTypeString #
---@field VarType VariableType # 
---@field Roundingtype MemScanRoundingType #
---@field Scanvalue string # Value to scan
---@field Scanvalue1 string # ^
---@field Scanvalue2 string # Secondary value to scan (e.g value between scan)
---@field Startaddress integer #
---@field Stopaddress integer #
---@field Hexadecimal boolean #
---@field BinaryStringAsDecimal boolean #
---@field UTF16 boolean # 
---@field Casesensitive boolean # 
---@field Fastscanmethod MemFastScanMethod # 
---@field Fastscanparameter string #
---@field Customtype string #
---@field ScanWritable MemScanRegionPreference #
---@field ScanExecutable  MemScanRegionPreference #
---@field ScanCopyOnWrite MemScanRegionPreference #  
---@field Percentage boolean #
---@field CompareToSavedScan boolean # 
---@field SavedScanName string #
local MemScan = {}

---Set a function to be called when the scan has finished.
---@param memScan MemScan
function MemScan.OnScanDone(memScan) end

---Called during the scan so you can update the interface if needed.
---@param memScan MemScan
---@param TotalAddressesToScan integer
---@param CurrentlyScanned integer
---@param ResultsFound integer
function MemScan.OnGuiUpdate(memScan, TotalAddressesToScan, CurrentlyScanned, ResultsFound) end

---Does either a first scan or next scan based on the given property values
function MemScan.scan() end

---Clears the current results.
function MemScan.newScan() end

---Does a first scan based on the given property values to the mem scan object. 
---
---Valid [scan options](lua://MemScanOption) for first scan are: "soUnknownValue", "soExactValue", "soValueBetween", "soBiggerThan", "soSmallerThan". 
---
---If inputs are required by the scan option these are string of the given variable type. 
---
---When [Hexadecimal](lua://MemScan.Hexadecimal) is true this will handle the input field as a hexadecimal string instead of decimal. 
---
---When [BinaryStringAsDecimal](lua://MemScan.BinaryStringAsDecimal) is true and the [VarType](lua://VariableType) is vtBinary this will handle the input field as a decimal instead of a binary string.
---
---When [UTF16](lua://MemScan.UTF16) is true and the [VarType](lua://VariableType) is vtString this will do a unicode (utf-16) string scan instead of utf-8 string. 
---
---When [Casesensitive](lua://MemScan.Casesensitive) is true and the [VarType](lua://VariableType) is vtString will check if the case matches.
function MemScan.firstScan() end

---Does a parameterized initial scan. 
---
---Valid [scan options](lua://MemScanOption) for firstscan are: "soUnknownValue", "soExactValue", "soValueBetween", "soBiggerThan", "soSmallerThan". 
---
---If inputs are required by the scan option these are string of the given variable type. 
---
---@param scanOption MemScanOption
---@param varType VariableType
---@param roundingType MemScanRoundingType
---@param input1 string | nil
---@param input2 string | nil
---@param startAddress Address
---@param stopAddress Address
---@param protectionflags ProtectionFlags
---@param alignmentType AOBAlignmentType
---@param alignmentparam string
---@param isHexadecimalInput boolean # if true this will handle the input field as a hexadecimal string instead of decimal.
---@param isNotABinaryString boolean # if true and the [VarType](lua://VariableType) is vtBinary this will handle the input field as a decimal instead of a binary string.
---@param isUnicodeScan boolean # if true and the [VarType](lua://VariableType) is vtString this will do a unicode (utf-16) string scan instead of utf-8 string.
---@param isCaseSensitive boolean # if true and the [VarType](lua://VariableType) is vtString will check if the case matches.
function MemScan.firstScan(
  scanOption, varType, roundingType, input1, input2,
  startAddress, stopAddress, protectionflags, alignmentType,
  alignmentparam, isHexadecimalInput, isNotABinaryString,
  isUnicodeScan, isCaseSensitive
) end

---Does a next scan based on the given values of the MemScan object based on the current addresslist and values of the previous scan or values of a saved scan. 
---
---All [scan options](lua://MemScanOption) for next scan are valid except "soUnknownValue".
---
---If inputs are required by the scan option these are string of the given variable type. 
---
---When [Hexadecimal](lua://MemScan.Hexadecimal) is true this will handle the input field as a hexadecimal string instead of decimal. 
---
---When [BinaryStringAsDecimal](lua://MemScan.BinaryStringAsDecimal) is true and the [VarType](lua://VariableType) is vtBinary this will handle the input field as a decimal instead of a binary string.
---
---When [UTF16](lua://MemScan.UTF16) is true and the [VarType](lua://VariableType) is vtString this will do a unicode (utf-16) string scan instead of utf-8 string. 
---
---When [Casesensitive](lua://MemScan.Casesensitive) is true and the [VarType](lua://VariableType) is vtString will check if the case matches.
---
---When [Percentage](lua://MemScan.Percentage) is true and the [scan option](lua://MemScanOption) is of type "soValueBetween", "soIncreasedValueBy" or "soDecreasedValueBy" will cause CE to do a percentage scan instead of a normal value scan. 
---
---The [SavedScanName](lua://MemScan.SavedScanName) is a String that holds the name of a saved result list that should be compared against. First scan is called "FIRST".
function MemScan.nextScan() end


---Does a parameterized next scan based on the current addresslist and values of the previous scan or values of a saved scan. 
---@param scanOption MemScanOption
---@param roundingType MemScanRoundingType
---@param input1 string | nil
---@param input2 string | nil
---@param isHexadecimalInput boolean # if true this will handle the input field as a hexadecimal string instead of decimal.
---@param isNotABinaryString boolean # if true and the [VarType](lua://VariableType) is vtBinary this will handle the input field as a decimal instead of a binary string.
---@param isUnicodeScan boolean # if true and the [VarType](lua://VariableType) is vtString this will do a unicode (utf-16) string scan instead of utf-8 string.
---@param isCaseSensitive boolean # if true and the [VarType](lua://VariableType) is vtString will check if the case matches.
---@param isPercentageScan boolean # if true and the [scan option](lua://MemScanOption) is of type "soValueBetween", "soIncreasedValueBy" or "soDecreasedValueBy" will cause CE to do a percentage scan instead of a normal value scan. 
---@param savedResultName? string # A string that holds the name of a saved result list that should be compared against. First scan is called "FIRST".
function MemScan.nextScan(
  scanOption, roundingType, input1, input2, 
  isHexadecimalInput, isNotABinaryString, isUnicodeScan, 
  isCaseSensitive, isPercentageScan, savedResultName
) end

---Waits for the memscan thread(s) to finish scanning. Always use this
function MemScan.waitTillDone() end

---Save the current scan results to a unique name for this mem scan. 
---
---This save can be used to compare against in a subsequent next scan.
---@param name string
function MemScan.saveCurrentResults(name) end

---@return string[] # An indexed table of all the saved results (as strings).
function MemScan.getSavedResultList() end

---Gets the [SavedResultHandler](lua://SavedResultHandler) object with this name (nil on failure).
---@param name string
---@return SavedResultHandler | nil # the [SavedResultHandler](lua://SavedResultHandler) object with this name or nil if it doesn't exist
function MemScan.getSavedResultHandler(name) end

---@return FoundList | nil # A [FoundList](lua://FoundList) object if one is attached to this scan, otherwise nil.
function MemScan.getAttachedFoundlist() end

---If set to true before you start a scan, this will cause the scanner to only return one result. 
---
---Note that it does not work with a [FoundList](lua://FoundList).
---@param state boolean
function MemScan.setOnlyOneResult(state) end

---Only works if [OnlyOneResult](lua://MemScan.OnlyOneResult) is true.
---@return Address | nil # nil if no result has been found, otherwise the address that was found.
function MemScan.getOnlyResult() end


---@return MemScanProgress # A mem scan progress table.
function MemScan.getProgress() end


---The FoundList is an object that opens the current memscan's result file and provides an interface for reading out the addresses
---
---Inherits from Object (FoundList->Object)
---@class FoundList: Object
--@operator index(integer):string
---@field Count integer # Number of results found
---@field Address string[] # Returns the address as a string at the given index
---@field Value string[] # Returns the value as a string at the given index
local FoundList = {}

---Call this when a mem scan has finished scanning. 
---
---This will open the results for reading.
function FoundList.initialize() end

---Release the results
function FoundList.deinitialize() end

---@return integer # Number of results found
function FoundList.getCount() end

---@param index integer
---@return string # the address as a string
function FoundList.getAddress(index) end

---@param index integer
---@return string # the value as a string
function FoundList.getValue(index) end


---Inherits from Object (SavedResultHandler->Object)
---@class SavedResultHandler: Object
local SavedResultHandler = {}

---@param address Address
---@param hexadecimal? boolean
---@param signed? boolean
---@return string # the value in string format at the given address
function SavedResultHandler.getStringFromAddress(address, hexadecimal, signed) end




---@return MemScan # The current memory scan object. If tabs are used the current tab's memscan object
function getCurrentMemscan() return {} end

---@param progressBar? ProgressBar
---@return MemScan # A new MemScan class object
function createMemScan(progressBar) return {} end


---@param memScan MemScan #
---@return FoundList #
function createFoundList(memScan) return {} end
