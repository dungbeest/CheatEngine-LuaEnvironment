---@meta



---The xmplayer class has already been defined as xmplayer, no need to create it manually
---@class xmplayer
---@field IsPlaying boolean # Indicator that the xmplayer is currently playing a xm file
---@field Initialized boolean # Indicator that the xmplayer is actually actively loaded in memory
---@field setVolume fun(volume: integer) #
---@field playXM fun(fileToPlay: path | TableFile | Stream, noloop?: boolean) #
---@field pause fun() #
---@field resume fun() #
---@field stop fun() #


---Inherits from Component (CustomApplication->Component->Object)
---@class CustomApplication: Component


---Inherits from CustomApplication(Application->CustomApplication->Component->Object)
---@class Application: CustomApplication
---@field Title string # The title of cheat engine in the bar
---@field Icon Icon # The icon of Cheat Engine inn the bar
---@field bringToFront fun() # Shows the cheat engine app
---@field processMessages fun() #
---@field terminate fun() #
---@field minimize fun() #


---Inherits from Object (ControlScrollBar->Object)
---@class ControlScrollBar: Object
---@field Increment word # The amount the position moves when using the scrollbar arrows
---@field Page word # slider size in pixels
---@field Smooth boolean #
---@field Position integer # (limited to 0 to range-page)
---@field Range integer # 
---@field Tracking boolean # Gives feedback when the slider is moved
---@field Visible boolean #


---@return Application # The application object (the titlebar)
function getApplication() return {} end
