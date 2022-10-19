---@meta


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
---@field OnDblClick fun(sender: any) # Function to call when the link is double-clicked
---@field hasLinkToBlock fun(DiagramBlock): boolean # Returns true/false depending on if this link has a connection to the provided block
---@field reset fun() # Sets all custom colors sizes back to default
---@field updateSide fun(table: BlockSideDescriptorTable) # Updates the side of the block described by the BlockSideDescriptorTable   
---@field getPointIndexAt fun(x: integer, y: integer): integer # Returns the point index at the given x, y coordinate
---@field addPoint fun(x: integer, y: integer, index?: integer) # Creates a point. If no index is given if inside the line at that line index, else at the end of the list.  If a index is given at that specific index.
---@field removeAllPoints fun() # Removes all points


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
---@field OnDoubleClickHeader fun(block: DiagramBlock) # Function to call when the block's header is doubleclicked
---@field OnDoubleClickBody fun(block: DiagramBlock) # Function to call when the block's body is doubleclick
---@field OnRenderHeader fun(sender: any, rectangle: Rectangle, beforeOwnerDraw: boolean): boolean # Function to call when the header is being rendered. This is called twice, before and after the normal painting code. In case of before and the function returns nil or false, the original text will not be drawn
---@field OnRenderBody fun(sender: any, rectangle: Rectangle, beforeOwnerDraw: boolean): boolean - Function to call when the body is being rendered. This is called twice, before and after the normal painting code. In case of before and the function returns nil or false, the original text will not be drawn
---@field OnDragStart fun(block: DiagramBlock) # Called when a block starts getting dragged
---@field OnDrag fun(block: DiagramBlock) # Called when a block is dragged around
---@field OnDragEnd fun(block: DiagramBlock) # Called when a dragged block is released
---@field getLinks fun(): table # Returns a table two elements: 'asSource' and 'asDestination'. each of those will have a table with DiagramLinks linking with the box
---@field overlapsWith fun(block: DiagramBlock): boolean # Returns true if the two blocks overlap
---@field intersectsWithLine fun(pointA: Locations2D, pointB: Locations2D): boolean, intersectPoint: Locations2D | nil # Returns true and the point of intersection or false if no intersection

