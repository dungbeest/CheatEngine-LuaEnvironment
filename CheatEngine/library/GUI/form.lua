---@meta


---@alias FormState string
---| '"fsCreating"' # 
---| '"fsVisible"' #
---| '"fsShowing"' #
---| '"fsModal"' #
---| '"fsCreatedMDIChild"' #
---| '"fsBorderStyleChanged"' #
---| '"fsFormStyleChanged"' #
---| '"fsFirstShow"' #
---| '"fsDisableAutoSize"' #


---@alias FormOnClose fun(sender: any): CloseAction | nil

---Inherits from ScrollingWinControl (Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class Form: ScrollingWinControl
---@field DesignTimePPI integer # The PPI/DPI at the time the form was designed
---@field AllowDropFiles boolean # Allows files to be dragged into the form
---@field ModalResult integer # The current ModalResult value of the form. Note: When this value gets set the modal form will close
---@field Menu MainMenu # The main menu of the form
---@field OnClose FormOnClose # The function to call when the form gets closed. Return a CloseAction to determine how to close the window
---@field OnDropFiles fun(sender: any, files: string[]) # Called when files are dragged on top of the form. Filenames is an array table with the files
---@field FormState FormState # The current state of the form (Read-only)
---@field fixDPI fun() # Resizes controls and fonts based on the current DPI and the DPI used to create the form. Only use this on forms that are not designed with variable DPI in mind
---@field centerScreen fun() # Places the form at the center of the screen
---@field hide fun() # Hide the form
---@field show fun() # Show the form
---@field close fun() # Closes the form. Without an onClose this will be the same as hide
---@field bringToFront fun() # Brings the form to the foreground
---@field showModal fun() # Show the form and wait for it to close and get the close result
---@field isForegroundWindow fun(): boolean # Returns true if the specified form has focus
---@field setOnClose fun(OnClose: FormOnClose) # Sets OnClose function
---@field getOnClose fun(): FormOnClose # Returns the OnClose function
---@field getMenu fun(): MainMenu # Returns the main menu object of this form
---@field setMenu fun(menu: MainMenu) # Sets the main menu object of this form
---@field setBorderStyle fun(borderStyle: any) # Sets the border style of the window
---@field getBorderStyle fun(): any # Returns the border style of the window
---@field printToRasterImage fun(rasterImage: RasterImage) # Draws the contents of the form to a raster image class object
---@field registerCreateCallback fun(OnCreate: function): userdata # Registers a function to be called when the form has finished being created
---@field unregisterCreateCallback fun(OnCreateId: userdata) # Removes the specific callback
---@field registerFirstShowCallback fun(OnFirstShow: function): userdata # Registers a function to be called when the form is show the first time
---@field unregisterFirstShowCallback fun(OnFirstShowId: userdata) # Removes the specific callback
---@field registerCloseCallback fun(OnClose: function): userdata # Registers a function to be called when the form has been closed
---@field unregisterCloseCallback fun(OnCloseId: userdata) # Removes the specific callback
---@field dragNow fun() # Call this on mousedown on any object if you wish that the mousemove will drag the whole form arround. Useful for borderless windows (Dragging will stop when the mouse button is released)
---@field saveFormPosition fun(extra?: integer[]) # Saves the current form position and dimensions and an optional list of integer. The name of the form must have been set to a unique name
---@field loadFormPosition fun(): boolean, integer[] | nil # Restores the form position and dimensions. On success returns true and a integer table if that was provided with the save.  The name of the form must have been set to a unique name



---Inherits from Form (CEForm->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class CEForm: Form
---@field DoNotSaveInTable boolean # Set this if you do not wish to save the forms in the table
---@field saveToFile fun(fileName: path) # Saves a user defined form
---@field saveToStream fun(stream: Stream) # Saves the user defined form to the given stream
---@field getDoNotSaveInTable fun(): boolean # Returns the DoNotSaveInTable property
---@field setDoNotSaveInTable fun(doNotSaveInTable: boolean) # Sets the DoNotSaveInTable property
---@field saveCurrentStateAsDesign fun() # Sets the current state of the form as the state that will be saved when the table is saved


---Inherits from Form (TfrmLuaEngine->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TfrmLuaEngine: Form
---@field mOutput Memo # Output of the lua engine window
---@field mScript SynEdit # Editor for the script


---Inherits from Form (TfrmAutoInject->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TfrmAutoInject: Form
---@field Assemblescreen SynEdit # Editor for the script
---@field TabCount integer #
---@field TabScript string[] #
---@field addTab fun(): integer #
---@field deleteTab fun(index: integer) #



---Inherits from Form (StructureFrm->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class StructureFrm: Form
---@field MainStruct structure # The currently selected structure
---@field ColumnCount integer # the number of columns (columns=address)
---@field Column structColumn[] # Fetches a structColumn object from the structure form
---@field GroupCount integer # The number of groups
---@field Group structGroup[] # Fetches a structGroup object from the structure form
---@field OnStatusbarUpdate fun(notificationBar) # Called when the statusbar gets updated
---@field structChange fun() # Forces a refresh
---@field addColumn fun(): structColumn # Adds a new column in the currently focused group and returns its structColumn object
---@field addGroup fun(): structGroup # Adds a new group and returns the structGroup object
---@field getSelectedStructElement fun(): StructureElement # Returns the currently selected StructureElement , and as second result a table containing an indexed list continaing 'struct', and 'element' describing the path to the base


---Inherits from Form (TFrmTracer->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TFrmTracer: Form
---@field Count integer # Number of entries in the list
---@field SelectionCount integer # The number of selected entries
---@field Entry TracerTable[] # Information about each entry. Read only. (Index starts at 0)
---@field StackEntry ByteTable[] # The stack snapshot of that entry. Nil if not available


---Inherits from Form (TfrmUltimap2->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TfrmUltimap2: Form
---@field Count integer # The number of entries in the list (READONLY)
---@field isInList fun(address: Address): boolean, count: integer # Returns true if the current address is in the list of addresses. In case of true, it also returns the count value (up to 255).


---Inherits from Form (TfrmCodeFilter->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object) 
---@class TfrmCodeFilter: Form
---@field isInList fun(address: Address): boolean # Returns true if this address is in the list



---@return integer The total number of forms assigned to the main CE application
function getFormCount() return 0 end

---@param index integer # Index of form to get
---@return Form # The form at the specific index
function getForm(index) return {} end


---Registers a function to be called when a form is attached to CE's form list.
---
---This is useful for extentions that add new functionality to certain existing forms.
---@param callback fun(form: Form) # A function to be called when a form is attached to Cheat Engine's form list.
---@return Object # An object you can use with unregisterFormAddNotification
---@see unregisterFormAddNotification
function registerFormAddNotification(callback) return {} end

---Unregisters a function called for form notifications.
---@param object Object # An object from registerFormAddNotification
---@see registerFormAddNotification
function unregisterFormAddNotification(object) end

---@return Settings # The main settings form
function getSettingsForm() return {} end

---@return Memoryview # The main memory view form class object which can be accessed using the Form_ class methods and the methods of the classes it inherits from. There can be multiple memory views, but this will only find the original/base
function getMemoryViewForm() return {} end

---@return MainForm # The main form class object which can be accessed using the Form class methods and the methods of the classes it inherits from
function getMainForm() return {} end


---Creates a CEForm class object(window).
---@param visible? boolean # Visible is default true but can be changed
---@return CEForm # returns the pointer for new CEForm
function createForm(visible) return {} end

---Creates a CEForm class object(window) from a file.
---@param fileName path # Path to file to read form from
---@return CEForm # The generated CEform
function createFormFromFile(fileName) return {} end

---Creates a CEForm class object(window) from a stream.
---@generic T: Stream
---@param stream T # Stream to read form from
---@return CEForm # The generated CEform
function createFormFromStream(stream) return {} end

---@return TfrmLuaEngine # The main lua engine form object (Creates it if needed)
function getLuaEngine() return {} end

---Creates a new lua engine form object.
---
---If there is no main lua engine window, this will become it. 
---@return TfrmLuaEngine # The new lua engine form object
function createLuaEngine() return {} end

---Spawns an auto assembler window with the optionally provided script.
---@param script? string # Script to write into auto assembler form
---@return TfrmAutoInject # The new auto assemble window form
function createAutoAssemblerForm(script) return {} end


---@param address SymbolAddress #
---@param groupName? string
---@param structureName? string
---@return StructureFrm # A new StructureFrm
function createStructureForm(address, groupName, structureName) return {} end


---@return StructureFrm[] # A table of StructureFrm objects (can be useful for finding a structure window with the wanted structure)
function enumStructureForms() return {} end

---Gets the ultimap2 form.
---@return TfrmUltimap2 | nil # The ultimap2 form, nil if not open
function getUltimap2() return {} end


---Gets the code filter form.
---@return TfrmCodeFilter # The codefilter form
function getCodeFilter() return {} end
