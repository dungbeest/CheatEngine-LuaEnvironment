---@meta

---@alias SystemMetricsIndex integer
---| 56 # SM_ARRANGE: The flags that specify how the system arranged minimized windows. 
---| 67 # SM_CLEANBOOT: The value that specifies how the system is started: 0 - Normal boot, 1 - Fail-safe boot, 2 - Fail-safe with network boot. A fail-safe boot (also called SafeBoot, Safe Mode, or Clean Boot) bypasses the user startup files. 
---| 80 # SM_CMONITORS: The number of display monitors on a desktop.
---| 43 # SM_CMOUSEBUTTONS: The number of buttons on a mouse, or zero if no mouse is installed. 
---| 8,195 # SM_CONVERTIBLESLATEMODE: Reflects the state of the laptop or slate mode, 0 for Slate Mode and non-zero otherwise. When this system metric changes, the system sends a broadcast message via WM_SETTINGCHANGE with "ConvertibleSlateMode" in the LPARAM. Note that this system metric doesn't apply to desktop PCs. In that case, use GetAutoRotationState. 
---| 5 # SM_CXBORDER: The width of a window border, in pixels. This is equivalent to the SM_CXEDGE value for windows with the 3-D look. 
---| 13 # SM_CXCURSOR: The width of a cursor, in pixels. The system cannot create cursors of other sizes.
---| 7 # SM_CXDLGFRAME: This value is the same as SM_CXFIXEDFRAME.
---| 36 # SM_CXDOUBLECLK: The width of the rectangle around the location of a first click in a double-click sequence, in pixels. The second click must occur within the rectangle that is defined by SM_CXDOUBLECLK and SM_CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur within a specified time. To set the width of the double-click rectangle, call SystemParametersInfo with SPI_SETDOUBLECLKWIDTH.
---| 68 # SM_CXDRAG: The number of pixels on either side of a mouse-down point that the mouse pointer can move before a drag operation begins. This allows the user to click and release the mouse button easily without unintentionally starting a drag operation. If this value is negative, it is subtracted from the left of the mouse-down point and added to the right of it. 
---| 45 # SM_CXEDGE: The width of a 3-D border, in pixels. This metric is the 3-D counterpart of SM_CXBORDER.
---| 7 # SM_CXFIXEDFRAME: The width of the left and right edges of the focus rectangle that the DrawFocusRect draws. This value is in pixels.
---| 32 # SM_CXFRAME: This value is the same as SM_CXSIZEFRAME.
---@source https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getsystemmetrics

---@enum VirtualKeyCodes
CE_defines.virtual_key_codes = {
  VK_LBUTTON    = 1,
  VK_RBUTTON    = 2,
  VK_CANCEL     = 3,
  VK_MBUTTON    = 4,
  VK_XBUTTON1   = 5,
  VK_XBUTTON2   = 6,
  VK_BACK       = 8,
  VK_TAB        = 9,
  VK_CLEAR      = 12,
  VK_RETURN     = 13,
  VK_SHIFT      = 16,
  VK_CONTROL    = 17,
  VK_MENU       = 18,
  VK_PAUSE      = 19,
  VK_CAPITAL    = 20,
  VK_ESCAPE     = 27,
  VK_SPACE      = 32,
  VK_PRIOR      = 33,
  VK_NEXT       = 34,
  VK_END        = 35,
  VK_HOME       = 36,
  VK_LEFT       = 37,
  VK_UP         = 38,
  VK_RIGHT      = 39,
  VK_DOWN       = 40,
  VK_SELECT     = 41,
  VK_PRINT      = 42,
  VK_EXECUTE    = 43,
  VK_SNAPSHOT   = 44,
  VK_INSERT     = 45,
  VK_DELETE     = 46,
  VK_HELP       = 47,
  VK_0          = 48,
  VK_1          = 49,
  VK_2          = 50,
  VK_3          = 51,
  VK_4          = 52,
  VK_5          = 53,
  VK_6          = 54,
  VK_7          = 55,
  VK_8          = 56,
  VK_9          = 57,
  VK_A          = 65,
  VK_B          = 66,
  VK_C          = 67,
  VK_D          = 68,
  VK_E          = 69,
  VK_F          = 70,
  VK_G          = 71,
  VK_H          = 72,
  VK_I          = 73,
  VK_J          = 74,
  VK_K          = 75,
  VK_L          = 76,
  VK_M          = 77,
  VK_N          = 78,
  VK_O          = 79,
  VK_P          = 80,
  VK_Q          = 81,
  VK_R          = 82,
  VK_S          = 83,
  VK_T          = 84,
  VK_U          = 85,
  VK_V          = 86,
  VK_W          = 87,
  VK_X          = 88,
  VK_Y          = 89,
  VK_Z          = 90,
  VK_LWIN       = 91,
  VK_RWIN       = 92,
  VK_APPS       = 93,
  VK_NUMPAD0    = 96,
  VK_NUMPAD1    = 97,
  VK_NUMPAD2    = 98,
  VK_NUMPAD3    = 99,
  VK_NUMPAD4    = 100,
  VK_NUMPAD5    = 101,
  VK_NUMPAD6    = 102,
  VK_NUMPAD7    = 103,
  VK_NUMPAD8    = 104,
  VK_NUMPAD9    = 105,
  VK_MULTIPLY   = 106,
  VK_ADD        = 107,
  VK_SEPARATOR  = 108,
  VK_SUBTRACT   = 109,
  VK_DECIMAL    = 110,
  VK_DIVIDE     = 111,
  VK_F1         = 112,
  VK_F2         = 113,
  VK_F3         = 114,
  VK_F4         = 115,
  VK_F5         = 116,
  VK_F6         = 117,
  VK_F7         = 118,
  VK_F8         = 119,
  VK_F9         = 120,
  VK_F10        = 121,
  VK_F11        = 122,
  VK_F12        = 123,
  VK_F13        = 124,
  VK_F14        = 125,
  VK_F15        = 126,
  VK_F16        = 127,
  VK_F17        = 128,
  VK_F18        = 129,
  VK_F19        = 130,
  VK_F20        = 131,
  VK_F21        = 132,
  VK_F22        = 133,
  VK_F23        = 134,
  VK_F24        = 135,
  VK_NUMLOCK    = 144,
  VK_SCROLL     = 145,
  VK_LSHIFT     = 160,
  VK_LCONTROL   = 162,
  VK_LMENU      = 164,
  VK_RSHIFT     = 161,
  VK_RCONTROL   = 163,
  VK_RMENU      = 165,
  VK_OEM1       = 0xBA,
  VK_OEM2       = 0xBF,
  VK_OEM3       = 0xC0,
}

---@alias VirtualKeyCode byte
---| 1 # VK_LBUTTON: Left Mouse Button
---| 2 # VK_RBUTTON: Right Mouse Button
---| 3 # VK_CANCEL: Control-break processing
---| 4 # VK_MBUTTON: Middle mouse button (three-button mouse)
---| 5 # VK_XBUTTON1: X1 Mouse Button
---| 6 # VK_XBUTTON2: X2 Mouse Button
---| 8 # VK_BACK: BACKSPACE Key
---| 9 # VK_TAB: Tab Key
---| 12 # VK_CLEAR: CLEAR Key
---| 13 # VK_RETURN: ENTER Key
---| 16 # VK_SHIFT: SHIFT Key
---| 17 # VK_CONTROL
---| 18 # VK_MENU
---| 19 # VK_PAUSE
---| 20 # VK_CAPITAL
---| 27 # VK_ESCAPE
---| 32 # VK_SPACE
---| 33 # VK_PRIOR
---| 34 # VK_NEXT
---| 35 # VK_END
---| 36 # VK_HOME
---| 37 # VK_LEFT
---| 38 # VK_UP
---| 39 # VK_RIGHT
---| 40 # VK_DOWN
---| 41 # VK_SELECT
---| 42 # VK_PRINT
---| 43 # VK_EXECUTE
---| 44 # VK_SNAPSHOT
---| 45 # VK_INSERT
---| 46 # VK_DELETE
---| 47 # VK_HELP
---| 48 # VK_0
---| 49 # VK_1
---| 50 # VK_2
---| 51 # VK_3
---| 52 # VK_4
---| 53 # VK_5
---| 54 # VK_6
---| 55 # VK_7
---| 56 # VK_8
---| 57 # VK_9
---| 65 # VK_A
---| 66 # VK_B
---| 67 # VK_C
---| 68 # VK_D
---| 69 # VK_E
---| 70 # VK_F
---| 71 # VK_G
---| 72 # VK_H
---| 73 # VK_I
---| 74 # VK_J
---| 75 # VK_K
---| 76 # VK_L
---| 77 # VK_M
---| 78 # VK_N
---| 79 # VK_O
---| 80 # VK_P
---| 81 # VK_Q
---| 82 # VK_R
---| 83 # VK_S
---| 84 # VK_T
---| 85 # VK_U
---| 86 # VK_V
---| 87 # VK_W
---| 88 # VK_X
---| 89 # VK_Y
---| 90 # VK_Z
---| 91 # VK_LWIN
---| 92 # VK_RWIN
---| 93 # VK_APPS
---| 96 # VK_NUMPAD0
---| 97 # VK_NUMPAD1
---| 98 # VK_NUMPAD2
---| 99 # VK_NUMPAD3
---| 100 # VK_NUMPAD4
---| 101 # VK_NUMPAD5
---| 102 # VK_NUMPAD6
---| 103 # VK_NUMPAD7
---| 104 # VK_NUMPAD8
---| 105 # VK_NUMPAD9
---| 106 # VK_MULTIPLY
---| 107 # VK_ADD
---| 108 # VK_SEPARATOR
---| 109 # VK_SUBTRACT
---| 110 # VK_DECIMAL
---| 111 # VK_DIVIDE
---| 112 # VK_F1
---| 113 # VK_F2
---| 114 # VK_F3
---| 115 # VK_F4
---| 116 # VK_F5
---| 117 # VK_F6
---| 118 # VK_F7
---| 119 # VK_F8
---| 120 # VK_F9
---| 121 # VK_F10
---| 122 # VK_F11
---| 123 # VK_F12
---| 124 # VK_F13
---| 125 # VK_F14
---| 126 # VK_F15
---| 127 # VK_F16
---| 128 # VK_F17
---| 129 # VK_F18
---| 130 # VK_F19
---| 131 # VK_F20
---| 132 # VK_F21
---| 133 # VK_F22
---| 134 # VK_F23
---| 135 # VK_F24
---| 144 # VK_NUMLOCK
---| 145 # VK_SCROLL
---| 160 # VK_LSHIFT
---| 162 # VK_LCONTROL
---| 164 # VK_LMENU
---| 161 # VK_RSHIFT
---| 163 # VK_RCONTROL
---| 165 # VK_RMENU    
---| 0xBA # VK_OEM1
---| 0xBF # VK_OEM2
---| 0xc0 # VK_OEM3
---@source https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes


---@enum MouseEventFlags
CE_defines.mouse_event_flags = {
  MOUSEEVENTF_MOVE        = 0x0001,
  MOUSEEVENTF_LEFTDOWN    = 0x0002,
  MOUSEEVENTF_LEFTUP      = 0x0004,
  MOUSEEVENTF_RIGHTDOWN   = 0x0008,
  MOUSEEVENTF_RIGHTUP     = 0x0010,
  MOUSEEVENTF_MIDDLEDOWN  = 0x0020,
  MOUSEEVENTF_MIDDLEUP    = 0x0040,
  MOUSEEVENTF_XDOWN       = 0x0080,
  MOUSEEVENTF_XUP         = 0x0100,
  MOUSEEVENTF_WHEEL       = 0x0800,
  MOUSEEVENTF_HWHEEL      = 0x1000,
  MOUSEEVENTF_ABSOLUTE    = 0x8000,
}

---@alias MouseEventFlag dword
---@source https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-mouse_event
---| 0x0001 # MOUSEEVENTF_MOVE ->
---| 0x0002 # MOUSEEVENTF_LEFTDOWN ->
---| 0x0004 # MOUSEEVENTF_LEFTUP ->
---| 0x0008 # MOUSEEVENTF_RIGHTDOWN ->
---| 0x0010 # MOUSEEVENTF_RIGHTUP ->
---| 0x0020 # MOUSEEVENTF_MIDDLEDOWN ->
---| 0x0040 # MOUSEEVENTF_MIDDLEUP ->
---| 0x0080 # MOUSEEVENTF_XDOWN ->
---| 0x0100 # MOUSEEVENTF_XUP ->
---| 0x0800 # MOUSEEVENTF_WHEEL ->
---| 0x1000 # MOUSEEVENTF_HWHEEL ->
---| 0x8000 # MOUSEEVENTF_ABSOLUTE ->



---@enum SpeechFlags
CE_defines.speech_flags = {
  SPF_DEFAULT	          = 0,
  SPF_ASYNC	            = ( 1 << 0 ),
  SPF_PURGEBEFORESPEAK	= ( 1 << 1 ),
  SPF_IS_FILENAME	      = ( 1 << 2 ),
  SPF_IS_XML	          = ( 1 << 3 ),
  SPF_IS_NOT_XML	      = ( 1 << 4 ),
  SPF_PERSIST_XML	      = ( 1 << 5 ),
  SPF_NLP_SPEAK_PUNC	  = ( 1 << 6 ),
  SPF_PARSE_SAPI	      = ( 1 << 7 ),
  SPF_PARSE_SSML	      = ( 1 << 8 ),
  SPF_PARSE_AUTODETECT  = 0,
}

---Text to speech "Speak" params
---@alias SpeechFlag integer
---@source https://learn.microsoft.com/en-us/previous-versions/office/developer/speech-technologies/jj127460(v=msdn.10)
---| 0 # SPF_DEFAULT, SPF_PARSE_AUTODETECT ->
---| 1 # SPF_ASYNC ->
---| 2 # SPF_PURGEBEFORESPEAK ->
---| 4 # SPF_IS_FILENAME ->
---| 8 # SPF_IS_XML ->
---| 16 # SPF_IS_NOT_XML ->
---| 32 # SPF_PERSIST_XML ->
---| 64 # SPF_NLP_SPEAK_PUNC ->
---| 128 # SPF_PARSE_SAPI ->
---| 256 # SPF_PARSE_SSML ->


---@class MemoryDescriptorList
--typedef struct _MDL {
--  struct _MDL      *Next;
--  CSHORT           Size;
--  CSHORT           MdlFlags;
--  struct _EPROCESS *Process;
--  PVOID            MappedSystemVa;
--  PVOID            StartVa;
--  ULONG            ByteCount;
--  ULONG            ByteOffset;
--} MDL, *PMDL;
