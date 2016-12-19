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
;~    POST HTTP for store log at database
   POST("http://192.168.1.36:8080/api/log",'log=' & $text)
EndFunc

Func PrintLog($text)
   ConsoleWrite(TimeStamp() & " " & $text & @CRLF)
   SaveLog($text)
EndFunc

Func TimeStamp()
   Return "[" & @MDAY & "-" & @MON & "-" & @YEAR & " | " & @HOUR & ":" & @MIN & ":" & @SEC & "]"
EndFunc