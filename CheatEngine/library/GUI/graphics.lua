---@meta _


---Can be one or more of the following between [ and ] 
---
---
---@alias DiagramArrowStyles string
---| '"asOrigin"' # There will be an arrow at the point of origin
---| '"asDestination"' # There will be an arrow at the destination
---| '"asPoints"' # There will be an arrow at plot point locations
---| '"asCenterBetweenPoints"' # There will be an arrow between two points
---| '"asCenter"' # There will be an arrow in the center of the line

---@enum BlockSideTypeDefinitions
CE_defines.block_side_type_definitions = {
  dbsTop          = 0,
  dbsLeft         = 1,
  dbsRight        = 2,
  dbsBottom       = 3,
  dbsTopLeft      = 4,
  dbsTopRight     = 5,
  dbsBottomLeft   = 6,
  dbsBottomRight  = 7,
}

---@alias BlockSideTypeDefinition integer
---| 0 # **dbsTop** ->
---| 1 # **dbsLeft** ->
---| 2 # **dbsRight** ->
---| 3 # **dbsBottom** ->
---| 4 # **dbsTopLeft** ->
---| 5 # **dbsTopRight** ->
---| 6 # **dbsBottomLeft** ->
---| 7 # **dbsBottomRight** ->

---@alias BlockSideTypeDefinitionString string
---| '"dbsTop"' #
---| '"dbsLeft"' #
---| '"dbsRight"' #
---| '"dbsBottom"' #
---| '"dbsTopLeft"' #
---| '"dbsTopRight"' #
---| '"dbsBottomLeft"' #
---| '"dbsBottomRight"' #


---@class BlockSideDescriptorTable
---@field Block DiagramBlock # The block to attach to
---@field Side BlockSideTypeDefinition # One of the blockside typedefs
---@field Position integer # Position on the provided side based on the center. Only for Sides 0 to 3


---@class DiagramBlockLinks
---@field asSource DiagramLink[] #
---@field asDestination DiagramLink[] #


---Links between blocks
---@class DiagramLink
---@field OriginBlock DiagramBlock # The source of the link 
---@field DestinationBlock DiagramBlock # The destination of the link
---@field OriginDescriptor BlockSideDescriptorTable #
---@field DestinationDescriptor BlockSideDescriptorTable #
---@field PointCount integer # The number of points in the table
---@field Points Locations2D[] # Return a table with x,y coordinates for the point at the given index (index starts at 0)
---@field LineColor integer # Color of the line , when set overrides the default
---@field Linethickness integer # thickness of the line, when set overrides the default
---@field ArrowStyles DiagramArrowStyles # See diagram ArrowStyles
---@field Name string # Name of the link
---@field Tag integer # Use for whatever you like
local DiagramLink = {}

---Function to call when the link is double-clicked.
---@param sender any
function DiagramLink.OnDblClick(sender) end

---@param DiagramBlock DiagramBlock
---@return boolean # whether this link has a connection to the provided block
function DiagramLink.hasLinkToBlock(DiagramBlock) end

---Sets all custom colors sizes back to default
function DiagramLink.reset() end

---@param table BlockSideDescriptorTable # Updates the side of the block described by the BlockSideDescriptorTable   
function DiagramLink.updateSide(table) end

---@param x integer
---@param y integer
---@return integer # The point index at the given x, y coordinates
function DiagramLink.getPointIndexAt(x, y) end

---Creates a point. 
---
---If no index is given:
---1. If the point is inside a line, the point is added at that line's index. 
---2. If the point is not inside a line, it's added at the end of the list.  
---
---If a index is given, the point is added at that specific index.
---@param x integer
---@param y integer
---@param index? integer
function DiagramLink.addPoint(x, y, index) end

---Removes all points.
function DiagramLink.removeAllPoints() end


---The diagram block is a block with a header and body which can contain text (ansi escape codes supported).
---@class DiagramBlock
---@field Owner Diagram # The diagram that this block is in
---@field X integer # X position of the block
---@field Y integer # Y position of the block
---@field Width integer # Width of the block
---@field Height integer # Height of the block
---@field Caption string # Header of the block (ansi escape codes supported)
---@field Strings Strings # Strings object containing the lines of the block (ansi escape codes supported)
---@field BackgroundColor Colors # When set overrides the default color for the block to the given one
---@field TextColor Colors # The starting/default textcolor
---@field Name string # The name of the block
---@field AutoSize boolean # If true the width and height of the box will adjust to the given Caption and Strings
---@field AutoSide boolean # If true the connection side of a link will be picked for you instead of providing the side yourself
---@field AutoSideDistance integer # If autoside is true and there are multiple lines on the same side, this determines the distance between
---@field ShowHeader boolean # If true show ther header. (default true)
---@field DragBody boolean # If true allows dragging of the body. Useful when there is no header (default false)
---@field Tag integer # Use for whatever you like
local DiagramBlock = {}

---Function to call when the block's header is double clicked
---@param block DiagramBlock
function DiagramBlock.OnDoubleClickHeader(block) end

---Function to call when the block's body is double click
---@param block DiagramBlock
function DiagramBlock.OnDoubleClickBody(block) end

---Function to call when the header is being rendered. 
---
---This is called twice, before and after the normal painting code. 
---@param sender any
---@param rectangle Rectangle
---@param beforeOwnerDraw boolean # When before is true and the function returns nil or false, the original text will not be drawn.
---@return boolean
function DiagramBlock.OnRenderHeader(sender, rectangle, beforeOwnerDraw) end

---Function to call when the body is being rendered. 
---
---This is called twice, before and after the normal painting code. 
---@param sender any
---@param rectangle Rectangle
---@param beforeOwnerDraw boolean # When before is true and the function returns nil or false, the original text will not be drawn.
---@return boolean
function DiagramBlock.OnRenderBody(sender, rectangle, beforeOwnerDraw) end

---Called when a block starts getting dragged.
---@param block DiagramBlock
function DiagramBlock.OnDragStart(block) end

---Called when a block is dragged around
---@param block DiagramBlock
function DiagramBlock.OnDrag(block) end

---Called when a dragged block is released
---@param block DiagramBlock
function DiagramBlock.OnDragEnd(block) end

---@param block DiagramBlock
---@return { asSource: DiagramLink[], asDestination: DiagramLink[] } # A table of two elements: 'asSource' and 'asDestination', each of those will have a table with DiagramLinks linking with the box.
function DiagramBlock.getLinks(block) end

---@param block DiagramBlock
---@return boolean # Whether the two blocks overlap.
function DiagramBlock.overlapsWith(block) end

---@param pointA Locations2D
---@param pointB Locations2D
---@return boolean # Whether the diagram block is intersected by the line passed in via 2 points.
---@return Locations2D | nil intersectPoint # When intersecting, the point of intersection, otherwise nil
function DiagramBlock.intersectsWithLine(pointA, pointB) end

