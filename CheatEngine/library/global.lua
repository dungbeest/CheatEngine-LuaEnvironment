---@meta

---Regarding eventhandlers. You can initialize them using both a string of a functionName or the function itself.
---
---If initialized using a function itself it won't be able to get saved in the table

---@class Object
---@field ClassName string # The name of class (Read only)
---@field getClassName fun(): string # returns the classname
---@field fieldAddress fun(fieldName: string): Address # returns the address of the specific field
---@field methodAddress fun(methodName: string): Address #
---@field methodName fun(address: Address): string #
---@field destroy fun() # Destroys the object




---Inherits from Panel (Addresslist->Panel->WinControl->Control->Component->Object)
---@class Addresslist: Panel
--@operator index(integer): MemoryRecord # Default accessor
---@field LoadedTableVersion integer # Returns the tableVersion of the last loaded table
---@field Count integer # The number of records in the table
---@field SelCount integer # The number of records that are selected
---@field SelectedRecord MemoryRecord # The main selected record
---@field MemoryRecord MemoryRecord[] # Array to access the individual memory records
---@field CheckboxActiveSelectedColor Colors #
---@field CheckboxActiveColor Colors #
---@field CheckboxSelectedColor Colors #
---@field CheckboxColor Colors #
---@field SelectedBackgroundColor Colors #
---@field SelectedSecondaryBackgroundColor Colors #
---@field ExpandSignColor Colors #
---@field IncreaseArrowColor Colors #
---@field DecreaseArrowColor Colors #
---@field MouseHighlightedRecord fun(): MemoryRecord | nil # Returns the memoryrecord that the mouse points at. nil if nothing
---@field OnDescriptionChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates a description column change on a record. Return true if you handle it, false for normal behaviour
---@field OnAddressChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates an address column change on a record. Return true if you handle it, false for normal behaviour
---@field OnTypeChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates a type column change on a record. Return true if you handle it, false for normal behaviour
---@field OnValueChange fun(addresslist: Addresslist, memoryRecord: MemoryRecord): boolean # Called when the user initiates a value column change on a record. Return true if you handle it, false for normal behaviour
---@field OnAutoAssemblerEdit fun(addresslist: Addresslist, memoryRecord) # Called when the user initiates a memoryrecord AA script edit.  This function will be responsible for changing the memory record
---@field getCount fun(): integer #
---@field getMemoryRecord fun(index: integer): MemoryRecord #
---@field getMemoryRecordByDescription fun(description: string): MemoryRecord | nil # Returns a MemoryRecord object
---@field getMemoryRecordByID fun(ID: integer): MemoryRecord | nil #
---@field createMemoryRecord fun(): MemoryRecord # Creates an generic cheat table entry and add it to the list
---@field getSelectedRecords fun(): MemoryRecord[] # Returns a table containing all the selected records
---@field doDescriptionChange fun() # Will show the GUI window to change the description of the selected entry
---@field doAddressChange fun() # Will show the GUI window to change the address of the selected entry
---@field doTypeChange fun() # Will show the GUI window to change the type of the selected entries
---@field doValueChange fun() # Will show the GUI window to change the value of the selected entries
---@field getSelectedRecord fun(): MemoryRecord # Gets the main selected memory record
---@field setSelectedRecord fun(memoryRecord: MemoryRecord) # Sets the currently selected memory record. This will unselect all other entries
---@field disableAllWithoutExecute fun() # Disables all memory records without executing their [Disable] section
---@field rebuildDescriptionCache fun() # Rebuilds the description to record lookup table


---@class MainForm
---@field process string # A variable that contains the main modulename of the currently opened process
---@field AddressList Addresslist # The address list of the main Cheat Engine GUI




---A variable that contains the path of the trainer that launched cheat engine 
---(Only set when launched as a trainer)
---@type string
TrainerOrigin = ""

---A variable that contains the main modulename of the currently opened process
---@type string
process = ""


---The main Cheat Engine GUI object
---@type MainForm
MainForm = {
  process = "",
  AddressList = {}
}

---@param object Object # Object to operate on
---@return string # The object's class name
function object_getClassName(object) return object.ClassName end

---Destroy the object.
---@param object Object # Object to operate on
function object_destroy(object) end

---@return Timer # The freeze timer object
function getFreezeTimer() return {} end

---@return Timer # The update timer object
function getUpdateTimer() return {} end

---@param object any # Object to check
---@return boolean # If object is of any Cheat Engine class
function inheritsFromObject(object) return true end

---@param object any # Object to check
---@return boolean # If the given object inherits from the Component class
function inheritsFromComponent(object) return true end

---@param object any # Object to check
---@return boolean # If the given object inherits from the Control class
function inheritsFromControl(object) return true end

---@param object any # Object to check
---@return boolean # If the given object inherits from the WinControl class
function inheritsFromWinControl(object) return true end

---@generic T: Object
---@param className string # The name of the class to create an object of
---@return T # Creates an object of the specified class (Assuming it's a registered class and has a default constructor)
function createClass(className) return {} end




---Will show an advertising window which will help keep the development of Cheat Engine going.
---
---If you provide your own url it will be shown Up to 75% of the time.
---
---Prefered formats for width, height are: 120x600 , 160x600, 300x250, 468x60, 728x90, but you are free to use different formats.
---@param attachWindow Form # The form that the ad is attached to
---@param hasCloseButton boolean # If true the window will have a border an a close button at top
---@param width integer # The client width of the window
---@param height integer # The client height of the window
---@param position WindowPositions #
---@param yourUrl? string # The url you want to show. When given instead of showing CE's ads 100% it will show your url up to 75%. You can use it for your own income, or for updating users about new versions of your trainer or whatever you feel like
---@param extraParameters? string # Url request parameters you can add to the default parameters (e.g trainername=mytrainer for tracking purposes)
---@param percentageShown? integer You can change the default of 75% to a smaller value like 50%
function supportCheatEngine(attachWindow, hasCloseButton, width, height, position ,yourUrl, extraParameters, percentageShown) end


---Removes the ad window if it was showing.
function fuckCheatEngine() end

