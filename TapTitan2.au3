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

MoveWindow()

If WinActivate($TITLE_NAME) Then
;~    TestScreen()
   $i = 0
   While True
	  Attack()

	  If $i == 10 Then
		 UpgradePlayer()
		 ManageAngle()
		 ;SwitchAttackBoss()
		 $i = 0
	  EndIf

	  $i += 1
   WEnd
Else
   MsgBox(16, "Error", "Not Found Vysor")
EndIf

Func TestScreen()
;~    MouseMove(@DesktopWidth - $WindowWidth,@DesktopHeight - 230, 30)
   MouseMove(ScreenWidth(55),ScreenHeight(70), 30)
   Sleep(1000)
;~    MouseMove( @DesktopWidth,@DesktopHeight - 185, 30)
   MouseMove(ScreenWidth(94),ScreenHeight(77), 30)
EndFunc