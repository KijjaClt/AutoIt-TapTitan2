#include-once
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <File.au3>
#include <Http.au3>

Func SaveLog($text)
    Local Const $sFilePath = StringTrimRight(@ScriptDir, 4) & "\log.txt"

	ConsoleWrite($sFilePath)

    If Not FileExists($sFilePath) Then
		 If Not _FileCreate("log.txt") Then
			MsgBox($MB_SYSTEMMODAL, "Error", " Error Creating log.      error:" & @error)
		 EndIf
    EndIf

    Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)
    If $hFileOpen = -1 Then
        MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")
        Return False
    EndIf

    FileWriteLine($hFileOpen, TimeStamp() & " " & $text)

    FileClose($hFileOpen)
EndFunc

Func PrintLog($text)
   ConsoleWrite(TimeStamp() & " " & $text & @LF)
   SaveLog($text)
EndFunc

Func TimeStamp()
   Return "[" & @MDAY & "-" & @MON & "-" & @YEAR & " | " & @HOUR & ":" & @MIN & ":" & @SEC & "]"
EndFunc