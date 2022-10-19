---@meta

---Undefined property functions. 
---Not all properties of all classes have been explicitly exposed to lua, but if you know the name of a property of a specific class you can still access them (assuming they are declared as published in the pascal class declaration)


---@param class string # The name of the PASCAL class to query for properties
---@return Stringlist # A Stringlist object containing all the published properties of the specified class (free the list when done) (Note, not all classed with properties have 'published' properties. E.g: stringlist)
function getPropertyList(class) return {} end

---Sets the value of a published property of a class (Won't work for method properties)
---@param class string # The name of the PASCAL class to query for properties
---@param propertyName string # The name of the property to set
---@param propertyValue any # The value to set the property to
function setProperty(class, propertyName, propertyValue) end

---Gets the value of a published property of a class (Won't work for method properties)
---@param class string # The name of the PASCAL class to query for properties
---@param propertyName string # The name of the property to get
---@return any # The property's value
function getProperty(class, propertyName) return {} end

---Sets the method property to the specific function
---@param class string # The name of the PASCAL class to query for properties
---@param propertyName string # The name of the property to set
---@param method function # The function to set the method property to
function setMethodProperty(class, propertyName, method) end

---@param class string # The name of the PASCAL class to query for properties
---@param propertyName string # The name of the property to get
---@return function # A function you can use to call the original function
function getMethodProperty(class, propertyName) return function() end end
