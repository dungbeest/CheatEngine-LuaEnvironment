---@meta _

---@class DotNetDomainInfo
---@field DomainHandle integer #
---@field Name string #

---@class DotNetModuleInfo
---@field ModuleHandle integer #
---@field BaseAddress Address #
---@field Name string #

---@class DotNetClassInfo
---@field TypeDefToken integer #
---@field Name string #
---@field Flags integer #
---@field Extends string #

---@class DotNetClassMethodInfo
---@field MethodToken integer #
---@field Name string #
---@field Attributes integer #
---@field ImplementationFlags integer #
---@field ILCode string #
---@field NativeCode string #
---@field SecondaryNativeCode integer[] #

---@class DotNetClassMethodParameter
---@field Name string #
---@field CType integer #

---@class DotNetClassReference
---@field ModuleHandle integer #
---@field TypedefToken integer #

---@class DotNetClassData
---@field ObjectType integer #
---@field ElementType integer #
---@field CountOffset integer #
---@field ElementSize integer #
---@field FirstElementOffset integer #
---@field ClassName string #
---@field Fields DotNetClassField[] #

---@class DotNetClassField
---@field Offset integer #
---@field FieldType integer #
---@field Name string #

---@class DotNetAddressData
---@field StartAddress Address #
---@field ObjectType integer #
---@field ElementType integer #
---@field CountOffset integer #
---@field ElementSize integer #
---@field FirstElementOffset integer #
---@field ClassName string #
---@field Fields DotNetClassField[] #

---@class DotNetObjectInfo
---@field StartAddress Address #
---@field Size integer #
---@field TypeID integer[] #
---@field ClassName string #


---@class DotNetDataCollector
---@field Attached boolean # true if attached to a process
local DotNetDataCollector = {}

---@return DotNetDomainInfo[] # An index table containing all domains.
function DotNetDataCollector.enumDomains() end

---@param domainHandle integer
---@return DotNetModuleInfo[] # An indexed table containing information about all modules.
function DotNetDataCollector.enumModuleList(domainHandle) end

---@param moduleHandle integer
---@return DotNetClassInfo[] # An indexed table containing information about all TypeDefs (classes)
function DotNetDataCollector.enumTypeDefs(moduleHandle) end


---@param moduleHandle integer
---@param typedefToken integer
---@return DotNetClassMethodInfo[] # A table containing all the methods in the specified typedef.
function DotNetDataCollector.getTypeDefMethods(moduleHandle, typedefToken) end


---@param moduleHandle integer
---@param typedefToken integer
---@return DotNetClassReference
function DotNetDataCollector.getTypeDefParent(moduleHandle, typedefToken) end


---@param moduleHandle integer
---@param typedefToken integer
---@return DotNetClassData[] # A table containing all the fields in the specified typedef.
function DotNetDataCollector.getTypeDefData(moduleHandle, typedefToken) end

---@param moduleHandle integer
---@param methodDefToken integer
---@return DotNetClassMethodParameter[] # A table containing all the parameters of the method.
function DotNetDataCollector.getMethodParameters(moduleHandle, methodDefToken) end


---Queries a specific address and returns information about it, assuming it is a valid object. 
---@param address Address
---@return DotNetAddressData
function DotNetDataCollector.getAddressData(address) end


---Queries ALL defined objects. WARNING: This will take a LOOOOOONG time and if done from the main thread will make it look like CE is frozen.
---@return DotNetObjectInfo
function DotNetDataCollector.enumAllObjects() end

---@param moduleHandle integer
---@param typedefToken integer
---@return Address[] # a list of addresses that have this type
function DotNetDataCollector.enumAllObjectsOfType(moduleHandle, typedefToken) end

---@return DotNetDataCollector # The current DotNetDataCollector object
function getDotNetDataCollector() end
