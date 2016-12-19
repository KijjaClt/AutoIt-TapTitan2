#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <MyFunc.au3>

HotKeySet("{ESC}", "Terminate")
HotKeySet("{F5}", "Pause")
HotKeySet("{F7}", "ClickFightBoss")

If WinActivate($TITLE_NAME) Then
   MoveWindow()
;~    TestScreen()
   For $i = 0 In True
	  Attack()

	  If $i == 10 Then
		 UpgradePlayer()
		 ManageAngle()
		 SwitchAttackBoss()
		 $i = 0
	  EndIf

	  $i += 1
   Next
Else
   MsgBox(16, "Error", "Not Found Nox")
EndIf