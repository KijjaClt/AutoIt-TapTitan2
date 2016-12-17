#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Const $TITLE_NAME = "Lenovo A7010a48"

Global $isPause = False
Global $WindowWidth
Global $WindowHeight

Func InitWindowSize()
   Local $position = WinGetPos($TITLE_NAME)
   $WindowWidth = $position[2]
   $WindowHeight = $position[3]
EndFunc

Func MoveWindow()
   InitWindowSize()

   WinMove($TITLE_NAME, "", @DesktopWidth - $WindowWidth, 0)
   PrintLog("Move window to correct position.")
EndFunc

Func Attack()
   ControlClick($TITLE_NAME, "", "", "left", 1, 184, 200)
   Sleep(50)
EndFunc

Func Pause()
   TogglePause()

   While $isPause
	  Sleep(100)
   WEnd
EndFunc

Func TogglePause()
   $isPause = Not $isPause
   If $isPause Then
	  PrintLog("Pause")
   Else
	  PrintLog("Resume")
   EndIf
EndFunc


Func UpgradePlayer()
   PixelSearch(ScreenWidth(69), ScreenHeight(64.7), ScreenWidth(96), ScreenHeight(70.4), 0xF06D17, 5)
   If Not @error Then
	  ControlClick($TITLE_NAME, "", "", "left", 1, 307, 491)
	  PrintLog("Upgrade level player.")
   EndIf
EndFunc

Func ManageAngle()
   PixelSearch(ScreenWidth(55),ScreenHeight(70), ScreenWidth(94),ScreenHeight(77), 0x2BA9D6, 1)
   If Not @error Then
	  PrintLog("Found angle!!")
	  Sleep(1000)
	  ControlClick($TITLE_NAME, "", "", "left", 1, 263, 531)

	  Sleep(45000)
	  ControlClick($TITLE_NAME, "", "", "right", 1, 219, 201)
	  Sleep(6000)

	  ControlClick($TITLE_NAME, "", "", "left", 1, 182, 532)
	  Sleep(2000)
   EndIf

EndFunc

Func SwitchAttackBoss()
   PixelSearch(@DesktopWidth - $WindowWidth,@DesktopHeight / 2 + 30, @DesktopWidth - 100,@DesktopHeight / 2 + 45, 0x201515, 10)
   If Not @error  Then
	  PixelSearch(758, 134, 898, 134, 0xFFFFFF, 10)
	  If @error  Then
		 ControlClick($TITLE_NAME, "", "", "left", 1, 311, 65)
		 PrintLog("Switch to attack boss.")
	  EndIf
   EndIf
EndFunc

Func ScreenHeight($percent)
   Return ($percent / 100) * $WindowHeight
EndFunc

Func ScreenWidth($percent)
   Return (($percent / 100) * $WindowWidth) + (@DesktopWidth - $WindowWidth)
EndFunc

Func PrintLog($text)
   ConsoleWrite(TimeStamp() & " " & $text & @LF)
EndFunc

Func TimeStamp()
   Return "[" & @MDAY & "-" & @MON & "-" & @YEAR & " | " & @HOUR & ":" & @MIN & ":" & @SEC & "]"
EndFunc

Func Terminate()
   PrintLog("Exit!!")
   Exit
EndFunc