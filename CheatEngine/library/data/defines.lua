---@meta


----------------------------------- Aliases -----------------------------------

---@alias Locations2D integer[][]


---The place of the window.
---@alias WindowPositionString string
---| '"Top"' #
---| '"Right"' #
---| '"Bottom"' #
---| '"Left"' #


---@alias WindowPosition integer
---| 0 # Top
---| 1 # Right
---| 2 # Bottom
---| 3 # Left


---@alias CheckBoxStateString string #
---| '"cbUnchecked"' # Check box is unchecked
---| '"cbChecked"' # Check box is checked
---| '"cbGrayed"' # Check box is grayed-out


---@alias CheckBoxState integer #
---| 0 # cbUnchecked -> Check box is unchecked
---| 1 # cbChecked -> Check box is checked
---| 2 # cbGrayed -> Check box is grayed-out


---@alias MouseEventButton integer
---| 0 # mbLeft ->
---| 1 # mbRight ->
---| 2 # mbMiddle ->
---| 3 # mbExtra1 ->
---| 4 # mbExtra2 ->

---@alias ScrollStyle integer
---| 0 # ssNone -> No scrollbars
---| 1 # ssHorizontal -> Has a horizontal scrollbar
---| 2 # ssVertical -> Has a vertical scrollbar
---| 3 # ssBoth -> Has both scrollbars
---| 4 # ssAutoHorizontal -> Has a horizontal scrollbar but only shows when there actually is something to scroll for
---| 5 # ssAutoVertical -> Has a vertical scrollbar but only shows when there actually is something to scroll for
---| 6 # ssAutoBoth -> Has both scrollbars but only shows when there actually is something to scroll for


---@alias ScrollStyleString string
---| '"ssNone"' # No scrollbars
---| '"ssHorizontal"' # Has a horizontal scrollbar
---| '"ssVertical"' # Has a vertical scrollbar
---| '"ssBoth"' # Has both scrollbars
---| '"ssAutoHorizontal"' # Has a horizontal scrollbar but only shows when there actually is something to scroll for
---| '"ssAutoVertical"' # Has a vertical scrollbar but only shows when there actually is something to scroll for
---| '"ssAutoBoth"' # Has both scrollbars but only shows when there actually is something to scroll for


---@alias MemFastScanMethod integer
---| 0 # fsmNotAligned -> No alignment check
---| 1 # fsmAligned -> The address must be dividable by the value in alignmentparam
---| 2 # fsmLastDigits -> The last digits of the address must end with the digits provided by alignmentparam

---@alias MemFastScanMethodString string
---| '"fsmNotAligned"' # No alignment check
---| '"fsmAligned"' # The address must be dividable by the value in alignmentparam
---| '"fsmLastDigits"' # The last digits of the address must end with the digits provided by alignmentparam


---@alias MemScanRoundingType integer
---| 0 # rtRounded -> Normal rounded scans. If exact value = "3" then it includes 3.0 to 3.49999999. If exact value is "3.0" it includes 3.00 to 3.0499999999
---| 1 # rtExtremerounded -> Rounded Extreme. If exact value = "3" then it includes 2.0000001 to 3.99999999. If exact value is "3.0" it includes 2.900000001 to 3.099999999
---| 2 # rtTruncated -> Truncated algorithm. If exact value = "3" then it includes 3.0 to 3.99999999. If exact value is "3.0" it includes 3.00 to 3.099999999

---@alias MemScanRoundingTypeString string
---| '"rtRounded"' # Normal rounded scans. If exact value = "3" then it includes 3.0 to 3.49999999. If exact value is "3.0" it includes 3.00 to 3.0499999999
---| '"rtExtremerounded"' # Rounded Extreme. If exact value = "3" then it includes 2.0000001 to 3.99999999. If exact value is "3.0" it includes 2.900000001 to 3.099999999
---| '"rtTruncated"' # Truncated algorithm. If exact value = "3" then it includes 3.0 to 3.99999999. If exact value is "3.0" it includes 3.00 to 3.099999999


---@alias MemScanOption integer
---| 0 # soUnknownValue -> Search for unknown value
---| 1 # soExactValue -> Search for exact value
---| 2 # soValueBetween -> Search for value in [lower bound, upper bound]
---| 3 # soBiggerThan -> Search for value bigger than lower bound
---| 4 # soSmallerThan -> Search for value smaller than upper bound
---| 5 # soIncreasedValue -> Search for increased value in relation to previous scan
---| 6 # soIncreasedValueBy -> Search for increased value in relation to previous scan by a specific amount
---| 7 # soDecreasedValue -> Search for decreased value in relation to previous scan
---| 8 # soDecreasedValueBy -> Search for decreased value in relation to previous scan by a specific amount
---| 9 # soChanged -> Search for changed value in relation to previous scan
---| 10 # soUnchanged -> Search for unchanged value in relation to previous scan

---@alias MemScanOptionString string
---| '"soUnknownValue"' # Search for unknown value
---| '"soExactValue"' # Search for exact value
---| '"soValueBetween"' # Search for value in [lower bound, upper bound]
---| '"soBiggerThan"' # Search for value bigger than lower bound
---| '"soSmallerThan"' # Search for value smaller than upper bound
---| '"soIncreasedValue"' # Search for increased value in relation to previous scan
---| '"soIncreasedValueBy"' # Search for increased value in relation to previous scan by a specific amount
---| '"soDecreasedValue"' # Search for decreased value in relation to previous scan
---| '"soDecreasedValueBy"' # Search for decreased value in relation to previous scan by a specific amount
---| '"soChanged"' # Search for changed value in relation to previous scan
---| '"soUnchanged"' # Search for unchanged value in relation to previous scan

---@alias BreakpointMethod integer
---| 0 # bpmInt3 ->
---| 1 # bpmDebugRegister ->
---| 2 # bpmException ->

---@alias BreakpointTriggerString string
---| '"bptExecute"' # Break thread on execution on a given address
---| '"bptAccess"' # Breaks thread when a given address is referenced in an executed instruction
---| '"bptWrite"' # Breaks thread when a given address is written to in an executed instruction

---@alias BreakpointTrigger integer
---| 0 # bptExecute -> Break thread on execution on a given address
---| 1 # bptAccess -> Breaks thread when a given address is referenced in an executed instruction
---| 2 # bptWrite -> Breaks thread when a given address is written to in an executed instruction


---Continue method can be 0 = run, 1 = step into
---@alias BreakpointContinueMethod integer
---| 0 # run -> 
---| 1 # step into ->
---| 2 # step over ->


---@alias CloseAction integer
---| 0 # caNone ->
---| 1 # caHide ->
---| 2 # caFree ->
---| 3 # caMinimize ->


---@alias CAlignmentTypeString string
---| '"alNone"' #
---| '"alTop"' #
---| '"alBottom"' #
---| '"alLeft"' #
---| '"alRight"' #
---| '"alClient"' #


---@alias CAlignmentType integer
---| 0 # alNone ->
---| 1 # alTop ->
---| 2 # alBottom ->
---| 3 # alLeft ->
---| 4 # alRight ->
---| 5 # alClient ->


---@alias MessageDialogType integer
---| 0 # mtWarning ->
---| 1 # mtError ->
---| 2 # mtInformation ->
---| 3 # mtConfirmation ->


---@alias MessageDialogButtonType
---| 0 # mbYes ->
---| 1 # mbNo ->
---| 2 # mbOK ->
---| 3 # mbCancel ->
---| 4 # mbAbort ->
---| 5 # mbRetry ->
---| 6 # mbIgnore ->
---| 7 # mbAll ->
---| 8 # mbNoToAll ->
---| 9 # mbYesToAll ->
---| 10 # mbHelp ->
---| 11 # mbClose ->


---@alias MessageDialogResult integer
---| 0 # mrNone ->
---| 1 # mrOK ->
---| 2 # mrCancel ->
---| 3 # mrAbort ->
---| 4 # mrRetry ->
---| 5 # mrIgnore ->
---| 6 # mrYes ->
---| 7 # mrNo ->
---| 8 # mrAll ->
---| 9 # mrNoToAll ->
---| 10 # mrYesToAll, mrLast ->


---@alias DuplicatesTypeString string
---| '"dupIgnore"' # Ignore duplicates
---| '"dupAccept"' # Accept duplicates
---| '"dupError"' # Error on duplicate

---@alias DuplicatesType integer
---| 0 # dupIgnore
---| 1 # dupAccept
---| 2 # dupError


---@see VariableType
---@alias VariableTypeString string
---| '"vtByte"' # The byte type for memory records
---| '"vtWord"' # The 2 byte type (word) for memory records
---| '"vtDword"' # The 4 byte type (dword) for memory records
---| '"vtQword"' # The 8 byte type (qword) for memory records
---| '"vtSingle"' # The 4 byte single floating point precision (float) for memory records
---| '"vtDouble"' # The 8 byte double floating point precision (double) for memory records
---| '"vtString"' # The string type for memory records
---| '"vtUnicodeString"' # The unicode string type for memory records (used by autoguess)
---| '"vtWideString"' # The wide string type for memory records
---| '"vtByteArray"' # The byte array type for memory records
---| '"vtBinary"' # The binary array type for memory records
---| '"vtAutoAssembler"' # The AA script type for memory records
---| '"vtPointer"' # The autoguess and structure pointer type
---| '"vtCustom"' # A custom type (user implementation) for memory records
---| '"vtGrouped"' # A grouped type for multiple other types for memory records


---@see VariableTypeString
---@alias VariableType integer
---| 0 # vtByte -> The byte type for memory records
---| 1 # vtWord -> The 2 byte type (word) for memory records
---| 2 # vtDword -> The 4 byte type (dword) for memory records
---| 3 # vtQword -> The 8 byte type (qword) for memory records
---| 4 # vtSingle -> The 4 byte single floating point precision (float) for memory records
---| 5 # vtDouble -> The 8 byte double floating point precision (double) for memory records
---| 6 # vtString -> The string type for memory records
---| 7 # vtUnicodeString or vtWideString -> The unicode or wide string type for memory records (used by autoguess)
---| 8 # vtByteArray -> The byte array type for memory records
---| 9 # vtBinary -> The binary array type for memory records
---| 11 # vtAutoAssembler -> The AA script type for memory records
---| 12 # vtPointer -> The autoguess and structure pointer type
---| 13 # vtCustom -> A custom type (user implementation) for memory records
---| 14 # vtGrouped -> A grouped type for multiple other types for memory records


---@alias ShellExecuteViewOption integer
---| 0 # SW_HIDE ->
---| 3 # SW_MAXIMIZE ->
---| 6 # SW_MINIMIZE ->
---| 1 # SW_NORMAL ->
---| 9 # SW_RESTORE ->
---| 5 # SW_SHOW ->
---| 10 # SW_SHOWDEFAULT ->
---| 3 # SW_SHOWMAXIMIZED ->
---| 2 # SW_SHOWMINIMIZED ->
---| 7 # SW_SHOWMINNOACTIVE ->
---| 8 # SW_SHOWNA ->
---| 4 # SW_SHOWNOACTIVATE ->
---| 1 # SW_SHOWNORMAL ->


---Supported pixelformats: pf1bit, pf4bit, pf8bit, pf15bit, pf16bit, pf24bit, pf32bit (recommended)
---@alias PixelFormatString string
---| '"pfDevice"' #
---| '"pf1bit"' #
---| '"pf4bit"' #
---| '"pf8bit"' #
---| '"pf15bit"' #
---| '"pf16bit"' #
---| '"pf24bit"' #
---| '"pf32bit"' #
---| '"pfCustom"' #


---@alias PixelFormat integer
---| 0 # pfDevice ->
---| 1 # pf1bit ->
---| 2 # pf4bit ->
---| 3 # pf8bit ->
---| 4 # pf15bit ->
---| 5 # pf16bit ->
---| 6 # pf24bit ->
---| 7 # pf32bit ->
---| 8 # pfCustom ->


---@alias DisassemblerValueType integer
---| 0 # dvtNone
---| 1 # dvtAddress
---| 2 # dvtValue


---Type can be jtCall, jtUnconditional, jtConditional, jtMemory
---In case of jtMemory setting isString to true will add it to the referenced strings list
---@alias DissectCodeType integer
---| 0 # jtCall
---| 1 # jtUnconditional
---| 2 # jtConditional
---| 3 # jtMemory


---@alias DissectCodeTypeString string
---| '"jtCall"' #
---| '"jtUnconditional"' #
---| '"jtConditional"' #
---| '"jtMemory"' #


---Location determines at what part of the symbol lookup the function is called
---
---The following locations can be called multiple times for one string as they 
---are called for each token and appended token:
---
---slNotModule, slNotUserdefinedSymbol, slNotSymbol, slFailure
---
---Note: slNotSymbol and slFailure are similar, but failure comes only if there's 
---no token after the current token that can be concatenated. 
---Else slNotSymbol will loop several times until all tokens make up the full string.
---@alias SymbolLookupStep integer
---| 0 # slStart -> The very start of a symbol lookup. Before tokenization
---| 1 # slNotInt -> Called when it has been determined it's not a hexadecimal only string. Before tokenization
---| 2 # slNotModule -> Called when it has been determined the current token is not a modulename
---| 3 # slNotUserdefinedSymbol -> Called when it has been determined it's not a userdefined symbol
---| 4 # slNotSymbol -> Called when it has been determined it's not a symbol in the symbollist
---| 5 # slFailure -> Called when it has no clue what the given string is    


---Location determines at what part of the symbol lookup the function is called
---
---The following locations can be called multiple times for one string as they
---are called for each token and appended token:
---
---slNotModule, slNotUserdefinedSymbol, slNotSymbol, slFailure
---
---Note: slNotSymbol and slFailure are similar, but failure comes only if there's 
---no token after the current token that can be concatenated. 
---Else slNotSymbol will loop several times until all tokens make up the full string.
---@alias SymbolLookupStepString string
---| '"slStart"' # The very start of a symbol lookup. Before tokenization
---| '"slNotInt"' # Called when it has been determined it's not a hexadecimal only string. Before tokenization
---| '"slNotModule"' # Called when it has been determined the current token is not a modulename
---| '"slNotUserdefinedSymbol"' # Called when it has been determined it's not a userdefined symbol
---| '"slNotSymbol"' # Called when it has been determined it's not a symbol in the symbollist
---| '"slFailure"' # Called when it has no clue what the given string is

---@alias LayeredWindowAttribute integer
---| 1 # LWA_COLORKEY ->
---| 2 # LWA_ALPHA ->


---@alias MemoryRecordHotkeyAction integer
---| 0 # mrhToggleActivation -> Toggles between active/not active
---| 1 # mrhToggleActivationAllowIncrease -> Toggles between active/not active. Allows increase when active
---| 2 # mrhToggleActivationAllowDecrease -> Toggles between active/not active. Allows decrease when active
---| 3 # mrhActivate -> Sets the memory record state to active
---| 4 # mrhDeactivate -> Sets the memory record state to not active
---| 5 # mrhSetValue -> Sets a specific value to the memory record value property (see value)
---| 6 # mrhIncreaseValue -> Increases the current memory record value with the value property (see value)
---| 7 # mrhDecreaseValue -> Decreases the current memory record value with the value property (see value)


---@alias MemoryRecordHotkeyActionString string
---| '"mrhToggleActivation"' # Toggles between active/not active
---| '"mrhToggleActivationAllowIncrease"' # Toggles between active/not active. Allows increase when active
---| '"mrhToggleActivationAllowDecrease"' # Toggles between active/not active. Allows decrease when active
---| '"mrhActivate"' # Sets the memory record state to active
---| '"mrhDeactivate"' # Sets the memory record state to not active
---| '"mrhSetValue"' # Sets a specific value to the memory record value property (see value)
---| '"mrhIncreaseValue"' # Increases the current memory record value with the value property (see value)
---| '"mrhDecreaseValue"' # Decreases the current memory record value with the value property (see value)


---@alias EventWaitResultString string
---| '"wrSignaled"' #
---| '"wrTimeout"' #
---| '"wrAbandoned"' #
---| '"wrError"' #


---@alias EventWaitResult integer
---| 0 # wrSignaled ->
---| 1 # wrTimeout ->
---| 2 # wrAbandoned ->
---| 3 # wrError ->


---@alias FillType string
---| '"fsSurface"' # Fill until the color (it fills all except this color)
---| '"fsBorder"' # Fill this color (it fills only connected pixels of this color)    


---@alias CustomDrawSetting string
---| '"cdsSelected"' #
---| '"cdsGrayed"' #
---| '"cdsDisabled"' #
---| '"cdsChecked"' #
---| '"cdsFocused"' #
---| '"cdsDefault"' #
---| '"cdsHot"' #
---| '"cdsMarked"' #
---| '"cdsIndeterminate"' #


---@alias DisplayRectangleCode integer
---| 0 # drBounds ->
---| 1 # drIcon ->
---| 2 # drLabel ->
---| 3 # drSelectBounds ->


---Mode can be fmCreate, fmOpenRead, fmOpenWrite or fmOpenReadWrite and can be 
---binary or-ed with fmShareCompat, fmShareExclusive, fmShareDenyWrite, 
---fmShareDenyRead or fmShareDenyNone.
---@alias FileStreamMode string
---| '"fmCreate"' #
---| '"fmOpenRead"' #
---| '"fmOpenWrite"' #
---| '"fmOpenReadWrite"' #
---| '"fmShareCompat"' #
---| '"fmShareExclusive"' #
---| '"fmShareDenyWrite"' #
---| '"fmShareDenyRead"' #
---| '"fmShareDenyNone"' #


---@alias PenMode integer
---| 0 # pmBlack ->
---| 1 # pmWhite ->
---| 2 # pmNop ->
---| 3 # pmNot ->
---| 4 # pmCopy ->
---| 5 # pmNotCopy ->
---| 6 # pmMergePenNot ->
---| 7 # pmMaskPenNot ->
---| 8 # pmMergeNotPen ->
---| 9 # pmMaskNotPen ->
---| 10 # pmMerge ->
---| 11 # pmNotMerge ->
---| 12 # pmMask ->
---| 13 # pmNotMask ->
---| 14 # pmXor ->
---| 15 # pmNotXor ->


---(Windows only) Values: tbpsNone, tbpsIndeterminate, tbpsNormal, tbpsError, tbpsPaused
---@alias TaskProgressStateString string
---| '"tbpsNone"' #
---| '"tbpsIndeterminate"' #
---| '"tbpsNormal"' #
---| '"tbpsError"' #
---| '"tbpsPaused"' #


---@alias TaskProgressState integer
---| 0 # tbpsNone ->
---| 1 # tbpsIndeterminate ->
---| 2 # tbpsNormal ->
---| 3 # tbpsError ->
---| 4 # tbpsPaused ->



----------------------------------- Enums -----------------------------------



---Package table to store all enums used with Cheat Engine.
CE_defines = {}


---@enum WindowPositions
CE_defines.window_positions = {
  Top = 0,
  Right = 1,
  Bottom = 2,
  Left = 3,
}


---@enum CheckBoxStates
CE_defines.check_box_states = {
  cbUnchecked = 0,
  cbChecked = 1,
  cbGrayed = 2,
}


---@enum MouseEventButtons
CE_defines.mouse_event_buttons = {
  mbLeft    = 0,
  mbRight   = 1,
  mbMiddle  = 2,
  mbExtra1  = 3,
  mbExtra2  = 4,
}


---@enum ScrollStyles
CE_defines.scroll_styles = {
  ssNone = 0,
  ssHorizontal = 1,
  ssVertical = 2,
  ssBoth = 3,
  ssAutoHorizontal = 4,
  ssAutoVertical = 5,
  ssAutoBoth = 6,
}


---@enum MemFastScanMethods
CE_defines.mem_fast_scan_methods = {
  fsmNotAligned = 0,
  fsmAligned = 1,
  fsmLastDigits = 2,
}


---@enum MemScanRoundingTypes
CE_defines.mem_scan_rounding_types = {
  rtRounded = 0,
  rtExtremerounded = 1,
  rtTruncated = 2,
}


---@enum MemScanOptions
CE_defines.mem_scan_options = {
  soUnknownValue = 0,
  soExactValue = 1,
  soValueBetween = 2,
  soBiggerThan = 3,
  soSmallerThan = 4,
  soIncreasedValue = 5,
  soIncreasedValueBy = 6,
  soDecreasedValue = 7,
  soDecreasedValueBy = 8,
  soChanged = 9,
  soUnchanged = 10,
}

---@enum BreakpointMethods
CE_defines.breakpoint_methods = {
  bpmInt3           = 0,
  bpmDebugRegister  = 1,
  bpmException      = 2,
}

---@enum BreakpointTriggers
CE_defines.breakpoint_triggers = {
  bptExecute  = 0,
  bptAccess   = 1,
  bptWrite    = 2,
}

---@enum BreakpointContinueMethods
CE_defines.breakpoint_continue_methods = {
  co_run      = 0,
  co_stepinto = 1,
  co_stepover = 2,
}

---@enum CloseActions
CE_defines.close_actions = {
  caNone      = 0,
  caHide      = 1,
  caFree      = 2,
  caMinimize  = 3,
}


---@enum CAlignmentTypes
CE_defines.alignment_types = {
  alNone = 0,
  alTop = 1,
  alBottom = 2,
  alLeft = 3,
  alRight = 4,
  alClient = 5,
}


---@enum MessageDialogTypes
CE_defines.message_dialog_types = {
  mtWarning       = 0,
  mtError         = 1,
  mtInformation   = 2,
  mtConfirmation  = 3,
}


---@enum MessageDialogButtonTypes
CE_defines.message_dialog_button_types = {
  mbYes       = 0,
  mbNo        = 1,
  mbOK        = 2,
  mbCancel    = 3,
  mbAbort     = 4,
  mbRetry     = 5,
  mbIgnore    = 6,
  mbAll       = 7,
  mbNoToAll   = 8,
  mbYesToAll  = 9,
  mbHelp      = 10,
  mbClose     = 11,
}


---@enum MessageDialogResults
CE_defines.message_dialog_results = {
  mrNone      = 0,
  mrOK        = 1,
  mrCancel    = 2,
  mrAbort     = 3,
  mrRetry     = 4,
  mrIgnore    = 5,
  mrYes       = 6,
  mrNo        = 7,
  mrAll       = 8,
  mrNoToAll   = 9,
  mrYesToAll  = 10,
  mrLast      = CE_defines.message_dialog_results.mrYesToAll,
}

---@enum DuplicatesTypes
CE_defines.duplicates_type = {
  dupIgnore = 0,
  dupAccept = 1,
  dupError = 2,
}

---@enum VariableTypes
CE_defines.variable_types = {
  vtByte          = 0,
  vtWord          = 1,
  vtDword         = 2,
  vtQword         = 3,
  vtSingle        = 4,
  vtDouble        = 5,
  vtString        = 6,
  vtUnicodeString = 7,
  vtWideString    = 7,
  vtByteArray     = 8,
  vtBinary        = 9,
  vtAll           = 10,
  vtAutoAssembler = 11,
  vtPointer       = 12,
  vtCustom        = 13,
  vtGrouped       = 14,
}


---@enum ShellExecuteViewOptions
CE_defines.shell_execute_view_options = {
  SW_HIDE             = 0,
  SW_MAXIMIZE         = 3,
  SW_MINIMIZE         = 6,
  SW_NORMAL           = 1,
  SW_RESTORE          = 9,
  SW_SHOW             = 5,
  SW_SHOWDEFAULT      = 10,
  SW_SHOWMAXIMIZED    = 3,
  SW_SHOWMINIMIZED    = 2,
  SW_SHOWMINNOACTIVE  = 7,
  SW_SHOWNA           = 8,
  SW_SHOWNOACTIVATE   = 4,
  SW_SHOWNORMAL       = 1,
}


---@enum PixelFormats
CE_defines.pixel_formats = {
  pfDevice  = 0,
  pf1bit    = 1,
  pf4bit    = 2,
  pf8bit    = 3,
  pf15bit   = 4,
  pf16bit   = 5,
  pf24bit   = 6,
  pf32bit   = 7,
  pfCustom  = 8,
}


---@enum DisassemblerValueTypes
CE_defines.disassembler_value_types = {
    dvtNone     = 0,
    dvtAddress  = 1,
    dvtValue    = 2,
}


---@enum DissectCodeTypes
CE_defines.dissect_code_types = {
    jtCall          = 0,
    jtUnconditional = 1,
    jtConditional   = 2,
    jtMemory        = 3,
}


---@enum SymbolLookupSteps
CE_defines.symbol_lookup_steps = {
  slStart                 = 0, --The very start of a symbol lookup. Before tokenization
  slNotInt                = 1, --Called when it has been determined it's not a hexadecimal only string. Before tokenization
  slNotModule             = 2, --Called when it has been determined the current token is not a modulename
  slNotUserdefinedSymbol  = 3, --Called when it has been determined it's not a userdefined symbol
  slNotSymbol             = 4, --Called when it has been determined it's not a symbol in the symbollist
  slFailure               = 5, --Called when it has no clue what the given string is    
}


---@enum LayeredWindowAttributes
CE_defines.layered_window_attributes = {
  LWA_COLORKEY  = 1,
  LWA_ALPHA     = 2,
}

---@enum MemoryRecordHotkeyActions
CE_defines.memory_record_hotkey_actions = {
  mrhToggleActivation               = 0,
  mrhToggleActivationAllowIncrease  = 1,
  mrhToggleActivationAllowDecrease  = 2,
  mrhActivate                       = 3,
  mrhDeactivate                     = 4,
  mrhSetValue                       = 5,
  mrhIncreaseValue                  = 6,
  mrhDecreaseValue                  = 7,
}


---@enum EventWaitResults
CE_defines.event_wait_results = {
    wrSignaled  = 0,
    wrTimeout   = 1,
    wrAbandoned = 2,
    wrError     = 3,
}


---@enum FillTypes
CE_defines.fill_types = {
  fsSurface = 0,
  fsBorder  = 1,
}


---@enum CustomDrawSettings
CE_defines.custom_draw_settings = {
  cdsSelected       = 0,
  cdsGrayed         = 1,
  cdsDisabled       = 2,
  cdsChecked        = 3,
  cdsFocused        = 4,
  cdsDefault        = 5,
  cdsHot            = 6,
  cdsMarked         = 7,
  cdsIndeterminate  = 8,
}


---@enum DisplayRectangleCodes
CE_defines.display_rectangle_codes = {
  drBounds        = 0,
  drIcon          = 1,
  drLabel         = 2,
  drSelectBounds  = 3,
}


---Mode can be fmCreate, fmOpenRead, fmOpenWrite or fmOpenReadWrite and can be binary or-ed with fmShareCompat, fmShareExclusive, fmShareDenyWrite, fmShareDenyRead or fmShareDenyNone.
---@enum FileStreamModes
CE_defines.file_stream_modes = {
  fmCreate        = 0xff00,
  fmOpenRead      = 0x0000,
  fmOpenWrite     = 0x0001,
  fmOpenReadWrite = 0x0002,

  fmShareCompat   = 0x0000,
  fmShareExclusive= 0x0010,
  fmShareDenyWrite= 0x0020,
  fmShareDenyRead = 0x0030,
  fmShareDenyNone = 0x0040,
}


---@enum Colors
CE_defines.colors = {
  CLR_NONE = 0xFFFFFFFF,
  CLR_DEFAULT = 0xFF000000,
  CLR_INVALID = 0xFFFFFFFF,

  COLOR_SCROLLBAR = 0,
  COLOR_BACKGROUND = 1,
  COLOR_ACTIVECAPTION = 2,
  COLOR_INACTIVECAPTION = 3,
  COLOR_MENU = 4,
  COLOR_WINDOW = 5,
  COLOR_WINDOWFRAME = 6,
  COLOR_MENUTEXT = 7,
  COLOR_WINDOWTEXT = 8,
  COLOR_CAPTIONTEXT = 9,
  COLOR_ACTIVEBORDER = 10,
  COLOR_INACTIVEBORDER = 11,
  COLOR_APPWORKSPACE = 12,
  COLOR_HIGHLIGHT = 13,
  COLOR_HIGHLIGHTTEXT = 14,
  COLOR_BTNFACE = 15,
  COLOR_BTNSHADOW = 16,
  COLOR_GRAYTEXT = 17,
  COLOR_BTNTEXT = 18,
  COLOR_INACTIVECAPTIONTEXT = 19,
  COLOR_BTNHIGHLIGHT = 20,
  COLOR_3DDKSHADOW = 21,
  COLOR_3DLIGHT = 22,
  COLOR_INFOTEXT = 23,
  COLOR_INFOBK = 24,
  COLOR_HOTLIGHT = 26,
  COLOR_GRADIENTACTIVECAPTION = 27,
  COLOR_GRADIENTINACTIVECAPTION = 28,
  COLOR_MENUHILIGHT = 29,
  COLOR_MENUBAR = 30,

  COLOR_FORM = 31,

  COLOR_ENDCOLORS = CE_defines.colors.COLOR_FORM,

  COLOR_DESKTOP = CE_defines.colors.COLOR_BACKGROUND,
  COLOR_3DFACE = CE_defines.colors.COLOR_BTNFACE,
  COLOR_3DSHADOW = CE_defines.colors.COLOR_BTNSHADOW,
  COLOR_3DHIGHLIGHT = CE_defines.colors.COLOR_BTNHIGHLIGHT,
  COLOR_3DHILIGHT = CE_defines.colors.COLOR_BTNHIGHLIGHT,
  COLOR_BTNHILIGHT = CE_defines.colors.COLOR_BTNHIGHLIGHT,

  MAX_SYS_COLORS = CE_defines.colors.COLOR_ENDCOLORS,
  SYS_COLOR_BASE = 0x80000000,

  clBlack   = 0x000000,
  clMaroon  = 0x000080,
  clGreen   = 0x008000,
  clOlive   = 0x008080,
  clNavy    = 0x800000,
  clPurple  = 0x800080,
  clTeal    = 0x808000,
  clGray    = 0x808080,
  clSilver  = 0xC0C0C0,
  clRed     = 0x0000FF,
  clLime    = 0x00FF00,
  clYellow  = 0x00FFFF,
  clBlue    = 0xFF0000,
  clFuchsia = 0xFF00FF,
  clAqua    = 0xFFFF00,
  clLtGray  = 0xC0C0C0,
  clDkGray  = 0x808080,
  clWhite   = 0xFFFFFF,
  StandardColorsCount = 16,

  clMoneyGreen = 0xC0DCC0,
  clSkyBlue    = 0xF0CAA6,
  clCream      = 0xF0FBFF,
  clMedGray    = 0xA4A0A0,
  ExtendedColorCount = 4,

  -- special colors
  clNone    = 0x1FFFFFFF,
  clDefault = 0x20000000,

  -- system colors
  clScrollBar = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_SCROLLBAR,
  clBackground = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_BACKGROUND,
  clActiveCaption = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_ACTIVECAPTION,
  clInactiveCaption = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_INACTIVECAPTION,
  clMenu = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_MENU,
  clWindow = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_WINDOW,
  clWindowFrame = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_WINDOWFRAME,
  clMenuText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_MENUTEXT,
  clWindowText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_WINDOWTEXT,
  clCaptionText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_CAPTIONTEXT,
  clActiveBorder = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_ACTIVEBORDER,
  clInactiveBorder = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_INACTIVEBORDER,
  clAppWorkspace = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_APPWORKSPACE,
  clHighlight = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_HIGHLIGHT,
  clHighlightText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_HIGHLIGHTTEXT,
  clBtnFace = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_BTNFACE,
  clBtnShadow = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_BTNSHADOW,
  clGrayText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_GRAYTEXT,
  clBtnText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_BTNTEXT,
  clInactiveCaptionText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_INACTIVECAPTIONTEXT,
  clBtnHighlight = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_BTNHIGHLIGHT,
  cl3DDkShadow = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_3DDKSHADOW,
  cl3DLight = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_3DLIGHT,
  clInfoText = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_INFOTEXT,
  clInfoBk = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_INFOBK,

  clHotLight = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_HOTLIGHT,
  clGradientActiveCaption = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_GRADIENTACTIVECAPTION,
  clGradientInactiveCaption = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_GRADIENTINACTIVECAPTION,
  clMenuHighlight = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_MENUHILIGHT,
  clMenuBar = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_MENUBAR,
  clForm = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_FORM,

  -- synonyms: do not show them in color lists
  clColorDesktop = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_DESKTOP,
  cl3DFace = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_3DFACE,
  cl3DShadow = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_3DSHADOW,
  cl3DHiLight = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_3DHIGHLIGHT,
  clBtnHiLight = CE_defines.colors.SYS_COLOR_BASE|CE_defines.colors.COLOR_BTNHILIGHT,

  clFirstSpecialColor = CE_defines.colors.clBtnHiLight,

  clMask = CE_defines.colors.clWhite,
  clDontMask = CE_defines.colors.clBlack,
}


---@enum PenModes
CE_defines.pen_modes = {
  pmBlack       = 0,
  pmWhite       = 1,
  pmNop         = 2,
  pmNot         = 3,
  pmCopy        = 4,
  pmNotCopy     = 5,
  pmMergePenNot = 6,
  pmMaskPenNot  = 7,
  pmMergeNotPen = 8,
  pmMaskNotPen  = 9,
  pmMerge       = 10,
  pmNotMerge    = 11,
  pmMask        = 12,
  pmNotMask     = 13,
  pmXor         = 14,
  pmNotXor      = 15,
}


---@enum TaskProgressStates
CE_defines.task_progress_states = {
  tbpsNone          = 0,
  tbpsIndeterminate = 1,
  tbpsNormal        = 2,
  tbpsError         = 3,
  tbpsPaused        = 4,
}



----------------------------------- Global Defines -----------------------------------



----------------------------------- CheckBox States -----------------------------------

cbUnchecked = CE_defines.check_box_states.cbUnchecked
cbChecked = CE_defines.check_box_states.cbChecked
cbGrayed = CE_defines.check_box_states.cbGrayed


----------------------------------- Mouse Button Events -----------------------------------

mbLeft    = CE_defines.mouse_event_buttons.mbLeft
mbRight   = CE_defines.mouse_event_buttons.mbRight
mbMiddle  = CE_defines.mouse_event_buttons.mbMiddle
mbExtra1  = CE_defines.mouse_event_buttons.mbExtra1
mbExtra2  = CE_defines.mouse_event_buttons.mbExtra2


----------------------------------- CloseActions -----------------------------------

caNone      = CE_defines.close_actions.caNone
caHide      = CE_defines.close_actions.caHide
caFree      = CE_defines.close_actions.caFree
caMinimize  = CE_defines.close_actions.caMinimize


----------------------------------- Memo Scrollbar -----------------------------------

ssNone            = CE_defines.scroll_styles.ssNone
ssHorizontal      = CE_defines.scroll_styles.ssHorizontal
ssVertical        = CE_defines.scroll_styles.ssVertical
ssBoth            = CE_defines.scroll_styles.ssBoth
ssAutoHorizontal  = CE_defines.scroll_styles.ssAutoHorizontal
ssAutoVertical    = CE_defines.scroll_styles.ssAutoVertical
ssAutoBoth        = CE_defines.scroll_styles.ssAutoBoth


----------------------------------- ??? -----------------------------------

bsNone        = 0
bsSingle      = 1
bsSizeable    = 2
bsDialog      = 3
bsToolWindow  = 4
bsSizeToolWin = 5


----------------------------------- Fast Scan Methods -----------------------------------

fsmNotAligned = CE_defines.mem_fast_scan_methods.fsmNotAligned
fsmAligned    = CE_defines.mem_fast_scan_methods.fsmAligned
fsmLastDigits = CE_defines.mem_fast_scan_methods.fsmLastDigits


----------------------------------- Rounding Types -----------------------------------

rtRounded         = CE_defines.mem_scan_rounding_types.rtRounded
rtExtremerounded  = CE_defines.mem_scan_rounding_types.rtExtremerounded
rtTruncated       = CE_defines.mem_scan_rounding_types.rtTruncated


----------------------------------- Scan Options -----------------------------------

soUnknownValue      = CE_defines.mem_scan_options.soUnknownValue
soExactValue        = CE_defines.mem_scan_options.soExactValue
soValueBetween      = CE_defines.mem_scan_options.soValueBetween
soBiggerThan        = CE_defines.mem_scan_options.soBiggerThan
soSmallerThan       = CE_defines.mem_scan_options.soSmallerThan
soIncreasedValue    = CE_defines.mem_scan_options.soIncreasedValue
soIncreasedValueBy  = CE_defines.mem_scan_options.soIncreasedValueBy
soDecreasedValue    = CE_defines.mem_scan_options.soDecreasedValue
soDecreasedValueBy  = CE_defines.mem_scan_options.soDecreasedValueBy
soChanged           = CE_defines.mem_scan_options.soChanged
soUnchanged         = CE_defines.mem_scan_options.soUnchanged


----------------------------------- Breakpoint methods -----------------------------------

bpmInt3           = CE_defines.breakpoint_methods.bpmInt3
bpmDebugRegister  = CE_defines.breakpoint_methods.bpmDebugRegister
bpmException      = CE_defines.breakpoint_methods.bpmException


----------------------------------- Breakpoint triggers -----------------------------------

bptExecute  = CE_defines.breakpoint_triggers.bptExecute
bptAccess   = CE_defines.breakpoint_triggers.bptAccess
bptWrite    = CE_defines.breakpoint_triggers.bptWrite


----------------------------------- Breakpoint Continue Methods -----------------------------------

co_run      = CE_defines.breakpoint_continue_methods.co_run
co_stepinto = CE_defines.breakpoint_continue_methods.co_stepinto
co_stepover = CE_defines.breakpoint_continue_methods.co_stepover


----------------------------------- Alignment Types -----------------------------------

alNone    = CE_defines.alignment_types.alNone
alTop     = CE_defines.alignment_types.alTop
alBottom  = CE_defines.alignment_types.alBottom
alLeft    = CE_defines.alignment_types.alLeft
alRight   = CE_defines.alignment_types.alRight
alClient  = CE_defines.alignment_types.alClient


----------------------------------- Message Dialog Types -----------------------------------

mtWarning       = CE_defines.message_dialog_types.mtWarning
mtError         = CE_defines.message_dialog_types.mtError
mtInformation   = CE_defines.message_dialog_types.mtInformation
mtConfirmation  = CE_defines.message_dialog_types.mtConfirmation


----------------------------------- Message Dialog Button Types -----------------------------------

mbYes       = CE_defines.message_dialog_button_types.mbYes
mbNo        = CE_defines.message_dialog_button_types.mbNo
mbOK        = CE_defines.message_dialog_button_types.mbOK
mbCancel    = CE_defines.message_dialog_button_types.mbCancel
mbAbort     = CE_defines.message_dialog_button_types.mbAbort
mbRetry     = CE_defines.message_dialog_button_types.mbRetry
mbIgnore    = CE_defines.message_dialog_button_types.mbIgnore
mbAll       = CE_defines.message_dialog_button_types.mbAll
mbNoToAll   = CE_defines.message_dialog_button_types.mbNoToAll
mbYesToAll  = CE_defines.message_dialog_button_types.mbYesToAll
mbHelp      = CE_defines.message_dialog_button_types.mbHelp
mbClose     = CE_defines.message_dialog_button_types.mbClose


----------------------------------- Message Dialog Results -----------------------------------

mrNone      = CE_defines.message_dialog_results.mrNone
mrOK        = CE_defines.message_dialog_results.mrOK
mrCancel    = CE_defines.message_dialog_results.mrCancel
mrAbort     = CE_defines.message_dialog_results.mrAbort
mrRetry     = CE_defines.message_dialog_results.mrRetry
mrIgnore    = CE_defines.message_dialog_results.mrIgnore
mrYes       = CE_defines.message_dialog_results.mrYes
mrNo        = CE_defines.message_dialog_results.mrNo
mrAll       = CE_defines.message_dialog_results.mrAll
mrNoToAll   = CE_defines.message_dialog_results.mrNoToAll
mrYesToAll  = CE_defines.message_dialog_results.mrYesToAll
mrLast      = CE_defines.message_dialog_results.mrLast


----------------------------------- Duplicate Enum -----------------------------------

dupIgnore = CE_defines.duplicates_type.dupIgnore
dupAccept = CE_defines.duplicates_type.dupAccept
dupError  = CE_defines.duplicates_type.dupError


----------------------------------- Variable Types -----------------------------------

vtByte          = CE_defines.variable_types.vtByte
vtWord          = CE_defines.variable_types.vtWord
vtDword         = CE_defines.variable_types.vtDword
vtQword         = CE_defines.variable_types.vtQword
vtSingle        = CE_defines.variable_types.vtSingle
vtDouble        = CE_defines.variable_types.vtDouble
vtString        = CE_defines.variable_types.vtString
vtUnicodeString = CE_defines.variable_types.vtUnicodeString --Only used by autoguess
vtWideString    = CE_defines.variable_types.vtWideString
vtByteArray     = CE_defines.variable_types.vtByteArray
vtBinary        = CE_defines.variable_types.vtBinary
vtAll           = CE_defines.variable_types.vtAll
vtAutoAssembler = CE_defines.variable_types.vtAutoAssembler
vtPointer       = CE_defines.variable_types.vtPointer --Only used by autoguess and structures
vtCustom        = CE_defines.variable_types.vtCustom
vtGrouped       = CE_defines.variable_types.vtGrouped


----------------------------------- Virtual Key Codes -----------------------------------

VK_LBUTTON    = CE_defines.virtual_key_codes.VK_LBUTTON
VK_RBUTTON    = CE_defines.virtual_key_codes.VK_RBUTTON
VK_CANCEL     = CE_defines.virtual_key_codes.VK_CANCEL
VK_MBUTTON    = CE_defines.virtual_key_codes.VK_MBUTTON
VK_XBUTTON1   = CE_defines.virtual_key_codes.VK_XBUTTON1
VK_XBUTTON2   = CE_defines.virtual_key_codes.VK_XBUTTON2
VK_BACK       = CE_defines.virtual_key_codes.VK_BACK
VK_TAB        = CE_defines.virtual_key_codes.VK_TAB
VK_CLEAR      = CE_defines.virtual_key_codes.VK_CLEAR
VK_RETURN     = CE_defines.virtual_key_codes.VK_RETURN
VK_SHIFT      = CE_defines.virtual_key_codes.VK_SHIFT
VK_CONTROL    = CE_defines.virtual_key_codes.VK_CONTROL
VK_MENU       = CE_defines.virtual_key_codes.VK_MENU
VK_PAUSE      = CE_defines.virtual_key_codes.VK_PAUSE
VK_CAPITAL    = CE_defines.virtual_key_codes.VK_CAPITAL
VK_ESCAPE     = CE_defines.virtual_key_codes.VK_ESCAPE
VK_SPACE      = CE_defines.virtual_key_codes.VK_SPACE
VK_PRIOR      = CE_defines.virtual_key_codes.VK_PRIOR
VK_NEXT       = CE_defines.virtual_key_codes.VK_NEXT
VK_END        = CE_defines.virtual_key_codes.VK_END
VK_HOME       = CE_defines.virtual_key_codes.VK_HOME
VK_LEFT       = CE_defines.virtual_key_codes.VK_LEFT
VK_UP         = CE_defines.virtual_key_codes.VK_UP
VK_RIGHT      = CE_defines.virtual_key_codes.VK_RIGHT
VK_DOWN       = CE_defines.virtual_key_codes.VK_DOWN
VK_SELECT     = CE_defines.virtual_key_codes.VK_SELECT
VK_PRINT      = CE_defines.virtual_key_codes.VK_PRINT
VK_EXECUTE    = CE_defines.virtual_key_codes.VK_EXECUTE
VK_SNAPSHOT   = CE_defines.virtual_key_codes.VK_SNAPSHOT
VK_INSERT     = CE_defines.virtual_key_codes.VK_INSERT
VK_DELETE     = CE_defines.virtual_key_codes.VK_DELETE
VK_HELP       = CE_defines.virtual_key_codes.VK_HELP
VK_0          = CE_defines.virtual_key_codes.VK_0
VK_1          = CE_defines.virtual_key_codes.VK_1
VK_2          = CE_defines.virtual_key_codes.VK_2
VK_3          = CE_defines.virtual_key_codes.VK_3
VK_4          = CE_defines.virtual_key_codes.VK_4
VK_5          = CE_defines.virtual_key_codes.VK_5
VK_6          = CE_defines.virtual_key_codes.VK_6
VK_7          = CE_defines.virtual_key_codes.VK_7
VK_8          = CE_defines.virtual_key_codes.VK_8
VK_9          = CE_defines.virtual_key_codes.VK_9
VK_A          = CE_defines.virtual_key_codes.VK_A
VK_B          = CE_defines.virtual_key_codes.VK_B
VK_C          = CE_defines.virtual_key_codes.VK_C
VK_D          = CE_defines.virtual_key_codes.VK_D
VK_E          = CE_defines.virtual_key_codes.VK_E
VK_F          = CE_defines.virtual_key_codes.VK_F
VK_G          = CE_defines.virtual_key_codes.VK_G
VK_H          = CE_defines.virtual_key_codes.VK_H
VK_I          = CE_defines.virtual_key_codes.VK_I
VK_J          = CE_defines.virtual_key_codes.VK_J
VK_K          = CE_defines.virtual_key_codes.VK_K
VK_L          = CE_defines.virtual_key_codes.VK_L
VK_M          = CE_defines.virtual_key_codes.VK_M
VK_N          = CE_defines.virtual_key_codes.VK_N
VK_O          = CE_defines.virtual_key_codes.VK_O
VK_P          = CE_defines.virtual_key_codes.VK_P
VK_Q          = CE_defines.virtual_key_codes.VK_Q
VK_R          = CE_defines.virtual_key_codes.VK_R
VK_S          = CE_defines.virtual_key_codes.VK_S
VK_T          = CE_defines.virtual_key_codes.VK_T
VK_U          = CE_defines.virtual_key_codes.VK_U
VK_V          = CE_defines.virtual_key_codes.VK_V
VK_W          = CE_defines.virtual_key_codes.VK_W
VK_X          = CE_defines.virtual_key_codes.VK_X
VK_Y          = CE_defines.virtual_key_codes.VK_Y
VK_Z          = CE_defines.virtual_key_codes.VK_Z
VK_LWIN       = CE_defines.virtual_key_codes.VK_LWIN
VK_RWIN       = CE_defines.virtual_key_codes.VK_RWIN
VK_APPS       = CE_defines.virtual_key_codes.VK_APPS
VK_NUMPAD0    = CE_defines.virtual_key_codes.VK_NUMPAD0
VK_NUMPAD1    = CE_defines.virtual_key_codes.VK_NUMPAD1
VK_NUMPAD2    = CE_defines.virtual_key_codes.VK_NUMPAD2
VK_NUMPAD3    = CE_defines.virtual_key_codes.VK_NUMPAD3
VK_NUMPAD4    = CE_defines.virtual_key_codes.VK_NUMPAD4
VK_NUMPAD5    = CE_defines.virtual_key_codes.VK_NUMPAD5
VK_NUMPAD6    = CE_defines.virtual_key_codes.VK_NUMPAD6
VK_NUMPAD7    = CE_defines.virtual_key_codes.VK_NUMPAD7
VK_NUMPAD8    = CE_defines.virtual_key_codes.VK_NUMPAD8
VK_NUMPAD9    = CE_defines.virtual_key_codes.VK_NUMPAD9
VK_MULTIPLY   = CE_defines.virtual_key_codes.VK_MULTIPLY
VK_ADD        = CE_defines.virtual_key_codes.VK_ADD
VK_SEPARATOR  = CE_defines.virtual_key_codes.VK_SEPARATOR
VK_SUBTRACT   = CE_defines.virtual_key_codes.VK_SUBTRACT
VK_DECIMAL    = CE_defines.virtual_key_codes.VK_DECIMAL
VK_DIVIDE     = CE_defines.virtual_key_codes.VK_DIVIDE
VK_F1         = CE_defines.virtual_key_codes.VK_F1
VK_F2         = CE_defines.virtual_key_codes.VK_F2
VK_F3         = CE_defines.virtual_key_codes.VK_F3
VK_F4         = CE_defines.virtual_key_codes.VK_F4
VK_F5         = CE_defines.virtual_key_codes.VK_F5
VK_F6         = CE_defines.virtual_key_codes.VK_F6
VK_F7         = CE_defines.virtual_key_codes.VK_F7
VK_F8         = CE_defines.virtual_key_codes.VK_F8
VK_F9         = CE_defines.virtual_key_codes.VK_F9
VK_F10        = CE_defines.virtual_key_codes.VK_F10
VK_F11        = CE_defines.virtual_key_codes.VK_F11
VK_F12        = CE_defines.virtual_key_codes.VK_F12
VK_F13        = CE_defines.virtual_key_codes.VK_F13
VK_F14        = CE_defines.virtual_key_codes.VK_F14
VK_F15        = CE_defines.virtual_key_codes.VK_F15
VK_F16        = CE_defines.virtual_key_codes.VK_F16
VK_F17        = CE_defines.virtual_key_codes.VK_F17
VK_F18        = CE_defines.virtual_key_codes.VK_F18
VK_F19        = CE_defines.virtual_key_codes.VK_F19
VK_F20        = CE_defines.virtual_key_codes.VK_F20
VK_F21        = CE_defines.virtual_key_codes.VK_F21
VK_F22        = CE_defines.virtual_key_codes.VK_F22
VK_F23        = CE_defines.virtual_key_codes.VK_F23
VK_F24        = CE_defines.virtual_key_codes.VK_F24
VK_NUMLOCK    = CE_defines.virtual_key_codes.VK_NUMLOCK
VK_SCROLL     = CE_defines.virtual_key_codes.VK_SCROLL
VK_LSHIFT     = CE_defines.virtual_key_codes.VK_LSHIFT
VK_LCONTROL   = CE_defines.virtual_key_codes.VK_LCONTROL
VK_LMENU      = CE_defines.virtual_key_codes.VK_LMENU
VK_RSHIFT     = CE_defines.virtual_key_codes.VK_RSHIFT
VK_RCONTROL   = CE_defines.virtual_key_codes.VK_RCONTROL
VK_RMENU      = CE_defines.virtual_key_codes.VK_RMENU
VK_OEM1       = CE_defines.virtual_key_codes.VK_OEM1
VK_OEM2       = CE_defines.virtual_key_codes.VK_OEM2
VK_OEM3       = CE_defines.virtual_key_codes.VK_OEM3


----------------------------------- Shell Execute Show -----------------------------------

SW_HIDE             = CE_defines.shell_execute_view_options.SW_HIDE
SW_MAXIMIZE         = CE_defines.shell_execute_view_options.SW_MAXIMIZE
SW_MINIMIZE         = CE_defines.shell_execute_view_options.SW_MINIMIZE
SW_NORMAL           = CE_defines.shell_execute_view_options.SW_NORMAL
SW_RESTORE          = CE_defines.shell_execute_view_options.SW_RESTORE
SW_SHOW             = CE_defines.shell_execute_view_options.SW_SHOW
SW_SHOWDEFAULT      = CE_defines.shell_execute_view_options.SW_SHOWDEFAULT
SW_SHOWMAXIMIZED    = CE_defines.shell_execute_view_options.SW_SHOWMAXIMIZED
SW_SHOWMINIMIZED    = CE_defines.shell_execute_view_options.SW_SHOWMINIMIZED
SW_SHOWMINNOACTIVE  = CE_defines.shell_execute_view_options.SW_SHOWMINNOACTIVE
SW_SHOWNA           = CE_defines.shell_execute_view_options.SW_SHOWNA
SW_SHOWNOACTIVATE   = CE_defines.shell_execute_view_options.SW_SHOWNOACTIVATE
SW_SHOWNORMAL       = CE_defines.shell_execute_view_options.SW_SHOWNORMAL


----------------------------------- Pixel Format -----------------------------------

pfDevice  = CE_defines.pixel_formats.pfDevice
pf1bit    = CE_defines.pixel_formats.pf1bit
pf4bit    = CE_defines.pixel_formats.pf4bit
pf8bit    = CE_defines.pixel_formats.pf8bit
pf15bit   = CE_defines.pixel_formats.pf15bit
pf16bit   = CE_defines.pixel_formats.pf16bit
pf24bit   = CE_defines.pixel_formats.pf24bit
pf32bit   = CE_defines.pixel_formats.pf32bit
pfCustom  = CE_defines.pixel_formats.pfCustom


----------------------------------- Disassembler Value Type -----------------------------------

dvtNone     = CE_defines.disassembler_value_types.dvtNone
dvtAddress  = CE_defines.disassembler_value_types.dvtAddress
dvtValue    = CE_defines.disassembler_value_types.dvtValue


----------------------------------- Dissect Code -----------------------------------

jtCall          = CE_defines.dissect_code_types.jtCall
jtUnconditional = CE_defines.dissect_code_types.jtUnconditional
jtConditional   = CE_defines.dissect_code_types.jtConditional
jtMemory        = CE_defines.dissect_code_types.jtMemory


----------------------------------- Register Symbol Lookup Callback -----------------------------------

slStart                 = CE_defines.symbol_lookup_steps.slStart
slNotInt                = CE_defines.symbol_lookup_steps.slNotInt
slNotModule             = CE_defines.symbol_lookup_steps.slNotModule
slNotUserdefinedSymbol  = CE_defines.symbol_lookup_steps.slNotUserdefinedSymbol
slNotSymbol             = CE_defines.symbol_lookup_steps.slNotSymbol
slFailure               = CE_defines.symbol_lookup_steps.slFailure


----------------------------------- ??? -----------------------------------

poDesigned        = 0
poDefault         = 1
poDefaultPosOnly  = 2
poDefaultSizeOnly = 3
poScreenCenter    = 4
poDesktopCenter   = 5
poMainFormCenter  = 6
poOwnerFormCenter = 7


----------------------------------- ??? -----------------------------------

asrTop = 0
asrBottom = 1
asrCenter = 2
asrLeft = asrTop
asrRight = asrBottom


----------------------------------- ??? -----------------------------------

vsIcon = 0
vsSmallIcon = 1
vsList = 2
vsReport = 3


----------------------------------- Layered Window Attributes -----------------------------------

LWA_COLORKEY  = CE_defines.layered_window_attributes.LWA_COLORKEY
LWA_ALPHA     = CE_defines.layered_window_attributes.LWA_ALPHA


----------------------------------- ??? -----------------------------------

GW_HWNDFIRST = 0
GW_HWNDLAST = 1
GW_HWNDNEXT = 2
GW_HWNDPREV = 3
GW_HWNDOWNER = 4
GW_OWNER = 4
GW_CHILD = 5
GW_ENABLEDPOPUP = 6


----------------------------------- Memory Record Hotkey -----------------------------------

mrhToggleActivation               = CE_defines.memory_record_hotkey_actions.mrhToggleActivation
mrhToggleActivationAllowIncrease  = CE_defines.memory_record_hotkey_actions.mrhToggleActivationAllowIncrease
mrhToggleActivationAllowDecrease  = CE_defines.memory_record_hotkey_actions.mrhToggleActivationAllowDecrease
mrhActivate                       = CE_defines.memory_record_hotkey_actions.mrhActivate
mrhDeactivate                     = CE_defines.memory_record_hotkey_actions.mrhDeactivate
mrhSetValue                       = CE_defines.memory_record_hotkey_actions.mrhSetValue
mrhIncreaseValue                  = CE_defines.memory_record_hotkey_actions.mrhIncreaseValue
mrhDecreaseValue                  = CE_defines.memory_record_hotkey_actions.mrhDecreaseValue


----------------------------------- Mouse Event Flags -----------------------------------

MOUSEEVENTF_MOVE        = CE_defines.mouse_event_flags.MOUSEEVENTF_MOVE
MOUSEEVENTF_LEFTDOWN    = CE_defines.mouse_event_flags.MOUSEEVENTF_LEFTDOWN
MOUSEEVENTF_LEFTUP      = CE_defines.mouse_event_flags.MOUSEEVENTF_LEFTUP
MOUSEEVENTF_RIGHTDOWN   = CE_defines.mouse_event_flags.MOUSEEVENTF_RIGHTDOWN
MOUSEEVENTF_RIGHTUP     = CE_defines.mouse_event_flags.MOUSEEVENTF_RIGHTUP
MOUSEEVENTF_MIDDLEDOWN  = CE_defines.mouse_event_flags.MOUSEEVENTF_MIDDLEDOWN
MOUSEEVENTF_MIDDLEUP    = CE_defines.mouse_event_flags.MOUSEEVENTF_MIDDLEUP
MOUSEEVENTF_XDOWN       = CE_defines.mouse_event_flags.MOUSEEVENTF_XDOWN
MOUSEEVENTF_XUP         = CE_defines.mouse_event_flags.MOUSEEVENTF_XUP
MOUSEEVENTF_WHEEL       = CE_defines.mouse_event_flags.MOUSEEVENTF_WHEEL
MOUSEEVENTF_HWHEEL      = CE_defines.mouse_event_flags.MOUSEEVENTF_HWHEEL
MOUSEEVENTF_ABSOLUTE    = CE_defines.mouse_event_flags.MOUSEEVENTF_ABSOLUTE


----------------------------------- Speech Flags -----------------------------------

SPF_DEFAULT	          = CE_defines.speech_flags.SPF_DEFAULT
SPF_ASYNC	            = CE_defines.speech_flags.SPF_ASYNC
SPF_PURGEBEFORESPEAK	= CE_defines.speech_flags.SPF_PURGEBEFORESPEAK
SPF_IS_FILENAME	      = CE_defines.speech_flags.SPF_IS_FILENAME
SPF_IS_XML	          = CE_defines.speech_flags.SPF_IS_XML
SPF_IS_NOT_XML	      = CE_defines.speech_flags.SPF_IS_NOT_XML
SPF_PERSIST_XML	      = CE_defines.speech_flags.SPF_PERSIST_XML
SPF_NLP_SPEAK_PUNC	  = CE_defines.speech_flags.SPF_NLP_SPEAK_PUNC
SPF_PARSE_SAPI	      = CE_defines.speech_flags.SPF_PARSE_SAPI
SPF_PARSE_SSML	      = CE_defines.speech_flags.SPF_PARSE_SSML
SPF_PARSE_AUTODETECT	= CE_defines.speech_flags.SPF_PARSE_AUTODETECT


----------------------------------- Events Wait For -----------------------------------

wrSignaled  = CE_defines.event_wait_results.wrSignaled
wrTimeout   = CE_defines.event_wait_results.wrTimeout
wrAbandoned = CE_defines.event_wait_results.wrAbandoned
wrError     = CE_defines.event_wait_results.wrError


----------------------------------- Fill Types -----------------------------------

fsSurface = 0
fsBorder  = 1


----------------------------------- Custom Draw Settings -----------------------------------

cdsSelected       = CE_defines.custom_draw_settings.cdsSelected
cdsGrayed         = CE_defines.custom_draw_settings.cdsGrayed
cdsDisabled       = CE_defines.custom_draw_settings.cdsDisabled
cdsChecked        = CE_defines.custom_draw_settings.cdsChecked
cdsFocused        = CE_defines.custom_draw_settings.cdsFocused
cdsDefault        = CE_defines.custom_draw_settings.cdsDefault
cdsHot            = CE_defines.custom_draw_settings.cdsHot
cdsMarked         = CE_defines.custom_draw_settings.cdsMarked
cdsIndeterminate  = CE_defines.custom_draw_settings.cdsIndeterminate


----------------------------------- ??? -----------------------------------

cdPrePaint  = 0
cdPostPaint = 1
cdPreErase  = 2
cdPostErase = 3


----------------------------------- Display Rectangle Codes -----------------------------------

drBounds        = CE_defines.display_rectangle_codes.drBounds
drIcon          = CE_defines.display_rectangle_codes.drIcon
drLabel         = CE_defines.display_rectangle_codes.drLabel
drSelectBounds  = CE_defines.display_rectangle_codes.drSelectBounds


----------------------------------- File Stream Modes -----------------------------------

fmCreate        = CE_defines.file_stream_modes.fmCreate
fmOpenRead      = CE_defines.file_stream_modes.fmOpenRead
fmOpenWrite     = CE_defines.file_stream_modes.fmOpenWrite
fmOpenReadWrite = CE_defines.file_stream_modes.fmOpenReadWrite

fmShareCompat   = CE_defines.file_stream_modes.fmShareCompat
fmShareExclusive= CE_defines.file_stream_modes.fmShareExclusive
fmShareDenyWrite= CE_defines.file_stream_modes.fmShareDenyWrite
fmShareDenyRead = CE_defines.file_stream_modes.fmShareDenyRead
fmShareDenyNone = CE_defines.file_stream_modes.fmShareDenyNone


----------------------------------- ??? -----------------------------------

crDefault     = 0
crNone        = -1
crArrow       = -2
crCross       = -3
crIBeam       = -4
crSize        = -22
crSizeNESW    = -6
crSizeNS      = -7
crSizeNWSE    = -8
crSizeWE      = -9
crSizeNW      = -23
crSizeN       = -24
crSizeNE      = -25
crSizeW       = -26
crSizeE       = -27
crSizeSW      = -28
crSizeS       = -29
crSizeSE      = -30
crUpArrow     = -10
crHourGlass   = -11
crDrag        = -12
crNoDrop      = -13
crHSplit      = -14
crVSplit      = -15
crMultiDrag   = -16
crSQLWait     = -17
crNo          = -18
crAppStart    = -19
crHelp        = -20
crHandPoint   = -21
crSizeAll     = -22


----------------------------------- Colors -----------------------------------

CLR_NONE                      = CE_defines.colors.CLR_NONE
CLR_DEFAULT                   = CE_defines.colors.CLR_DEFAULT
CLR_INVALID                   = CE_defines.colors.CLR_INVALID

COLOR_SCROLLBAR               = CE_defines.colors.COLOR_SCROLLBAR
COLOR_BACKGROUND              = CE_defines.colors.COLOR_BACKGROUND
COLOR_ACTIVECAPTION           = CE_defines.colors.COLOR_ACTIVECAPTION
COLOR_INACTIVECAPTION         = CE_defines.colors.COLOR_INACTIVECAPTION
COLOR_MENU                    = CE_defines.colors.COLOR_MENU
COLOR_WINDOW                  = CE_defines.colors.COLOR_WINDOW
COLOR_WINDOWFRAME             = CE_defines.colors.COLOR_WINDOWFRAME
COLOR_MENUTEXT                = CE_defines.colors.COLOR_MENUTEXT
COLOR_WINDOWTEXT              = CE_defines.colors.COLOR_WINDOWTEXT
COLOR_CAPTIONTEXT             = CE_defines.colors.COLOR_CAPTIONTEXT
COLOR_ACTIVEBORDER            = CE_defines.colors.COLOR_ACTIVEBORDER
COLOR_INACTIVEBORDER          = CE_defines.colors.COLOR_INACTIVEBORDER
COLOR_APPWORKSPACE            = CE_defines.colors.COLOR_APPWORKSPACE
COLOR_HIGHLIGHT               = CE_defines.colors.COLOR_HIGHLIGHT
COLOR_HIGHLIGHTTEXT           = CE_defines.colors.COLOR_HIGHLIGHTTEXT
COLOR_BTNFACE                 = CE_defines.colors.COLOR_BTNFACE
COLOR_BTNSHADOW               = CE_defines.colors.COLOR_BTNSHADOW
COLOR_GRAYTEXT                = CE_defines.colors.COLOR_GRAYTEXT
COLOR_BTNTEXT                 = CE_defines.colors.COLOR_BTNTEXT
COLOR_INACTIVECAPTIONTEXT     = CE_defines.colors.COLOR_INACTIVECAPTIONTEXT
COLOR_BTNHIGHLIGHT            = CE_defines.colors.COLOR_BTNHIGHLIGHT
COLOR_3DDKSHADOW              = CE_defines.colors.COLOR_3DDKSHADOW
COLOR_3DLIGHT                 = CE_defines.colors.COLOR_3DLIGHT
COLOR_INFOTEXT                = CE_defines.colors.COLOR_INFOTEXT
COLOR_INFOBK                  = CE_defines.colors.COLOR_INFOBK
COLOR_HOTLIGHT                = CE_defines.colors.COLOR_HOTLIGHT
COLOR_GRADIENTACTIVECAPTION   = CE_defines.colors.COLOR_GRADIENTACTIVECAPTION
COLOR_GRADIENTINACTIVECAPTION = CE_defines.colors.COLOR_GRADIENTINACTIVECAPTION
COLOR_MENUHILIGHT             = CE_defines.colors.COLOR_MENUHILIGHT
COLOR_MENUBAR                 = CE_defines.colors.COLOR_MENUBAR

COLOR_FORM                    = CE_defines.colors.COLOR_FORM

COLOR_ENDCOLORS               = CE_defines.colors.COLOR_ENDCOLORS

COLOR_DESKTOP                 = CE_defines.colors.COLOR_DESKTOP
COLOR_3DFACE                  = CE_defines.colors.COLOR_3DFACE
COLOR_3DSHADOW                = CE_defines.colors.COLOR_3DSHADOW
COLOR_3DHIGHLIGHT             = CE_defines.colors.COLOR_3DHIGHLIGHT
COLOR_3DHILIGHT               = CE_defines.colors.COLOR_3DHILIGHT
COLOR_BTNHILIGHT              = CE_defines.colors.COLOR_BTNHILIGHT

MAX_SYS_COLORS                = CE_defines.colors.MAX_SYS_COLORS
SYS_COLOR_BASE                = CE_defines.colors.SYS_COLOR_BASE

clBlack                       = CE_defines.colors.clBlack
clMaroon                      = CE_defines.colors.clMaroon
clGreen                       = CE_defines.colors.clGreen
clOlive                       = CE_defines.colors.clOlive
clNavy                        = CE_defines.colors.clNavy
clPurple                      = CE_defines.colors.clPurple
clTeal                        = CE_defines.colors.clTeal
clGray                        = CE_defines.colors.clGray
clSilver                      = CE_defines.colors.clSilver
clRed                         = CE_defines.colors.clRed
clLime                        = CE_defines.colors.clLime
clYellow                      = CE_defines.colors.clYellow
clBlue                        = CE_defines.colors.clBlue
clFuchsia                     = CE_defines.colors.clFuchsia
clAqua                        = CE_defines.colors.clAqua
clLtGray                      = CE_defines.colors.clLtGray
clDkGray                      = CE_defines.colors.clDkGray
clWhite                       = CE_defines.colors.clWhite
StandardColorsCount           = CE_defines.colors.StandardColorsCount

clMoneyGreen                  = CE_defines.colors.clMoneyGreen
clSkyBlue                     = CE_defines.colors.clSkyBlue
clCream                       = CE_defines.colors.clCream
clMedGray                     = CE_defines.colors.clMedGray
ExtendedColorCount            = CE_defines.colors.ExtendedColorCount

-- special colors
clNone                        = CE_defines.colors.clNone
clDefault                     = CE_defines.colors.clDefault

-- system colors
clScrollBar                   = CE_defines.colors.clScrollBar
clBackground                  = CE_defines.colors.clBackground
clActiveCaption               = CE_defines.colors.clActiveCaption
clInactiveCaption             = CE_defines.colors.clInactiveCaption
clMenu                        = CE_defines.colors.clMenu
clWindow                      = CE_defines.colors.clWindow
clWindowFrame                 = CE_defines.colors.clWindowFrame
clMenuText                    = CE_defines.colors.clMenuText
clWindowText                  = CE_defines.colors.clWindowText
clCaptionText                 = CE_defines.colors.clCaptionText
clActiveBorder                = CE_defines.colors.clActiveBorder
clInactiveBorder              = CE_defines.colors.clInactiveBorder
clAppWorkspace                = CE_defines.colors.clAppWorkspace
clHighlight                   = CE_defines.colors.clHighlight
clHighlightText               = CE_defines.colors.clHighlightText
clBtnFace                     = CE_defines.colors.clBtnFace
clBtnShadow                   = CE_defines.colors.clBtnShadow
clGrayText                    = CE_defines.colors.clGrayText
clBtnText                     = CE_defines.colors.clBtnText
clInactiveCaptionText         = CE_defines.colors.clInactiveCaptionText
clBtnHighlight                = CE_defines.colors.clBtnHighlight
cl3DDkShadow                  = CE_defines.colors.cl3DDkShadow
cl3DLight                     = CE_defines.colors.cl3DLight
clInfoText                    = CE_defines.colors.clInfoText
clInfoBk                      = CE_defines.colors.clInfoBk

clHotLight                    = CE_defines.colors.clHotLight
clGradientActiveCaption       = CE_defines.colors.clGradientActiveCaption
clGradientInactiveCaption     = CE_defines.colors.clGradientInactiveCaption
clMenuHighlight               = CE_defines.colors.clMenuHighlight
clMenuBar                     = CE_defines.colors.clMenuBar
clForm                        = CE_defines.colors.clForm

-- synonyms: do not show them in color lists
clColorDesktop                = CE_defines.colors.clColorDesktop
cl3DFace                      = CE_defines.colors.cl3DFace
cl3DShadow                    = CE_defines.colors.cl3DShadow
cl3DHiLight                   = CE_defines.colors.cl3DHiLight
clBtnHiLight                  = CE_defines.colors.clBtnHiLight

clFirstSpecialColor           = CE_defines.colors.clFirstSpecialColor

clMask                        = CE_defines.colors.clMask
clDontMask                    = CE_defines.colors.clDontMask


----------------------------------- Pen Mode -----------------------------------

pmBlack       = CE_defines.pen_modes.pmBlack
pmWhite       = CE_defines.pen_modes.pmWhite
pmNop         = CE_defines.pen_modes.pmNop
pmNot         = CE_defines.pen_modes.pmNot
pmCopy        = CE_defines.pen_modes.pmCopy
pmNotCopy     = CE_defines.pen_modes.pmNotCopy
pmMergePenNot = CE_defines.pen_modes.pmMergePenNot
pmMaskPenNot  = CE_defines.pen_modes.pmMaskPenNot
pmMergeNotPen = CE_defines.pen_modes.pmMergeNotPen
pmMaskNotPen  = CE_defines.pen_modes.pmMaskNotPen
pmMerge       = CE_defines.pen_modes.pmMerge
pmNotMerge    = CE_defines.pen_modes.pmNotMerge
pmMask        = CE_defines.pen_modes.pmMask
pmNotMask     = CE_defines.pen_modes.pmNotMask
pmXor         = CE_defines.pen_modes.pmXor
pmNotXor      = CE_defines.pen_modes.pmNotXor


----------------------------------- Task Progress States -----------------------------------

tbpsNone          = CE_defines.task_progress_states.tbpsNone
tbpsIndeterminate = CE_defines.task_progress_states.tbpsIndeterminate
tbpsNormal        = CE_defines.task_progress_states.tbpsNormal
tbpsError         = CE_defines.task_progress_states.tbpsError
tbpsPaused        = CE_defines.task_progress_states.tbpsPaused
