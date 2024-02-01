---@meta

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
---@field Attached boolean # Returns true if attached to a process
---@field enumDomains fun(): DotNetDomainInfo[] # Returns an index table containing all domains. Each entry is build up as {DomainHandle, Name}
---@field enumModuleList fun(domainHandle: integer): DotNetModuleInfo[] # Returns an indexed table containing information about all modules. Each module entry is build up as {ModuleHandle, BaseAddress, Name}
---@field enumTypeDefs fun(moduleHandle: integer): DotNetClassInfo[] # Returns an indexed table containing information about all TypeDefs (classes) . Each entry is build up as {TypeDefToken, Name, Flags, Extends}
---@field getTypeDefMethods fun(moduleHandle: integer, typedefToken: integer): DotNetClassMethodInfo[] # Returns a table containing all the methods in the specified typedef. Each entry is build up as {MethodToken, Name, Attributes, ImplementationFlags, ILCode, NativeCode, SecondaryNativeCode[]: Integer)
---@field getTypeDefParent fun(moduleHandle: integer, typedefToken: integer): DotNetClassReference #
---@field getTypeDefData fun(moduleHandle: integer, typedefToken: integer): DotNetClassData[] # Returns a table containing all the fields in the specified typedef.  {ObjectType, ElementType, CountOffset, ElementSize, FirstElementOffset, ClassName, Fields[]{Offset, FieldType, Name} }
---@field getMethodParameters fun(moduleHandle: integer, methodDefToken: integer): DotNetClassMethodParameter[] # Returns a table containing all the parameters of the method. {Name, CType}
---@field getAddressData fun(address: Address): DotNetAddressData # Queries a specific address and returns information about it, assuming it is a valid object. It contains the following data: {StartAddress, ObjectType, ElementType, CountOffset, ElementSize, FirstElementOffset, ClassName, Fields[]{Offset, FieldType, Name} }
---@field enumAllObjects fun(): DotNetObjectInfo # Queries ALL defined objects. {StartAddress, Size, TypeID{token1,token2}, ClassName}. WARNING: This will take a LOOOOOONG time and if done from the main thread will make it look like CE is frozen
---@field enumAllObjectsOfType fun(moduleHandle: integer, typedefToken: integer): Address[] # Returns a list of addresses that have this type




---@return DotNetDataCollector # The current DotNetDataCollector object
function getDotNetDataCollector() return {} end
