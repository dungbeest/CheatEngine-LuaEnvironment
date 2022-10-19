---@meta


---Generates an auto assembler script which will hook the given address when executed.
---@param address SymbolAddress
---@param addressToJumpTo SymbolAddress
---@param addressToGetNewCallAddress? SymbolAddress
---@param ext? string # ???
---@param targetSelf boolean #
function generateAPIHookScript(
  address, addressToJumpTo,
  addressToGetNewCallAddress,
  ext, targetSelf
) end

---A table with table entries: PathToFile and RelativePath.
---
---Ex. Output:
---
---[1]:
--->PathToFile=c:\cefolder\autorun\mycode.lua
--->RelativePath="autorun\"
---
---[2]:
--->PathToFile=c:\cefolder\autorun\dlls\mycode.lua
--->RelativePath="autorun\mylib.dll"
---
---@class TrainerFeature
---@field PathToFile string #
---@field RelativePath string #

---Adds a new feature to the exe trainer generator window, and calls your function when the user builds an .exe trainer.  
---
---Note: This runs AFTER the table has been packaged already
---@param featureName string # Name of the feature to add
---@param callback fun(): TrainerFeature # The function to run for the feature.
---@return integer # The id of the feature to use with unregisterEXETrainerFeature()
---@see unregisterEXETrainerFeature
function registerEXETrainerFeature(featureName, callback) end

---Unregister a previously registered trainer feature.
---@param ID integer # ID of the trainer feature to remove
---@see registerEXETrainerFeature
function unregisterEXETrainerFeature(ID) end

---Registers an auto assembler command to call the specified function. The command will be replaced by the string this function returns when executed.
---
---The function can be called twice: once for syntax check and symbol lookup(1), and the second time for actual execution by the assembler(2) if it has not been removed in phase1.
---
---Note: The callback function can return multiple values:
--->nil, string -> Will raise an error with the given string
--->MultilineString -> Replaces the line in the script with the given string.
---
---If the function returns nil, and as secondary parameter a string, this will make the auto assembler fail with that error
---@param command string # The auto assembler command name
---@param callback fun(parameters: any[], syntaxCheckOnly: boolean): nil | string # Callback function that processes the command
---@see unregisterAutoAssemblerCommand
function registerAutoAssemblerCommand(command, callback) end

---Unregisters a previously registered command.
---@param command string # The auto assembler command name
---@see registerAutoAssemblerCommand
function unregisterAutoAssemblerCommand(command) end

---Makes the lua highlighter show the functionname as a functionkeyword
---@param functionName string # functionname to treat as a functionkeyword
---@see unregisterLuaFunctionHighlight
function registerLuaFunctionHighlight(functionName) end

---Removes the given name from showing up as a functionkeyword
---@param functionName string # functionname to treat as a functionkeyword
---@see registerLuaFunctionHighlight
function unregisterLuaFunctionHighlight(functionName) end



---Registers a function to be called when a symbol is parsed.
---@param callback fun(string: string): Address | nil # The callback that will be registered. Return the corresponding address during the symbol lookup if you found it. Nil or 0 if you didn't.
---@param location SymbolLookupStep # When in the symbol lookup process the callback is called
---@return integer # The callback ID to use with unregisterSymbolLookupCallback()
---@see unregisterSymbolLookupCallback
function registerSymbolLookupCallback(callback, location) return 0 end

---Unregisters a previously registered callback.
---@param ID integer # ID of the callback to remove
---@see registerSymbolLookupCallback
function unregisterSymbolLookupCallback(ID) end

---Registers a function to be called when the name of an address is requested.
---@param callback fun(int: integer): Symbol | nil # The callback that will be registered. Return the corresponding symbol if you found it. nil if you didn't
---@return integer # The callback ID to use with unregisterAddressLookupCallback()
---@see unregisterAddressLookupCallback
function registerAddressLookupCallback(callback) return 0 end

---Unregisters a previously registered callback.
---@param ID integer # ID of the callback to remove
---@see registerAddressLookupCallback
function unregisterAddressLookupCallback(ID) end

---Calls the given function each time the list is updated
---@param callback fun(sender: any) # The callback that will be registered
---@return integer # The callback ID to use with unregisterGlobalStructureListUpdateNotification()
---@see unregisterGlobalStructureListUpdateNotification
function registerGlobalStructureListUpdateNotification(callback) return 0 end

---Unregisters a previously registered callback.
---@param ID integer # ID of the callback to remove
---@see registerGlobalStructureListUpdateNotification
function unregisterGlobalStructureListUpdateNotification(ID) end

---@class DataStructure
---@field name string # Name of the structure
---@field id1 integer # ID you can use for whatever(e.g module ID)
---@field id2 integer # ID you can use for whatever(e.g structure ID inside the module)

---@class DataElement
---@field name string #
---@field offset integer #
---@field vartype VariableType #

---Registers a function to be called when a structure needs to be dissected.
---
---Each DataStructure's IDs returned by structureListCallback is passed on to elementListCallback.
---Tip: If you return an empty table the structure will not be created. You can use this to create the structure layout yourself and register that instead
---@param structureListCallback fun(): DataStructure[] # The function to be called when a structure needs to be dissected.
---@param elementListCallback fun(ID1: integer, ID2: integer): DataElement[] # A function called for each structure created by structureListCallback
---@return integer # The callback ID to use with unregisterStructureAndElementListCallback()
---@see unregisterStructureAndElementListCallback
function registerStructureAndElementListCallback(
    structureListCallback, elementListCallback
) return 0 end

---Unregisters a previously registered callback.
---@param ID integer # ID of the callback to remove
---@see registerStructureAndElementListCallback
function unregisterStructureAndElementListCallback(ID) end

---Is called by the structure dissect window when the user chooses to let cheat engine guess the structure for him.
---
---Use the structure object to fill it in.
---
---Tip: Use inputQuery to ask the user the size if your function doesn't do that automatically
---@param callback fun(structure: {}, baseAddress: Address): boolean | nil # The function to be called for dissecting structures. Should return true if you have filled it in, or false or nil if you did not
---@return integer # The callback ID to use with unregisterStructureDissectOverride()
---@see unregisterStructureDissectOverride
---@see onAutoGuess
function registerStructureDissectOverride(callback) return 0 end

---Unregisters a previously registered callback.
---@param ID integer # ID of the callback to remove
---@see registerStructureDissectOverride
function unregisterStructureDissectOverride(ID) end


---Registers a function to be called when dissect data asks the user for the name of a new structure define. 
---
---If you have code that can look up the name of a structure, and perhaps also the real starting point, you can use this to improve the data dissection. 
---@param callback fun(address: Address): string # Function to be called
---@param address? Address # ???
---@return integer # The callback ID to use with unregisterStructureNameLookup()
---@see unregisterStructureNameLookup
function registerStructureNameLookup(callback, address) return 0 end

---Unregisters a previously registered callback.
---@param ID integer # ID of the callback to remove
---@see registerStructureNameLookup
function unregisterStructureNameLookup(ID) end

---Registers a function to be called when the single line assembler is invoked to convert an instruction to a list of bytes
---@param callback fun(address: Address, instruction: string): ByteTable # The callback which will handle the instruction. Return a byte table with the specific bytes, or nil if you wish to let another function, or the original x86 assembler to assemble it
---@return integer # The callback ID to use with unregisterAssembler()
---@see unregisterAssembler
function registerAssembler(callback) return 0 end

---Unregisters the registered assembler
---@param ID integer # ID of the assembler to remove
---@see registerAssembler
function unregisterAssembler(ID) end


---Registers a function to be called when the auto assembler is about to parse an auto assembler script. 
---
---The script passed to the callback is after the [ENABLE] and [DISABLE] tags have been used to strip the script to the according one, but before comment stripping and trimming has occured.
---@param callback fun(script: Strings, syntaxCheck: boolean) # script is a Strings object which when changed has direct effect on the script to be assembled. syntaxCheck determines whether the assembler is being run at syntax check only step.
---@param postAOB? boolean # ???. Defaults to false
---@return integer # The callback ID to use with unregisterAutoAssemblerPrologue()
---@see unregisterAutoAssemblerPrologue
function registerAutoAssemblerPrologue(callback, postAOB) return 0 end


---Unregisters the registered callback
---@param ID integer # ID of the callback to remove
---@see registerAutoAssemblerPrologue
function unregisterAutoAssemblerPrologue(ID) end


---Registers a template for the auto assembler. 
---@param name string # Name of the template
---@param callback fun(script: Strings, sender: TfrmAutoInject) # The script parameter is a TStrings object that has a direct connection to the current script. (All script parsing is up to you...)
---@param shortcut? any #
---@return integer # The callback ID to use with unregisterAutoAssemblerTemplate()
---@see unregisterAutoAssemblerTemplate
function registerAutoAssemblerTemplate(
  name, callback, shortcut
) return 0 end


---Unregisters the registered callback.
---@param ID integer # ID of the callback to remove
---@see registerAutoAssemblerTemplate
function unregisterAutoAssemblerTemplate(ID) end


---Adds a default code injection script to the given script.
---@param script Strings # A template script object
---@param address SymbolAddress # The address to inject into
---@param farJump boolean # Whether to use long jumps
function generateCodeInjectionScript(
  script, address, farJump
) end

---Adds an AOB injection script to the given script.
---@param script Strings # A template script object
---@param symbolName string # The name to attribute to the symbol scanned by the AOB
---@param address SymbolAddress # The address to inject into
---@param commentRadius integer # Radius around the address to include as a comment. Defaults to 10
---@param farJump boolean # Whether to use long jumps
function generateAOBInjectionScript(
  script, symbolName, address, commentRadius, farJump
) end

---Adds a Full Injection script to the given script
---@param script Strings # A template script object
---@param address SymbolAddress # The address to inject into
---@param commentRadius integer # Radius around the address to include as a comment. Defaults to 10
---@param farJump boolean # Whether to use long jumps
function generateFullInjectionScript(
  script, address, commentRadius, farJump
) end

---Scans the given script for alloc(newmem## and returns the next unused newmem number)
---@param script Strings # A template script object
---@return integer # The next unused alloc number
function getNextAllocNumber(script) return 0 end

---creates a comment section for AA scripts that contains a snapshot of the original code
---@param script Strings # A template script object
---@param address Address # The address of the code being targeted
---@param commentRadius integer # Radius around the address to include as a comment. Defaults to 10
function addSnapshotAsComment(script, address, commentRadius) end

---Registers a function to be called whenever autoguess is used to predict a variable type.
---@param callback fun(address: Address, ceGuess: VariableType): VariableType # The callback function. Return the variable type you want it to be. If no change, just return ceGuess
function onAutoGuess(callback) end


---@return Stringlist # The AutoAttach StringList object. It can be controlled with the stringlist_ routines (it's not recommended to destroy this list object)
function getAutoAttachList() return {} end
