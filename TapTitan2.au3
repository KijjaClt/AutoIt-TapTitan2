#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <MyFunc.au3>
#include <MsgBoxConstants.au3>

DllOpen($DLL)

If WinActivate("Lenovo A7010a48") Then
   Do
	  _Attack()

	  If _IsPressed("50",$DLL) Then ; If Pressed Key 'P'
		 _Pause()
	  EndIf

   Until _IsPressed("73",$DLL) ; If Pressed Key 'F4'
Else
   MsgBox($MB_ICONERROR, "Error", "Not Found Vysor")
EndIf

DllClose($DLL)