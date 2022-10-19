---@meta


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
---@field getID fun(): integer #
---@field getIndex fun(): integer #
---@field setIndex fun(index: integer) #
---@field getDisplayName fun(): string #
---@field setDisplayName fun(displayName: string) #



---Inherits from CollectionItem (ListColumn->CollectionItem->Object)
---@class ListColumn: CollectionItem
---@field AutoSize boolean #
---@field Caption string #
---@field MaxWidth integer #
---@field MinWidth integer #
---@field Width integer #
---@field Visible boolean #
---@field getAutosize fun(): boolean #
---@field setAutosize fun(autoSize: boolean) #
---@field getCaption fun(): string #
---@field setCaption fun(caption: string) #
---@field getMaxWidth fun(): integer #
---@field setMaxWidth fun(width: integer) #
---@field getMinWidth fun(): integer #
---@field setMinWidth fun(width: integer) #
---@field getWidth fun(): integer #
---@field setWidth fun(width: integer) #


---Inherits from Object (Collection->Object)
---@class Collection: Object
---@field Count integer #
---@field clear fun() #
---@field getCount fun(): integer #
---@field delete fun(index: integer) #


---Inherits from Collection (ListColumns->Collection->Object)
---@class ListColumns: Collection
--@operator index(integer):ListColumn
---@field Columns ListColumn[] # Array to access a column
---@field add fun(): ListColumn # Returns a new ListColumn object
---@field getColumn fun(index: integer): ListColumn # Returns a ListColumn object;
---@field setColumn fun(index: integer, listColumn: ListColumn) # Sets a ListColumn object (not recommended, use add instead)


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
---@field delete fun() #
---@field getCaption fun() # Returns the first columns string of the listitem
---@field setCaption fun(caption: string) # Sets the first column string of the listitem
---@field getChecked fun() # Returns true if the listitem is checked
---@field setChecked fun(checked: boolean) # Sets the checkbox of the listbox to the given state
---@field getSubItems fun(): Strings # Returns a Strings object
---@field makeVisible fun(partial) # Scrolls the listview so this item becomes visible (Cheat Engine 6.4 and later)
---@field displayRect fun(code: DisplayRectangleCodes): Rectangle # Returns the displayed rectangle of the list item.
---@field displayRectSubItem fun(code: DisplayRectangleCodes): Rectangle # Returns the displayed rectangle of the list item.


---Inherits from Object (ListItems->Object)
---@class ListItems: Object
--@operator index(integer): ListItem
---@field Count integer # The number of ListItems this object holds (Normally read only, but writable if OwnerData is true in the listview)
---@field Item ListItem[] # Array to access each ListItem object
---@field clear fun() #
---@field getCount fun(): integer #
---@field getItem fun(index: integer): ListItem # Return the list item object at the given index
---@field add fun(): ListItem # Returns a new ListItem object



---Inherits from CollectionItem (HeaderSection->CollectionItem->Object)
---@class HeaderSection: CollectionItem
---@field Alignment HeaderAlignment # 
---@field ImageIndex integer #
---@field MaxWidth integer #
---@field MinWidth integer #
---@field Text string # The text of the header section
---@field Width integer # The width of the header section
---@field Visible boolean # Determines if the header section is visible
---@field OriginalIndex integer # The original index ignoring user reorganization (READONLY)


---Inherits from Collection (HeaderSections->Collection->TObject)
---@class HeaderSections: Collection
---@field add fun(): HeaderSection # Adds a new header and returns it
---@field insert fun(index: integer): HeaderSection # Inserts a new header at the index and returns it
---@field delete fun(index: integer) # Deletes (and frees) the headers ection at the given index


---Inherits from Object (TreeNode->Object)
---@class TreeNode: Object
--@operator index(integer):TreeNode
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
---@field delete fun() #
---@field deleteChildren fun() #
---@field makeVisible fun() #
---@field expand fun(recursive?: boolean) # Expands the given node. Recursive expansion defaults to true
---@field collapse fun(recursive?: boolean) # Collapses the given node. Recursive expansion defaults to true
---@field getNextSibling fun(): TreeNode # Returns the tree node object that's behind this tree node on the same level
---@field getDisplayRect fun(textOnly?: boolean): Rectangle # Returns a rectangle describing the node
---@field add fun(text: string): TreeNode # Returns a Treenode object that is a child of the tree node used to create it


---Inherits from Object (TreeNodes->Object)
---@class TreeNodes: Object
--@operator index(integer):TreeNode
---@field Count integer # The total number of tree nodes this object has
---@field Item TreeNode[] # Array to access each node
---@field clear fun() #
---@field getCount fun(): integer #
---@field getItem fun(index: integer): TreeNode # Returns the TreeNode object at the given index (based on the TreeView's Treenodes)
---@field add fun(text: string) # Returns a new root Treenode object with the supplied text
---@field insert fun(treeNode: TreeNode, text: string): TreeNode # Returns a new tree node object that has been inserted after the given treenode
---@field insertBehind fun(treeNode: TreeNode, text: string): TreeNode # Returns a new tree node object that has been inserted before the given treenode



---Inherits from Object (structColumn->Object)
---@class structColumn: Object
---@field Address Address # The current address
---@field AddressText string # Gets/sets the visual address
---@field Focused boolean # Gets/sets the focused state 
---@field focus fun() # Focuses the current column


---Inherits from Object (structGroup->Object)
---@class structGroup: Object
---@field name string # Gets the current name
---@field box GroupBox # Gets the group box object
---@field columnCount integer # Gets the number of columns in the group
---@field columns structColumn[] # Returns the specific structColumn object
---@field addColumns fun(): structColumn # Adds a new column to the specific group and returns its structColumn object



---Inherits from Object (structure->Object)
---@class structure: Object
---@field Name string # The name of the structure
---@field Size integer # The number of bytes between the last element and the start. ReadOnly
---@field Count integer # Number of elements in the structure. ReadOnly
---@field Element StructureElement[] # Returns the structure element at the given index. Readonly
---@field getName fun(): string # Returns the name
---@field setName fun(name: string) # Sets the name
---@field getElement fun(index): StructureElement # Returns a structureElement object (Changing offsets can change the index)
---@field getElementByOffset fun(offset: integer): StructureElement # Returns a structureElement object where the specified offset is at least the requested offset
---@field addElement fun(): StructureElement # Adds a new blank structureElement and returns it
---@field autoGuess fun(baseAddressToGuessFrom: Address, offset: integer, size: integer) #
---@field fillFromDotNetAddress fun(address: Address, changeName: boolean) # Fills the structure with the layout gathered from querying .NET.  If changeName is true, the structure will take the name of the .NET class.  (Cheat Engine version 6.4+)
---@field beginUpdate fun() # Call this when you want to make multiple updates to a structure. It will speed up the update process
---@field endUpdate fun() # Call this when done
---@field addToGlobalStructureList fun() # Add this to the list of structures for the user to select from. (Global structures will get saved to the table)
---@field removeFromGlobalStructureList fun() # Remove from the list of structures.


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
---@field getOwnerStructure fun(): structure # Returns the structure this element belongs to
---@field getOffset fun(): integer # Returns the offset of this element
---@field setOffset fun(offset: integer) # Sets the offset of this element
---@field getName fun(): string # Returns the name of this element
---@field setName fun(name: string) # Sets the name of this element (tip: Leave blank if you only want to set the name of the variable)
---@field getVartype fun(): VariableType # Returns the variable type of this element
---@field setVartype fun(varType: VariableType) #
---@field getValue fun(address: SymbolAddress): any # Gets the memory from the specified address and interprets it according to the element type
---@field setValue fun(address: SymbolAddress, value: any) # Sets the memory at the specified address to the interpreted value according to the element type
---@field getValueFromBase fun(baseAddress: SymbolAddress): any # Same as getValue but uses the offset to calculate the final address
---@field setValueFromBase fun(baseaddress: SymbolAddress, value: any) # Same as setValue but uses the offset to calculate the final address
---@field getChildStruct fun(): structure | nil #
---@field setChildStruct fun(structure: structure) #
---@field getChildStructStart fun(): integer #
---@field setChildStructStart fun(offset: integer) #
---@field getBytesize fun(): integer # Gets the bytesize of the element. Usually returns the size of the type, except for string and aob
---@field setBytesize fun(size: integer) # Sets the bytesize for types that are affected (string, aob)


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
