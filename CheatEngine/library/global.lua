---@meta _

---Regarding event handlers. You can initialize them using both a string of a functionName or the function itself.
---
---If initialized using a function itself it won't be able to get saved in the table

---@class Object
---@field ClassName string # The name of class (Read only)
local Object = {}

---@return string # the classname
function Object.getClassName() end

---@param fieldName string
---@return Address # the address of the specific field
function Object.fieldAddress(fieldName) end

---@param methodName string
---@return Address
function Object.methodAddress(methodName) end

---@param address Address
---@return string
function Object.methodName(address) end

---Destroys the object
function Object.destroy() end


---The main Cheat Engine GUI object
---@class MainForm: Form
---@field process string # A variable that contains the main modulename of the currently opened process
---@field AddressList Addresslist # The address list of the main Cheat Engine GUI
---@field Menu Menu # The main menu behind the main GUI window
---@field Splitter1 Control # Control for the first splitter separates the memory scan from addresslist
---@field Panel4 Control # Control for the bottom panel that has table extras and advanced options
---@field Panel5 Control # Control for the middle panel that has the memory scan and scan list
MainForm = {}

---Define this if you want to be notified when a new process has been opened. 
---Called only once from the main thread. 
---It is recommended to use this instead of onOpenProcess. 
---Takes a process ID of the process that's been opened, a process handle of the process that's been opened, the process' associated name.
---@param processID integer | nil
---@param processHandle integer | nil
---@param caption string | nil
function OnProcessOpened(processID, processHandle, caption) end


---A variable that contains the path of the trainer that launched cheat engine 
---(Only set when launched as a trainer)
---@type string
TrainerOrigin = ""

---A variable that contains the main modulename of the currently opened process
---@type string
process = ""

---@param object Object # Object to operate on
---@return string # The object's class name
function object_getClassName(object) end

---Destroy the object.
---@param object Object # Object to operate on
function object_destroy(object) end

---@return Timer # The freeze timer object
function getFreezeTimer() end

---@return Timer # The update timer object
function getUpdateTimer() end

---@param object Object # Object to check
---@return boolean # If object is of any Cheat Engine class
function inheritsFromObject(object) end

---@param object Object # Object to check
---@return boolean # If the given object inherits from the Component class
function inheritsFromComponent(object) end

---@param object Object # Object to check
---@return boolean # If the given object inherits from the Control class
function inheritsFromControl(object) end

---@param object Object # Object to check
---@return boolean # If the given object inherits from the WinControl class
function inheritsFromWinControl(object) end

---@generic T: Object
---@param className string # The name of the class to create an object of
---@return T # Creates an object of the specified class (Assuming it's a registered class and has a default constructor)
function createClass(className) end




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
function supportCheatEngine(
  attachWindow, hasCloseButton, width,
  height, position ,yourUrl, extraParameters,
  percentageShown
) end


---Removes the ad window if it was showing.
function fuckCheatEngine() end

