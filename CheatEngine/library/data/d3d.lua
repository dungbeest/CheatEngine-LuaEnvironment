---@meta



---The d3dhook functions provide a method to render graphics and text inside the game, as long as it is running in directx9, 10 or 11
---@class D3DHook
---@field Width integer # The width of the screen (readonly)
---@field Height integer # The height of the screen (readonly)
---@field DisabledZBuffer boolean # Set this to true if you don't want previously rendered walls to overlap a newly rendered object (e.g map is rendered first, then the players are rendered)
---@field WireframeMode boolean # Set this to true if you don't want the faces of 3d objects to be filled
---@field MouseClip boolean # Set this if to true if you have one of those games where your mouse can go outside of the gamewindow and you don't want that
---@field OnClick fun(d3dhookSprite: D3DHookSprite, x: integer, y: integer) # A function to be called when clicked on an sprite (excluding the mouse). x and y are coordinates in the sprite object. If sprites overlap the highest zorder sprite will be given. It does NOT care if a transparent part is clicked or not. Note: If you set this it can cause a slowdown in the game if there are a lot of sprites and you press the left button a lot
---@field OnKeyDown fun(virtualKey: VirtualKeyCode, char: string): boolean # A function to be called when a key is pressed in the game window (Not compatible with DirectInput8). Return false if you do not wish this key event to pass down to the game
---@field beginUpdate fun() # Use this function when you intent to update multiple sprites, text containers or textures. Otherwise artifacts may occur (sprite 1 might be drawn at the new location while sprite 2 might still be at the old location when a frame is rendered)
---@field endUpdate fun() # When done updating, call this function to apply the changes
---@field enableConsole fun(virtualkey: VirtualKeyCode) # Adds a (lua) console to the specific game. The given key will bring it up (0xc0=tilde(`~))
---@field createTexture fun(fileName: path) | fun(picture: Picture, transparentColor?: Colors): D3DHookTexture # Returns a d3dhook texture object. If the picture is not a transparent image the transparentcolor parameter can be used to make one of it's colors transparent
---@field createFontmap fun(font: Font): D3DHookFontMap # Returns a d3dhook fontmap object created from the given font
---@field createSprite fun(d3dhookTexture: D3DHookTexture): D3DHookSprite # returns a d3dhook sprite object that uses the given texture for rendering
---@field createTextContainer fun(d3dhookFontMap: D3DHookFontMap, x: integer, y: integer, text: string): D3DHookTextContainer # Returns a d3dhook text container object


---This class controls the texture in memory. 
---
---Without a sprite to use it, it won't show.
---
---Inherits from Object (D3DHookTexture->Object)
---@class D3DHookTexture: Object
---@field Height integer # (ReadOnly)
---@field Width integer # (ReadOnly)
---@field loadTextureByPicture fun(picture: Picture) #



---A fontmap is a texture that contains extra data regarding the characters. 
---
---This class is used by the text container.
---
---Current implementation only supports 96 characters (character 32 to 127).
---
---Inherits from D3DHookTexture (D3DHookFontMap->D3DHookTexture->Object)
---@class D3DHookFontMap: D3DHookTexture
---@field changeFont fun(font: Font) # Changes the fontmap to the selected font
---@field getTextWidth fun(string: string): integer # Returns the width of the given string in pixels


---The render object is the abstract class used to control in what manner objects are rendered.
---
---The sprite and text container classed inherit from this.
---
---Inherits from Object (D3DHookRenderObject->Object)
---@class D3DHookRenderObject: Object
---@field X float # The X coordinate of the object on the screen
---@field Y float # The Y coordinate of the object on the screen
---@field CenterX float # X coordinate inside the object. It defines the rotation spot and affects the X position
---@field CenterY float # Y coordinate inside the object. It defines the rotation spot and affects the Y position
---@field Rotation float # Rotation value in degrees (0 and 360 are the same)
---@field Alphablend float # Alphablend value. 1.0 is fully visible, 0.0=invisible
---@field Visible boolean # Set to false to hide the object
---@field ZOrder integer # Determines if the object will be shown in front or behind another object


---A d3dhook_sprite class is a visible texture on the screen.
---
---Inherits from D3DHookRenderObject (D3DHookSprite->D3DHookRenderObject->Object)
---@class D3DHookSprite: D3DHookRenderObject
---@field Width integer # The width of the sprite in pixels. Default is the initial texture width
---@field Height integer # The height of the sprite in pixels. Default is the initial texture height
---@field Texture D3DHookTexture # The texture to show on the screen


---A d3dhook_sprite class draws a piece of text on the screen based on the used fontmap.
---
---While you could use a texture with the text, updating a texture in memory is slow. 
---
---So if you wish to do a lot of text updates, use a text container.
---
---Inherits from D3DHookRenderObject (D3DHookTextContainer->D3DHookRenderObject->Object)
---@class D3DHookTextContainer: D3DHookRenderObject
---@field FontMap D3DHookFontMap # The D3DHookFontMap object to use for rendering text
---@field Text string # The text to render



---Hooks direct3d and allocates a buffer with given size for storage of for the render command list
---
---If no size is provided 16MB is used and hookmessages is true
---
---Note: You can call this only once for a process
---@param textureAndCommandListSize? integer #
---@param hookMessages? any # hookmessages defines if you want to hook the windows message handler for the direct3d window. The d3dhook_onClick function makes use of that
---@return D3DHook # A d3dhook object
function createD3DHook(
  textureAndCommandListSize, hookMessages
) return {} end
