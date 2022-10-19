---@meta

---Fills a Strings inherited object with the top-window list of the system. 
---
---Format: %x-windowcaption
---@param strings Strings # A strings object to populate with window strings (format: %x-windowcaption)
function getWindowList(strings) end

---@alias WindowListInfo table<integer, string[]>

---Every process might have multiple associated windows.
---
---Every pid matches 0 or more windows, each with their own caption.
---@return WindowListInfo # A table with the windowlist (pid - window caption). The table is formatted as : {pid,{id,caption}} (ex. {6435 = { "Lua Engine", "Memory Viewer"}, ...})
function getWindowList()
    local t = {}
    t[634] = { "Lua Engine", "Memory Viewer" }
    t[4243] = {}
    return t
end

---Finds a window with the given class name and/or window name.
---@param className? string # The class name or window name for the window
---@param caption? string # A caption to supply for the window handle object
---@return integer WindowHandle #
function findWindow(className, caption) return 0 end

---Gets a specific window based on the given window (Check MSDN getWindow for the command description)
---@param windowhandle any #
---@param command any #
---@return integer WindowHandle #
function getWindow(windowhandle, command) return 0 end

---@param windowhandle any #
---@return string # The caption of the window
function getWindowCaption(windowhandle) return "" end

---@param windowhandle any
---@return string # The class name of the window
function getWindowClassName(windowhandle) return "" end

---@param windowhandle any
---@return integer # The process ID of the process this window belongs to
function getWindowProcessID(windowhandle) return 0 end

---@return integer WindowHandle # The window handle of the topmost window
function getForegroundWindow() return 0 end


---Sends a message to a window. Those that wish to use it, should know how to use it (and fill in the msg id's yourself)
---@param hwnd any # ???
---@param msg any # ???
---@param wparam any # ???
---@param lparam any # ???
---@return any # ???
function sendMessage(hwnd, msg, wparam, lparam) return {} end

---Hooks a window's wndproc procedure. 
---
---The given function will receive all functions.
---@param hwnd any # ???
---@param hook fun(hwnd: any, msg: any, wparam: any, lparam: any): integer, ...: any # Return 0 to say you handled it. 1 to let the default windows handler deal with it. Or anything else, to let the original handler deal with it. Besides the return value, you can also return hWnd, Msg, lParam and wParam, modified, or nil for the original value.
---@param ASYNC boolean # Set ASYNC to true if you don't want to run this in the CE GUI. (faster, but you can't touch gui objects)
function hookWndProc(hwnd, hook, ASYNC) end

---Call this when done with a hook. Not calling this will result in the process window behaving badly when you exit Cheat Engine.
---@param hwnd any
function unhookWndProc(hwnd) end
