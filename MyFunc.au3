#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Misc.au3>

Const $DLL = "user32.dll"
Const $TITLE_NAME = "Lenovo A7010a48"

Func _Attack()
   ControlClick($TITLE_NAME, "", "", "left", 1, 184, 204)
   Sleep(35)
EndFunc

Func _Pause()
   Do
	  Sleep(10)
   Until _IsPressed("7B",$DLL) ; If Pressed Key 'F12'
EndFunc