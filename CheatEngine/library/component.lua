---@meta


---@class Component: Object
---@field ComponentCount integer # Number of child components (Readonly)
---@field Component Component[] # Array containing the child components. Starts at 0 (Readonly)
---@field ComponentByName table<string, Component> # An array of components based on the name (Readonly)
---@field Name string # The name of the component
---@field Tag integer # Free to use storage space (Useful for id's)
---@field Owner Component | nil # The owner of this object. nil if it has none
---@field getComponentCount fun(): integer # Returns the number of components attached to this component
---@field getComponent fun(index: integer): Component # The specific component
---@field findComponentByName fun(name: string): Component # The component with this name
---@field getName fun(): string # The component's name
---@field setName fun(newName: string) # Changes the component's name
---@field getTag fun(): integer # Get the tag value
---@field setTag fun(tag: integer) # Sets an integer value. You can use this for IDs
---@field getOwner fun(): Component # Returns the owner of this component


---Creates an object of the specified component inherited class 
---@generic T: Component
---@generic R: Object
---@param className string # The name of the class to create an object of
---@param owner R # The owner of the component
---@return T # An object of the specified component inherited class
function createComponentClass(className, owner) return {} end


---@param component Component # The component to operate on
---@return integer # Number of child components
function component_getComponentCount(component) return component.getComponentCount() end


---@param component Component # The component to operate on
---@param index integer # Index of child component
---@return Component # Child component at index supplied
function component_getComponent(component, index) return component.getComponent(index) end


---@param component Component # The component to operate on
---@param name string # Name of child component
---@return Component # Child component with name supplied
function component_findComponentByName(component, name) return component.findComponentByName(name) end


---@param component Component # The component to operate on
---@return string # The name of the component
function component_getName(component) return component.getName() end

---@param component Component # The component to operate on
---@param name string # The name to set to component
function component_setName(component, name) end

---@param component Component # The component to operate on
---@return integer # The component's tag
function component_getTag(component) return component.getTag() end

---@param component Component # The component to operate on
---@param tag integer # Tag to set on component
function component_setTag(component, tag) end

---@param component Component # The component to operate on
---@return Component | nil # The owner component or nil if no owner is set
function component_getOwner(component) return component.getOwner() end
