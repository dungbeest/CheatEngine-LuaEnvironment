---@meta _

---Most addresses can be strings, they will get interpreted by CE's symbolhandler
---@alias SymbolAddress string|integer
---@alias Symbol string
---@alias Address integer

---@alias byte integer
---@alias word integer
---@alias dword integer
---@alias qword integer
---@alias pointer integer
---@alias float number
---@alias double number
---@alias extended number
---@alias widestring string
---@alias ByteTable byte[]
---@alias path string

---Version table includes major, minor, release and build.
---@class FullVersion
---@field major integer # Major version
---@field minor integer # Minor version
---@field release integer # Release number
---@field build integer # Build number

---Can be used as a set of options to combine multiples.
---
---Example:
---"moHideChildren, moDeactivateChildrenAsWell, moAllowManualCollapseAndExpand"
---@alias MemoryRecordOptions string
---| "moHideChildren" # Hides child records until activated
---| "moActivateChildrenAsWell" # Activate child records when activated
---| "moDeactivateChildrenAsWell" # Deactivate child records when deactivated
---| "moRecursiveSetValue" # Recursively set same value to all child records
---| "moAllowManualCollapseAndExpand" # Allow manual collapse/expand with left and right keys
---| "moManualExpandCollapse" # Allow manual collapse/expand caret
---| "moAlwaysHideChildren" # Always hide child records


---@alias MemRecActivationFn fun(memoryRecord: MemoryRecord, before: boolean, currentState: boolean): boolean
---@alias MemRecDisplayFn fun(memoryRecord: MemoryRecord, value: string): boolean, string
---@alias MemRecChangeValueFn fun(memoryRecord: MemoryRecord, oldValue: string, newValue: string)
---@alias MemRecHotkeyFn fun(keys: VirtualKeyCodes[], action: MemoryRecordHotkeyAction, value?: string, description?: string): MemoryRecordHotkey

---The memory record objects are the entries you see in the address list.
---@class MemoryRecord
---@field ID integer # Unique ID, user definable
---@field Index integer # The index ID for this record. 0 is top. (ReadOnly)
---@field Description string # The description of the memory record
---@field Address string # Get/Set the interpretable address string. Useful for simple address settings.
---@field AddressString string # Get the address string shown in CE (ReadOnly)
---@field OffsetCount integer # The number of offsets. Set to 0 for a normal address
---@field Offset integer[] # Array to access each offset
---@field OffsetText string[] # Array to access each offset using the interpretable text style
---@field CurrentAddress integer # The address the memoryrecord points to
---@field VarType VariableTypeString - # The variable type of this record. See VarTypeString. If the type is vtString then the following properties are available: String.Size, String.Unicode, String.Codepage. If the type is vtBinary then the following properties are available: Binary.Startbit, Binary.Size. If the type is vtByteArray then the following properties are available: Aob.Size
---@field Type VariableType # The variable type of this record. See VariableType. If the type is vtString then the following properties are available: String.Size, String.Unicode, String.Codepage. If the type is vtBinary then the following properties are available: Binary.Startbit, Binary.Size. If the type is vtByteArray then the following properties are available: Aob.Size
---@field String.Size integer | nil # Number of characters in the string
---@field String.Unicode boolean | nil # If string is unicode
---@field String.Codepage boolean | nil # If string is codepage
---@field Binary.Startbit integer | nil # First bit to start reading from
---@field Binary.Size integer | nil # Number of bits
---@field Aob.Size integer | nil # Number of bytes
---@field CustomTypeName string | nil # If the type is vtCustom this will contain the name of the CustomType
---@field Script string | nil # If the type is vtAutoAssembler this will contain the auto assembler script
---@field Value string | nil # The value in string form.
---@field NumericalValue number | nil - The value in numerical form or nil if it can not be parsed to a number
---@field Selected boolean # Set to true if selected (ReadOnly)
---@field Active boolean # Set to true to activate/freeze, false to deactivate/unfreeze
---@field Color integer #
---@field ShowAsHex boolean # Self explanatory
---@field ShowAsSigned boolean # Self explanatory
---@field AllowIncrease boolean # Allow value increasing, unfreeze will reset it to false
---@field AllowDecrease boolean # Allow value decreasing, unfreeze will reset it to false
---@field Collapsed boolean # Set to true to collapse this record or false to expand it. Use expand/collapse methods for recursive operations. 
---@field IsGroupHeader boolean # Set to true if the record was created as a Group Header with no address or value info. 
---@field IsAddressGroupHeader boolean # Set to true if the record was created as a Group Header with address.
---@field IsReadable boolean # Set to false if record contains an unreadable address. NOTE: This property will not be set until the value property is accessed at least once. (ReadOnly)
---@field Options MemoryRecordOptions | string # A string enclosed by square brackets filled with the options separated by a comma
---@field DropDownLinked boolean # If dropdown list refers to list of another memory record eg. (memrec name)
---@field DropDownLinkedMemrec string # Record description of linked memory record or empty string if not linked
---@field DropDownList Stringlist # List of "value:description" lines, lists are still separate objects when linked, read-write
---@field DropDownReadOnly boolean # True if 'Disallow manual user input' is set
---@field DropDownDescriptionOnly boolean # self explanatory
---@field DisplayAsDropDownListItem boolean # self explanatory
---@field DropDownCount integer # equivalent to .DropDownList.Count
---@field DropDownValue string[] # Array to access values in DropDownList (ReadOnly)
---@field DropDownDescription string[] : Array to access Descriptions in DropDownList (ReadOnly)
---@field Count integer # Number of child records
---@field Child MemoryRecord[] # Array to access the child records
---@field Parent MemoryRecord | nil # The parent of the memory record
---@field HotkeyCount integer # Number of hotkeys attached to this memory record
---@field Hotkey MemoryRecordHotkey[] # Array to index the hotkeys
---@field Async boolean # Set to true if activating this entry will be asynchronous. (only for AA/Lua scripts)
---@field AsyncProcessing boolean # True when async is true and it's being processed
---@field AsyncProcessingTime qword # The time that it has been processing in milliseconds
---@field HasMouseOver boolean # True if the mouse is currently over it
---@field DontSave boolean # Don't save this memory record and it's children on table save
local MemoryRecord = {}

---The function to call when the memory record will change (or changed) Active to true. If before is true, not returning true will cause the activation to stop.
---@param memoryRecord MemoryRecord
---@param before boolean
---@param currentState boolean
---@return boolean
function MemoryRecord.OnActivate(memoryRecord, before, currentState) end

---The function to call when the memory record will change (or changed) Active to false. If before is true, not returning true will cause the deactivation to stop.
---@param memoryRecord MemoryRecord
---@param before boolean
---@param currentState boolean
---@return boolean
function MemoryRecord.OnDeactivate(memoryRecord, before, currentState) end


---Called when the memory record is destroyed.
function MemoryRecord.OnDestroy() end

---This function gets called when rendering the value of a memory record.
---@param memoryRecord MemoryRecord
---@param value string
---@return boolean # true
---@return string # A new string to override the value shown.
function MemoryRecord.OnGetDisplayValue(memoryRecord, value) end

---This function gets called whenever the value of a memory record has changed
---@param memoryRecord MemoryRecord
---@param oldValue string
---@param newValue string
function MemoryRecord.OnChangedValue(memoryRecord, oldValue, newValue) end

---This function gets called whenever the value of a memory record has changed by the user
---@param memoryRecord MemoryRecord
---@param oldValue string
---@param newValue string
function MemoryRecord.OnChangedValueByUser(memoryRecord, oldValue, newValue) end

---@return string
function MemoryRecord.getDescription() end

---@param description string
function MemoryRecord.setDescription(description) end

---@return SymbolAddress # The interpretable address string of this record.
---@return Address[] | nil # If the memory record type is a pointer, it returns a second result as a table filled with its offsets.
function MemoryRecord.getAddress() end

---Sets the interpretable address string, and if offsets are provided makes it a pointer.
---@param address SymbolAddress
function MemoryRecord.setAddress(address) end

---@return integer # The number of offsets for this memory record
function MemoryRecord.getOffsetCount() end

---@param offsets integer # The number of offsets to set for this memory record (Uninitialized offsets are set to 0)
function MemoryRecord.setOffsetCount(offsets) end

---@param index integer
---@return integer # The offset at the given index
function MemoryRecord.getOffset(index) end

---Sets the offset at the given index
---@param index integer The index of the offset
---@param value integer The value to set at the given index
function MemoryRecord.setOffset(index, value) end

---@return Address # The current address as an integer (the final result of the interpretable address and pointer offsets).
function MemoryRecord.getCurrentAddress() end

---Appends the current memory record to the given memory record.
---@param memoryRecord MemoryRecord # The memory record to append to.
function MemoryRecord.appendToEntry(memoryRecord) end

---@param index integer
---@return MemoryRecordHotkey # The hotkey from the hotkey array
function MemoryRecord.getHotkey(index) end

---@param id integer
---@return MemoryRecordHotkey # The hotkey with the given id
function MemoryRecord.getHotkeyID(id) end

function MemoryRecord.reinterpret() end

---@param keys VirtualKeyCodes[]
---@param action MemoryRecordHotkeyAction
---@param value? string
---@param description? string
---@return MemoryRecordHotkey # A hotkey object
function MemoryRecord.createHotkey(keys, action, value, description) end

---Sets the entry to disabled without executing the disable section
function MemoryRecord.disableWithoutExecute() end

---Call when you wish to take a long time to edit a record (e.g external editor). 
---It prevents the record from getting deleted
function MemoryRecord.beginEdit() end

---To mark the end of your long edit sequence
function MemoryRecord.endEdit() end





---@class DisassemblerTable
---@field address Address # The address that was disassembled
---@field opcode string # The opcode without parameters
---@field parameters string # The parameters
---@field description string # The description of this opcode
---@field commentsoverride string # If set, this will be the comments/LastParamatersToString result
---@field bytes ByteTable # A table containing the bytes this instruction consists of (1.. )
---@field modrmValueType DisassemblerValueType # Defines the type of the modrmValue field
---@field modrmValue integer # The value that the modrm specified. modrmValueType defines what kind of value
---@field parameterValueType DisassemblerValueType #
---@field parameterValue integer # The value that the parameter part specified
---@field isJump boolean # Set to true if the disassembled instruction can change the EIP/RIP (not ret)
---@field isCall boolean # Set to true if it's a Call
---@field isRet boolean # Set to true if it's a Ret
---@field isRep boolean # Set to true if it's preceded by a Rep
---@field isConditionalJump boolean # Set to true if it's a conditional jump
---@field syntaxhighlighting boolean # This property is set if the syntax highlighting codes are accepted or not


---Inherits from Object (Disassembler->Object)
---@class Disassembler: Object
---@field LastDisassembleData DisassemblerTable #
local Disassembler = {}

---@param sender Disassembler
---@param address Address
---@param lastDisassembleData DisassemblerTable
---@return string opcode
---@return string description
function Disassembler.OnDisassembleOverride(sender, address, lastDisassembleData) end

---@param sender Disassembler
---@param address Address
---@param lastDisassembleData DisassemblerTable
---@param result string
---@param description string
---@return boolean result
---@return string description
function Disassembler.OnPostDisassemble(sender, address, lastDisassembleData, result, description) end

---Disassembles the given instruction and returns the opcode. It also fills in a LastDisassembleData record
---@param address Address
---@return string opcode
function Disassembler.disassemble(address) end

---@return string # The unedited "Comments" information. Does not display userdefined comments
function Disassembler.decodeLastParametersToString() end

---@return DisassemblerTable # The LastDisassembleData table.
function Disassembler.getLastDisassembleData() end


---Inherits from Object (DissectCode->Object)
---@class DissectCode: Object (DissectCode->Object)
local DissectCode = {}

---Clears all data
function DissectCode.clear() end

---Dissects the memory of a module or a specified memory region
---@param moduleName string
function DissectCode.dissect(moduleName) end

---Dissects the memory of a module or a specified memory region
---@param base Address
---@param size integer
function DissectCode.dissect(base, size) end

---Adds a reference
---@param fromAddress Address
---@param toAddress Address
---@param type DissectCodeType
---@param isString? boolean
function DissectCode.addReference(fromAddress, toAddress, type, isString) end

---@param fromAddress Address
---@param toAddress Address
function DissectCode.deleteReference(fromAddress, toAddress) end

---@param address Address
---@return table # A table containing the addresses that reference this address and the type
function DissectCode.getReferences(address) end

---@return table # A table of addresses and their strings that have been referenced. Use getReferences to find out which addresses those are.
function DissectCode.getReferencedStrings() end

---@return table # A table of functions that have been referenced. Use getReferences to find out which callers that are
function DissectCode.getReferencedStrings() end

---@param fileName path
function DissectCode.saveToFile(fileName) end

---@param fileName path
function DissectCode.loadFromFile(fileName) end


---Inherits from Object (RIPRelativeScanner->Object)
---@class RIPRelativeScanner: Object
---@field Count integer # The number of instructions found that have a RIP relative address
---@field Address Address[] # An array to access the results. The address is the address of the RIP relative offset in the instruction


---???
---@alias CustomTypeType integer

---The custom type is an convertor of raw data, to a human readable interpretation.
---
---Inherits from Object (CustomType->Object)
---@class CustomType: Object
---@field name string #
---@field functiontypename string #
---@field CustomTypeType CustomTypeType # The type of the script
---@field script string # The custom type auto assemble conversion script
---@field scriptUsesFloat boolean - True if this script interprets its user-side values as float
local CustomType = {}

---@param bytes ByteTable
---@param address? Address
---@return integer
function CustomType.byteTableToValue(bytes, address) end

---@param value integer
---@param address? Address
---@return ByteTable
function CustomType.valueToByteTable(value, address) end


---@class ContextTable
---@field EAX integer # The EAX Register
---@field EBX integer # The EBX Register
---@field ECX integer # The ECX Register
---@field EDX integer # The EDX Register
---@field ESI integer # The ESI Register
---@field EDI integer # The EDI Register
---@field EBP integer # The EBP Register
---@field ESP integer # The ESP Register
---@field RAX integer # The RAX Register
---@field RBX integer # The RBX Register
---@field RCX integer # The RCX Register
---@field RDX integer # The RDX Register
---@field RSI integer # The RSI Register
---@field RDI integer # The RDI Register
---@field RBP integer # The RBP Register
---@field RSP integer # The RSP Register
---@field R8 integer # The R8 Register
---@field R9 integer # The R9 Register
---@field R10 integer # The R10 Register
---@field R11 integer # The R11 Register
---@field R12 integer # The R12 Register
---@field R13 integer # The R13 Register
---@field R14 integer # The R14 Register
---@field R15 integer # The R15 Register
---@field FPR0 number # The FPR0 Register
---@field FPR1 number # The FPR1 Register
---@field FPR2 number # The FPR2 Register
---@field FPR3 number # The FPR3 Register
---@field FPR4 number # The FPR4 Register
---@field FPR5 number # The FPR5 Register
---@field FPR6 number # The FPR6 Register
---@field FPR7 number # The FPR7 Register
---@field XMM0 number # The XMM0 Register
---@field XMM1 number # The XMM1 Register
---@field XMM2 number # The XMM2 Register
---@field XMM3 number # The XMM3 Register
---@field XMM4 number # The XMM4 Register
---@field XMM5 number # The XMM5 Register
---@field XMM6 number # The XMM6 Register
---@field XMM7 number # The XMM7 Register
---@field XMM8 number # The XMM8 Register
---@field XMM9 number # The XMM9 Register
---@field XMM10 number # The XMM10 Register
---@field XMM11 number # The XMM11 Register
---@field XMM12 number # The XMM12 Register
---@field XMM13 number # The XMM13 Register
---@field XMM14 number # The XMM14 Register
---@field XMM15 number # The XMM15 Register



---@class TracerTable
---@field address Address # Address of the instruction
---@field instruction string # Disassembled instruction
---@field instructionSize integer # bytesize of the instruction
---@field referencedAddress integer # Address the code references
---@field referencedData ByteTable # The bytes of the referenced data at the time of tracing
---@field context ContextTable # The state of the cpu when this instruction got executed (contains registers(EAX/RAX, ...), floating points(FP) and XMM values
---@field hasStackSnapshot boolean # Set to true if there is a stack entry      
---@field selected boolean # Set to true if the entry is selected


---@class ModuleLoader
---@field loaded boolean # True if successfuly mapped
---@field exports table # Table containing all exports
---@field entryPoint Address # Address of the entry point


---@return Disassembler # Creates a disassembler object that can be used to disassemble an instruction and at the same time get more data
function createDisassembler() end

---@return Disassembler # Returns the default disassembler object used by a lot of ce's disassembler routines (Only use this from the main thread)
function getDefaultDisassembler() end

---@return Disassembler # Deprecated. Returns a stub disassembler for backward compatability. It's function overrides are set the other visible disasemblers will use that if they themselves don't have an ovverride. Special codes are: {H}=Hex value {R}=Register {S}=Symbol {N}=Nothing special {C######}=RGB color , {B######}=Background RGB color were ###### is 0xBBGGRR
function getVisibleDisassembler() end


---Same as Disassembler.OnDisassembleOverride, but does it for all disassemblers, including newly created ones.  Tip: Check the sender to see if you should use syntax highlighting codes or not.
---
---(Requires Cheat Engine version 6.4+)
---@param disassembleOverride fun(sender: Disassembler, address: integer, lastDisassembleData: table): opcode: integer, description: string #
---@return integer # An ID you can pass on to unregisterGlobalDisassembleOverride()
function registerGlobalDisassembleOverride(disassembleOverride) end

---Unregisters a global disassemble override by id.
---@param id integer # Id from registerGlobalDisassembleOverride()
---@see registerGlobalDisassembleOverride
function unregisterGlobalDisassembleOverride(id) end


---@return DissectCode # Creates or returns the current code DissectCode object
function getDissectCode() end


---Creates a RIP relative scanner.
---
---This will scan the provided memory region for RIP relative instructions which you can use for whatever you like
---@param startAddress Address
---@param stopAddress Address
---@param includeJumpsAndCalls? boolean
---@return RIPRelativeScanner
function createRipRelativeScanner(startAddress, stopAddress, includeJumpsAndCalls) end

---Creates a RIP relative scanner. 
---
---This will scan the provided module for RIP relative instructions which you can use for whatever you like
---@param moduleName string #
---@param includeJumpsAndCalls? boolean #
---@return RIPRelativeScanner #
function createRipRelativeScanner(moduleName, includeJumpsAndCalls) end

---Registers a Custom type based on lua functions
---@param typename string
---@param bytecount integer
---@param bytesToValueFunction fun(...: byte): integer #
---@param valueToBytesFunction fun(value: integer): ...: byte #
---@param isFloat boolean
---@return CustomType # 
function registerCustomTypeLua(typename, bytecount, bytesToValueFunction, valueToBytesFunction, isFloat) end


---Registers a custom type based on an auto assembler script. 
---
---The script must allocate an "ConvertRoutine" and "ConvertBackRoutine".
---@param script string # A conversion auto assembler script
---@return CustomType # The Custom Type object
function registerCustomTypeAutoAssembler(script) end

---@param typeName string # The name of the type
---@return CustomType | nil # The custom type object, or nil if not found
function getCustomType(typeName) end


---Loads a module.
---@param pathToDLL path #
---@param executeEntryPoint? boolean # Defaults to true
---@param timeout? integer | nil # Defaults to nil which is equivalent to waiting indefinitely
function loadModule(pathToDLL, executeEntryPoint, timeout) end


----------------------------MemoryRecord Functions-------------------------------

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param description string # Description to set to memory record
function memoryrecord_setDescription(memoryRecord, description) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return string # The memory record's description
function memoryrecord_getDescription(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return string # The address as an interpretable address string
---@return Address[] | nil # The offsets of the pointer or nil if it's a direct address
function memoryrecord_getAddress(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param address SymbolAddress # Address to set memory record to
function memoryrecord_setAddress(memoryRecord, address) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return VariableType # The type of the memory record
function memoryrecord_getType(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param type VariableType # The type to set memory record to
function memoryrecord_setType(memoryRecord, type) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return string | nil # The value of the memory record in string form
function memoryrecord_getValue(memoryRecord) end

---Set memory record value to provided value
---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param value string # Value to set to memory record
function memoryrecord_setValue(memoryRecord, value) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return string | nil # Auto assemble Script of memory record
function memoryrecord_getScript(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param script string # Auto Assemble script to set to memory record
function memoryrecord_setScript(memoryRecord, script) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return boolean # Whether memory record is activated
function memoryrecord_isActive(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return boolean # Whether memory record is selected currently
function memoryrecord_isSelected(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
function memoryrecord_freeze(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
function memoryrecord_unfreeze(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param color Colors # Color to set to memory record
function memoryrecord_setColor(memoryRecord, color) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param memoryRecordToAppendTo MemoryRecord # The memory record to append the first memory record to
function memoryrecord_appendToEntry(memoryRecord, memoryRecordToAppendTo) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
function memoryrecord_delete(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return integer | nil # Size of the string if memory record is string type, otherwise nil
function memoryrecord_string_getSize(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param size integer # Size to set string in memory record
function memoryrecord_string_setSize(memoryRecord, size) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return boolean | nil # Whether a memory record's string type is interpreted as Unicode
function memoryrecord_string_getUnicode(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param isUnicode boolean # Whether to treat memory record's string type as Unicode
function memoryrecord_string_setUnicode(memoryRecord, isUnicode) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return integer | nil # Start bit of the binary if memory record is binary type, otherwise nil
function memoryrecord_binary_getStartbit(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param startBit integer # The start bit to set memory record's binary type
function memoryrecord_binary_setStartbit(memoryRecord, startBit) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return integer | nil # Size of the binary if memory record is binary type, otherwise nil
function memoryrecord_binary_getSize(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param size integer # Size of the binary to set to memory record's binary type
function memoryrecord_binary_setSize(memoryRecord, size) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return integer | nil # Size of the array of bytes if memory record is array of bytes type, otherwise nil
function memoryrecord_aob_getSize(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param size integer # Size of the array of bytes to set to memory record's array of bytes type
function memoryrecord_aob_setSize(memoryRecord, size) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return integer # ID of the memory record (ID is user definable)
function memoryrecord_getID(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@return integer # Number of hotkeys set in memory record
function memoryrecord_getHotkeyCount(memoryRecord) end

---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param index integer # The hotkey's index
---@return MemoryRecordHotkey # The hotkey with the provided index
function memoryrecord_getHotkey(memoryRecord, index) end


---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param id integer # The hotkey's id
---@return MemoryRecordHotkey # The hotkey with the provided id
function memoryrecord_getHotkeyByID(memoryRecord, id) end


---Set OnActivate event.
---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param onActivate fun(memoryRecord: MemoryRecord, before: boolean, currentState: boolean): boolean | string # A function to set to onActivate or the name of the function to use as onActivate function
function memoryrecord_onActivate(memoryRecord, onActivate) end


---Set OnDeactivate event.
---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param onDeactivate fun(memoryRecord: MemoryRecord, before: boolean, currentState: boolean): boolean | string # A function to set to onDeactivate or the name of the function to use as onDeactivate function
function memoryrecord_onDeactivate(memoryRecord, onDeactivate) end


---Set OnDestroy event.
---@param memoryRecord MemoryRecord # The memory record to manipulate
---@param onDestroy fun() | string # A function to set to onDestroy or the name of the function to use as onDestroy function
function memoryrecord_onDestroy(memoryRecord, onDestroy) end
