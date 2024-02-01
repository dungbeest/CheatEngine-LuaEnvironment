---@meta

---------------------- Aliases ----------------------

---@alias MonoCommand integer
---| 0 # MONOCMD_INITMONO ->
---| 1 # MONOCMD_OBJECT_GETCLASS ->
---| 2 # MONOCMD_ENUMDOMAINS ->
---| 3 # MONOCMD_SETCURRENTDOMAIN ->
---| 4 # MONOCMD_ENUMASSEMBLIES ->
---| 5 # MONOCMD_GETIMAGEFROMASSEMBLY ->
---| 6 # MONOCMD_GETIMAGENAME ->
---| 7 # MONOCMD_ENUMCLASSESINIMAGE ->
---| 8 # MONOCMD_ENUMFIELDSINCLASS ->
---| 9 # MONOCMD_ENUMMETHODSINCLASS ->
---| 10 # MONOCMD_COMPILEMETHOD ->
---| 11 # MONOCMD_GETMETHODHEADER ->
---| 12 # MONOCMD_GETMETHODHEADER_CODE ->
---| 13 # MONOCMD_LOOKUPRVA ->
---| 14 # MONOCMD_GETJITINFO ->
---| 15 # MONOCMD_FINDCLASS ->
---| 16 # MONOCMD_FINDMETHOD ->
---| 17 # MONOCMD_GETMETHODNAME ->
---| 18 # MONOCMD_GETMETHODCLASS ->
---| 19 # MONOCMD_GETCLASSNAME ->
---| 20 # MONOCMD_GETCLASSNAMESPACE ->
---| 21 # MONOCMD_FREEMETHOD ->
---| 22 # MONOCMD_TERMINATE ->
---| 23 # MONOCMD_DISASSEMBLE ->
---| 24 # MONOCMD_GETMETHODSIGNATURE ->
---| 25 # MONOCMD_GETPARENTCLASS ->
---| 26 # MONOCMD_GETSTATICFIELDADDRESSFROMCLASS ->
---| 27 # MONOCMD_GETTYPECLASS ->
---| 28 # MONOCMD_GETARRAYELEMENTCLASS ->
---| 29 # MONOCMD_FINDMETHODBYDESC ->
---| 30 # MONOCMD_INVOKEMETHOD ->
---| 31 # MONOCMD_LOADASSEMBLY ->
---| 32 # MONOCMD_GETFULLTYPENAME ->
---| 33 # MONOCMD_OBJECT_NEW ->
---| 34 # MONOCMD_OBJECT_INIT ->
---| 35 # MONOCMD_GETVTABLEFROMCLASS ->
---| 36 # MONOCMD_GETMETHODPARAMETERS ->
---| 37 # MONOCMD_ISCLASSGENERIC ->
---| 38 # MONOCMD_ISIL2CPP ->
---| 39 # MONOCMD_FILLOPTIONALFUNCTIONLIST ->
---| 40 # MONOCMD_GETSTATICFIELDVALUE -> fallback for il2cpp which doesn't expose what's needed
---| 41 # MONOCMD_SETSTATICFIELDVALUE ->
---| 42 # MONOCMD_GETCLASSIMAGE ->
---| 43 # MONOCMD_FREE ->
---| 44 # MONOCMD_GETIMAGEFILENAME ->
---| 45 # MONOCMD_GETCLASSNESTINGTYPE ->



---@alias MonoType integer
---| 0 # MONO_TYPE_END -> End of List
---| 1 # MONO_TYPE_VOID ->
---| 2 # MONO_TYPE_BOOLEAN -> mono boolean
---| 3 # MONO_TYPE_CHAR -> mono char pointer
---| 4 # MONO_TYPE_I1 -> mono signed byte
---| 5 # MONO_TYPE_U1 -> mono unsigned byte
---| 6 # MONO_TYPE_I2 -> mono signed short
---| 7 # MONO_TYPE_U2 -> mono unsigned short
---| 8 # MONO_TYPE_I4 -> mono signed int
---| 9 # MONO_TYPE_U4 -> mono unsigned int
---| 10 # MONO_TYPE_I8 -> mono signed long
---| 11 # MONO_TYPE_U8 -> mono unsigned long
---| 12 # MONO_TYPE_R4 -> mono float
---| 13 # MONO_TYPE_R8 -> mono double
---| 14 # MONO_TYPE_STRING -> mono pointer to string
---| 15 # MONO_TYPE_PTR -> arg: <type> token
---| 16 # MONO_TYPE_BYREF -> arg: <type> token
---| 17 # MONO_TYPE_VALUETYPE -> arg: <type> token
---| 18 # MONO_TYPE_CLASS -> arg: <type> token
---| 19 # MONO_TYPE_VAR -> number
---| 20 # MONO_TYPE_ARRAY -> type, rank, boundsCount, bound1, loCount, lo1
---| 21 # MONO_TYPE_GENERICINST -> <type> <type-arg-count> <type-1> \x{2026} <type-n> */
---| 22 # MONO_TYPE_TYPEDBYREF ->
---| 24 # MONO_TYPE_I -> mono signed int
---| 25 # MONO_TYPE_U -> mono unsigned int
---| 27 # MONO_TYPE_FNPTR -> arg: full method signature */
---| 28 # MONO_TYPE_OBJECT ->
---| 29 # MONO_TYPE_SZARRAY -> 0-based one-dim-array */
---| 30 # MONO_TYPE_MVAR -> number */
---| 31 # MONO_TYPE_CMOD_REQD -> arg: typedef or typeref token */
---| 32 # MONO_TYPE_CMOD_OPT -> optional arg: typedef or typref token */
---| 33 # MONO_TYPE_INTERNAL -> CLR internal type */
---| 64 # MONO_TYPE_MODIFIER -> Or with the following types */
---| 65 # MONO_TYPE_SENTINEL -> Sentinel for varargs method signature */
---| 69 # MONO_TYPE_PINNED -> Local var that points to pinned object */
---| 85 # MONO_TYPE_ENUM -> An enumeration */



---@alias MonoFieldAttribute integer
---| 7 # FIELD_ATTRIBUTE_FIELD_ACCESS_MASK ->
---| 0 # FIELD_ATTRIBUTE_COMPILER_CONTROLLED ->
---| 1 # FIELD_ATTRIBUTE_PRIVATE ->
---| 2 # FIELD_ATTRIBUTE_FAM_AND_ASSEM ->
---| 3 # FIELD_ATTRIBUTE_ASSEMBLY ->
---| 4 # FIELD_ATTRIBUTE_FAMILY ->
---| 5 # FIELD_ATTRIBUTE_FAM_OR_ASSEM ->
---| 6 # FIELD_ATTRIBUTE_PUBLIC ->
---| 16 # FIELD_ATTRIBUTE_STATIC ->
---| 32 # FIELD_ATTRIBUTE_INIT_ONLY ->
---| 64 # FIELD_ATTRIBUTE_LITERAL ->
---| 128 # FIELD_ATTRIBUTE_NOT_SERIALIZED ->
---| 512 # FIELD_ATTRIBUTE_SPECIAL_NAME ->
---| 8192 # FIELD_ATTRIBUTE_PINVOKE_IMPL ->
---| 38144 # FIELD_ATTRIBUTE_RESERVED_MASK ->
---| 1024 # FIELD_ATTRIBUTE_RT_SPECIAL_NAME ->
---| 4096 # FIELD_ATTRIBUTE_HAS_FIELD_MARSHAL ->
---| 32768 # FIELD_ATTRIBUTE_HAS_DEFAULT ->
---| 256 # FIELD_ATTRIBUTE_HAS_FIELD_RVA ->



---@alias MonoTypeNameFormat integer
---| 0 # MONO_TYPE_NAME_FORMAT_IL ->
---| 1 # MONO_TYPE_NAME_FORMAT_REFLECTION ->
---| 2 # MONO_TYPE_NAME_FORMAT_FULL_NAME ->
---| 3 # MONO_TYPE_NAME_FORMAT_ASSEMBLY_QUALIFIED ->



---@alias MonoTypesClassStrings string
---| '"void"' #
---| '"boolean"' #
---| '"char"' #
---| '"unsigned char"' #
---| '"short"' #
---| '"unsigned short"' #
---| '"int"' #
---| '"unsigned int"' #
---| '"int64"' #
---| '"unsigned int 64"' #
---| '"single"' #
---| '"double"' #
---| '"String"' #
---| '"Pointer"' # raw pointer
---| '"Object"' #
---| '"Function"' # 
---| '"<Generic>"' #
---| '"Array[]"' #
---| '"String[]"' #

---------------------- Classes ----------------------

---@class MonoClass
---@field class Address # The address of the class
---@field classname string # The name of the class
---@field namespace string # The namespace the class is in


---@class MonoClassField
---@field field Address # The address of the field
---@field type VariableType # CE type autoguessed for field
---@field monotype MonoType # The associated mono type for field
---@field parent Address # The address of the object
---@field offset integer # Offset from object start
---@field flags integer # 
---@field isStatic boolean # whether the field is static
---@field isConst boolean # wheter the field is a constant
---@field name string # The name of the field
---@field typename string # The name of the type of the field

---@class MonoClassMethod
---@field method Address # The method's address
---@field name string # The name of the method

---@class MonoClassJitInfo
---@field jitinfo Address #
---@field method Address #
---@field code_start Address #
---@field code_size dword #

---@class MonoParameterInfo
---@field name string
---@field type MonoType

---@class MonoMethodParametersInfo
---@field parameters MonoParameterInfo[]
---@field returntype MonoType

---------------------- Enums & Defines ----------------------


---Change to 0 to never timeout (meaning: 0 will freeze your face off if it breaks on a breakpoint, just saying ...)
---@type integer
CE_defines.mono_timeout = 3000



---@enum MonoCommands
CE_defines.mono_commands = {
  MONOCMD_INITMONO                        = 0,
  MONOCMD_OBJECT_GETCLASS                 = 1,
  MONOCMD_ENUMDOMAINS                     = 2,
  MONOCMD_SETCURRENTDOMAIN                = 3,
  MONOCMD_ENUMASSEMBLIES                  = 4,
  MONOCMD_GETIMAGEFROMASSEMBLY            = 5,
  MONOCMD_GETIMAGENAME                    = 6,
  MONOCMD_ENUMCLASSESINIMAGE              = 7,
  MONOCMD_ENUMFIELDSINCLASS               = 8,
  MONOCMD_ENUMMETHODSINCLASS              = 9,
  MONOCMD_COMPILEMETHOD                   = 10,
  MONOCMD_GETMETHODHEADER                 = 11,
  MONOCMD_GETMETHODHEADER_CODE            = 12,
  MONOCMD_LOOKUPRVA                       = 13,
  MONOCMD_GETJITINFO                      = 14,
  MONOCMD_FINDCLASS                       = 15,
  MONOCMD_FINDMETHOD                      = 16,
  MONOCMD_GETMETHODNAME                   = 17,
  MONOCMD_GETMETHODCLASS                  = 18,
  MONOCMD_GETCLASSNAME                    = 19,
  MONOCMD_GETCLASSNAMESPACE               = 20,
  MONOCMD_FREEMETHOD                      = 21,
  MONOCMD_TERMINATE                       = 22,
  MONOCMD_DISASSEMBLE                     = 23,
  MONOCMD_GETMETHODSIGNATURE              = 24,
  MONOCMD_GETPARENTCLASS                  = 25,
  MONOCMD_GETSTATICFIELDADDRESSFROMCLASS  = 26,
  MONOCMD_GETTYPECLASS                    = 27,
  MONOCMD_GETARRAYELEMENTCLASS            = 28,
  MONOCMD_FINDMETHODBYDESC                = 29,
  MONOCMD_INVOKEMETHOD                    = 30,
  MONOCMD_LOADASSEMBLY                    = 31,
  MONOCMD_GETFULLTYPENAME                 = 32,
  MONOCMD_OBJECT_NEW                      = 33,
  MONOCMD_OBJECT_INIT                     = 34,
  MONOCMD_GETVTABLEFROMCLASS              = 35,
  MONOCMD_GETMETHODPARAMETERS             = 36,
  MONOCMD_ISCLASSGENERIC                  = 37,
  MONOCMD_ISIL2CPP                        = 38,
  MONOCMD_FILLOPTIONALFUNCTIONLIST        = 39,
  MONOCMD_GETSTATICFIELDVALUE             = 40, --fallback for il2cpp which doesn't expose what's needed
  MONOCMD_SETSTATICFIELDVALUE             = 41,
  MONOCMD_GETCLASSIMAGE                   = 42,
  MONOCMD_FREE                            = 43,
  MONOCMD_GETIMAGEFILENAME                = 44,
  MONOCMD_GETCLASSNESTINGTYPE             = 45,
}

---@enum MonoFieldAttributes
CE_defines.mono_field_attributes = {
  FIELD_ATTRIBUTE_FIELD_ACCESS_MASK   = 0x0007,
  FIELD_ATTRIBUTE_COMPILER_CONTROLLED = 0x0000,
  FIELD_ATTRIBUTE_PRIVATE             = 0x0001,
  FIELD_ATTRIBUTE_FAM_AND_ASSEM       = 0x0002,
  FIELD_ATTRIBUTE_ASSEMBLY            = 0x0003,
  FIELD_ATTRIBUTE_FAMILY              = 0x0004,
  FIELD_ATTRIBUTE_FAM_OR_ASSEM        = 0x0005,
  FIELD_ATTRIBUTE_PUBLIC              = 0x0006,
  FIELD_ATTRIBUTE_STATIC              = 0x0010,
  FIELD_ATTRIBUTE_INIT_ONLY           = 0x0020,
  FIELD_ATTRIBUTE_LITERAL             = 0x0040,
  FIELD_ATTRIBUTE_NOT_SERIALIZED      = 0x0080,
  FIELD_ATTRIBUTE_SPECIAL_NAME        = 0x0200,
  FIELD_ATTRIBUTE_PINVOKE_IMPL        = 0x2000,
  FIELD_ATTRIBUTE_RESERVED_MASK       = 0x9500,
  FIELD_ATTRIBUTE_RT_SPECIAL_NAME     = 0x0400,
  FIELD_ATTRIBUTE_HAS_FIELD_MARSHAL   = 0x1000,
  FIELD_ATTRIBUTE_HAS_DEFAULT         = 0x8000,
  FIELD_ATTRIBUTE_HAS_FIELD_RVA       = 0x0100,
}



---@enum MonoTypeNameFormats
CE_defines.mono_type_name_formats = {
  MONO_TYPE_NAME_FORMAT_IL                  = 0,
  MONO_TYPE_NAME_FORMAT_REFLECTION          = 1,
  MONO_TYPE_NAME_FORMAT_FULL_NAME           = 2,
  MONO_TYPE_NAME_FORMAT_ASSEMBLY_QUALIFIED  = 3,
}



---@enum MonoTypes
CE_defines.mono_types = {
  MONO_TYPE_END        = 0x00,  -- End of List
  MONO_TYPE_VOID       = 0x01,
  MONO_TYPE_BOOLEAN    = 0x02,
  MONO_TYPE_CHAR       = 0x03,
  MONO_TYPE_I1         = 0x04,
  MONO_TYPE_U1         = 0x05,
  MONO_TYPE_I2         = 0x06,
  MONO_TYPE_U2         = 0x07,
  MONO_TYPE_I4         = 0x08,
  MONO_TYPE_U4         = 0x09,
  MONO_TYPE_I8         = 0x0a,
  MONO_TYPE_U8         = 0x0b,
  MONO_TYPE_R4         = 0x0c,
  MONO_TYPE_R8         = 0x0d,
  MONO_TYPE_STRING     = 0x0e,
  MONO_TYPE_PTR        = 0x0f,  -- arg: <type> token
  MONO_TYPE_BYREF      = 0x10,  -- arg: <type> token
  MONO_TYPE_VALUETYPE  = 0x11,  -- arg: <type> token
  MONO_TYPE_CLASS      = 0x12,  -- arg: <type> token
  MONO_TYPE_VAR        = 0x13,  -- number
  MONO_TYPE_ARRAY      = 0x14,  -- type, rank, boundsCount, bound1, loCount, lo1
  MONO_TYPE_GENERICINST= 0x15,  -- <type> <type-arg-count> <type-1> \x{2026} <type-n> */
  MONO_TYPE_TYPEDBYREF = 0x16,
  MONO_TYPE_I          = 0x18,
  MONO_TYPE_U          = 0x19,
  MONO_TYPE_FNPTR      = 0x1b,  -- arg: full method signature */
  MONO_TYPE_OBJECT     = 0x1c,
  MONO_TYPE_SZARRAY    = 0x1d,  -- 0-based one-dim-array */
  MONO_TYPE_MVAR       = 0x1e,  -- number */
  MONO_TYPE_CMOD_REQD  = 0x1f,  -- arg: typedef or typeref token */
  MONO_TYPE_CMOD_OPT   = 0x20,  -- optional arg: typedef or typref token */
  MONO_TYPE_INTERNAL   = 0x21,  -- CLR internal type */
  MONO_TYPE_MODIFIER   = 0x40,  -- Or with the following types */
  MONO_TYPE_SENTINEL   = 0x41,  -- Sentinel for varargs method signature */
  MONO_TYPE_PINNED     = 0x45,  -- Local var that points to pinned object */
  MONO_TYPE_ENUM       = 0x55,  -- An enumeration */
}




---@type table<integer, integer> #
CE_defines.mono_type_to_var_type_lookups = {}

CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_BOOLEAN]      = CE_defines.variable_types.vtByte
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_CHAR]         = CE_defines.variable_types.vtString
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I1]           = CE_defines.variable_types.vtByte
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U1]           = CE_defines.variable_types.vtByte
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I2]           = CE_defines.variable_types.vtWord
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U2]           = CE_defines.variable_types.vtWord
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I4]           = CE_defines.variable_types.vtDword
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U4]           = CE_defines.variable_types.vtDword
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I8]           = CE_defines.variable_types.vtQword
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U8]           = CE_defines.variable_types.vtQword
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_R4]           = CE_defines.variable_types.vtSingle
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_R8]           = CE_defines.variable_types.vtDouble
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_STRING]       = CE_defines.variable_types.vtPointer --pointer to a string object
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_PTR]          = CE_defines.variable_types.vtPointer
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_BYREF]        = CE_defines.variable_types.vtPointer
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_CLASS]        = CE_defines.variable_types.vtPointer
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_FNPTR]        = CE_defines.variable_types.vtPointer
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_GENERICINST]  = CE_defines.variable_types.vtPointer
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_ARRAY]        = CE_defines.variable_types.vtPointer
CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_SZARRAY]      = CE_defines.variable_types.vtPointer


---@type table<integer, string> #
CE_defines.mono_type_to_CString_lookup={}

CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_END]          = 'void'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_BOOLEAN]      = 'boolean'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_CHAR]         = 'char'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I1]           = 'char'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U1]           = 'unsigned char'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I2]           = 'short'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U2]           = 'unsigned short'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I4]           = 'int'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U4]           = 'unsigned int'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I8]           = 'int64'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U8]           = 'unsigned int 64'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_R4]           = 'single'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_R8]           = 'double'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_STRING]       = 'String'  --pointer to a string object
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_PTR]          = 'Pointer'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_BYREF]        = 'Object'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_CLASS]        = 'Object'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_FNPTR]        = 'Function'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_GENERICINST]  = '<Generic>'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_ARRAY]        = 'Array[]'
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_SZARRAY]      = 'String[]'


---------------------- Globals ----------------------

---@type LuaPipe
monopipe = {
  Connected = true,
  lock = function () end,
  unlock = function () end,
  writeByte = function (_) return nil end,
  writeBytes = function (_, _) return nil end,
  writeWord = function (_) return nil end,
  writeDword = function (_) return nil end,
  writeQword = function (_) return nil end,
  writeFloat = function (_) return nil end,
  writeDouble = function (_) return nil end,
  writeString = function (_, _) return nil end,
  writeWideString = function (_, _) return nil end,
  readByte = function() return nil end,
  readBytes = function(_) return nil end,
  readWord = function() return nil end,
  readDword = function() return nil end,
  readQword = function() return nil end,
  readFloat = function() return nil end,
  readDouble = function() return nil end,
  readString = function(_) return nil end,
  readWideString = function(_) return nil end
}

---@type integer
mono_AttachedProcess = 0


---Change to 0 to never timeout (meaning: 0 will freeze your face off if it breaks on a breakpoint, just saying ...)
---@type integer
mono_timeout = CE_defines.mono_timeout


---@type integer
MONOCMD_INITMONO                        = CE_defines.mono_commands.MONOCMD_INITMONO
---@type integer
MONOCMD_OBJECT_GETCLASS                 = CE_defines.mono_commands.MONOCMD_OBJECT_GETCLASS
---@type integer
MONOCMD_ENUMDOMAINS                     = CE_defines.mono_commands.MONOCMD_ENUMDOMAINS
---@type integer
MONOCMD_SETCURRENTDOMAIN                = CE_defines.mono_commands.MONOCMD_SETCURRENTDOMAIN
---@type integer
MONOCMD_ENUMASSEMBLIES                  = CE_defines.mono_commands.MONOCMD_ENUMASSEMBLIES
---@type integer
MONOCMD_GETIMAGEFROMASSEMBLY            = CE_defines.mono_commands.MONOCMD_GETIMAGEFROMASSEMBLY
---@type integer
MONOCMD_GETIMAGENAME                    = CE_defines.mono_commands.MONOCMD_GETIMAGENAME
---@type integer
MONOCMD_ENUMCLASSESINIMAGE              = CE_defines.mono_commands.MONOCMD_ENUMCLASSESINIMAGE
---@type integer
MONOCMD_ENUMFIELDSINCLASS               = CE_defines.mono_commands.MONOCMD_ENUMFIELDSINCLASS
---@type integer
MONOCMD_ENUMMETHODSINCLASS              = CE_defines.mono_commands.MONOCMD_ENUMMETHODSINCLASS
---@type integer
MONOCMD_COMPILEMETHOD                   = CE_defines.mono_commands.MONOCMD_COMPILEMETHOD
---@type integer
MONOCMD_GETMETHODHEADER                 = CE_defines.mono_commands.MONOCMD_GETMETHODHEADER
---@type integer
MONOCMD_GETMETHODHEADER_CODE            = CE_defines.mono_commands.MONOCMD_GETMETHODHEADER_CODE
---@type integer
MONOCMD_LOOKUPRVA                       = CE_defines.mono_commands.MONOCMD_LOOKUPRVA
---@type integer
MONOCMD_GETJITINFO                      = CE_defines.mono_commands.MONOCMD_GETJITINFO
---@type integer
MONOCMD_FINDCLASS                       = CE_defines.mono_commands.MONOCMD_FINDCLASS
---@type integer
MONOCMD_FINDMETHOD                      = CE_defines.mono_commands.MONOCMD_FINDMETHOD
---@type integer
MONOCMD_GETMETHODNAME                   = CE_defines.mono_commands.MONOCMD_GETMETHODNAME
---@type integer
MONOCMD_GETMETHODCLASS                  = CE_defines.mono_commands.MONOCMD_GETMETHODCLASS
---@type integer
MONOCMD_GETCLASSNAME                    = CE_defines.mono_commands.MONOCMD_GETCLASSNAME
---@type integer
MONOCMD_GETCLASSNAMESPACE               = CE_defines.mono_commands.MONOCMD_GETCLASSNAMESPACE
---@type integer
MONOCMD_FREEMETHOD                      = CE_defines.mono_commands.MONOCMD_FREEMETHOD
---@type integer
MONOCMD_TERMINATE                       = CE_defines.mono_commands.MONOCMD_TERMINATE
---@type integer
MONOCMD_DISASSEMBLE                     = CE_defines.mono_commands.MONOCMD_DISASSEMBLE
---@type integer
MONOCMD_GETMETHODSIGNATURE              = CE_defines.mono_commands.MONOCMD_GETMETHODSIGNATURE
---@type integer
MONOCMD_GETPARENTCLASS                  = CE_defines.mono_commands.MONOCMD_GETPARENTCLASS
---@type integer
MONOCMD_GETSTATICFIELDADDRESSFROMCLASS  = CE_defines.mono_commands.MONOCMD_GETSTATICFIELDADDRESSFROMCLASS
---@type integer
MONOCMD_GETTYPECLASS                    = CE_defines.mono_commands.MONOCMD_GETTYPECLASS
---@type integer
MONOCMD_GETARRAYELEMENTCLASS            = CE_defines.mono_commands.MONOCMD_GETARRAYELEMENTCLASS
---@type integer
MONOCMD_FINDMETHODBYDESC                = CE_defines.mono_commands.MONOCMD_FINDMETHODBYDESC
---@type integer
MONOCMD_INVOKEMETHOD                    = CE_defines.mono_commands.MONOCMD_INVOKEMETHOD
---@type integer
MONOCMD_LOADASSEMBLY                    = CE_defines.mono_commands.MONOCMD_LOADASSEMBLY
---@type integer
MONOCMD_GETFULLTYPENAME                 = CE_defines.mono_commands.MONOCMD_GETFULLTYPENAME

---@type integer
MONOCMD_OBJECT_NEW                      = CE_defines.mono_commands.MONOCMD_OBJECT_NEW
---@type integer
MONOCMD_OBJECT_INIT                     = CE_defines.mono_commands.MONOCMD_OBJECT_INIT
---@type integer
MONOCMD_GETVTABLEFROMCLASS              = CE_defines.mono_commands.MONOCMD_GETVTABLEFROMCLASS
---@type integer
MONOCMD_GETMETHODPARAMETERS             = CE_defines.mono_commands.MONOCMD_GETMETHODPARAMETERS
---@type integer
MONOCMD_ISCLASSGENERIC                  = CE_defines.mono_commands.MONOCMD_ISCLASSGENERIC
---@type integer
MONOCMD_ISIL2CPP                        = CE_defines.mono_commands.MONOCMD_ISIL2CPP

---@type integer
MONOCMD_FILLOPTIONALFUNCTIONLIST        = CE_defines.mono_commands.MONOCMD_FILLOPTIONALFUNCTIONLIST
---@type integer
MONOCMD_GETSTATICFIELDVALUE             = CE_defines.mono_commands.MONOCMD_GETSTATICFIELDVALUE --fallback for il2cpp which doesn't expose what's needed
---@type integer
MONOCMD_SETSTATICFIELDVALUE             = CE_defines.mono_commands.MONOCMD_SETSTATICFIELDVALUE
---@type integer
MONOCMD_GETCLASSIMAGE                   = CE_defines.mono_commands.MONOCMD_GETCLASSIMAGE
---@type integer
MONOCMD_FREE                            = CE_defines.mono_commands.MONOCMD_FREE
---@type integer
MONOCMD_GETIMAGEFILENAME                = CE_defines.mono_commands.MONOCMD_GETIMAGEFILENAME
---@type integer
MONOCMD_GETCLASSNESTINGTYPE             = CE_defines.mono_commands.MONOCMD_GETCLASSNESTINGTYPE



---@type integer
MONO_TYPE_END        = CE_defines.mono_types.MONO_TYPE_END  -- End of List
---@type integer
MONO_TYPE_VOID       = CE_defines.mono_types.MONO_TYPE_VOID
---@type integer
MONO_TYPE_BOOLEAN    = CE_defines.mono_types.MONO_TYPE_BOOLEAN
---@type integer
MONO_TYPE_CHAR       = CE_defines.mono_types.MONO_TYPE_CHAR
---@type integer
MONO_TYPE_I1         = CE_defines.mono_types.MONO_TYPE_I1
---@type integer
MONO_TYPE_U1         = CE_defines.mono_types.MONO_TYPE_U1
---@type integer
MONO_TYPE_I2         = CE_defines.mono_types.MONO_TYPE_I2
---@type integer
MONO_TYPE_U2         = CE_defines.mono_types.MONO_TYPE_U2
---@type integer
MONO_TYPE_I4         = CE_defines.mono_types.MONO_TYPE_I4
---@type integer
MONO_TYPE_U4         = CE_defines.mono_types.MONO_TYPE_U4
---@type integer
MONO_TYPE_I8         = CE_defines.mono_types.MONO_TYPE_I8
---@type integer
MONO_TYPE_U8         = CE_defines.mono_types.MONO_TYPE_U8
---@type integer
MONO_TYPE_R4         = CE_defines.mono_types.MONO_TYPE_R4
---@type integer
MONO_TYPE_R8         = CE_defines.mono_types.MONO_TYPE_R8
---@type integer
MONO_TYPE_STRING     = CE_defines.mono_types.MONO_TYPE_STRING
---@type integer
MONO_TYPE_PTR        = CE_defines.mono_types.MONO_TYPE_PTR  -- arg: <type> token
---@type integer
MONO_TYPE_BYREF      = CE_defines.mono_types.MONO_TYPE_BYREF  -- arg: <type> token
---@type integer
MONO_TYPE_VALUETYPE  = CE_defines.mono_types.MONO_TYPE_VALUETYPE  -- arg: <type> token
---@type integer
MONO_TYPE_CLASS      = CE_defines.mono_types.MONO_TYPE_CLASS  -- arg: <type> token
---@type integer
MONO_TYPE_VAR        = CE_defines.mono_types.MONO_TYPE_VAR  -- number
---@type integer
MONO_TYPE_ARRAY      = CE_defines.mono_types.MONO_TYPE_ARRAY  -- type, rank, boundsCount, bound1, loCount, lo1
---@type integer
MONO_TYPE_GENERICINST= CE_defines.mono_types.MONO_TYPE_GENERICINST  -- <type> <type-arg-count> <type-1> \x{2026} <type-n> */
---@type integer
MONO_TYPE_TYPEDBYREF = CE_defines.mono_types.MONO_TYPE_TYPEDBYREF
---@type integer
MONO_TYPE_I          = CE_defines.mono_types.MONO_TYPE_I
---@type integer
MONO_TYPE_U          = CE_defines.mono_types.MONO_TYPE_U
---@type integer
MONO_TYPE_FNPTR      = CE_defines.mono_types.MONO_TYPE_FNPTR  -- arg: full method signature */
---@type integer
MONO_TYPE_OBJECT     = CE_defines.mono_types.MONO_TYPE_OBJECT
---@type integer
MONO_TYPE_SZARRAY    = CE_defines.mono_types.MONO_TYPE_SZARRAY  -- 0-based one-dim-array */
---@type integer
MONO_TYPE_MVAR       = CE_defines.mono_types.MONO_TYPE_MVAR  -- number */
---@type integer
MONO_TYPE_CMOD_REQD  = CE_defines.mono_types.MONO_TYPE_CMOD_REQD  -- arg: typedef or typeref token */
---@type integer
MONO_TYPE_CMOD_OPT   = CE_defines.mono_types.MONO_TYPE_CMOD_OPT  -- optional arg: typedef or typref token */
---@type integer
MONO_TYPE_INTERNAL   = CE_defines.mono_types.MONO_TYPE_INTERNAL  -- CLR internal type */

---@type integer
MONO_TYPE_MODIFIER   = CE_defines.mono_types.MONO_TYPE_MODIFIER  -- Or with the following types */
---@type integer
MONO_TYPE_SENTINEL   = CE_defines.mono_types.MONO_TYPE_SENTINEL  -- Sentinel for varargs method signature */
---@type integer
MONO_TYPE_PINNED     = CE_defines.mono_types.MONO_TYPE_PINNED  -- Local var that points to pinned object */

---@type integer
MONO_TYPE_ENUM       = CE_defines.mono_types.MONO_TYPE_ENUM  -- An enumeration */



---@type integer
MONO_TYPE_NAME_FORMAT_IL                  = CE_defines.mono_type_name_formats.MONO_TYPE_NAME_FORMAT_IL
---@type integer
MONO_TYPE_NAME_FORMAT_REFLECTION          = CE_defines.mono_type_name_formats.MONO_TYPE_NAME_FORMAT_REFLECTION
---@type integer
MONO_TYPE_NAME_FORMAT_FULL_NAME           = CE_defines.mono_type_name_formats.MONO_TYPE_NAME_FORMAT_FULL_NAME
---@type integer
MONO_TYPE_NAME_FORMAT_ASSEMBLY_QUALIFIED  = CE_defines.mono_type_name_formats.MONO_TYPE_NAME_FORMAT_ASSEMBLY_QUALIFIED


---@type integer
FIELD_ATTRIBUTE_FIELD_ACCESS_MASK   = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_FIELD_ACCESS_MASK
---@type integer
FIELD_ATTRIBUTE_COMPILER_CONTROLLED = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_COMPILER_CONTROLLED
---@type integer
FIELD_ATTRIBUTE_PRIVATE             = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_PRIVATE
---@type integer
FIELD_ATTRIBUTE_FAM_AND_ASSEM       = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_FAM_AND_ASSEM
---@type integer
FIELD_ATTRIBUTE_ASSEMBLY            = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_ASSEMBLY
---@type integer
FIELD_ATTRIBUTE_FAMILY              = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_FAMILY
---@type integer
FIELD_ATTRIBUTE_FAM_OR_ASSEM        = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_FAM_OR_ASSEM
---@type integer
FIELD_ATTRIBUTE_PUBLIC              = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_PUBLIC
---@type integer
FIELD_ATTRIBUTE_STATIC              = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_STATIC
---@type integer
FIELD_ATTRIBUTE_INIT_ONLY           = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_INIT_ONLY
---@type integer
FIELD_ATTRIBUTE_LITERAL             = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_LITERAL
---@type integer
FIELD_ATTRIBUTE_NOT_SERIALIZED      = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_NOT_SERIALIZED
---@type integer
FIELD_ATTRIBUTE_SPECIAL_NAME        = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_SPECIAL_NAME
---@type integer
FIELD_ATTRIBUTE_PINVOKE_IMPL        = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_PINVOKE_IMPL
---@type integer
FIELD_ATTRIBUTE_RESERVED_MASK       = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_RESERVED_MASK
---@type integer
FIELD_ATTRIBUTE_RT_SPECIAL_NAME     = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_RT_SPECIAL_NAME
---@type integer
FIELD_ATTRIBUTE_HAS_FIELD_MARSHAL   = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_HAS_FIELD_MARSHAL
---@type integer
FIELD_ATTRIBUTE_HAS_DEFAULT         = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_HAS_DEFAULT
---@type integer
FIELD_ATTRIBUTE_HAS_FIELD_RVA       = CE_defines.mono_field_attributes.FIELD_ATTRIBUTE_HAS_FIELD_RVA



---@type table<integer, integer> #
monoTypeToVartypeLookup={}

monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_BOOLEAN]      = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_BOOLEAN]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_CHAR]         = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_CHAR]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_I1]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I1]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_U1]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U1]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_I2]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I2]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_U2]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U2]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_I4]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I4]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_U4]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U4]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_I8]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_I8]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_U8]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_U8]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_R4]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_R4]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_R8]           = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_R8]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_STRING]       = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_STRING]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_PTR]          = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_PTR]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_BYREF]        = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_BYREF]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_CLASS]        = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_CLASS]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_FNPTR]        = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_FNPTR]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_GENERICINST]  = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_GENERICINST]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_ARRAY]        = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_ARRAY]
monoTypeToVartypeLookup[CE_defines.mono_types.MONO_TYPE_SZARRAY]      = CE_defines.mono_type_to_var_type_lookups[CE_defines.mono_types.MONO_TYPE_SZARRAY]





---@type table<integer, string> #
monoTypeToCStringLookup={}

CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_END]          = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_END]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_BOOLEAN]      = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_BOOLEAN]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_CHAR]         = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_CHAR]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I1]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I1]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U1]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U1]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I2]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I2]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U2]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U2]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I4]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I4]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U4]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U4]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I8]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_I8]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U8]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_U8]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_R4]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_R4]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_R8]           = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_R8]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_STRING]       = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_STRING]  --pointer to a string object
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_PTR]          = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_PTR]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_BYREF]        = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_BYREF]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_CLASS]        = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_CLASS]
CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_FNPTR]        = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_FNPTR]
monoTypeToCStringLookup[CE_defines.mono_types.MONO_TYPE_GENERICINST]  = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_GENERICINST]
monoTypeToCStringLookup[CE_defines.mono_types.MONO_TYPE_ARRAY]        = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_ARRAY]
monoTypeToCStringLookup[CE_defines.mono_types.MONO_TYPE_SZARRAY]      = CE_defines.mono_type_to_CString_lookup[CE_defines.mono_types.MONO_TYPE_SZARRAY]

