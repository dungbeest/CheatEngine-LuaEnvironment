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





---@class MainForm: Form
---@field process string # A variable that contains the main modulename of the currently opened process
---@field AddressList Addresslist # The address list of the main Cheat Engine GUI
---@field Menu Menu # The main menu behind the main GUI window
---@field Splitter1 Control # Control for the first splitter separates the memory scan from addresslist
---@field Panel4 Control # Control for the bottom panel that has table extras and advanced options
---@field Panel5 Control # Control for the middle panel that has the memory scan and scan list
---@field OnProcessOpened fun(processID: integer | nil, processHandle: integer | nil, caption: string | nil) # Define this if you want to be notified when a new process has been opened. Called only once from the main thread. It is recommended to use this instead of onOpenProcess. Takes a process ID of the process that's been opened, a process handle of the process that's been opened, the process' associated name.




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
  AddressList = AddressList,
  Menu = {
    ClassName = "",
    Component = {},
    ComponentByName = {},
    ComponentCount = 0,
    Items = {
      Caption = "",
      ClassName = "",
      Component = {},
      ComponentByName = {},
      ComponentCount = 0,
      Count = 0,
      FontColor = 0,
      ImageIndex = 0,
      ImageList = {
        Count = 0,
        DrawingStyle = "dsFocus",
        Height = 0,
        Masked = false,
        OnChange = function(_) end,
        Scaled = false,
        Width = 0,
        add = function(_,_) return 0 end,
        draw = function(_,_,_,_) end
      },
      Item = {},
      Menu = MainForm.Menu,
      MenuIndex = 0,
      Name = "",
      OnClick = function(_) end,
      Owner = nil,
      Parent = MainForm.Menu.Items,
      Shortcut = "",
      Tag = 0,
      add = function(_) end,
      clear = function() end,
      delete = function(_) end,
      destroy = function() end,
      doClick = function() end,
      fieldAddress = function(_) return 0 end,
      findComponentByName = function(_) return MainForm.Menu end,
      getCaption = function() return "" end,
      getClassName = function() return "" end,
      getComponent = function(_) return MainForm.Menu end,
      getComponentCount = function() return 0 end,
      getCount = function() return 0 end,
      getItem = function(_) return MainForm.Menu.Items end,
      getName = function() return "" end,
      getOnClick = function() return function() end end,
      getOwner = function() return MainForm.Menu end,
      getShortcut = function() return "" end,
      getTag = function() return 0 end,
      insert = function(_, _) end,
      methodAddress = function(_) return 0 end,
      methodName = function(_) return "" end,
      setCaption = function(_) end,
      setName = function(_) end,
      setOnClick = function(_) end,
      setShortcut = function(_) end,
      setTag = function(_) end,
    },
    Name = "",
    Owner = nil,
    Tag = 0,
    destroy = function() end,
    fieldAddress = function(_) return 0 end,
    findComponentByName = function(_) return MainForm.Menu end,
    getClassName = function() return "" end,
    getComponent = function(_) return MainForm.Menu end,
    getComponentCount = function() return 0 end,
    getItems = function() return MainForm.Menu.Items end,
    getName = function() return "" end,
    getOwner = function() return MainForm.Menu end,
    getTag = function() return 0 end,
    methodAddress = function(_) return 0 end,
    methodName = function(_) return "" end,
    setName = function(_) end,
    setTag = function(_) end,
  },
  Splitter1 = createSplitter(MainForm),
  Panel4 = createPanel(MainForm),
  Panel5 = createPanel(MainForm),
  OnProcessOpened = function (processID, processHandle, caption) end
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
function supportCheatEngine(
  attachWindow, hasCloseButton, width,
  height, position ,yourUrl, extraParameters,
  percentageShown
) end


---Removes the ad window if it was showing.
function fuckCheatEngine() end

