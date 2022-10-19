---@meta

---@alias OpenDialogOption string
---| '"ofReadOnly"' #
---| '"ofOverwritePrompt"' # If selected file exists shows a message, that file will be overwritten
---| '"ofHideReadOnly"' # Hide read-only files
---| '"ofNoChangeDir"' # Do not change current directory
---| '"ofShowHelp"' # Show a help button
---| '"ofNoValidate"' #
---| '"ofAllowMultiSelect"' # Allow multi selection
---| '"ofExtensionDifferent"' # 
---| '"ofPathMustExist"' # Shows an error message if selected path does not exist
---| '"ofFileMustExist"' # Shows an error message if selected file does not exist
---| '"ofCreatePrompt"' #
---| '"ofShareAware"' #
---| '"ofNoReadOnlyReturn"' # Do not return file names that are read-only
---| '"ofNoTestFileCreate"' #
---| '"ofNoNetworkButton"' #
---| '"ofNoLongNames"' #
---| '"ofOldStyleDialog"' #
---| '"ofNoDereferenceLinks"' # Do not expand file names for links
---| '"ofEnableIncludeNotify"' #
---| '"ofEnableSizing"' # Dialog can be resized, e.g. via the mouse
---| '"ofDontAddToRecent"' # Do not add the path to the history list
---| '"ofForceShowHidden"' # Show hidden files
---| '"ofViewDetail"' # Details are OS and interface dependent
---| '"ofAutoPreview"' # Details are OS and interface dependent

---@alias FindDialogOption string
---| '"frDown"' #
---| '"frFindNext"' #
---| '"frHideMatchCase"' #
---| '"frHideWholeWord"' #
---| '"frHideUpDown"' #
---| '"frMatchCase"' #
---| '"frDisableMatchCase"' #
---| '"frDisableUpDown"' #
---| '"frDisableWholeWord"' #
---| '"frReplace"' #
---| '"frReplaceAll"' #
---| '"frWholeWord"' #
---| '"frShowHelp"' #
---| '"frEntireScope"' #
---| '"frHideEntireScope"' #
---| '"frPromptOnReplace"' #
---| '"frHidePromptOnReplace"' #


---Inherits from Component (CommonDialog->Component->Object)
---@class CommonDialog: Component
---@field OnShow fun(sender: any) #
---@field OnClose fun(sender: any) #
---@field Title string # The caption at top of the dialog
---@field Execute fun(): boolean # Shows the dialog and return true/false depending on the dialog


---Inherits from CommonDialog (ColorDialog->CommonDialog->Component->Object)
---@class ColorDialog: CommonDialog
---@field Color Colors # The currently selected color
---@field CustomColors Strings # List of custom colors (entry looks like ColorA = FFFF00 ... ColorX = C0C0C0)


---Inherits from CommonDialog(FindDialog->CommonDialog->Component->Object)
---@class FindDialog: CommonDialog
---@field Top integer #
---@field Left integer #
---@field Width integer #
---@field Height integer #
---@field FindText string # The text the user wishes to find
---@field Options FindDialogOption[] # Find Options
---@field OnFind fun(sender: any) # Called when the find button has been clicked
---@field OnHelp fun(sender: any) # Called when the help button is visible (see Options) and clicked


---Inherits from CommonDialog (FileDialog->CommonDialog->Component->Object)
---@class FileDialog: CommonDialog
---@field DefaultExt string # When not using filters this will be the default extention used if no extension is given
---@field Files Strings # Stringlist containing all selected files if multiple files are selected
---@field FileName string # The filename that was selected
---@field Filter string # A filter formatted string
---@field FilterIndex integer # The index of which filter to use
---@field InitialDir string # Sets the folder the filedialog will show first


---Inherits from FileDialog (OpenDialog->FileDialog->CommonDialog->Component->Object)
---@class OpenDialog: FileDialog
---@field Options OpenDialogOption | string # A string formatted as "[param1, param2, param3]" to set OpenDialogs options


---Inherits from OpenDialog (SaveDialog->OpenDialog->CommonDialog->Component->Object)
---@class SaveDialog: OpenDialog


---Inherits from OpenDialog (SelectDirectoryDialog->OpenDialog->CommonDialog->Component->Object)
---@class SelectDirectoryDialog: OpenDialog




---@param owner? Component
---@return ColorDialog # A new color dialog
function createColorDialog(owner) return {} end


---@param owner Component #
---@return FindDialog # A new find dialog
function createFindDialog(owner) return {} end

---@param owner Component #
---@return OpenDialog # An open dialog object
function createOpenDialog(owner) return {} end

---@param owner Component #
---@return SaveDialog # A save dialog object
function createSaveDialog(owner) return {} end

---@param owner Component #
---@return SaveDialog # A select directory dialog object
function createSelectDirectoryDialog(owner) return {} end
