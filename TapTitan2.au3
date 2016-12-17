#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <AutoItConstants.au3>
#include <MyFunc.au3>
#include <MsgBoxConstants.au3>

HotKeySet("{ESC}", "Terminate")
HotKeySet("{F5}", "Pause")

MoveWindow()

If WinActivate($TITLE_NAME) Then
   $i = 0
   While True
	  Attack()

	  If $i == 10 Then
		 UpgradePlayer()
		 ManageAngle()
;~ 		 SwitchAttackBoss()
		 $i = 0
	  EndIf

	  $i += 1
   WEnd
Else
   MsgBox($MB_ICONERROR, "Error", "Not Found Vysor")
EndIf

Func Test()
;~    ConsoleWrite($dCoord & @LF)
EndFunc