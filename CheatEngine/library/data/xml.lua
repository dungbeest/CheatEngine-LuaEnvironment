---@meta

---@class DOMNode
---@field writeToFile fun(fileName: path) #
---@field writeToStream fun(stream: Stream) #

---Inherits from DOMNode (DOMNodeWithChildren->DOMNode)
---@class DOMNodeWithChildren: DOMNode


---Inherits from DOMNodeWithChildren (DOMNodeTopLevel->DOMNodeWithChildren->DOMNode)
---@class DOMNodeTopLevel: DOMNodeWithChildren


---Inherits from DOMNodeTopLevel (DOMDocument->DOMNodeTopLevel->DOMNodeWithChildren->DOMNode)
---@class DOMDocument: DOMNodeTopLevel



---Inherits from DOMDocument (XMLDocument->DOMDocument->DOMNodeTopLevel->DOMNodeWithChildren->DOMNode)
---@class XMLDocument


---Creates an empty XML document
---@return XMLDocument #
function createXMLDocument() return {} end

---Reads the given file and returns an XMLDocument with the parsed contents of the file.
---@param fileName path # Path to file to parse
---@return XMLDocument # An XMLDocument with the parsed contents of the file
function createXMLDocumentFromFile(fileName) return {} end

---Reads the given stream and returns an XMLDocument with the parsed contents of the stream
---@param stream Stream # Stream to parse
---@return XMLDocument # an XMLDocument with the parsed contents of the stream
function createXMLDocumentFromStream(stream) return {} end
