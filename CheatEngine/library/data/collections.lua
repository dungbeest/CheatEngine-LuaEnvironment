---@meta _


---@alias StructureDisplayMethod string
---| '"dtUnsignedInteger"' # 
---| '"dtSignedInteger"' # 
---| '"dtHexadecimal"' #

---@alias HeaderAlignment string
---| '"taLeftJustify"' #
---| '"taRightJustify"' #
---| '"taCenter"' #


---Inherits from Object (CollectionItem->Object)
---
---Base class for some higher level classes. 
---
---Often used for columns.
---@class CollectionItem: Object
---@field ID integer #
---@field Index integer # The index in the array this item belong to
---@field DisplayName string #
local CollectionItem = {}

---@return integer
function CollectionItem.getID() end

---@return integer
function CollectionItem.getIndex() end

---@param index integer
function CollectionItem.setIndex(index) end

---@return string
function CollectionItem.getDisplayName() end

---@param displayName string
function CollectionItem.setDisplayName(displayName) end


---Inherits from CollectionItem (ListColumn->CollectionItem->Object)
---@class ListColumn: CollectionItem
---@field AutoSize boolean #
---@field Caption string #
---@field MaxWidth integer #
---@field MinWidth integer #
---@field Width integer #
---@field Visible boolean #
local ListColumn = {}

---@return boolean
function ListColumn.getAutosize() end

---@param autoSize boolean
function ListColumn.setAutosize(autoSize) end

---@return string
function ListColumn.getCaption() end

---@param caption string
function ListColumn.setCaption(caption) end

---@return integer
function ListColumn.getMaxWidth() end

---@param width integer
function ListColumn.setMaxWidth(width) end

---@return integer
function ListColumn.getMinWidth() end

---@param width integer
function ListColumn.setMinWidth(width) end

---@return integer
function ListColumn.getWidth() end

---@param width integer
function ListColumn.setWidth(width) end


---Inherits from Object (Collection->Object)
---@class Collection: Object
---@field Count integer #
local Collection = {}

function Collection.clear() end

---@return integer
function Collection.getCount() end

---@param index integer
function Collection.delete(index) end


---Inherits from Collection (ListColumns->Collection->Object)
---@class ListColumns: Collection
---@field [integer] ListColumn
---@field Columns ListColumn[] # Array to access a column
local ListColumns = {}

---@return ListColumn # A new ListColumn object
function ListColumns.add() end

---@param index integer
---@return ListColumn # A ListColumn object
function ListColumns.getColumn(index) end

---Sets a ListColumn object (not recommended, use add instead)
---@param index integer
---@param listColumn ListColumn # A ListColumn object
function ListColumns.setColumn(index, listColumn) end


---Inherits from Object (ListItem->Object)
---@class ListItem: Object
---@field Caption boolean # The text of this listitem
---@field Checked boolean # Determines if the checkbox is checked (if it has a checkbox)
---@field SubItems Strings # The Strings object that hold the subitems
---@field Selected boolean # Returns true if selected
---@field Index integer # The index in the Items object of the owner of this listitem (readonly)
---@field ImageIndex integer # The index in the attached imagelist (LargeImages/SmallImages)
---@field StateIndex integer # The index in the attached imagelist (StateImages)
---@field Owner ListItems # The ListItems object that owns this ListItem (readonly)
---@field Data integer # Read/Write value up to the user to implement
local ListItem = {}

function ListItem.delete() end

---@return string | nil # The first column string in this listitem or none if there is no caption
function ListItem.getCaption() end

---@param caption string # Sets the first column string of the listitem
function ListItem.setCaption(caption) end

---@return boolean # Whether the listitem's checkbox is currently checked
function ListItem.getChecked() end

---Sets the checkbox of the listitem to the given state
---@param checked boolean
function ListItem.setChecked(checked) end

---@return Strings # A Strings object with all subitems from this ListItem
function ListItem.getSubItems() end

---Scrolls the listview so this item becomes visible (Cheat Engine 6.4 and later)
function ListItem.makeVisible(partial) end

---@param code DisplayRectangleCodes
---@return Rectangle # the displayed rectangle of the list item.
function ListItem.displayRect(code) end

---@param code DisplayRectangleCodes
---@return Rectangle # the displayed rectangle of the current list subitem.
function ListItem.displayRectSubItem(code) end

---Inherits from Object (ListItems->Object)
---@class ListItems: Object
--@operator index(integer): ListItem
---@field Count integer # The number of ListItems this object holds (Normally read only, but writable if OwnerData is true in the listview)
---@field Item ListItem[] # Array to access each ListItem object
local ListItems = {}

function ListItems.clear() end

---@return integer
function ListItems.getCount() end

---@param index integer
---@return ListItem # the list item object at the given index
function ListItems.getItem(index) end

---@return ListItem # A new ListItem object
function ListItems.add() end

---Inherits from CollectionItem (HeaderSection->CollectionItem->Object).
---@class HeaderSection: CollectionItem
---@field Alignment HeaderAlignment # 
---@field ImageIndex integer #
---@field MaxWidth integer #
---@field MinWidth integer #
---@field Text string # The text of the header section.
---@field Width integer # The width of the header section.
---@field Visible boolean # Determines if the header section is visible.
---@field OriginalIndex integer # The original index ignoring user reorganization (READONLY).


---Inherits from Collection (HeaderSections->Collection->TObject).
---@class HeaderSections: Collection
local HeaderSections = {}

---@return HeaderSection # A new header added to this object.
function HeaderSections.add() end

---Inserts a new header at the index and returns it.
---@param index integer
---@return HeaderSection # A new header added to this object at the provided index.
function HeaderSections.insert(index) end

---Deletes (and frees) the headers section at the given index.
---@param index integer
function HeaderSections.delete(index) end


---Inherits from Object (TreeNode->Object)
---@class TreeNode: Object
---@field [integer] TreeNode
---@field Text string # The text of the treenode
---@field Parent TreeNode The tree node this object is a child of. (can be nil) (ReadOnly)
---@field Level integer # The level this node is at
---@field HasChildren boolean # Set to true if it has children, or you wish it to have an expand sign
---@field Expanded boolean # Set to true if it has been expanded
---@field Count integer # The number of children this node has
---@field Items TreeNode[] # Array to access the child nodes of this node
---@field Index integer # The index based on the parent
---@field AbsoluteIndex integer # The index based on the TreeView's Treenodes object (Items)
---@field ImageIndex integer # The image to show from the attached ImageList
---@field Selected boolean # Set to true if currently selected
---@field MultiSelected boolean # Set to true if selected as well, but not the main selected object
---@field Data pointer # Space to store 4 or 8 bytes depending on which version of CE is used
local TreeNode = {}

function TreeNode.delete() end

function TreeNode.deleteChildren() end

function TreeNode.makeVisible() end

---Expands the given node.
---@param recursive? boolean # Whether to expand recursively. Recursive expansion defaults to true.
function TreeNode.expand(recursive) end

---Collapses the given node.
---@param recursive? boolean # Whether to expand recursively. Recursive expansion defaults to true.
function TreeNode.collapse(recursive) end

---@return TreeNode # The tree node object that's behind this tree node on the same level
function TreeNode.getNextSibling() end

---@param textOnly? boolean
---@return Rectangle # A rectangle describing the node
function TreeNode.getDisplayRect(textOnly) end

---@param text string 
---@return TreeNode # A new Treenode object that is a child of the tree node used to create it.
function TreeNode.add(text) end


---Inherits from Object (TreeNodes->Object)
---@class TreeNodes: Object
---@field [integer] TreeNode
---@field Count integer # The total number of tree nodes this object has
---@field Item TreeNode[] # Array to access each node
local TreeNodes = {}

function TreeNodes.clear() end

---@return integer # The total number of tree nodes this object has.
function TreeNodes.getCount() end

---@param index integer 
---@return TreeNode # The TreeNode object at the given index (based on the TreeView's Treenodes)
function TreeNodes.getItem(index) end

---@param text string
---@return TreeNode # A new root Treenode object with the supplied text
function TreeNodes.add(text) end

---@param treeNode TreeNode #
---@param text string #
---@return TreeNode # A new tree node object that has been inserted after the given treenode
function TreeNodes.insert(treeNode, text) end

---@param treeNode TreeNode
---@param text string
---@return TreeNode # A new tree node object that has been inserted before the given treenode
function TreeNodes.insertBehind(treeNode, text) end


---Inherits from Object (structColumn->Object)
---@class structColumn: Object
---@field Address Address # The current address
---@field AddressText string # Gets/sets the visual address
---@field Focused boolean # Gets/sets the focused state 
local structColumn = {}

---Focuses the current column
function structColumn.focus() end

---Inherits from Object (structGroup->Object)
---@class structGroup: Object
---@field name string # Gets the current name
---@field box GroupBox # Gets the group box object
---@field columnCount integer # Gets the number of columns in the group
---@field columns structColumn[] # Returns the specific structColumn object
local structGroup = {}

---Adds a new column to the specific group
---@return structColumn # the new structColumn object
function structGroup.addColumns() end


---Inherits from Object (structure->Object)
---@class structure: Object
---@field Name string # The name of the structure
---@field Size integer # The number of bytes between the last element and the start. ReadOnly
---@field Count integer # Number of elements in the structure. ReadOnly
---@field Element StructureElement[] # Returns the structure element at the given index. Readonly
local structure = {}

---@return string # the structure's name
function structure.getName() end

---@param name string # The name to set
function structure.setName(name) end

---@param index integer
---@return StructureElement # A structureElement object (Changing offsets can change the index)
function structure.getElement(index) end

---@param offset integer
---@return StructureElement # A structureElement object where the specified offset is at least the requested offset
function structure.getElementByOffset(offset) end

---Adds a new blank structureElement
---@return StructureElement # A new blank structureElement
function structure.addElement() end

---@param baseAddressToGuessFrom Address
---@param offset integer 
---@param size integer #
function structure.autoGuess(baseAddressToGuessFrom, offset, size) end

---Fills the structure with the layout gathered from querying .NET.
---@param address Address 
---@param changeName boolean # If changeName is true, the structure will take the name of the .NET class. (Cheat Engine version 6.4+)
function structure.fillFromDotNetAddress(address, changeName) end

---Call this when you want to make multiple updates to a structure. It will speed up the update process
function structure.beginUpdate() end

---Call this when done
function structure.endUpdate() end

---Add this to the list of structures for the user to select from. (Global structures will get saved to the table)
function structure.addToGlobalStructureList() end

---Remove from the list of structures.
function structure.removeFromGlobalStructureList() end


---Inherits from Object (StructureElement->Object)
---@class StructureElement: Object
---@field Owner structure # The structure this element belongs to (READONLY)
---@field Offset integer # The offset of this element
---@field Name string # The name of this element
---@field Vartype VariableType # The variable type of this element
---@field DisplayMethod StructureDisplayMethod - The display method of the entry
---@field ChildStruct structure | nil # If not nil this element is a pointer to the structure defined here
---@field ChildStructStart integer # The number of bytes inside the provided childstruct. (E.g: It might point to offset 10 of a certain structure)
---@field Bytesize integer # The number of bytes of this element. Readonly for basic types, writable for types that require a defined length like strings and array of bytes
local StructureElement = {}

---@return structure # The structure this element belongs to
function StructureElement.getOwnerStructure() end

---@return integer # The offset of this element
function StructureElement.getOffset() end

---@param offset integer # Sets the offset of this element
function StructureElement.setOffset(offset) end

---@return string # The name of this element
function StructureElement.getName() end

---@param name string # Sets the name of this element (tip: Leave blank if you only want to set the name of the variable)
function StructureElement.setName(name) end

---@return VariableType # The variable type of this element
function StructureElement.getVartype() end

---@param varType VariableType #
function StructureElement.setVartype(varType) end

---Gets the memory from the specified address and interprets it according to the element type
---@param address SymbolAddress # the address to get a value from
---@return any # the value
function StructureElement.getValue(address) end

---Sets the memory at the specified address to the interpreted value according to the element type
---@param address SymbolAddress
---@param value any
function StructureElement.setValue(address, value) end

---Same as getValue but uses the offset to calculate the final address.
---@param baseAddress SymbolAddress
---@return any
---@see StructureElement.getValue
function StructureElement.getValueFromBase(baseAddress) end

---Same as setValue but uses the offset to calculate the final address.
---@param baseaddress SymbolAddress
---@param value any
---@see StructureElement.setValue
function StructureElement.setValueFromBase(baseaddress, value) end

---@return structure | nil
function StructureElement.getChildStruct() end

---@param structure structure
function StructureElement.getChildStruct(structure) end

---@return integer
function StructureElement.getChildStructStart() end

---@param offset integer
function StructureElement.setChildStructStart(offset) end

---Gets the bytesize of the element. Usually returns the size of the type, except for string and aob.
---@return integer # The size of the type, except for string and aob
function StructureElement.getBytesize() end

---Sets the bytesize for types that are affected (string, aob).
---@param size integer # bytesize to set
function StructureElement.setBytesize(size) end


---@return integer # The number of Global structures. (Global structures are the visible structures)
function getStructureCount() return 0 end

---@param index integer # The index of the structure
---@return structure # The Structure object at the given index
function getStructure(index) return {} end

---@param name? string # The name for the structure
---@return structure # An empty structure object (Not yet added to the Global list. Call structure.addToGlobalStructureList manually)
function createStructure(name) return {} end


---@param name string # Name of a structure in a PDB
---@return structure # If PDB files are loaded this will create a structure with that name if it can be found
function createStructureFromName(name) return {} end
