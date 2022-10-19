---@meta


---A table of 4 integers representing 4 lengths of edges of a rectangle in order: { Left, Top, Right, Bottom }.
---@alias Rectangle integer[]


---The array of settings to pass for custom draw.
---
---It takes each option from CustomDrawSetting.
---
---Example: { cdsSelected=true/false(nil), cdsGrayed=true/false(nil), cdsDisabled=true/false(nil), cdsChecked=true/false(nil), cdsFocused=true/false(nil), cdsDefault=true/false(nil), cdsHot=true/false(nil), cdsMarked=true/false(nil), cdsIndeterminate=true/false(nil) }
---@alias CustomDrawSettingTable table<CustomDrawSetting, boolean>


---@alias DrawDirection integer
---| 0 # Vertical
---| 1 # Horizontal

---@alias FontPitch string
---| '"fpDefault"' # Default pitch
---| '"fpVariable"' # Variable pitch
---| '"fpFixed"' # Fixed pitch

---@alias FontQuality string
---| '"fqDefault"' # 
---| '"fqDraft"' # 
---| '"fqProof"' # 
---| '"fqNonAntialiased"' # 
---| '"fqAntialiased"' # 
---| '"fqCleartype"' #
---| '"fqCleartypeNatural"' # 

---@alias FontStyle string 
---| '"fsBold"' # 
---| '"fsItalic"' # 
---| '"fsStrikeOut"' # 
---| '"fsUnderline"' #


---Inherits from Object (CustomCanvas->Object)
---@class CustomCanvas: Object


---Inherits from CustomCanvas (Canvas->CustomCanvas->Object)
---@class Canvas: CustomCanvas
---@field Brush Brush # The brush object
---@field Pen Pen # The pen object
---@field Font Font # The font object
---@field Width integer # Width of the canvas
---@field Height integer # Height of the canvas
---@field Handle integer # DC handle of the canvas
---@field getBrush fun(): Brush # Returns the brush object of this canvas
---@field getPen fun(): Pen # Returns the pen object of this canvas
---@field getFont fun(): Font # Returns the font object of this canvas
---@field getWidth fun(): integer #
---@field getHeight fun(): integer #
---@field getPenPosition fun(): x: integer, y: integer #
---@field setPenPosition fun(x: integer, y: integer) #
---@field clear fun() # Clears the canvas
---@field line fun(sourceX: integer, sourceY: integer, destinationX: integer, destinationY: integer) #
---@field lineTo fun(destinationX: integer, destinationY: integer) #
---@field moveTo fun(destinationX: integer, destinationY: integer) #
---@field rect fun(x1: integer, y1: integer, x2: integer, y2: integer) # Draws a rectangle
---@field fillRect fun(x1: integer, y1: integer, x2: integer, y2: integer) # Draws a filled rectangle
---@field roundRect fun(x1: integer, y1: integer, x2: integer, y2: integer, rx: integer, ry: integer) # Draws a rectangle with rounded corners
---@field drawFocusRect fun(x1: integer, y1: integer, x2: integer, y2: integer) # Draws the focus rectangle shape
---@field textOut fun(x: integer, y: integer, text: string) #
---@field textRect fun(rect, x: integer, y: integer, text: string) # Write the text within the given rectangle. The text supports some ansi escape characters
---@field getTextWidth fun(text: string): integer #
---@field getTextHeight fun(text: string): integer #
---@field getPixel fun(x: integer, y: integer): integer #
---@field setPixel fun(x: integer, y: integer, color: Colors) #
---@field floodFill fun(x: integer, y: integer, color?: Colors, fillType?: FillTypes) # Fills the picture with a color. Color defaults to brush.Color. Fill type defaults to fsSurface
---@field ellipse fun(x1: integer, y1: integer, x2: integer, y2: integer)
---@field gradientFill fun(x1: integer, y1: integer, x2: integer, y2: integer, startColor: Colors, stopColor: Colors, direction: DrawDirection) # Gradient fills a rectangle.
---@field copyRect fun(dest_x1: integer, dest_y1: integer, dest_x2: integer, dest_y2: integer, sourceCanvas: Canvas, source_x1: integer, source_y1: integer, source_x2: integer, source_y2: integer) # Draws an image from one source to another. Useful in cases of doublebuffering
---@field draw fun(x: integer, y: integer, graphic: Graphic) # Draw the image of a specific Graphic class
---@field stretchDraw fun(rect: Rectangle, graphic: Graphic) # Draw the image of a specific Graphic class and stretch it so it fits in the given rectangle
---@field getClipRect fun(): Rectangle # Returns a table containing the fields Left, Top, Right and Bottom, which define the invalidated region of the graphical object. Use this to only render what needs to be rendered in the onPaint event of objects


---Inherits from Object (CanvasHelper->Object)
---@class CanvasHelper: Object


---Inherits from CanvasHelper (CustomPen->CanvasHelper->Object)
---@class CustomPen: CanvasHelper


---Inherits from CustomPen (Pen->CustomPen->CanvasHelper->Object)
---@class Pen: CustomPen
---@field Color Colors # The color of the pen
---@field Width integer # Thickness of the pen
---@field getColor fun(): Colors #
---@field setColor fun(color: Colors) #
---@field getWidth fun(): integer #
---@field setWidth fun(width: integer) #


---Inherits from CanvasHelper (CustomBrush->CanvasHelper->Object)
---@class CustomBrush: CanvasHelper


---Inherits from CustomBrush (Brush->CustomBrush->CanvasHelper->Object)
---@class Brush: CustomBrush
---@field Color Colors #
---@field getColor fun(): Colors #
---@field setColor fun(color: Colors) #


---Inherits from CanvasHelper (CustomFont->CanvasHelper->Object)
---@class CustomFont: CanvasHelper


---Inherits from CustomFont (Font->CustomFont->CanvasHelper->Object)
---@class Font: CustomFont
---@field Name string #
---@field Size integer #
---@field Height integer #
---@field Orientation integer #
---@field Pitch FontPitch #
---@field Color Colors #
---@field CharSet integer #
---@field Quality FontQuality # 
---@field Style FontStyle[] # Set of styles applied to font
---@field getName fun(): string # Gets the fontname of the font
---@field setName fun(name: string) # Sets the fontname of the font
---@field getSize fun(): integer # Gets the size of the font
---@field setSize fun(size: integer) # Sets the size of the font
---@field getColor fun(): Colors # Gets the color of the font
---@field setColor fun(color: Colors) # Sets the color of the font
---@field assign fun(font: Font) # Copies the contents of the font given as parameter to this font



---Inherits from Object (GraphicsObject->Object)
---@class GraphicsObject: Object


---Inherits from Graphics Object (Region->GraphicsObject->Object)
---@class Region: GraphicsObject
---@field addRectangle fun(x1: integer, y1: integer, x2: integer, y2: integer) # Adds a rectangle to the region
---@field addPolygon fun(coordinates: Locations2D) # Adds an array of 2D locations. (example : {{0,0},{100,100}, {0,100}} for a triangle)



---Inherits from Control (GraphicControl->Control->Component->Object)
---@class GraphicControl: Control
---@field Canvas Canvas # The canvas for rendering this control
---@field getCanvas fun(): Canvas # Returns the Canvas object for the given object that has inherited from Graphic Control


---Inherits from GraphicControl (PaintBox->GraphicControl->Control->Component->Object)
---@class PaintBox: GraphicControl


---Inherits from GraphicControl (Label->GraphicControl->Control->Component->Object)
---@class Label: GraphicControl



---Creates an empty region.
---@return Region # New empty region
function createRegion() return {} end


---@return Font # A font object (default initialized based on the main Cheat Engine window)
function createFont() return {} end


---Creates an image list object.
---@param owner? Control # The control to attach the image list to
---@return ImageList # A new ImageList object
function createImageList(owner) return {} end
