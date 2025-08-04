---@meta _


---Inherits from Component (Control->Component->Object)
---@class Control: Component
---@field Caption string # The text of a control
---@field Top integer # The x position
---@field Left integer # The y position
---@field Width integer # The width of the control
---@field Height integer # The height of the control
---@field ClientWidth integer # The usable width inside the control (minus the borders)
---@field ClientHeight integer # The usable height the control (minus the borders)
---@field Align CAlignmentType # Alignment of the control
---@field Enabled boolean # Determines if the object is usable or greyed out
---@field Visible boolean # Determines if the object is visible or not
---@field Color Colors # The color of the object. Does not affect the caption
---@field RGBColor string # The color of the object in RGB formatting
---@field Parent WinControl # The owner of this control
---@field PopupMenu PopupMenu # The popup menu that shows when right clicking the control
---@field Font Font # The font class associated with the control
local Control = {}

---The function to call when a button is pressed.
---@param sender any
function Control.OnClick(sender) end

---Called when the size or position of the control changes.
---@param sender any
function Control.OnChangeBounds(sender) end

---@return integer
function Control.getLeft() end

---@param left integer
function Control.setLeft(left) end

---@return integer
function Control.getTop() end

---@param top integer
function Control.setTop(top) end

---@return integer
function Control.getWidth() end

---@param width integer
function Control.setWidth(width) end

---@return integer
function Control.getHeight() end

---@param height integer
function Control.setHeight(height) end

---@return string # The text of the control
function Control.getCaption() end

---Sets the text on a control. All the GUI objects fall in this category.
---@param caption string
function Control.setCaption(caption) end

---@return integer # The x position of the object (relative to the client array of the owner object)
---@return integer # The y position of the object (relative to the client array of the owner object)
function Control.getPosition() end

---Sets the x and y position of the object based on the top left position (relative to the client array of the owner object).
---@param x integer # x position
---@param y integer # y position
function Control.setPosition(x, y) end


---Gets the size of the control.
---@return integer # The width position of the object (relative to the client array of the owner object)
---@return integer # The height position of the object (relative to the client array of the owner object)
function Control.getSize() end

---Sets the width and height of the control
---@param width integer # width of the control.
---@param height integer # height of the control.
function Control.setSize(width, height) end

---Gets the alignment of the control.
---@return CAlignmentType
function Control.getAlign() end

---Sets the alignment of the control.
---@param option CAlignmentType
function Control.setAlign(option) end

---Gets the enabled state of the control.
---@return boolean
function Control.getEnabled() end

---Sets the alignment of the control.
---@param enabled boolean
function Control.setEnabled(enabled) end

---Gets the visible state of the control.
---@return boolean
function Control.getVisible() end

---Sets the visible state of the control.
---@param visible boolean
function Control.setVisible(visible) end

---Gets the color.
---@return Colors
function Control.getColor() end

---Sets the color.
---@param color Colors
function Control.setColor(color) end

---Gets the color.
---@generic T: WinControl
---@return T | nil # A parent object that inherits from the WinControl class or nil
function Control.getParent() end

---Sets the parent for this control.
---@generic T: WinControl
---@param parent T
function Control.setParent(parent) end

---Gets the popup menu for this control.
---@generic T: PopupMenu
---@return T # The popup menu for this control.
function Control.getPopupMenu() end

---Sets the popup menu for this control.
---@generic T: PopupMenu
---@param menu T
function Control.setPopupMenu(menu) end

---Gets the popup menu for this control.
---@generic T: Font
---@return T # the Font object of this control.
function Control.getFont() end

---Sets the popup menu for this control.
---@generic T: PopupMenu
---@param font T # Assigns a new font object. (Not recommended to use. Change the font object that's already there if you wish to change fonts)
function Control.setFont(font) end

---@return function # The OnClick function
function Control.getOnClick() end

---Sets the OnClick routine to a function directly.
---@param onClick string | function # The OnClick function to set, or the OnClick function's name, set by reflection fetching the function with this name.
function Control.setOnClick(onClick) end


---Invalidates the graphical area of the control and forces and update.
function Control.repaint() end

---Only updates the invalidated areas.
function Control.update() end


---Executes the current function under OnClick.
function Control.doClick() end

---Changes the z-order of the control so it's at the top.
function Control.bringToFront() end

---Changes the z-order of the control so it's at the back.
function Control.sendToBack() end

---Converts screen x, y coordinates to x, y coordinates on the control.
---@param x integer # Screen x coordinate to convert.
---@param y integer # Screen y coordinate to convert.
---@return integer x # Converted control x coordinate.
---@return integer y # Converted control y coordinate.
function Control.screenToClient(x, y) end

---Converts control x, y coordinates to screen coordinates.
---@param x integer # Control x coordinate to convert to screen coordinates.
---@param y integer # Control y coordinate to convert to screen coordinates.
---@return integer x # Converted screen x coordinate.
---@return integer y # Converted screen y coordinate.
function Control.clientToScreen(x, y) end



---Inherits from Control (WinControl->Control->Component->Object)
---@class WinControl: Control 
---@field Handle integer # The internal windows handle
---@field DoubleBuffered boolean # Graphical updates will go to a offscreen bitmap which will then be shown on the screen instead of directly to the screen. May reduce flickering
---@field ControlCount integer # The number of child controls of this wincontrol
---@field Control Control[] # Array to access a child control
---@field OnEnter function # Function to be called when the WinControl gains focus
---@field OnExit function # Function to be called when the WinControl loses focus
local WinControl = {}

---@return integer # The number of Controls attached to this class.
function WinControl.getControlCount() end

---@param index integer
---@return Control # A WinControl class object
function WinControl.getControl(index) end

---@param x integer # x position relative to this wincontrol
---@param y integer # y position relative to this wincontrol
---@return Control | nil # The child control at the given x, y position relative to this wincontrol's position
function WinControl.getControlAtPos(x, y) end

---@return boolean # Whether the object can be focused
function WinControl.canFocus() end

---@return boolean # Whether the object is currently focused
function WinControl.focused() end

---Tries to set keyboard focus the object.
---@param focus boolean # Whether the object should be considered currently focused.
function WinControl.setFocus(focus) end


---Sets the region or bitmap object as the new shape for this wincontrol.
---@param shape Region | Bitmap # The region or bitmap object to use to set a new shape for this wincontrol.
function WinControl.setShape(shape) end

---@return function
function WinControl.getOnEnter() end

---Sets an onEnter event. (Triggered on focus enter).
---@param onEnter function
function WinControl.setOnEnter(onEnter) end


---@return function #
function WinControl.getOnExit() end

---Sets an onExit event. (Triggered on lost focus)
---@param onExit function
function WinControl.setOnExit(onExit) end

---When specifying an explicit RGB color, the COLORREF value has the following hexadecimal form:
---> 0x00bbggrr
---
---The low-order byte contains a value for the relative intensity of red; 
---the second byte contains a value for green; 
---and the third byte contains a value for blue. 
---The high-order byte must be zero. 
---The maximum value for a single byte is 0xFF.
---@alias COLORREF integer

---Sets the layered state for the control if possible (Only Forms are supported in windows 7 and earlier).
---See [msdn/SetLayeredWindowAttributes](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-setlayeredwindowattributes) for more information.
---@param key COLORREF
---@param alpha byte # Alpha value used to describe the opacity of the layered window. Similar to the SourceConstantAlpha member of the BLENDFUNCTION structure. When alpha is 0, the window is completely transparent. When alpha is 255, the window is opaque.
---@param flags dword # Flags can be a combination of LWA_ALPHA (0x2) and/or LWA_COLORKEY (0x1).
function WinControl.setLayeredAttributes(key, alpha, flags) end


---Inherits from WinControl (CustomControl->WinControl->Control->Component->Object)
---@class CustomControl: WinControl
---@field Canvas Canvas # The canvas object for drawing on the control (READONLY)
local CustomControl = {}

---An OnPaint event you can assign to do some extra painting.
function CustomControl.OnPaint() end

---@return Canvas # The Canvas object for the given object that has inherited from CustomControl.
function CustomControl.getCanvas() end


---Inherits from CustomControl (ScrollingWinControl->CustomControl->WinControl->Control->Component->Object)
---@class ScrollingWinControl: CustomControl
---@field HorzScrollBar ControlScrollBar #
---@field VertScrollBar ControlScrollBar #

---@class PanelBevel

---Inherits from CustomControl(Panel->CustomControl->WinControl->Control->Component->Object)
---@class Panel: CustomControl
---@field Alignment CAlignmentType #
---@field BevelInner PanelBevel #
---@field BevelOuter PanelBevel #
---@field BevelWidth integer #
---@field FullRepaint boolean #
local Panel = {}

---Gets the alignment property.
---@return CAlignmentType
function Panel.getAlignment() end

---Sets the alignment property.
---@param alignment CAlignmentType
function Panel.setAlignment(alignment) end

---@return PanelBevel
function Panel.getBevelInner() end

---@param bevel PanelBevel
function Panel.setBevelInner(bevel) end

---@return PanelBevel
function Panel.getBevelOuter() end

---@param bevel PanelBevel
function Panel.setBevelOuter(bevel) end

---@return integer
function Panel.getBevelWidth() end

---@param width integer
function Panel.setBevelWidth(width) end

---@return boolean
function Panel.getFullRepaint() end

---@param fullRepaint boolean
function Panel.setFullRepaint(fullRepaint) end


---Inherits from CustomControl (Splitter->CustomControl->WinControl->Control->Component->Object)
---@class Splitter: CustomControl


---Inherits from WinControl (ButtonControl->WinControl->Control->Component->Object)
---@class ButtonControl: WinControl


---Inherits from ButtonControl (Button->ButtonControl->WinControl->Control->Component->Object)
---@class Button: ButtonControl
---@field ModalResult integer # The result this button will give the modal form when clicked
local Button = {}

---@return integer
function Button.getModalResult() end

---@param modalResult integer
function Button.getModalResult(modalResult) end


---Inherits from ButtonControl (CheckBox->ButtonControl->WinControl->Control->Component->Object)
---@class CheckBox: ButtonControl
---@field Checked boolean # True if checked
---@field AllowGrayed boolean # True if it can have 3 states. True/False/None
---@field State CheckBoxState # The check box state
---@field OnChange function # Function to call when the state is changed
local CheckBox = {}

---@return boolean
function CheckBox.getAllowGrayed() end

---@param allowGrayed boolean
function CheckBox.setAllowGrayed(allowGrayed) end

---@return CheckBoxState # A state for the checkbox.
function CheckBox.getState() end

---Sets the state of the checkbox.
---@param state CheckBoxState | boolean # A state enum if you need to set a grayed out checkbox, or boolean for checked or unchecked
function CheckBox.setState(state) end

---@param onChange function
function CheckBox.onChange(onChange) end

---Inherits from CheckBox (ToggleBox->CheckBox->ButtonControl->WinControl->Control->Component->Object)
---@class ToggleBox: CheckBox

---Inherits from WinControl (GroupBox->WinControl->Control->Component->Object)
---@class GroupBox: WinControl

---Inherits from GroupBox (RadioGroup->GroupBox->WinControl->Control->Component->Object)
---@class RadioGroup: GroupBox
---@field Items Strings # Strings derived object containing all the items in the list
---@field Columns integer # The number of columns to split the items into
---@field ItemIndex integer # The currently selected item
local RadioGroup = {}

---Called when the control is clicked
function RadioGroup.OnClick() end

---@return integer # the number of rows
function RadioGroup.getRows() end

---@return Strings # A Strings object
function RadioGroup.getItems() end

---@return integer # The number of columns
function RadioGroup.getColumns() end

---@param columns integer
function RadioGroup.setColumns(columns) end

---@return integer
function RadioGroup.getItemIndex() end

---@param index integer
function RadioGroup.setItemIndex(index) end

---@return function
function RadioGroup.getOnClick() end

---@param onClick function
function RadioGroup.setOnClick(onClick) end



---Inherits from WinControl (ListBox->WinControl->Control->Component->Object)
---@class ListBox: WinControl
---@field MultiSelect boolean # When set to true you can select multiple items
---@field Items Strings # Strings derived object containings all the items in the list
---@field Selected boolean[] # Returns true if the given line is selected. Use Items.Count-1 to find out the max index
---@field ItemIndex integer # Get selected index. -1 is nothing selected
---@field Canvas Canvas # The canvas object used to render on the object
local ListBox = {}

function ListBox.clear() end

---Deselects all items in the list
function ListBox.clearSelection() end

---Selects all items in the list
function ListBox.clearSelection() end

---@return Strings # A strings object
function ListBox.getItems() end

---Sets a strings object to the listbox
---@param items Strings
function ListBox.setItems(items) end

---@return integer
function ListBox.getItemIndex() end

---@param index integer
function ListBox.setItemIndex(index) end

---@return Canvas
function ListBox.getCanvas() end


---Inherits from WinControl (Calendar->WinControl->Control->Component->Object)
---@class Calendar: WinControl
---@field Date string # Current date of the Calendar, format: yyyy-mm-dd
---@field DateTime number # Days since December 30, 1899
local Calendar = {}

---@return string # Current date of the Calendar, format: ShortDateFormat from OS local settings
function Calendar.getDateLocalFormat() end


---Inherits from WinControl (ComboBox->WinControl->Control->Component->Object)
---@class ComboBox: WinControl
---@field Items Strings # Strings derived object containings all the items in the list
---@field ItemIndex integer # Get selected index. -1 is nothing selected
---@field Canvas Canvas # The canvas object used to render on the object
local ComboBox = {}

function ComboBox.clear() end

---@return Strings
function ComboBox.getItems() end

---@param items Strings
function ComboBox.setItems(items) end

---@return integer #
function ComboBox.getItemIndex() end

---@param index integer
function ComboBox.setItemIndex(index) end

---@return Canvas
function ComboBox.getCanvas() end

---@return integer # The number of pixels not part of the text of the combobox (think about borders, thumb button, etc...)
function ComboBox.getExtraWidth() end


---ComboBox like component where you can pick a color-
---
---Inherits from WinControl (ColorBox->WinControl->Control->Component->Object)
---@class ColorBox: WinControl


---Inherits from WinControl (ProgressBar->WinControl->Control->Component->Object)
---@class ProgressBar: WinControl
---@field Min integer # The minimum position value the progress bar can have (default 0)
---@field Max integer # The maximum position value the progress bar can have (default 100
---@field Position integer # The position of the progress bar
---@field Step integer # The stepsize to step by when stepIt() is called
local ProgressBar = {}

---Increase position with "Step" size
function ProgressBar.stepIt() end

---Increase the position of the ProgressBar by the given integer value
---@param step integer
function ProgressBar.stepBy(step) end

---@return integer # The max property
function ProgressBar.getMax() end

---Sets the max property
---@param max integer
function ProgressBar.setMax(max) end

---@return integer # The min property
function ProgressBar.getMin() end

---Sets the min property
---@param min integer
function ProgressBar.setMin(min) end

---@return integer # The current position
function ProgressBar.getPosition() end

---Sets the current position
---@param position integer
function ProgressBar.setPosition(position) end

---Sets the current position. Without slow progress animation on Win7 and later.
---@param position integer
function ProgressBar.setPosition2(position) end


---Inherits from WinControl (Inheritance: TrackBar->WinControl->Control->Component->Object)
---@class TrackBar: WinControl
---@field Min integer # Minimal value for the trackbar
---@field Max integer # Maximum value for the trackbar
---@field Position integer # The current position
---@field OnChange function # Function to call when trackbar position changes
local TrackBar = {}

---@return integer #
function TrackBar.getMax() end

---@param max integer 
function TrackBar.setMax(max) end

---@return integer
function TrackBar.getMin() end

---@param min integer 
function TrackBar.setMin(min) end

---@return integer
function TrackBar.getPosition() end

---@param position integer 
function TrackBar.setPosition(position) end

---@return function
function TrackBar.getOnChange() end

---@param onChange function 
function TrackBar.setOnChange(onChange) end


---The cheatcomponent class is the component used in Cheat Engine 5.x trainers.
---
---Most people will probably want to design their own components but for those that don't know much coding and use the autogenerated trainer this will be used.
---
---Inherits from WinControl (CheatComponent->WinControl->Control->Component->Object)
---@class CheatComponent: WinControl
---@field Color Colors # Background color
---@field Textcolor Colors # Text color
---@field Activationcolor Colors # The textcolor to show when activated is true
---@field Activated boolean # Toggles between the ActivationColor and the TextColor
---@field Editleft integer # The x position of the optional edit field
---@field Editwidth integer # The width of the optional edit field
---@field Editvalue string # The string of the optional edit field
---@field Hotkey string # The hotkey part of the cheat line
---@field Description string # Description part of the cheat line
---@field Hotkeyleft integer # The x position of the hotkey line
---@field Descriptionleft integer # The x position of the Description line
---@field ShowHotkey boolean # Decides if the hotkey label should be shown
---@field HasEditBox boolean # Decides if the editbox should be shown
---@field HasCheckbox boolean # Decides if the checkbox should be shown
---@field Font Font # The font to use to render the text


---@class DefaultDraw

---Inherits from WinControl (Listview->WinControl->Control->Component->Object)
---@class Listview: WinControl
---@field Columns ListColumns # The Listcolumns object of the listview (Readonly)
---@field Items ListItems # The ListItems objects of the listview
---@field ItemIndex integer # The currently selected index in the Items object  (-1 if nothing is selected)
---@field Selected ListItem # The currently selected listitem (nil if nothing is selected)
---@field TopItem ListItem # The first visible item in the listview
---@field VisibleRowCount integer # The number of lines currently visible
---@field Canvas Canvas # The canvas object used to render the listview  (Readonly)
---@field AutoWidthLastColumn boolean # When set to true the last column will resize when the control resizes
---@field HideSelection boolean # When set to true the selection will not hide when the focus leaves the control
---@field RowSelect boolean # When set to true the whole row will be selected instead of just the first column
---@field OwnerData boolean # When set to true the listview will call the onData function for every line being displayed. Use Items.Count to set the number of virtual lines
---@field LargeImages ImageList #
---@field SmallImages ImageList #
---@field StateImages ImageList #
local Listview = {}

---Called when a listview who's owned (with OwnerData true) renders a line.
---@param sender any
---@param item ListItem
function Listview.OnData(sender, item) end

---@param sender any
---@param rect Rectangle
---@param default? DefaultDraw
---@return DefaultDraw
function Listview.OnCustomDraw(sender, rect, default) end

---@param sender any
---@param item ListItem
---@param settings CustomDrawSettingTable
---@param default? DefaultDraw
---@return DefaultDraw
function Listview.OnCustomDrawItem(sender, item, settings, default) end

---@param sender any
---@param item ListItem
---@param subItemIndex integer
---@param settings CustomDrawSettingTable
---@param default? DefaultDraw
---@return DefaultDraw
function Listview.OnCustomDrawSubItem(sender, item, subItemIndex, settings, default) end

function Listview.clear() end

---@return ListColumns # A ListColumns object
function Listview.getColumns() end

---@param x integer # x row
---@param y integer # y column
---@return ListItem | nil # the ListItem at the given coordinate (x * column size * y). nil if no list item is there.
function Listview.getItemAt(x, y) end

---@return ListItems # A ListItems object
function Listview.getItems() end

---@return integer # The currently selected index in the Items object.
function Listview.getItemIndex() end

---Sets the current item index.
---@param index integer
function Listview.setItemIndex(index) end

---@return Canvas # The canvas object used to render the list view.
function Listview.getCanvas() end

---Tells the list view to stop updating while you're busy
function Listview.beginUpdate() end

---Applies all updates between beginUpdate and endUpdate
function Listview.endUpdate() end


---This is an object that can hold multiple pages.
---
---Inherits from WinControl (PageControl->WinControl->Control->Component->Object)
---@class PageControl: WinControl
---@field ShowTabs boolean # Shows the tabs
---@field TabIndex integer # Gets and sets the current tab
---@field ActivePage TabSheet # Returns the current tabsheet.
---@field PageCount integer # Gets the number of pages
---@field Page TabSheet[] # Get a specific page (TabSheet)
local PageControl = {}

---Creates a new TabSheet.
---@return TabSheet
function PageControl.addTab() end

---@param index integer
---@return Rectangle # A rectangle table describing the position of the specific tab
function PageControl.tabRect(index) end


---Part of a page control. This object can contain other objects.
---
---Inherits from WinControl (TabSheet->WinControl->Control->Component->Object)
---@class TabSheet: WinControl
---@field TabIndex integer # The current index in the pagelist of the owning page control



---The diagram class lets you represent data using blocks and lines.
---
---Inherits from CustomControl (Diagram->CustomControl->WinControl->Control->LclComponent->Component->Object)
---@class Diagram: CustomControl
---@field LineThickness integer # Default thickness of lines in pixels
---@field LineColor Colors # Sets the default color of lines
---@field PlotPointColor Colors # Sets the default color for points
---@field BlockBackground Colors # Color of the diagramBlocks
---@field BackgroundColor Colors # Color of the diagram background
---@field ArrowStyles DiagramArrowStyles #
---@field BlockCount integer # Returns the number of blocks in the diagram (readonly)
---@field Block DiagramBlock[] # Returns the block at the specific index
---@field LinkCount integer # Returns the number of linkes in the diagram (readonly)
---@field Link DiagramLink[] # Returns the link at the specific index
---@field DrawPlotPoints boolean # If set to true linkpoints will be shown
---@field AllowUserToCreatePlotPoints boolean # If true(default) will allow the user to create plotpoints by clicking on lines
---@field AllowUserToMovePlotPoints boolean # If true(default) will allow the user to move plotpoints by dragging them
---@field AllowUserToResizeBlocks boolean # If true(default) will allow the user to resize blocks
---@field AllowUserToMoveBlocks boolean # If true(default) will allow the user to move blocks around by draging the caption
---@field AllowUserToChangeAttachPoints boolean # If true(default) will allow the user to move move the point where a line connects to the block by dragging it
---@field ScrollX integer # The horizontal scroll
---@field ScrollY integer # The vertical scroll
---@field Zoom float # The zoom level to use
local Diagram = {}

---@return DiagramBlock # Creates a new uninitialized block.
function Diagram.createBlock() end

---Creates a link between the two blocks.
---@param source DiagramBlock
---@param destination DiagramBlock
---@return DiagramLink
function Diagram.addConnection(source, destination) end

---Creates a link between the two blocks using the BlockSideDescritorTable table definition.
---@param source BlockSideDescriptorTable
---@param destination BlockSideDescriptorTable
---@return DiagramLink
function Diagram.addConnection(source, destination) end


---Saves the current display as an PNG image
---@param fileNamePNG path
function Diagram.saveAsImage(fileNamePNG) end

---Saves the state of the diagram to a file.
---@param fileName path
function Diagram.saveToFile(fileName) end

---Loads the state of the diagram from a file.
---@param fileName path
function Diagram.loadFromFile(fileName) end

---Saves the state of the diagram to a stream.
---@param stream Stream
function Diagram.saveToStream(stream) end

---Loads the state of the diagram from a stream
---@param stream Stream
function Diagram.loadFromStream(stream) end

---@param pos Locations2D
---@return Object | nil # The object at this position or nil if nothing.
function Diagram.getObjectAt(pos) end


---A more customizable button instead of the windows themed button, and lets you repaint it from scratch as well.
---
---Inherits from CustomControl (CECustomButton->CustomControl->WinControl->Control->Component->Object)
---@class CECustomButton: CustomControl
---@field ShowPrefix boolean # Process first single '&' per line as an underscore and draw '&&' as '&'  
---@field BorderColor Colors # The color of the button border
---@field BorderSize integer # The thickness of the border
---@field ButtonColor Colors # The color of the button face
---@field ButtonHighlightedColor Colors # The color of the button face when highlighted (hovered over with the mouse)
---@field ButtonDownColor Colors # The color of the button face when the mouse is pressed down on it
---@field DrawFocusRect boolean # If true will draw a focus roundrect showing it has focus
---@field DrawBorder boolean # Defaults to true.  Will draw a border around the button
---@field FocusedSize integer # The width of the focus round rect
---@field FocusElipseColor Colors # The color of the focus round rect
---@field GrowFont boolean # When true the font will get resized till the caption fits the button
---@field RoundingX integer #
---@field RoundingY integer #
---@field CustomDrawn boolean # Do your own drawing in the OnPaint property of the button
---@field FramesPerSecond integer # If animation is used this will determine how often per second the OnPaint gets called
---@field ButtonAnimationSpeed integer # If not custom drawn, this determnines how long the animations for enter/leave take
local CECustomButton = {}

---Starts the animator timer which will trigger an OnPaint with the speed of the current framesPerSecond property.
function CECustomButton.startAnimatorTimer() end

---Stops the animator timer.
function CECustomButton.stopAnimatorTimer() end


---Creates a PaintBox class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the PaintBox component. Can be any object inherited from WinControl
---@return PaintBox # The new PaintBox object
function createPaintBox(owner) return {} end

---Creates a Label class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the PaintBox component. Owner can be any object inherited from WinControl
---@return Label # The new Label object
function createLabel(owner) return {} end

---Creates a Splitter class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the Splitter component. Owner can be any object inherited from WinControl
---@return Splitter # The new Splitter object
function createSplitter(owner) return {} end

---Creates a Panel class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the Panel component. Owner can be any object inherited from WinControl
---@return Panel # The new Panel object
function createPanel(owner) return {} end


---Creates a Button class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the Button component. Owner can be any object inherited from WinControl
---@return Button # The new Button object
function createButton(owner) return {} end

---Get modal result of button.
---@param button Button # Button to operate on
---@return integer # Modal result of button
function button_getModalResult(button) return 0 end

---Set modal result of button.
---@param button Button # Button to operate on
---@param modalResult integer # Modal result to override on button
function button_setModalResult(button, modalResult) end

---Creates a CheckBox class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the CheckBox component. Owner can be any object inherited from WinControl
---@return CheckBox # The new CheckBox object
function createCheckBox(owner) return {} end

---Creates a ToggleBox class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the ToggleBox component. Owner can be any object inherited from WinControl
---@return ToggleBox # The new ToggleBox object
function createToggleBox(owner) return {} end


---Creates a GroupBox class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the GroupBox component. Owner can be any object inherited from WinControl
---@return GroupBox # The new GroupBox object
function createGroupBox(owner) return {} end


---Creates a RadioGroup class object which belongs to the given owner. 
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the RadioGroup component. Owner can be any object inherited from WinControl
---@return RadioGroup # The new RadioGroup object
function createRadioGroup(owner) return {} end


---Creates a ListBox class object which belongs to the given owner. 
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the ListBox component. Owner can be any object inherited from WinControl
---@return ListBox # The new ListBox object
function createListBox(owner) return {} end


---Creates a Calendar class object which belongs to the given owner.
---
---Owner can be any object inherited from WinControl. 
---
---Valid date is between "September 14, 1752" and "December 31, 9999".
---@generic T: WinControl
---@param owner T # The control that will own the Calendar component. Owner can be any object inherited from WinControl
---@return Calendar # The new Calendar object
function createCalendar(owner) return {} end


---Creates a ComboBox class object which belongs to the given owner. 
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the ComboBox component. Owner can be any object inherited from WinControl
---@return ComboBox # The new ComboBox object
function createComboBox(owner) return {} end


---Creates a ColorBox class object which belongs to the given owner. 
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the ColorBox component. Owner can be any object inherited from WinControl
---@return ColorBox # The new ColorBox object
function createColorBox(owner) return {} end



---Creates a ProgressBar class object which belongs to the given owner. 
---
---Owner can be any object inherited from WinControl.
---@generic T: WinControl
---@param owner T # The control that will own the ProgressBar component. Owner can be any object inherited from WinControl
---@return ProgressBar # The new ProgressBar object
function createProgressBar(owner) return {} end


---Creates a TrackBar class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the TrackBar component. Owner can be any object inherited from WinControl
---@return TrackBar # The new TrackBar object
function createTrackBar(owner) return {} end

---Creates a Listview class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the Listview component. Owner can be any object inherited from WinControl
---@return Listview # The new Listview object
function createListView(owner) return {} end

---Creates a Listview class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the Listview component. Owner can be any object inherited from WinControl
---@return Listview # The new Listview object
function createListview(owner) return {} end


---Creates a PageControl class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the PageControl component. Owner can be any object inherited from WinControl
---@return PageControl # The new PageControl object
function createPageControl(owner) return {} end


---Creates a Diagram class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the Diagram component. Owner can be any object inherited from WinControl
---@return Diagram # The new Diagram object
function createDiagram(owner) return {} end


---Creates a CECustomButton class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the CECustomButton component. Owner can be any object inherited from WinControl
---@return CECustomButton # The new CECustomButton object
function createCECustomButton(owner) return {} end

