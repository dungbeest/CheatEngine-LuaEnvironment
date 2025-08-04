---@meta _


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
---@field FormState FormState # The current state of the form (Read-only)
local Form = {}

---The function to call when the form gets closed.
---@param sender any
---@return CloseAction | nil # A CloseAction to determine how to close the window
function Form.OnClose(sender) end

---Called when files are dragged on top of the form.
---@param sender any
---@param files string[] # An array table with the files (??? as string?, as path?)
function Form.OnDropFiles(sender, files) end

---Resizes controls and fonts based on the current DPI and the DPI used to create the form. 
---
---Only use this on forms that are not designed with variable DPI in mind.
function Form.fixDPI() end

---Places the form at the center of the screen.
function Form.centerScreen() end

---Hide the form.
function Form.hide() end

---Show the form.
function Form.show() end

---Closes the form. 
---Without an onClose this will be the same as hide.
function Form.close() end

---Brings the form to the foreground.
function Form.bringToFront() end

---Show the form and wait for it to close and get the close result.
function Form.showModal() end

---@return boolean # Whether the specified form has focus.
function Form.isForegroundWindow() end

---Sets OnClose function.
---@param OnClose FormOnClose
function Form.setOnClose(OnClose) end

---@return FormOnClose # The OnClose function.
function Form.getOnClose() end

---@return MainMenu # The main menu object of this form.
function Form.getMenu() end

---@param menu MainMenu # Sets the main menu object of this form.
function Form.setMenu(menu) end

---@return any # The border style of the window
function Form.getBorderStyle() end

---Sets the border style of the window.
---@param borderStyle any
function Form.setBorderStyle(borderStyle) end

---Draws the contents of the form to a raster image class object.
---@param rasterImage RasterImage
function Form.printToRasterImage(rasterImage) end

---Registers a function to be called when the form has finished being created.
---@param OnCreate function
---@return userdata # A userdata Id.
function Form.registerCreateCallback(OnCreate) end

---Removes the specific callback.
---@param OnCreateId userdata
function Form.unregisterCreateCallback(OnCreateId) end

---Registers a function to be called when the form is shown the first time.
---@param OnFirstShow function
---@return userdata # A userdata Id.
function Form.registerFirstShowCallback(OnFirstShow) end

---Removes the specific callback
---@param OnFirstShowId userdata
function Form.unregisterFirstShowCallback(OnFirstShowId) end

---Registers a function to be called when the form has been closed.
---@param OnClose function
---@return userdata # A userdata Id.
function Form.registerCloseCallback(OnClose) end

---Removes the specific callback.
---@param OnCloseId userdata
function Form.unregisterCloseCallback(OnCloseId) end

---Call this on mousedown on any object if you wish that the mouse move will drag the whole form around. 
---
---Useful for borderless windows (Dragging will stop when the mouse button is released).
function Form.dragNow() end

---Saves the current form position and dimensions and an optional list of integer. 
---
---The name of the form must have been set to a unique name
---@param extra? integer[]
function Form.saveFormPosition(extra) end

---Restores the form position and dimensions.
---
---The name of the form must have been set to a unique name
---@return boolean # On success returns true.
---@return integer[] | nil # A integer table if that was provided with the save.
function Form.loadFormPosition() end



---Inherits from Form (CEForm->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class CEForm: Form
---@field DoNotSaveInTable boolean # Set this if you do not wish to save the forms in the table
local CEForm = {}

---Saves a user defined form.
---@param fileName path
function CEForm.saveToFile(fileName) end

---Saves the user defined form to the given stream.
---@param stream Stream
function CEForm.saveToStream(stream) end


---@return boolean # The DoNotSaveInTable property
function CEForm.getDoNotSaveInTable() end

---Sets the DoNotSaveInTable property.
---@param doNotSaveInTable boolean
function CEForm.setDoNotSaveInTable(doNotSaveInTable) end

---Sets the current state of the form as the state that will be saved when the table is saved.
function CEForm.saveCurrentStateAsDesign() end


---Inherits from Form (TfrmLuaEngine->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TfrmLuaEngine: Form
---@field mOutput Memo # Output of the lua engine window
---@field mScript SynEdit # Editor for the script


---Inherits from Form (TfrmAutoInject->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TfrmAutoInject: Form
---@field Assemblescreen SynEdit # Editor for the script
---@field TabCount integer #
---@field TabScript string[] #
local TfrmAutoInject = {}

---@return integer
function TfrmAutoInject.addTab() end

---@param index integer
function TfrmAutoInject.deleteTab(index) end


---Inherits from Form (StructureFrm->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class StructureFrm: Form
---@field MainStruct structure # The currently selected structure
---@field ColumnCount integer # the number of columns (columns=address)
---@field Column structColumn[] # Fetches a structColumn object from the structure form
---@field GroupCount integer # The number of groups
---@field Group structGroup[] # Fetches a structGroup object from the structure form
local StructureFrm = {}

---Called when the statusbar gets updated.
---@param notificationBar any # ???
function StructureFrm.OnStatusbarUpdate(notificationBar) end

---Forces a refresh.
function StructureFrm.structChange() end

---Adds a new column in the currently focused group.
---@return structColumn # the newly added structColumn object
function StructureFrm.addColumn() end

---Adds a new group.
---@return structGroup # the newly added structGroup object
function StructureFrm.addGroup() end

---@return StructureElement # The currently selected StructureElement
---@return table # A table containing an indexed list containing 'struct', and 'element' describing the path to the base
function StructureFrm.getSelectedStructElement() end


---Inherits from Form (TFrmTracer->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TFrmTracer: Form
---@field Count integer # Number of entries in the list
---@field SelectionCount integer # The number of selected entries
---@field Entry TracerTable[] # Information about each entry. Read only. (Index starts at 0)
---@field StackEntry ByteTable[] # The stack snapshot of that entry. Nil if not available


---Inherits from Form (TfrmUltimap2->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class TfrmUltimap2: Form
---@field Count integer # The number of entries in the list (READONLY)
local TfrmUltimap2 = {}

---@param address Address
---@return boolean # Whether the current address is in the list of addresses.
---@return integer count # In case of true, it also returns the count value (up to 255).
function TfrmUltimap2.isInList(address) end


---Inherits from Form (TfrmCodeFilter->Form->ScrollingWinControl->CustomControl->WinControl->Control->Component->Object) 
---@class TfrmCodeFilter: Form
local TfrmCodeFilter = {}

---@param address Address
---@return boolean # Whether the current address is in the list of addresses.
function TfrmCodeFilter.isInList(address) end


---@return integer The total number of forms assigned to the main CE application
function getFormCount() end

---@param index integer # Index of form to get
---@return Form # The form at the specific index
function getForm(index) end


---Registers a function to be called when a form is attached to CE's form list.
---
---This is useful for extentions that add new functionality to certain existing forms.
---@param callback fun(form: Form) # A function to be called when a form is attached to Cheat Engine's form list.
---@return Object # An object you can use with unregisterFormAddNotification
---@see unregisterFormAddNotification
function registerFormAddNotification(callback) end

---Unregisters a function called for form notifications.
---@param object Object # An object from registerFormAddNotification
---@see registerFormAddNotification
function unregisterFormAddNotification(object) end

---@return Settings # The main settings form
function getSettingsForm() end

---@return Memoryview # The main memory view form class object which can be accessed using the Form_ class methods and the methods of the classes it inherits from. There can be multiple memory views, but this will only find the original/base
function getMemoryViewForm() end

---@return MainForm # The main form class object which can be accessed using the Form class methods and the methods of the classes it inherits from
function getMainForm() end


---Creates a CEForm class object(window).
---@param visible? boolean # Visible is default true but can be changed
---@return CEForm # returns the pointer for new CEForm
function createForm(visible) end

---Creates a CEForm class object(window) from a file.
---@param fileName path # Path to file to read form from
---@return CEForm # The generated CEform
function createFormFromFile(fileName) end

---Creates a CEForm class object(window) from a stream.
---@generic T: Stream
---@param stream T # Stream to read form from
---@return CEForm # The generated CEform
function createFormFromStream(stream) end

---@return TfrmLuaEngine # The main lua engine form object (Creates it if needed)
function getLuaEngine() end

---Creates a new lua engine form object.
---
---If there is no main lua engine window, this will become it. 
---@return TfrmLuaEngine # The new lua engine form object
function createLuaEngine() end

---Spawns an auto assembler window with the optionally provided script.
---@param script? string # Script to write into auto assembler form
---@return TfrmAutoInject # The new auto assemble window form
function createAutoAssemblerForm(script) end


---@param address SymbolAddress #
---@param groupName? string
---@param structureName? string
---@return StructureFrm # A new StructureFrm
function createStructureForm(address, groupName, structureName) end


---@return StructureFrm[] # A table of StructureFrm objects (can be useful for finding a structure window with the wanted structure)
function enumStructureForms() end

---Gets the ultimap2 form.
---@return TfrmUltimap2 | nil # The ultimap2 form, nil if not open
function getUltimap2() end


---Gets the code filter form.
---@return TfrmCodeFilter # The codefilter form
function getCodeFilter() end
