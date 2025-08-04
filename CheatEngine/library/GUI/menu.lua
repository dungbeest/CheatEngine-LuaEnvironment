---@meta _



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
local MenuItem = {}

---Gets the caption of the menu item
---@return string
function MenuItem.getCaption() end

---Sets the caption of the menu item
---@param caption string
function MenuItem.setCaption(caption) end

---Gets the caption of the menu item
---@return string # the shortcut for this menu item
function MenuItem.getShortcut() end

---Sets the shortcut of the menu item.
---
---A shortcut is a string in the form of ("ctrl+x").
---@param shortcut string
function MenuItem.setShortcut(shortcut) end

---@return function
function MenuItem.getOnClick() end

---Sets an OnClick event
---@param onClick function
function MenuItem.setOnClick(onClick) end


---@return integer
function MenuItem.getCount() end


---@param index integer
---@return MenuItem # the menu item object at the given index
function MenuItem.getItem(index) end

---Adds a menuItem as a submenu item.
---@param item MenuItem
function MenuItem.add(item) end

---Adds a menuItem as a submenu item at the given index
---@param index integer
---@param item MenuItem
function MenuItem.add(index, item) end

---@param index integer
function MenuItem.delete(index) end

---Deletes all children under this menuitem (frees the menu item, so it's gone)
function MenuItem.clear() end

---Executes the OnClick method if one is assigned.
function MenuItem.doClick() end



---Inherits from Component (Menu->Component->Object)
---@class Menu: Component
---@field Items MenuItem # The base MenuItem class of this menu (readonly)
local Menu = {}

---@return MenuItem # The main MenuItem of this Menu
function Menu.getItems() end

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
