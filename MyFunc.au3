#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <ImageSearch.au3>
#include <GDIPlus.au3>
#include <File.au3>

Const $TITLE_NAME = "เครื่องจำลองนอกซ์"

Global $isPause = False
Global $WindowWidth
Global $WindowHeight

Global $x = 0, $y = 0

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

Func Attack()
   ControlClick($TITLE_NAME, "", "", "left", 1, 200, 165)
   Sleep(50)
   ControlClick($TITLE_NAME, "", "", "left", 1, 194, 320)
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
	  MoveWindow()
   EndIf
EndFunc

Func Terminate()
   PrintLog("Exit!!")
   Exit
EndFunc

Func UpgradePlayer()
   PixelSearch(ScreenWidth(69), ScreenHeight(70), ScreenWidth(97.5), ScreenHeight(76.8), 0xF06D17, 5)
   If Not @error Then
	  Sleep(100)
	  MouseClick("", 330, 516, 1, 1)
;~ 	  ControlClick($TITLE_NAME, "", "", "left", 1, 307, 491)
	  PrintLog("Upgrade level player.")
   EndIf
EndFunc

Func ManageAngle()
   Local $result = ImageSearch("play_ads.png")
   If $result > 0 Then
	  PrintLog("Found angle!!")

	  Sleep(1000)
	  MouseClick("",$x, $y,1,1)
	  Sleep(45000)
	  Send("{END}")
	  Sleep(6000)

	  MoveWindow()

	  Local $result = ImageSearch("collect_reward.png")
	  If $result > 0 Then
		 Sleep(1000)
		 MouseClick("",$x, $y,1,1)
		 Sleep(2000)
	  EndIf
   EndIf
EndFunc

Func SwitchAttackBoss()
   If Mod(@Min, 5) == 0 Then
	  ClickFightBoss()
   EndIf
EndFunc

Func ClickFightBoss()
   Local $result = ImageSearch("fight_boss.png")
   If $result > 0 Then
	  PrintLog("Switch to attack boss.")

	  Sleep(500)
	  MouseClick("",$x, $y,1,1)
	  Sleep(100)
   EndIf
EndFunc

Func ImageSearch($imgName)
   $fileA = @ScriptDir & "\" & $imgName

   _GDIPlus_Startup()

   $hImageA =_GDIPlus_ImageLoadFromFile($fileA)
   $hBitmapA = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImageA)

   $result = _ImageSearch($hBitmapA, 1, $x, $y, 5, 0)

   _GDIPlus_ImageDispose($hImageA)
   _GDIPlus_Shutdown()

   Return $result
EndFunc

Func SaveLog($text)
   ; Create a constant variable in Local scope of the filepath that will be read/written to.
    Local Const $sFilePath = @ScriptDir & "\log.txt"

    ; Create a temporary file to write data to.
    If Not FileExists($sFilePath) Then
		 If Not _FileCreate("log.txt") Then
			MsgBox($MB_SYSTEMMODAL, "Error", " Error Creating log.      error:" & @error)
		 EndIf
    EndIf

    ; Open the file for writing (append to the end of a file) and store the handle to a variable.
    Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)
    If $hFileOpen = -1 Then
        MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")
        Return False
    EndIf

    ; Write data to the file using the handle returned by FileOpen.
    FileWriteLine($hFileOpen, TimeStamp() & " " & $text)

    ; Close the handle returned by FileOpen.
    FileClose($hFileOpen)
EndFunc

Func PrintLog($text)
   ConsoleWrite(TimeStamp() & " " & $text & @LF)
   SaveLog($text)
EndFunc

Func TimeStamp()
   Return "[" & @MDAY & "-" & @MON & "-" & @YEAR & " | " & @HOUR & ":" & @MIN & ":" & @SEC & "]"
EndFunc