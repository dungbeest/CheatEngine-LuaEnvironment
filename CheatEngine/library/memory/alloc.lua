---@meta

---Allocates some memory into the target process.
---@param size integer # The size of the allocation
---@param baseAddress? SymbolAddress # A start address from which to allocate memory. The actual allocation address will be after this address
---@param protection? integer # ???
---@return Address # The address where the memory was allocated to
function allocateMemory(
    size, baseAddress, protection
) return 0 end

---Frees allocated memory
---@param address SymbolAddress # The address of the allocation
---@param size? integer # The size of the allocation
function deAlloc(address, size) end

---Creates a shared memory object in the attached process of the given size if it doesn't exist yet. 
---
---It then maps this shared memory block into the currently targeted process. Keep in mind that a process can map the same block multiple times, so keep track of your assignments
---@param name string # A name for the shared memory block
---@param size integer? # If size is not given and there is no shared region with this name then the default size of 4096 is used.
---@return Address # The address of this mapped region in the target process.
function allocateSharedMemory(name, size) return 0 end

---Same as allocateSharedMemory but for the Cheat Engine process itself.
---
---Creates a shared memory object in the attached process of the given size if it doesn't exist yet. 
---
---It then maps this shared memory block into the currently targeted process. Keep in mind that a process can map the same block multiple times, so keep track of your assignments
---@param name string # A name for the shared memory block
---@param size integer? # If size is not given and there is no shared region with this name then the default size of 4096 is used.
---@return Address # The address of this mapped region in the target process.
---@see allocateSharedMemory
function allocateSharedMemoryLocal(name, size) return 0 end

---Creates a 'section' in memory.
---@param size integer
---@return Address #
function createSection(size) return 0 end

---Maps the section to memory.
---@param section Address # ???
---@param preferredBaseAddress? Address # ???
---@return integer # ???
function mapViewOfSection(
    section, preferredBaseAddress
) return 0 end

---Unmaps a section from memory.
---@param baseAddress Address # ???
---@return integer # ???
function unMapViewOfSection(baseAddress) end
