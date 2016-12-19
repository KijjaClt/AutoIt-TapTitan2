#include-once
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kijja

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <ImageSearch.au3>
#include <Window.au3>
#include <Log.au3>
#include <Test.au3>

Global $isPause = False

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

	  PrintLog("Upgrade level player.")
   EndIf
EndFunc

Func ManageAngle()
   Local $result = ImageSearch("play_ads.png")
   If $result > 0 Then
	  PrintLog("Found angle!!")

	  Sleep(1000)
	  MouseClick("", $x, $y, 1, 1)
	  Sleep(45000)
	  Send("{END}")
	  Sleep(6000)

	  MoveWindow()

	  Local $result = ImageSearch("collect_reward.png")
	  If $result > 0 Then
		 Sleep(1000)
		 MouseClick("", $x, $y, 1, 1)
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
	  MouseClick("", $x, $y, 1, 1)
	  Sleep(100)
   EndIf
EndFunc