---@meta

---Shows a message box with the given text
---@param text string # Text to show in the message box
function showMessage(text) end

---Shows a dialog where the user can input a string.
---@param caption string # A caption for the dialog box (explanatory/comment text)
---@param prompt string # The prompt for the dialog box to present the user
---@param initialString string # Default string for the input
---@return string | nil # The string supplied by the user, or nil on cancel
function inputQuery(caption, prompt, initialString) return "" end

---Shows a menu with the given list.
---@param title string # Menu title
---@param caption string # A caption for the selection form (explanatory/comment text)
---@param stringList Stringlist # The string list to select from
---@param allowCustomInput? boolean # Whether the user is allowed to enter custom input
---@param formName? string # Name of the form
---@return integer # The linenumber (starting at 0). Linenumber is -1 if the user was allowed to enter custom input
---@return string # The selected string
function showSelectionList(
    title, caption, stringList, allowCustomInput, formName
) return 0, "" end

---Shows an information dialog with the text.
---
---Pops up a message box with a specific icon/sound with the specified buttons (mbok, mbyes, ....).
---@param title string # A custom title for the message box
---@param text string # The text for the information dialog
---@param type MessageDialogType #
---@param ... Button # Buttons to include in message box
---@overload fun(text: string, type: string, ...: Button)
---@overload fun(text: string)
function messageDialog(title, text, type, ...) end


---Outputs a message using the windows OutputDebugString message.
---
---You can use tools like dbgview to read this. Useful for testing situations where the GUI freezes.
---@param text string # Text to output
function outputDebugString(text) end


---Convenience function for printing text to stdout.
---
---Same as print(string.format(...))
---@param ... string | any # Arguments as supplied to string format
function printf(...) end


---Plays the fabulous beep/ping sound!
function beep() end

---Plays the given memory stream containing a .WAV formatted memory object. 
---@param stream MemoryStream # Memory stream containing a .WAV formatted memory object 
---@param waitUntilDone? boolean # If waitUntilDone is true the script will stop executing until the sound has stopped
function playSound(stream, waitUntilDone) end

---Takes the memorystream from the tableFile and plays it.
---
---There are two tablefiles predeclared inside cheat engine "Activate" and "Deactivate" . You are free to use or override them
---@param tableFile string # The table file to use to extract a memory stream from
---@param waitUntilDone? boolean # If waitUntilDone is true the script will stop executing until the sound has stopped
function playSound(tableFile, waitUntilDone) end

---Speaks a given text. 
---@param text string # Text to speak
---@param waitUntilDone? boolean # If waitUntilDone is true the thread it's in will be frozen till it is done
function speak(text, waitUntilDone) end

---Speaks a given text using the given flags. 
---
---https://learn.microsoft.com/en-us/previous-versions/office/developer/speech-technologies/jj127460(v=msdn.10)
---@param text string # Text to speak
---@param flags SpeechFlag # Flags for the speech API
function speak(text, flags) end

---Will try the English voice by wrapping the given text into an XML statement specifying the english voice. 
---
---Will not say anything if no English language is present. 
---
---Do not use SPF_IS_NOT_XML flag and SPF_PARSE_SSML won't work in this situation
---@param text string # Text to speak
---@param waitUntilDone? boolean # If waitUntilDone is true the thread it's in will be frozen till it is done
function speakEnglish(text, waitUntilDone) end
