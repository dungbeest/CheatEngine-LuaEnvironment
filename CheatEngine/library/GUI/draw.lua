---@meta _


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
local Canvas = {}


---@return Brush # The brush object of this canvas.
function Canvas.getBrush() end

---@return Pen # The pen object of this canvas.
function Canvas.getPen() end

---@return Font # The font object of this canvas.
function Canvas.getFont() end

---@return integer
function Canvas.getWidth() end

---@return integer
function Canvas.getHeight() end

---@return integer x
---@return integer y
function Canvas.getPenPosition() end

---@param x integer
---@param y integer
function Canvas.setPenPosition(x, y) end

---Clears the canvas
function Canvas.clear() end

---@param sourceX integer
---@param sourceY integer
---@param destinationX integer
---@param destinationY integer
function Canvas.line(sourceX, sourceY, destinationX, destinationY) end

---@param destinationX integer
---@param destinationY integer
function Canvas.lineTo(destinationX, destinationY) end

---@param destinationX integer
---@param destinationY integer
function Canvas.moveTo(destinationX, destinationY) end

---Draws a rectangle.
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
function Canvas.rect(x1, y1, x2, y2) end

---Draws a filled rectangle.
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
function Canvas.fillRect(x1, y1, x2, y2) end

---Draws a rectangle with rounded corners.
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param rx integer
---@param ry integer
function Canvas.roundRect(x1, y1, x2, y2, rx, ry) end

---Draws the focus rectangle shape.
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
function Canvas.drawFocusRect(x1, y1, x2, y2) end

---@param x integer
---@param y integer
---@param text string
function Canvas.textOut(x, y, text) end

---Write the text within the given rectangle. 
---The text supports some ansi escape characters.
---@param x integer
---@param y integer
---@param text string
function Canvas.textRect(x, y, text) end

---@param text string
---@return integer
function Canvas.getTextWidth(text) end

---@param text string
---@return integer
function Canvas.getTextHeight(text) end

---@param x integer
---@param y integer
---@return Colors
function Canvas.getPixel(x, y) end

---@param x integer
---@param y integer
---@param color Colors
function Canvas.setPixel(x, y, color) end

---Fills the picture with a color. 
---Color defaults to the brushes' color (brush.Color). 
---Fill type defaults to fsSurface.
---@param x integer
---@param y integer
---@param color? Colors
---@param fillType? FillTypes
function Canvas.floodFill(x, y, color, fillType) end

---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
function Canvas.ellipse(x1, y1, x2, y2) end

---Gradient fills a rectangle.
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param startColor Colors
---@param stopColor Colors
---@param direction DrawDirection
function Canvas.gradientFill(x1, y1, x2, y2, startColor, stopColor, direction) end


---Draws an image from one source to another. 
---Useful in cases of double buffering.
---@param dest_x1 integer
---@param dest_y1 integer
---@param dest_x2 integer
---@param dest_y2 integer
---@param sourceCanvas Canvas
---@param source_x1 integer
---@param source_y1 integer
---@param source_x2 integer
---@param source_y2 integer
function Canvas.copyRect(dest_x1, dest_y1, dest_x2, dest_y2, sourceCanvas, source_x1, source_y1, source_x2, source_y2) end

---Draw the image of a specific Graphic class.
---@param x integer
---@param y integer
---@param graphic Graphic
function Canvas.draw(x, y, graphic) end

---Draw the image of a specific Graphic class and stretch it so it fits in the given rectangle.
---@param rect Rectangle
---@param graphic Graphic
function Canvas.stretchDraw(rect, graphic) end

---Use this to only render what needs to be rendered in the onPaint event of objects.
---@return Rectangle # A table containing the fields Left, Top, Right and Bottom, which define the invalidated region of the graphical object.
function Canvas.getClipRect() end


---Inherits from Object (CanvasHelper->Object)
---@class CanvasHelper: Object


---Inherits from CanvasHelper (CustomPen->CanvasHelper->Object)
---@class CustomPen: CanvasHelper


---Inherits from CustomPen (Pen->CustomPen->CanvasHelper->Object)
---@class Pen: CustomPen
---@field Color Colors # The color of the pen
---@field Width integer # Thickness of the pen
local Pen = {}

---@return Colors
function Pen.getColor() end

---@param color Colors
function Pen.setColor(color) end

---@return integer
function Pen.getWidth() end

---@param width integer
function Pen.setWidth(width) end


---Inherits from CanvasHelper (CustomBrush->CanvasHelper->Object)
---@class CustomBrush: CanvasHelper


---Inherits from CustomBrush (Brush->CustomBrush->CanvasHelper->Object)
---@class Brush: CustomBrush
---@field Color Colors #
local Brush = {}

---@return Colors
function Brush.getColor() end

---@param color Colors
function Brush.setColor(color) end


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
local Font = {}

---Gets the font name of the font.
---@return string
function Font.getName() end

---Sets the font name of the font.
---@param name string
function Font.setName(name) end

---Gets the size of the font.
---@return integer
function Font.getSize() end

---Sets the size of the font.
---@param size integer
function Font.setSize(size) end

---Gets the color of the font.
---@return Colors
function Font.getColor() end

---Sets the color of the font.
---@param color Colors
function Font.setColor(color) end

---Copies the contents of the font given as parameter to this font.
---@param font Font
function Font.assign(font) end



---Inherits from Object (GraphicsObject->Object)
---@class GraphicsObject: Object


---Inherits from Graphics Object (Region->GraphicsObject->Object)
---@class Region: GraphicsObject
local Region = {}

---Adds a rectangle to the region
---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
function Region.addRectangle(x1, y1, x2, y2) end

---Adds an array of vertices (2d points). 
---
---Example : {{0,0},{100,100}, {0,100}} for a triangle.
---@param coordinates Locations2D[]
function Region.addPolygon(coordinates) end



---Inherits from Control (GraphicControl->Control->Component->Object)
---@class GraphicControl: Control
---@field Canvas Canvas # The canvas for rendering this control
local GraphicControl = {}

---@return Canvas # The Canvas object of this graphic control.
function GraphicControl.getCanvas() end


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
