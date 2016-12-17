#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Const $TITLE_NAME = "Lenovo A7010a48"

Global $isPause = False

Func MoveWindow()
   PrintLog("Move window to correct position.")
   Global $boo = WinGetPos($TITLE_NAME, "")
   WinMove($TITLE_NAME, "", @DesktopWidth - $boo[2], 0)
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
   $cCoord = PixelSearch(@DesktopWidth - $boo[2] / 2, @DesktopHeight-280, @DesktopWidth, @DesktopHeight-220, 0xF06D17, 5)
   If Not @error Then
	  PrintLog("Upgrade level player.")
	  MouseClick("",$cCoord[0], $cCoord[1],1,1)
   EndIf
EndFunc

Func ManageAngle()
   Local $cCoord = PixelSearch(@DesktopWidth - $boo[2] / 2,@DesktopHeight-230, @DesktopWidth,@DesktopHeight-185, 0x2BA9D6, 1)
   If Not @error Then
	  PrintLog("Found angle!!")
	  Sleep(1000)
	  MouseClick("",$cCoord[0], $cCoord[1],1,1)

	  Sleep(45000)
	  ControlClick($TITLE_NAME, "", "", "right", 1, 184, 200)
	  Sleep(6000)

	  Local $dCoord = PixelSearch(@DesktopWidth - $boo[2],@DesktopHeight-230, @DesktopWidth,@DesktopHeight-185, 0x2BA9D6, 1)
	  If Not @error Then
		 MouseClick("",$dCoord[0], $dCoord[1],1,1)
		 Sleep(2000)
	  EndIf
   EndIf

EndFunc

Func SwitchAttackBoss()
   Local $dCoord = PixelSearch(@DesktopWidth - $boo[2],@DesktopHeight/2 + 30, @DesktopWidth - 100,@DesktopHeight/2 + 45, 0x201515, 10)
   If Not @error  Then
	  Local $eCoord = PixelSearch(758, 134, 898, 134, 0xFFFFFF, 10)
	  If @error  Then
		 PrintLog("Switch to attack boss.")
		 ControlClick($TITLE_NAME, "", "", "left", 1, 311, 65)
	  EndIf
   EndIf
EndFunc

Func PrintLog($text)
   ConsoleWrite(TimeStamp() & " " & $text & @LF)
EndFunc

Func TimeStamp()
   Return "[" & @MDAY & "-" & @MON & "-" & @YEAR & " | " & @HOUR & ":" & @MIN & ":" & @SEC & "]"
EndFunc

Func Terminate()
    Exit
EndFunc