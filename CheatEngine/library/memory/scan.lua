---@meta

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
---@field OnScanDone fun(memScan: MemScan) # Set a function to be called when the scan has finished
---@field OnGuiUpdate fun(memScan: MemScan, TotalAddressesToScan: integer, CurrentlyScanned: integer, ResultsFound: integer) # Called during the scan so you can update the interface if needed
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
---@field scan fun() # Does either a first scan or next scan based on the given property values
---@field newScan fun() # Clears the current results
---@field firstScan fun() | fun(scanOption: MemScanOption, varType: VariableType, roundingType: MemScanRoundingType, input1: string | nil, input2: string | nil, startAddress: Address, stopAddress: Address, protectionflags: ProtectionFlags, alignmentType: AOBAlignmentType, alignmentparam: string, isHexadecimalInput: boolean, isNotABinaryString: boolean, isUnicodeScan: boolean, isCaseSensitive: boolean) # Does a first scan based on the given property values or does a parameterized initial scan. Valid scan options for firstscan are: soUnknownValue, soExactValue, soValueBetween, soBiggerThan, soSmallerThan. If inputs are required by the scan option these are string of the given variable type. When isHexadecimalInput is true this will handle the input field as a hexadecimal string instead of decimal. When isNotABinaryString is true and the varType is vtBinary this will handle the input field as a decimal instead of a binary string. When isUnicodeScan is true and the vartype is vtString this will do a unicode (utf-16) string scan instead of utf-8 string. When isCaseSensitive is true and the vartype is vtString will check if the case matches
---@field nextScan fun() | fun(scanOption: MemScanOption, roundingType: MemScanRoundingType, input1: string | nil, input2: string | nil, isHexadecimalInput: boolean, isNotABinaryString: boolean, isUnicodeScan: boolean, isCaseSensitive: boolean, isPercentageScan: boolean, savedResultName?: string) # Does a next scan based on the given property values or does a parameterized next scan based on the current addresslist and values of the previous scan or values of a saved scan. Valid scan options for firstscan are: soExactValue, soValueBetween, soBiggerThan, soSmallerThan, soIncreasedValue, soIncreasedValueBy, soDecreasedValue, soDecreasedValueBy, soChanged, soUnchanged. If inputs are required by the scan option these are string of the given variable type. When isHexadecimalInput is true this will handle the input field as a hexadecimal string instead of decimal. When isNotABinaryString is true and the varType is vtBinary this will handle the input field as a decimal instead of a binary string. When isUnicodeScan is true and the vartype is vtString this will do a unicode (utf-16) string scan instead of utf-8 string. When isCaseSensitive is true and the vartype is vtString will check if the case matches. When isPercentage is true and the scanoption is of type soValueBetween, soIncreasedValueBy or soDecreasedValueBy will cause CE to do a precentage scan instead of a normal value scan. The savedResultName is String that holds the name of a saved result list that should be compared against. First scan is called "FIRST"
---@field waitTillDone fun() # Waits for the memscan thread(s) to finish scanning. Always use this
---@field saveCurrentResults fun(name: string) # Save the current scanresults to a unique name for this memscan. This save can be used to compare against in a subsequent next scan
---@field getSavedResultList fun(): string[] # Returns an indexed table of all the saved results (strings)
---@field getSavedResultHandler fun(name: string): SaveResultHandler # Gets the 'SavedResultHandler' object with this name (nil on failure)
---@field getAttachedFoundlist fun(): FoundList | nil # Returns a FoundList object if one is attached to this scanresults. Returns nil otherwise
---@field setOnlyOneResult fun(state: boolean) # If set to true before you start a scan, this will cause the scanner to only return one result. Note that it does not work with a foundlist
---@field getOnlyResult fun(): Address | nil # Only works if returnOnlyOneResult is true. Returns nil if not found, else returns the address that was found (integer)
---@field getProgress fun(): MemScanProgress # Returns a mem scan progress table


---The FoundList is an object that opens the current memscan's result file and provides an interface for reading out the addresses
---
---Inherits from Object (FoundList->Object)
---@class FoundList: Object
--@operator index(integer):string
---@field Count integer # Number of results found
---@field Address string[] # Returns the address as a string at the given index
---@field Value string[] # Returns the value as a string at the given index
---@field initialize fun() # Call this when a memscan has finished scanning. This will open the results for reading
---@field deinitialize fun() # Release the results
---@field getCount fun(): integer #
---@field getAddress fun(index: integer): string # Returns the address as a string
---@field getValue fun(index: integer): string # Returns the value as a string


---Inherits from Object (SavedResultHandler->Object)
---@class SavedResultHandler: Object
---@field getStringFromAddress fun(address: Address, hexadecimal?: boolean, signed?: boolean): string # Returns the value in string format at the given address




---@return MemScan # The current memory scan object. If tabs are used the current tab's memscan object
function getCurrentMemscan() return {} end

---@param progressBar? ProgressBar
---@return MemScan # A new MemScan class object
function createMemScan(progressBar) return {} end


---@param memScan MemScan #
---@return FoundList #
function createFoundList(memScan) return {} end
