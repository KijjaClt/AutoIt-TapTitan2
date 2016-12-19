#include-once
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Global $oHTTP = ObjCreate("winhttp.winhttprequest.5.1")
Global $httpResult

;~ Example GET HTTP => GET("http://brugbart.com/")
;~ Example POST HTTP => POST("http://brugbart.com/Examples/http-post.php",'name=Jacob&bench=150')

Func GET($url)
   $oHTTP.Open("GET", $url, False)

   $oHTTP.Send()

   $oReceived = $oHTTP.ResponseText
   $oStatusCode = $oHTTP.Status

   $httpResult = $oReceived
   Return $oStatusCode
EndFunc

Func POST($url,$obj)
   $oHTTP.Open("POST", $url, False)
   $oHTTP.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")

   $oHTTP.Send($obj)

   $oReceived = $oHTTP.ResponseText
   $oStatusCode = $oHTTP.Status

   $httpResult = $oReceived
   Return $oStatusCode
EndFunc