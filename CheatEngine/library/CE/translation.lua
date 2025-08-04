---@meta _


---@return string # The path of the current translation files. Empty if there is no translation going on
function getTranslationFolder() end

---Loads a .PO file used for translation
---@param path string # Path to the .PO file to load
function loadPOFile(path) end

---@param string string # A string to translate
---@return string # A translation of the string or the same string if it can't be found.
function translate(string) end

---@param translationid string # A reference to search for in translation folder
---@param originalstring? string # The original string referenced
---@return string # A translation string of the string referenced by translationid
function translateID(translationid, originalstring) end
