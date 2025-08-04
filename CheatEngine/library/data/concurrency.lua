---@meta _


---Inherits from Component (Timer->Component->Object)
---@class Timer: Component
---@field Interval integer # The number of milliseconds (1000=1 second) between executions
---@field Enabled boolean #
local Timer = {}


---The function to call when the timer triggers
---@param timer Timer
---@param ... any
---@return ...
function Timer.OnTimer(timer, ...) end

---@return integer
function Timer.getInterval() end

---Sets the speed on how often the timer should trigger. In milliseconds (1000=1 second)
---@param interval integer # Interval to trigger the timer function. In milliseconds.
function Timer.setInterval(interval) end

---@return fun(timer: Timer, ...: any): ...: any
function Timer.getOnTimer() end

---@param OnTimer fun(timer: Timer, ...: any): ...: any
function Timer.setOnTimer(OnTimer) end

---@return boolean
function Timer.getEnabled() end

---@param enabled boolean
function Timer.setEnabled(enabled) end


---Inherits from Object. (Thread->Object)
---@class Thread: Object
---@field Name string # This name will be shown when the thread terminated abnormally
---@field Finished boolean # Returns true if the thread has reached the end.  Do not rely on this if the thread is freeOnTerminate(true) (which is the default)
---@field Terminated boolean # Returns true if the Terminate method has been called
---@field Result string # The result of the thread function as a string
local Thread = {}

---@param state boolean # When set to true the thread object will free itself when the function ends (default=true). Note: Use this only from inside the thread function as the thread might have already terminated and freed itself when called
function Thread.freeOnTerminate(state) end

---@param callback string | fun(thread: Thread, ...: any): ...: any # Called from inside the thread. This wil cause the thread to get the main thread to execute the given function and wait for it to finish. Usually for GUI access. Supply a string to use a function by name. Returns the return value of the given function
function Thread.synchronize(callback) end

---Waits for the given thread to finish (Not recommended to call this from inside the thread itself)
function Thread.waitfor() end

---Suspend the thread's execution
function Thread.suspend() end

---Resume the thread's execution
function Thread.resume() end

---Tells the thread it should terminate. The Terminated property will become true
function Thread.terminate() end

---Inherits from Object (CriticalSection->Object)
---@class CriticalSection: Object
local CriticalSection = {}

function CriticalSection.enter() end

function CriticalSection.leave() end

---@return boolean # true if entered, false if not
function CriticalSection.tryEnter() end

---Inherits from Object (Semaphore->Object)
---@class Semaphore: Object
local Semaphore = {}

function Semaphore.acquire() end

function Semaphore.release() end

---Inherits from Object (MultiReadExclusiveWriteSynchronizer->Object)
---@class MultiReadExclusiveWriteSynchronizer: Object
local MultiReadExclusiveWriteSynchronizer = {}

function MultiReadExclusiveWriteSynchronizer.beginWrite() end
function MultiReadExclusiveWriteSynchronizer.endWrite() end
function MultiReadExclusiveWriteSynchronizer.beginRead() end
function MultiReadExclusiveWriteSynchronizer.endRead() end



---@return CriticalSection # A critical section object
function createCriticalSection() end


---@param count integer # The semaphore limit
---@return Semaphore # A semaphore object
function createSemaphore(count) end


---@return MultiReadExclusiveWriteSynchronizer # A new MultiReadExclusiveWriteSynchronizer
function createMultiReadExclusiveWriteSynchronizer() end


---@param timer Timer # Timer object to operate on
---@param interval integer # Interval in milliseconds to fire timer
function timer_setInterval(timer, interval) end


---@param timer Timer # Timer object to operate on
---@param onTimer fun(timer: Timer, ...: any): ...: any # Callback to run when timer fires
function timer_onTimer(timer, onTimer) end


---@param timer Timer # Timer object to operate on
---@param enabled boolean # Whether to enable the timer to fire
function timer_setEnabled(timer, enabled) end


---@param timer Timer # Timer object to operate on
---@return boolean # Whether the timer is enabled (will fire on interval and run onTimer callback)
function timer_getEnabled(timer) return timer.getEnabled() end


---Creates a timer object that waits the given delay, executes the given function, and then selfdestructs.  
---
---Tip: Don't use the timer after it has ran
---@param delay integer #
---@param onTimer fun(timer: Timer, ...: any): ...: any #
---@return Timer #
function createTimer(delay, onTimer) end

---Creates a timer object. If enabled is not given it will be enabled by default (will start as soon as an onTimer event has been assigned).
---
---Owner may be nil, but you will be responsible for destroying it instead of being the responsibility of the owner object.
---@generic T: Object
---@param owner? T #
---@param enabled? boolean #
---@return Timer #
function createTimer(owner, enabled) end


---@param thread Thread # The thread object to operate on
---@param state boolean # When set to true the thread object will free itself when the function ends (defaults to true). Note: Use this only from inside the thread function as the thread might have already terminated and freed itself when called
function thread_freeOnTerminate(thread, state) end


---@param thread Thread # The thread object to operate on
---@param callback fun(thread: Thread, ...: any) | string # # Called from inside the thread. This will cause the thread to get the main thread to execute the given function and wait for it to finish. Usually for GUI access. Supply a string to use a function by name
---@param ... any # Parameters to pass to callback function
---@return any # The return value of the given function
function thread_synchronize(thread, callback, ...) end


--- Waits for the given thread to finish (Not recommended to call this from inside the thread itself)
---@param thread Thread # The thread object to operate on
function thread_waitfor(thread) end

---Executes the given function in another thread using the systems thread mechanism.
---@param threadFunction fun(thread: Thread, ...: any): ...: any #
---@param ... any # Params to supply the function to run in the new thread
---@return Thread # Thread class object
function createThread(threadFunction, ...) end

---Same as createThread but it won't run until resume is called on it.
---
---Executes the given function in another thread using the systems thread mechanism.
---@param threadFunction fun(thread: Thread, ...: any): ...: any #
---@param ... any # Params to supply the function to run in the new thread
---@return Thread # Thread class object
function createThreadSuspended(threadFunction, ...) end

---Creates a new thread in a new lua state. 
---
---This is more efficient as no locking inside lua takes place, but has no access to userdefined lua functions and only limited base CE functions. 
---
---Called inside a function(t) where t is the thread.  Watch for t.Terminated to quit.  
---
---Notice: Unlike createThread, the created thread does not freeOnTerminate so you can read out the "Result" property which will be set on thread finish.
---@param scriptText string #
---@return Thread # Thread class object
function createThreadNewState(scriptText) end
