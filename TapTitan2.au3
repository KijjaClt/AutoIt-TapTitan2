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
HotKeySet("{b}", "ClickFightBoss")

If WinActivate($TITLE_NAME) Then
   MoveWindow()
;~    TestScreen()
   $i = 0
   While True
	  Attack()

	  If $i == 10 Then
		 UpgradePlayer()
		 ManageAngle()
		 SwitchAttackBoss()
		 $i = 0
	  EndIf

	  $i += 1
   WEnd
Else
   MsgBox(16, "Error", "Not Found Nox")
EndIf

Func TestScreen()
;~    MouseMove(@DesktopWidth - $WindowWidth,@DesktopHeight / 2 + 30, 30)
   MouseMove(ScreenWidth(69), ScreenHeight(70), 30)
   Sleep(1000)
;~    MouseMove(@DesktopWidth - 100,@DesktopHeight / 2 + 45, 30)
   MouseMove(ScreenWidth(97.5), ScreenHeight(76.8)), 30)
EndFunc