#include-once
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Func TestScreen()
;~    MouseMove(@DesktopWidth - $WindowWidth,@DesktopHeight / 2 + 30, 30)
   MouseMove(ScreenWidth(69), ScreenHeight(70), 30)
   Sleep(1000)
;~    MouseMove(@DesktopWidth - 100,@DesktopHeight / 2 + 45, 30)
   MouseMove(ScreenWidth(97.5), ScreenHeight(76.8)), 30)
EndFunc