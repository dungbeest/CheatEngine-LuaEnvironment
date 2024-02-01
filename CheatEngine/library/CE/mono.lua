---@meta

---------------------- Functions ----------------------

---Launch Mono.
---@return integer | nil
function LaunchMonoDataCollector() return 0 end



---Convert a mono type to a Cheat Engine addressable variable type.
---@param monoType MonoType
---@return VariableType
function monoTypeToVarType(monoType) return 0 end


---Get the class name and class address from the address of a class instance
---@param address Address # 
---@return Address | nil # The address of the class or nil if a class was not found
---@return string | nil # The name of the class or nil if a class was not found
function mono_object_getClass(address) return 0, "" end

---Enumerate addresses for all domains.
---@return Address[] # An array of all domain addresses
function mono_enumDomains() return { 0 } end


---Enumerate addresses for all assemblies.
---@return Address[] # An array of all assembly base addresses
function mono_enumAssemblies() return { 0 } end


---@param assembly Address # An assembly address
---@return Address # The address of the corresponding Image
function mono_getImageFromAssembly(assembly) return 0 end


---@param image Address # An address of an image
---@return string | nil # The image's name or nil if either the image is invalid or the monopipe is broken.
---@return string | nil # If the image is invalid, will contain an error string, otherwise nil
function mono_image_get_name(image) return "", "" end


---@param image Address # An address of an image
---@return string | nil # The image's file name or nil if the monopipe is broken.
function mono_image_get_filename(image) return "" end


---@param image Address # An address of an image
---@return MonoClass[]
function mono_image_enumClasses(image) return {} end

---@param class Address # The address of a class
---@return boolean # Whether the class is generic
function mono_class_isgeneric(class) return true end


---@param class Address # The address of a class
---@return boolean # Whether the class is an il2cpp
function mono_isil2cpp(class) return true end


---@param class Address # The address of a class
---@return Address # The parent class address if nested. 0 if not nested
function mono_class_getNestingType(class) return 0 end

---@param class Address # The address of a class
---@return string # The name of the class or empty string if some error occurs or the class is invalid
function mono_class_getName(class) return "" end


---@param class Address # The address of a class
---@return string # The namespace of the class or empty string if some error occurs or the class is invalid
function mono_class_getNamespace(class) return "" end

---@param typePtr Address # The address of a type (can be a class)
---@param isClass? byte # Defaults to 1 (true). A byte boolean because pipes only support write byte as smallest write size.
---@param nameFormat? MonoTypeNameFormat # Which format to use for the resulting string
---@return string # The full name of the type/class supplied
function mono_class_getFullName(
  typePtr, isClass, nameFormat
) return "" end

---@param class Address # The address of a class
---@return Address # The parent class address. 0 if class does not have parent
function mono_class_getParent(class) return 0 end


---@param class Address # The address of a class
---@return Address # The address of the Image of the class
function mono_class_getImage(class) return 0 end

---@param monoType Address # The address of a type (can be a class)
---@return Address # Address of class for this type
function mono_type_getClass(monoType) return 0 end


---@param class Address # The address of an array class
---@return Address # The address of the element class of an array
function mono_class_getArrayElementClass(class) return 0 end



---@param domain Address # The address of the class' domain
---@param class Address # The address of a class
---@return Address | nil # The address of the class' VTable or nil if monopipe is broken.
---@return string | nil # An error string if class and domain are nil
function mono_class_getVTable(domain, class) return 0 end


---@param class Address # The address of a class
---@return Address | nil # The address of the class' VTable or nil if monopipe is broken.
---@return string | nil # An error string if class and domain are nil
function mono_class_getVTable(class) return 0 end



---@param domain Address # The address of the class' domain or the address of a class if class parameter is nil
---@param class? Address # The address of a class
---@param progressBar? ProgressBar #
---@return Address[] | nil # Addresses of class instances of supplied class or nil if the scan fails
function mono_class_findInstancesOfClassListOnly(
  domain, class, progressBar
) return {} end



---@param domain Address # The address of the class' domain or the address of a class if class parameter is nil
---@param class? Address # The address of a class
---@param onScanDone fun(memScan: MemScan) # Called when scanning for instances of class, it's passed to a memscan instance
---@param progressBar? ProgressBar #
function mono_class_findInstancesOfClass(
  domain, class, onScanDone, progressBar
) end


---@param domain Address # The address of the class' domain
---@param class Address # The address of a class
---@return Address # Address of static fields of the class
function mono_class_getStaticFieldAddress(domain, class)
  return 0
end

---@param class Address # The address of a class
---@return Address # Address of static fields of the class
function mono_class_getStaticFieldAddress(class)
  return 0
end


---@param class Address # The address of a class
---@param includeParents boolean # Whether to include fields of parent classes class inherits from
---@return MonoClassField[] #
function mono_class_enumFields(class, includeParents)
  return {}
end


---@param class Address # The address of a class
---@param includeParents boolean # Whether to include methods of parent classes class inherits from
---@return MonoClassMethod[] #
function mono_class_enumMethods(class, includeParents)
  return {}
end


---@param address Address # Address for JIT stub ???
---@return MonoClassJitInfo[]
function mono_getJitInfo(address) return {} end


---@param vtable Address # Address of a vtable for a class
---@param field Address # Address of a field
---@return qword # The value of the static field as an integer
function mono_getStaticFieldValue(vtable, field) return 0 end

---@param vtable Address # Address of a vtable for a class
---@param field Address # Address of a field
---@param value qword # The value to set the static field as an integer
function mono_setStaticFieldValue(vtable, field, value) end

---@param class Address # Address for a class
---@param field Address # Address for a field
---@return qword # The value of the static field as an integer
function mono_class_getStaticFieldValue(class, field) return 0 end

---@param class Address # Address of a class
---@param field Address # Address for a field
---@param value qword # The value to set the static field as an integer
function mono_class_setStaticFieldValue(class, field, value) end


---@param address Address # Approximate address of an object instance
---@param maxSize integer | nil # Size to search around address (if nil defaults to 4096)
---@return Address | nil # The address of the object instance or nil if object was not found
---@return Address | nil # The address of the class  or nil if object was not found
---@return string | nil # The class' name or nil if object was not found
function mono_object_findRealStartOfObject(address, maxSize) return 0, 0, '' end


---@param image Address # Address of the image to find class in
---@param namespace Address | nil # Address of namespace to search class in
---@param className string # The name of the class to search for
---@return Address # Address of the class or 0 if not found or monopipe is broken 
function mono_image_findClass(image, namespace, className) return 0 end

---Slower version that manually scans memory for class.
---@param image Address # Address of the image to find class in
---@param namespace Address | nil # Address of namespace to search class in
---@param className string # The name of the class to search for
---@return Address # Address of the class or 0 if not found or monopipe is broken 
function mono_image_findClassSlow(image, namespace, className) return 0 end


---@param namespace Address # The address of the namespace
---@param className string # The name of the class to find
---@return Address # The class' address or 0 if not found
function mono_findClass(namespace, className) return 0 end

---@param className string # The name of the class to find
---@return Address # The class' address or 0 if not found
function mono_findClass(className) return 0 end

---@param class Address # Address of a class
---@param methodName string | nil # Name of method of class to search for
---@return Address | nil # Address of method or 0 if not found. Is nil if method name is nil or monopipe is broken
function mono_class_findMethod(class, methodName) return 0 end


---@param namespace Address # The address of the namespace
---@param className string # The name of the class to find
---@param methodName string # Name of method of class to search for
---@return Address | nil # Address of method or 0 if not found. Is nil if method name is nil or monopipe is broken
function mono_findMethod(namespace, className, methodName) return 0 end

---@param className string # The name of the class to find
---@param methodName string | nil # Name of method of class to search for
---@return Address | nil # Address of method or 0 if not found. Is nil if method name is nil or monopipe is broken
function mono_findMethod(className, methodName) return 0 end


---@param image Address # Address of the image to search
---@param methodDescription string # A description of a method to search
---@return Address # The address of the method found or 0 if not found or parameters are nil
function mono_image_findMethodByDesc(image, methodDescription) return 0 end

---Identical to mono_image_findMethodByDesc for old scripts that use this legacy method that was mislabeled.
---@param image Address # Address of the image to search
---@param methodDescription string # A description of a method to search
---@return Address # The address of the method found or 0 if not found or parameters are nil
function mono_class_findMethodByDesc(image, methodDescription) return 0 end


---@param assemblyName Address # Name of the image/assembly to search for the method
---@param methodDescription string # A description of a method to search
---@return Address | nil # The address of the method found or 0 if not found. Is nil if any of the parameters are nil 
---@return string | nil # An error string when assemblies are nil or one of the parameters is nil
function mono_findMethodByDesc(assemblyName, methodDescription) return 0 end


---@param method Address # The address of a method
---@return string # The name of the method
function mono_method_getName(method) return '' end

---@param method Address # The address of a method
---@return Address # The address of the method's header
function mono_method_getHeader(method) return 0 end


---@param method Address # The address of a method
---@return MonoMethodParametersInfo # A table with the mono method parameter and return info
function mono_method_get_parameters(method) return {} end


---Gets the method 'signature', i.e. the corresponding parameter names, and the return type.
---@param method Address # The address of a method
---@return string result # The method signature as a string
---@return string[] parameternames # An array of parameter types of the method as strings
---@return string returntype # The return type of the method as a string
function mono_method_getSignature(method) return '', {}, '' end


---@param method Address # The address of a method
---@return string # The method disassembled as multiple assembly instructions in a string
function mono_method_disassemble(method) return '' end


---@param method Address # The address of a method
---@return Address # The address of the class this method belongs to
function mono_method_getClass(method) return 0 end


---JIT a method if it wasn't jitted yet.
---@param method Address # The address of a method
---@return Address | nil # The address of the jit compiled method or nil if monopipe is broken
function mono_compile_method(method) return 0 end

