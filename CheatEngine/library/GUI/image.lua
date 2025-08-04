---@meta _



---@alias DrawingStyle string
---| '"dsFocus"' # 
---| '"dsSelected"' # 
---| '"dsNormal"' #
---| '"dsTransparent"' #




---Abstract class
---Inherits from Object (Graphic->Object)
---@class Graphic: Object
---@field Width integer
---@field Height integer
---@field Transparent boolean
local Graphic = {}

---Gets the current width in pixels of this graphics object.
---@return integer
function Graphic.getWidth() end

---Sets the width in pixels.
---@param width integer
function Graphic.setWidth(width) end

---Gets the current height in pixels of this graphics object.
---@return integer
function Graphic.getHeight() end

---Sets the height in pixels.
---@param width integer
function Graphic.setHeight(width) end

---Loads a graphic into this object from a file.
---@param fileName path
function Graphic.loadFromFile(fileName) end

---Saves this graphic into a file.
---@param fileName path
function Graphic.saveToFile(fileName) end


---List containing images.
---
---Used by several components for images.
---@class ImageList
---@field Count integer # Number of images in the list
---@field DrawingStyle DrawingStyle # Style to draw images
---@field Height integer #
---@field Width integer #
---@field Masked boolean #
---@field Scaled boolean #
local ImageList = {}

---@param sender any
function ImageList.OnChange(sender) end

---Adds a new bitmap to the list.
---@param bitmap Bitmap
---@param bitmapmask? integer
---@return integer # the index of the newly added entry.
function ImageList.add(bitmap, bitmapmask) end

---Draws the image at the index to the specific x, y coordinates on the canvas.
---@param canvas Canvas
---@param x integer
---@param y integer
---@param index integer
function ImageList.draw(canvas, x, y, index) end


---Inherits from GraphicControl (Image->GraphicControl->Control->Component->Object)
---@class Image: GraphicControl
---@field Canvas Canvas # The canvas object to access the picture of the image
---@field Transparent boolean # Determines if some parts of the picture are see through (usually based on the bottomleft corner)
---@field Stretch boolean # Determines if the picture gets stretched when rendered in the image component
---@field Picture Picture # The picture to render
local Image = {}

---@param fileName path
function Image.loadImageFromFile(fileName) end

---@return Canvas
function Image.getCanvas() end


---@return boolean
function Image.getStretch() end

---@param stretch boolean
function Image.setStretch(stretch) end

---@return boolean
function Image.getTransparent() end

---@param transparent boolean
function Image.setTransparent(transparent) end

---@return Picture # the Picture object of this image
function Image.getPicture() end

---@param picture Picture
function Image.setPicture(picture) end



---Container for the Graphic class.
---
---Inherits from Object (Picture->Object)
---@class Picture: Object
---@field Graphic Graphic #
---@field PNG PortableNetworkGraphic #
---@field Bitmap Bitmap #
---@field Jpeg JpegImage #
---@field Icon Icon #
local Picture = {}

---@param fileName path
function Picture.loadFromFile(fileName) end

---@param fileName path
function Picture.saveToFile(fileName) end

---Loads a picture from a stream. 
---
---Note that the stream position must be set to the start of the picture.
---@param stream Stream
---@param originalExtension? string
function Picture.loadFromStream(stream, originalExtension) end

---@param sourcePicture Picture
function Picture.assign(sourcePicture) end


---Base class for some graphical controls
---
---Inherits from Graphic (RasterImage->Graphic->Object)
---@class RasterImage: Graphic
---@field Canvas Canvas #
---@field PixelFormat PixelFormats # The pixel format for this image. Will clear the current image if it had one. 
---@field TransparentColor Colors #
local RasterImage = {}

---@return Canvas # The Canvas object for this image.
function RasterImage.getCanvas() end

---@return PixelFormats # The current pixel format.
function RasterImage.getPixelFormat() end

---Sets the pixelformat for this image. 
---
---Will clear the current image if it had one.
---@param pixelFormat PixelFormats
function RasterImage.setPixelFormat(pixelFormat) end

---@return Colors # The color set to be transparent.
function RasterImage.getTransparentColor() end

---Sets the color that will be rendered as transparent when drawn.
---@param color Colors
function RasterImage.setTransparentColor(color) end

---Saves the image to a stream object.
---@param stream Stream
function RasterImage.saveToStream(stream) end

---Loads the image from a stream object.
---@param stream Stream
function RasterImage.loadFromStream(stream) end



---Bitmap based Graphic object.
---
---Inherits from RasterImage (CustomBitmap->RasterImage->Graphic->Object)
---@class CustomBitmap: RasterImage


---Inherits from CustomBitmap (Bitmap->CustomBitmap->RasterImage->Graphic->Object)
---@class Bitmap: CustomBitmap

---Inherits from CustomBitmap (PortableNetworkGraphic->CustomBitmap->RasterImage->Graphic->Object)
---@class PortableNetworkGraphic: CustomBitmap

---Inherits from CustomBitmap (JpegImage->CustomBitmap->RasterImage->Graphic->Object)
---@class JpegImage: CustomBitmap

---Inherits from CustomBitmap (Icon->CustomBitmap->RasterImage->Graphic->Object)
---@class Icon: CustomBitmap



---Creates an Image class object which belongs to the given owner. Owner can be any object inherited from WinControl
---@generic T: WinControl
---@param owner T # The control that will own the Image component. Owner can be any object inherited from WinControl
---@return Image # The new Image object
function createImage(owner) return {} end


---@return Picture # A empty Picture object
function createPicture() return {} end


---@param width integer # Width of the bitmap
---@param height integer # Height of the bitmap
---@return Bitmap # A Bitmap object
function createBitmap(width, height) return {} end


---@param width integer # Width of the PNG
---@param height integer # Height of the PNG
---@return PortableNetworkGraphic # A PortableNetworkGraphic object
function createPNG(width, height) return {} end


---@param width integer # Width of the JPEG
---@param height integer # Height of the JPEG
---@return JpegImage # A Jpeg object
function createJpeg(width, height) return {} end


---@param width integer # Width of the Icon
---@param height integer # Height of the Icon
---@return Icon # An Icon object
function createIcon(width, height) return {} end
