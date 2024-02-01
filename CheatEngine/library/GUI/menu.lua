---@meta



---Inherits from Component (MenuItem->Component->Object)
---@class MenuItem: Component
---@field Caption string # Text of the menu item
---@field Shortcut string # Shortcut in text form to trigger the menuitem
---@field Count integer # Number of children attached to this menuitem
---@field Menu Menu # The menu this item resides in
---@field Parent MenuItem # The menu item this item hangs under
---@field MenuIndex integer # The position this menu item is in it's parent
---@field ImageList ImageList #
---@field ImageIndex integer # Which image of the attached ImageList to show
---@field Item MenuItem[] # Array to access each child menu item
---@field OnClick function # Function to call when the menu item is activated
---@field FontColor Colors # Color of the font. (Only works when in dark mode)
---@field getCaption fun(): string # Gets the caption of the menu item
---@field setCaption fun(caption: string) # Sets the caption of the menu item
---@field getShortcut fun(): string # Returns the shortcut for this menu item
---@field setShortcut fun(shortcut: string) # Sets the shortcut for this menuitem. A shortcut is a string in the form of ("ctrl+x")
---@field getCount fun(): integer #
---@field getItem fun(index: integer): MenuItem # Returns the menu item object at the given index
---@field add fun(item: MenuItem) # Adds a menuItem as a submenu item
---@field insert fun(index: integer, item: MenuItem) # Adds a menuItem as a submenu item at the given index
---@field delete fun(index: integer) #
---@field clear fun() # Deletes all children under this menuitem (frees the menu item, so it's gone)
---@field setOnClick fun(onClick: function) # Sets an OnClick event
---@field getOnClick fun(): function #
---@field doClick fun() # Executes the OnClick method if one is assigned



---Inherits from Component (Menu->Component->Object)
---@class Menu: Component
---@field Items MenuItem # The base MenuItem class of this menu (readonly)
---@field getItems fun(): MenuItem # Returns the main MenuItem of this Menu


---Inherits from Menu (MainMenu->Menu->Component->Object)
---@class MainMenu: Menu

---Inherits from Menu (PopupMenu->Menu->Component->Object)
---@class PopupMenu: Menu


---Creates a menu item that gets added to the owner menu
---@param ownerMenu Menu | MenuItem
---@return MenuItem # A new menu item
function createMenuItem(ownerMenu) return {} end

---@param form Form # The form to attach a menu to
---@return MainMenu # The main Menu is the menu at the top of a window
function createMainMenu(form) return {} end

---@param owner Control # The control to attach the menu to
---@return PopupMenu # The popup menu is the menu that pops up when showing the (rightclick) context of an control
function createPopupMenu(owner) return {} end
