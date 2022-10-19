---@meta



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
---@field getWidth fun(): integer # Gets the current width in pixels of this graphics object
---@field setWidth fun(width): integer # Sets the width in pixels
---@field getHeight fun(): integer # Gets the current height in pixels of this graphics object
---@field setHeight fun(height: integer) # Sets the height in pixels
---@field loadFromFile fun(fileName: path) # Loads a graphic into this object from a file
---@field saveToFile fun(fileName: path) # Saves this graphic into a file


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
---@field OnChange fun(sender: any)
---@field add fun(bitmap: Bitmap, bitmapmask?: integer): integer # Adds a new bitmap the list and returns the index of the newly added entry
---@field draw fun(canvas: Canvas, x: integer, y: integer, index: integer) # Draws the image at the index to the specific x, y coordinates on the canvas


---Inherits from GraphicControl (Image->GraphicControl->Control->Component->Object)
---@class Image: GraphicControl
---@field Canvas Canvas # The canvas object to access the picture of the image
---@field Transparent boolean # Determines if some parts of the picture are see through (usually based on the bottomleft corner)
---@field Stretch boolean # Determines if the picture gets stretched when rendered in the image component
---@field Picture Picture # The picture to render
---@field loadImageFromFile fun(fileName: path) #
---@field getStretch fun(): boolean #
---@field setStretch fun(stretch: boolean) #
---@field getTransparent fun(): boolean #
---@field setTransparent fun(transparent: boolean) #
---@field getCanvas fun(): Canvas #
---@field setPicture fun(picture: Picture) #
---@field getPicture fun(): Picture # Returns the Picture object of this image



---Container for the Graphic class.
---
---Inherits from Object (Picture->Object)
---@class Picture: Object
---@field Graphic Graphic #
---@field PNG PortableNetworkGraphic #
---@field Bitmap Bitmap #
---@field Jpeg JpegImage #
---@field Icon Icon #
---@field loadFromFile fun(fileName: path) #
---@field saveToFile fun(fileName: path) #
---@field loadFromStream fun(stream: Stream, originalExtension?: string) # Loads a picture from a stream. Note that the stream position must be set to the start of the picture
---@field assign fun(sourcePicture: Picture) #


---Base class for some graphical controls
---
---Inherits from Graphic (RasterImage->Graphic->Object)
---@class RasterImage: Graphic
---@field Canvas Canvas #
---@field PixelFormat PixelFormats # The pixel format for this image. Will clear the current image if it had one. 
---@field TransparentColor Colors #
---@field getCanvas fun(): Canvas # Returns the Canvas object for this image
---@field getPixelFormat fun(): PixelFormats # Returns the current pixelformat
---@field setPixelFormat fun(pixelFormat: PixelFormats) # Sets the pixelformat for this image. Will clear the current image if it had one
---@field setTransparentColor fun(color: Colors) # Sets the color that will be rendered as transparent when drawn
---@field getTransparentColor fun(): Colors # Returns the color set to be transparent
---@field saveToStream fun(stream: Stream) # Saves the image to a stream object
---@field loadFromStream fun(stream: Stream) # Loads the image from a stream object



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
