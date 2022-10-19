---@meta




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
---@field PopupMenu PopupMenu # The popup menu that shows when rightclicking the control
---@field Font Font # The font class associated with the control
---@field OnClick fun(sender: any) # The function to call when a button is pressed
---@field OnChangeBounds fun(sender: any) # Called when the size or position of the control changes
---@field getLeft fun(): integer #
---@field setLeft fun(left: integer) #
---@field getTop fun(): integer #
---@field setTop fun(top: integer) #
---@field getWidth fun(): integer #
---@field setWidth fun(width: integer) #
---@field getHeight fun() #
---@field setHeight fun(height: integer) #
---@field setCaption fun(caption: string) # Sets the text on a control. All the GUI objects fall in this category
---@field getCaption fun(): string # Returns the text of the control
---@field setPosition fun(x: integer, y: integer) # Sets the x and y position of the object base don the top left position (relative to the client array of the owner object)
---@field getPosition fun(): integer, integer # Returns the x and y position of the object (relative to the client array of the owner object)
---@field setSize fun(width: integer, height: integer) # Sets the width and height of the control
---@field getSize fun(): integer, integer # Gets the size of the control
---@field setAlign fun(option: CAlignmentType) # Sets the alignment of the control
---@field getAlign fun(): CAlignmentType # Gets the alignment of the control
---@field getEnabled fun(): boolean # Gets the enabled state of the control
---@field setEnabled fun(enabled: boolean) # Sets the enabled state of the control
---@field getVisible fun(): boolean # Gets the visible state of the control
---@field setVisible fun(visible: boolean) # Sets the visible state of the control
---@field getColor fun(): Colors # Gets the color
---@field setColor fun(color: Colors) # Sets the color
---@field getParent fun(): WinControl | nil # Returns nil or an object that inherits from the WinControl class
---@field setParent fun(parent: WinControl) # Sets the parent for this control
---@field getPopupMenu fun(): PopupMenu # Gets the popup menu for this control
---@field setPopupMenu fun(menu: PopupMenu) # Sets the popup menu for this control
---@field getFont fun(): Font # Returns the Font object of this object
---@field setFont fun(font: Font) # Assigns a new font object. (Not recommended to use. Change the font object that's already there if you wish to change fonts)
---@field repaint fun() # Invalidates the graphical area of the control and forces and update
---@field update fun() # Only updates the invalidated areas
---@field setOnClick fun(f: function | string) # Sets the OnClick routine to a function, either by name or directly
---@field getOnClick fun(): function # Gets the OnClick function
---@field doClick fun() # Executes the current function under OnClick
---@field bringToFront fun() # Changes the z-order of the control so it'd at the top
---@field sendToBack fun() # Changes the z-order of the control so it'd at the back
---@field screenToClient fun(x: integer, y: integer) # Converts screen x,y coordinates to x,y coordinates on the control
---@field clientToScreen fun(x: integer, y: integer) # Converts control x,y coordinates to screen coordinates



---Inherits from Control (WinControl->Control->Component->Object)
---@class WinControl: Control 
---@field Handle integer # The internal windows handle
---@field DoubleBuffered boolean # Graphical updates will go to a offscreen bitmap which will then be shown on the screen instead of directly to the screen. May reduce flickering
---@field ControlCount integer # The number of child controls of this wincontrol
---@field Control Control[] # Array to access a child control
---@field OnEnter function # Function to be called when the WinControl gains focus
---@field OnExit function # Function to be called when the WinControl loses focus
---@field getControlCount fun(): integer # Returns the number of Controls attached to this class
---@field getControl fun(index: integer): Control # Returns a WinControl class object
---@field getControlAtPos fun(x: integer, y: integer): Control # Gets the control at the given x,y position relative to the wincontrol's position
---@field canFocus fun(): boolean # Returns true if the object can be focused
---@field focused fun(): boolean # Returns boolean true when focused
---@field setFocus fun(focus: boolean) # Tries to set keyboard focus the object
---@field setShape fun(shape: Region | Bitmap) # Sets the region or bitmap object as the new shape for this wincontrol
---@field setOnEnter fun(onEnter: function) # Sets an onEnter event. (Triggered on focus enter)
---@field getOnEnter fun(): function #
---@field setOnExit fun(onExit: function) # Sets an onExit event. (Triggered on lost focus)
---@field getOnExit fun(): function #
---@field setLayeredAttributes fun(key, alpha, flags) # Sets the layered state for the control if possible (Only Forms are supported in windows 7 and earlier). Flags can be a combination of LWA_ALPHA and/or LWA_COLORKEY
---@see # msdn SetLayeredWindowAttributes for more information     


---Inherits from WinControl (CustomControl->WinControl->Control->Component->Object)
---@class CustomControl: WinControl
---@field Canvas Canvas # The canvas object for drawing on the control (READONLY)
---@field OnPaint fun() # An OnPaint event you can assign to do some extra painting
---@field getCanvas fun(): Canvas # Returns the Canvas object for the given object that has inherited from CustomControl


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
---@field getAlignment fun(): CAlignmentType # Gets the alignment property
---@field setAlignment fun(alignment: CAlignmentType) # Sets the alignment property
---@field getBevelInner fun(): PanelBevel #
---@field setBevelInner fun(bevel: PanelBevel) #
---@field getBevelOuter fun(): PanelBevel #
---@field setBevelOuter fun(bevel: PanelBevel) #
---@field getBevelWidth fun(): integer #
---@field setBevelWidth fun(width: integer) #
---@field getFullRepaint fun(): boolean #
---@field setFullRepaint fun(fullRepaint: boolean) #


---Inherits from CustomControl (Splitter->CustomControl->WinControl->Control->Component->Object)
---@class Splitter: CustomControl


---Inherits from WinControl (ButtonControl->WinControl->Control->Component->Object)
---@class ButtonControl: WinControl


---Inherits from ButtonControl (Button->ButtonControl->WinControl->Control->Component->Object)
---@class Button: ButtonControl
---@field ModalResult integer # The result this button will give the modal form when clicked
---@field getModalResult fun(): integer #
---@field setModalResult fun(modalResult: integer) #



---Inherits from ButtonControl (CheckBox->ButtonControl->WinControl->Control->Component->Object)
---@class CheckBox: ButtonControl
---@field Checked boolean # True if checked
---@field AllowGrayed boolean # True if it can have 3 states. True/False/None
---@field State CheckBoxState # The check box state
---@field OnChange function # Function to call when the state is changed
---@field getAllowGrayed fun(): boolean #
---@field setAllowGrayed fun(allowGrayed: boolean) #
---@field getState fun(): CheckBoxState # Returns a state for the checkbox.
---@field setState fun(state: CheckBoxState | boolean) # Sets the state of the checkbox
---@field onChange fun(onChange: function) #

---Inherits from CheckBox (ToggleBox->CheckBox->ButtonControl->WinControl->Control->Component->Object)
---@class ToggleBox: CheckBox

---Inherits from WinControl (GroupBox->WinControl->Control->Component->Object)
---@class GroupBox: WinControl

---Inherits from GroupBox (RadioGroup->GroupBox->WinControl->Control->Component->Object)
---@class RadioGroup: GroupBox
---@field Items Strings # Strings derived object containings all the items in the list
---@field Columns integer # The number of columns to split the items into
---@field ItemIndex integer # The currently selected item
---@field OnClick function # Called when the control is clicked
---@field getRows fun(): integer # Returns the number of rows
---@field getItems fun(): Strings # Returns a Strings object
---@field getColumns fun(): integer # Returns the nuber of columns
---@field setColumns fun(columns: integer) #
---@field getItemIndex fun(): integer #
---@field setItemIndex fun(index: integer) #
---@field setOnClick fun(onClick: function) #
---@field getOnClick fun(): function #


---Inherits from WinControl (ListBox->WinControl->Control->Component->Object)
---@class ListBox: WinControl
---@field MultiSelect boolean # When set to true you can select multiple items
---@field Items Strings # Strings derived object containings all the items in the list
---@field Selected boolean[] # Returns true if the given line is selected. Use Items.Count-1 to find out the max index
---@field ItemIndex integer # Get selected index. -1 is nothing selected
---@field Canvas Canvas # The canvas object used to render on the object
---@field clear fun() #
---@field clearSelection fun() # Deselects all items in the list
---@field selectAll fun() # Selects all items in the list
---@field getItems fun(): Strings # Returns a strings object
---@field setItems fun(items: Strings) # Sets a strings object to the listbox
---@field getItemIndex fun(): integer #
---@field setItemIndex fun(index: integer) #
---@field getCanvas fun(): Canvas #


---Inherits from WinControl (Calendar->WinControl->Control->Component->Object)
---@class Calendar: WinControl
---@field Date string # Current date of the Calendar, format: yyyy-mm-dd
---@field DateTime number # Days since December 30, 1899
---@field getDateLocalFormat fun(): string # Returns current date of the Calendar, format: ShortDateFormat from OS local settings


---Inherits from WinControl (ComboBox->WinControl->Control->Component->Object)
---@class ComboBox: WinControl
---@field Items Strings # Strings derived object containings all the items in the list
---@field ItemIndex integer # Get selected index. -1 is nothing selected
---@field Canvas Canvas # The canvas object used to render on the object
---@field clear fun() #
---@field getItems fun(): Strings #
---@field setItems fun(items: Strings) #
---@field getItemIndex fun(): integer #
---@field setItemIndex fun(index: integer) #
---@field getCanvas fun(): Canvas #
---@field getExtraWidth fun(): integer # Returns the number of pixels not part of the text of the combobox (think about borders, thumb button, etc...)


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
---@field stepIt fun() # Increase position with "Step" size
---@field stepBy fun(step: integer) # Increase the position by the given integer value
---@field getMax fun(): integer # Returns the Max property
---@field setMax fun(max: integer) # Sets the max property
---@field getMin fun(): integer # Returns the min property
---@field setMin fun(min: integer) # Sets the min property
---@field getPosition fun(): integer # Returns the current position
---@field setPosition fun(position: integer) # Sets the current position
---@field setPosition2 fun(position: integer) # Sets the current position. Without slow progress animation on Win7 and later


---Inherits from WinControl (Inheritance: TrackBar->WinControl->Control->Component->Object)
---@class TrackBar: WinControl
---@field Min integer # Minimal value for the trackbar
---@field Max integer # Maximum value for the trackbar
---@field Position integer # The current position
---@field OnChange function # Function to call when trackbar position changes
---@field getMax fun(): integer #
---@field setMax fun(max: integer) #
---@field getMin fun(): integer #
---@field setMin fun(min: integer) #
---@field getPosition fun(): integer #
---@field setPosition fun(position: integer) #
---@field getOnChange fun(): function #
---@field setOnChange fun(onChange: function) #


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
---@field OnData fun(sender: any, item: ListItem) # Called when a listview with OwnerData true renders a line
---@field OnCustomDraw fun(sender: any, rect: Rectangle, default?: DefaultDraw): DefaultDraw #
---@field OnCustomDrawItem fun(sender: any, item: ListItem, settings: CustomDrawSettingTable, default?: DefaultDraw): DefaultDraw #
---@field OnCustomDrawSubItem fun(sender: any, item: ListItem, subItemIndex: integer, settings: CustomDrawSettingTable, default?: DefaultDraw): DefaultDraw #
---@field clear fun() #
---@field getColumns fun(): ListColumns # Returns a ListColumns object
---@field getItemAt fun(x: integer, y: integer): ListItem # Returns the ListItem at the given coordinate (x * column size * y). nil if nothing
---@field getItems fun(): ListItems # Returns a ListItems object
---@field getItemIndex fun(): integer # Returns the currently selected index in the Items object
---@field setItemIndex fun(index: integer) # Sets the current itemindex
---@field getCanvas fun(): Canvas # Returns the canvas object used to render the list view
---@field beginUpdate fun() # Tells the list view to stop updating while you're busy
---@field endUpdate fun() # Applies all updates between beginUpdate and endUpdate


---This is an object that can hold multiple pages.
---
---Inherits from WinControl (PageControl->WinControl->Control->Component->Object)
---@class PageControl: WinControl
---@field ShowTabs boolean # Shows the tabs
---@field TabIndex integer # Gets and sets the current tab
---@field ActivePage TabSheet # Returns the current tabsheet.
---@field PageCount integer # Gets the number of pages
---@field Page TabSheet[] # Get a specific page (TabSheet)
---@field addTab fun(): TabSheet # Creates a new TabSheet
---@field tabRect fun(index: integer): Rectangle # Returns a rect table describing the position of the specific tab

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
---@field createBlock fun(): DiagramBlock # Creates a new uninitialized block
---@field addConnection fun(source: DiagramBlock, destination: DiagramBlock): DiagramLink | fun(source: BlockSideDescriptorTable, destination: BlockSideDescriptorTable): DiagramLink # Creates a link between the two blocks or using the BlockSideDescritorTable table definition
---@field saveAsImage fun(fileNamePNG: path) # Saves the current display as an PNG image
---@field saveToFile fun(fileName: path) # Saves the state of the diagram to a file
---@field loadFromFile fun(fileName: path) # loads the state of the diagram from a file
---@field saveToStream fun(stream: Stream) # Saves the state of the diagram to a stream
---@field loadFromStream fun(stream: Stream) # loads the state of the diagram from a stream
---@field getObjectAt fun(pos: Locations2D): Object # Returns the object at this position. nil if nothing


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
---@field startAnimatorTimer fun() # Starts the animator timer which will trigger an OnPaint with the speed of the current framesPerSecond property
---@field stopAnimatorTimer fun() # Stops the animator timer


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

