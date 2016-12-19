#include-once
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Global Const $TITLE_NAME = "เครื่องจำลองนอกซ์"

Global $WindowWidth
Global $WindowHeight

Func InitWindowSize()
   Local $position = WinGetPos($TITLE_NAME)
   $WindowWidth = $position[2]
   $WindowHeight = $position[3]
EndFunc

Func MoveWindow()
   InitWindowSize()

   WinMove($TITLE_NAME, "", 0, 0)
   PrintLog("Move window to correct position.")
EndFunc

Func ScreenHeight($percent)
   Return ($percent / 100) * $WindowHeight
EndFunc

Func ScreenWidth($percent)
   Return ($percent / 100) * $WindowWidth
EndFunc