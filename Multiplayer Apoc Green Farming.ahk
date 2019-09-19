#SingleInstance Force
#InstallMouseHook
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

;Uncomment lines 9, 10 and 11 (Delete the ;)to enable the script to run as admin.
;Usually needed if Windows 10 throws a tantrum and blocks the clicks.
;If that doesn't work, compile the script and run as administrator.
;SetWorkingDir %A_ScriptDir%
;if not A_IsAdmin
	;Run *RunAs "%A_ScriptFullPath%"

;All Pixel coordinates in this section must use the "Screen (less often used)" value.
;All colours in this section should be of the format 0xRRGGBB

;The amount of time, in minutes, you want the script to wait while in the battle before it decides something has gone wrong and triggers the crash handling.
Battle_Timeout := 6

;The amount of time, in seconds, you want the script to wait in menus before it decides something has gone wrong and triggers the crash handling.
Menu_Timeout := 30

;A Purple Pixel on the top right corner of the "(Apocalypse +)" dungeon button.
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop1_Pixel_X := 1786
Loop1_Pixel_Y := 462
Loop1_Pixel_C := 0x800757

;A Blue Pixel on the "Enter Dungeon" button.
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop2_Pixel_X := 1782
Loop2_Pixel_Y := 933
Loop2_Pixel_C := 0x2742D6

;A Brown Pixel on the "Solo Raid" button.
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop3_Pixel_X := 1341
Loop3_Pixel_Y := 573
Loop3_Pixel_C := 0x502110

;A Blue Pixel on the "Next" button.
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop4_Pixel_X := 1625
Loop4_Pixel_Y := 945
Loop4_Pixel_C := 0x0726B6

;A Brown Pixel on the "Remove" button of the first roaming warrior.
;This script is intended for farming, if you need to rely on Cloud USB1 this script isn't for you.
;If you really want to use the top RW, change the "Use_RW" variable to 1
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop5_Pixel_X := 1797
Loop5_Pixel_Y := 490
Loop5_Pixel_C := 0x5A2713
Use_RW := 0

;A Blue Pixel on the "GO!" button.
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop6_Pixel_X := 1617
Loop6_Pixel_Y := 935
Loop6_Pixel_C := 0x1239D3

;A Yellow Pixel on the "1" underneath the word "Stamina".
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop7_Pixel_X := 1524
Loop7_Pixel_Y := 510
Loop7_Pixel_C := 0xFFDD8E


;A Blue Pixel directly above the first "t" in "Begin Battle".
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop8_Pixel_X := 1718
Loop8_Pixel_Y := 664
Loop8_Pixel_C := 0x1D55EA

;The same Pixel but the orange of the spend gems dialogue, to enter slow mode when out of stamina.
;The macro should work without you changing this thanks to variation matching but it's worth double checking.
;In any case it shouldn't spend gems even if it does click as Loop9 is looking for red, not blue.
;Get to <=49 Stamina and trigger the stamina refresh dialogue on a 50 stamina fight if needs be.
Loop8_Pixel_O := 0xDE701E 

;The position of the "Back" button when you've run out of stamina.
;Get to <=49 Stamina and trigger the stamina refresh dialogue on a 50 stamina fight if needs be.
Loop8_Pixel_X_B := 1557
Loop8_Pixel_Y_B := 810


;A Red pixel on the Champion Rainbow bar (so it clicks and skips the exp scrolling)
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop9_Pixel_X := 1822
Loop9_Pixel_Y := 692
Loop9_Pixel_C := 0xFF4900

;A White Pixel in the "Next" button text after the battle is won, will be used for all the next buttons
;This will search a 3x3 square centred on the given pixel for the given colour.
Loop10_Pixel_X := 1526
Loop10_Pixel_Y := 900
Loop10_Pixel_C := 0xFFFFFF

;Crash Handling
;This will enable the macro to recover for when (yes, when) FFRK crashes.
;It can handle either the infinite black loading screen or a total crash to home screen.
;This only works for emulators with a tab-like switcher at the top of the screen, like MuMu or MeMu.
;However, since this relies on exact positioning, the emulator needs to be at the same position each time.
;Please visit https://redd.it/b9xn3z for instructions on how to force MuMu into the same position each time.
Enable_Crash_Handle := 1

;The position of the X that closes the current tab (this is for the infinite black loading screen crash)
Crash_Close_Pixel_X := 1480
Crash_Close_Pixel_Y := 8

;The position of the FFRK launcher icon. This searches for a white pixel so put the coordinates somewhere in the middle.
;Please note that when you close an app on MeMu it will go to the default launcher, not Nova Launcher
;As such please use the position of the app on the default launcher.
Crash_App_Launch_X := 1790
Crash_App_Launch_Y := 187

;The position and colour of the blue "Play" button when FFRK launches.
Crash_Play_X := 1563
Crash_Play_Y := 740
Crash_Play_C := 0x1D95F7

;The position and colour of the blue "OK" button when resuming an interrupted fight (This is for the battle load crash).
Crash_OK_X := 1693
Crash_OK_Y := 660
Crash_OK_C := 0x1D95F7

;The position and colour of the yellow dome in the top left of the Event Dungeon button, without moving the home screen after pressing the "Home" button.
;Because of the particle effects the colour likes to jump around and this was the most stable place I could find.
Crash_Home_Screen_X := 1853
Crash_Home_Screen_Y := 628
Crash_Home_Screen_C := 0xFFFA74

;The position and colour of the white hair of the Bartz lookalike in the "Raid Dungeons" button.
Crash_Raid_Dungeons_X := 1719
Crash_Raid_Dungeons_Y := 84
Crash_Raid_Dungeons_C := 0xEFF9FE

;The position and colour of the green hair of the Bartz lookalike in the "Event Dungeons" button.
Crash_Event_Dungeons_X := 1766
Crash_Event_Dungeons_Y := 84
Crash_Event_Dungeons_C := 0x87F829

;The a clickable position of the Dungeon you are farming.
Crash_Farm_X := 1557
Crash_Farm_Y := 268

;******************************************************************;
;**Do not edit below this line unless you know what you are doing**;
;******************************************************************;

Loop0:
loop{	
	start1 := A_TickCount 
	Loop1:
	loop{
		if (resumed = 1){
		break Loop1
		}
		PixelSearch, XX, YY, Loop1_Pixel_X-1, Loop1_Pixel_Y-1, Loop1_Pixel_X+1, Loop1_Pixel_Y+1, Loop1_Pixel_C, 5, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop1_Pixel_X, Loop1_Pixel_Y, 1, 0
		sleep 100
		BlockInput, MouseMoveOff
		break Loop1
		}
		now1 := A_TickCount-start1
		if (now1 > Menu_Timeout*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500
		
	start2 := A_TickCount 
	Loop2:
	loop{
		if (resumed = 1){
		break Loop2
		}
		PixelSearch, XX, YY, Loop2_Pixel_X-1, Loop2_Pixel_Y-1, Loop2_Pixel_X+1, Loop2_Pixel_Y+1, Loop2_Pixel_C, 4, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop2_Pixel_X, Loop2_Pixel_Y, 1, 0
		sleep 100
		BlockInput, MouseMoveOff
		break Loop2
		}
		now2 := A_TickCount-start2
		if (now2 > Menu_Timeout*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500
		
	start3 := A_TickCount 
	Loop3:
	loop{
		if (resumed = 1){
		break Loop3
		}
		PixelSearch, XX, YY, Loop3_Pixel_X-1, Loop3_Pixel_Y-1, Loop3_Pixel_X+1, Loop3_Pixel_Y+1, Loop3_Pixel_C, 4, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop3_Pixel_X, Loop3_Pixel_Y, 1, 0
		sleep 100
		BlockInput, MouseMoveOff
		break Loop3
		}
		now3 := A_TickCount-start3
		if (now3 > Menu_Timeout*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500

	start4 := A_TickCount 
	Loop4:
	loop{
		if (resumed = 1){
		break Loop4
		}
		PixelSearch, XX, YY, Loop4_Pixel_X-1, Loop4_Pixel_Y-1, Loop4_Pixel_X+1, Loop4_Pixel_Y+1, Loop4_Pixel_C, 4, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop4_Pixel_X, Loop4_Pixel_Y, 1, 0
		sleep 100
		BlockInput, MouseMoveOff
		break Loop4
		}
		now4 := A_TickCount-start4
		if (now4 > Menu_Timeout*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500

	start5 := A_TickCount 
	Loop5:
	loop{
		if (resumed = 1){
		break Loop5
		}
		PixelSearch, XX, YY, Loop5_Pixel_X-1, Loop5_Pixel_Y-1, Loop5_Pixel_X+1, Loop5_Pixel_Y+1, Loop5_Pixel_C, 4, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		if(Use_RW = 0) {
		MouseClick, Left, Loop5_Pixel_X, Loop5_Pixel_Y, 1, 0
		}
		sleep 100
		BlockInput, MouseMoveOff
		break Loop5
		}
		now5:= A_TickCount-start5
		if (now5 > Menu_Timeout*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500
		
		
	start6 := A_TickCount 
	Loop6:
	loop{
		if (resumed = 1){
		break Loop6
		}
		PixelSearch, XX, YY, Loop6_Pixel_X-1, Loop6_Pixel_Y-1, Loop6_Pixel_X+1, Loop6_Pixel_Y+1, Loop6_Pixel_C, 4, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop6_Pixel_X, Loop6_Pixel_Y, 1, 0
		sleep 100
		BlockInput, MouseMoveOff
		break Loop6
		}
		now6:= A_TickCount-start6
		if (now6 > Menu_Timeout*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500
		
	start7 := A_TickCount 
	Loop7:
	loop{
		if (resumed = 1){
		break Loop7
		}
		PixelSearch, XX, YY, Loop7_Pixel_X-1, Loop7_Pixel_Y-1, Loop7_Pixel_X+1, Loop7_Pixel_Y+1, Loop7_Pixel_C, 4, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop7_Pixel_X, Loop7_Pixel_Y, 1, 0
		sleep 100
		BlockInput, MouseMoveOff
		break Loop7
		}
		now7 := A_TickCount-start7
		if (now7 > Menu_Timeout*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500
		
	start8 := A_TickCount 
	Loop8:
	loop{
		if (resumed = 1){
		break Loop8
		}
		PixelSearch, ZZ, YY, Loop8_Pixel_X-1, Loop8_Pixel_Y-1, Loop8_Pixel_X+1, Loop8_Pixel_Y+1, Loop8_Pixel_O, 5, Fast RGB
		if (ZZ != ""){
		sleep 1000
		MouseClick, Left, Loop8_Pixel_X_B, Loop8_Pixel_Y_B, 1, 0
		Sleep 180000
		Reload
		}
		PixelSearch, XX, YY, Loop8_Pixel_X-1, Loop8_Pixel_Y-1, Loop8_Pixel_X+1, Loop8_Pixel_Y+1, Loop8_Pixel_C, 8, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop8_Pixel_X, Loop8_Pixel_Y, 1, 0
		BlockInput, MouseMoveOff
		break Loop8
		}
		now8 := A_TickCount-start8
		if (now8 > Menu_Timeout*1000  && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 500
	
	start9 := A_TickCount 
	Loop9:
	loop{
		resumed := 0
		PixelSearch, XX, YY, Loop9_Pixel_X, Loop9_Pixel_Y, Loop9_Pixel_X, Loop9_Pixel_Y, Loop9_Pixel_C, 2, Fast RGB
		if (XX != ""){
		sleep 400
		BlockInput, MouseMove
		sleep 100
		MouseClick, Left, Loop10_Pixel_X, Loop10_Pixel_Y, 1, 0
		BlockInput, MouseMoveOff
		break Loop9
		}
		now9 := A_TickCount-start9
		if (now9 > Battle_Timeout*60*1000 && Enable_Crash_Handle = 1){
		Goto CrashHandle
		}
		}
		sleep 250
		
	count2 = 0
	LoopB:
	loop{
		PixelSearch, ZZ, YY, Loop10_Pixel_X, Loop10_Pixel_Y, Loop10_Pixel_X, Loop10_Pixel_Y, 0x000000, 1, Fast RGB
		if (ZZ != ""){
		break LoopB
		}
		count = 0
		Loop10:
		loop{
			PixelSearch, XX, YY, Loop10_Pixel_X-1, Loop10_Pixel_Y-1, Loop10_Pixel_X+1, Loop10_Pixel_Y+1, Loop10_Pixel_C, 2, Fast RGB
			count++
			if (XX !=""){
			sleep 100
			BlockInput, MouseMove
			MouseClick, Left, Loop10_Pixel_X, Loop10_Pixel_Y, 1, 0
			sleep 100
			MouseClick, Left, Loop10_Pixel_X, Loop10_Pixel_Y, 1, 0
			BlockInput, MouseMoveOff
			break Loop10
			}
			count2++
			} until count > 20
		} until count2 > 200
		sleep 750

}
CrashHandle:
sleep 1000
MouseClick, Left, Crash_Close_Pixel_X, Crash_Close_Pixel_Y, 1, 0
sleep 1000
MouseClick, Left, Crash_App_Launch_X, Crash_App_Launch_Y+25, 1, 0
sleep 1000
start1 := A_TickCount
LoopC1:
Loop{
	now1 := A_TickCount-start1
	PixelSearch, XX, YY, Crash_App_Launch_X-25, Crash_App_Launch_Y-25, Crash_App_Launch_X+25, Crash_App_Launch_Y+25, 0xFFFFFF, 5, Fast RGB
	if (XX != ""){
	sleep 400
	BlockInput, MouseMove
	sleep 100
	MouseClick, Left, Crash_App_Launch_X, Crash_App_Launch_Y, 1, 0
	sleep 100
	BlockInput, MouseMoveOff
	break LoopC1
		}
	} until now1 > Menu_Timeout*1000
	
start2 := A_TickCount 
LoopC2:
Loop{
	now2 := A_TickCount-start2
	PixelSearch, XX, YY, Crash_Play_X-2, Crash_Play_Y-2, Crash_Play_X+2, Crash_Play_Y+2, Crash_Play_C, 2, Fast RGB
	if (XX != ""){
	sleep 400
	BlockInput, MouseMove
	sleep 100
	MouseClick, Left, Crash_Play_X, Crash_Play_Y, 1, 0
	sleep 100
	BlockInput, MouseMoveOff
	break LoopC2
		}
	} until now2 > Menu_Timeout*1000

resumed := 0

start3 := A_TickCount
LoopC3:
Loop{
	now3 := A_TickCount-start3
	PixelSearch, XX, YY, Crash_OK_X-2, Crash_OK_Y-2, Crash_OK_X+2, Crash_OK_Y+2, Crash_OK_C, 2, Fast RGB
	if (XX != ""){
	sleep 400
	BlockInput, MouseMove
	sleep 100
	MouseClick, Left, Crash_OK_X, Crash_OK_Y, 1, 0
	sleep 100
	BlockInput, MouseMoveOff
	resumed := 1
	break LoopC3
		}
	} until now3 > 10000

start4 := A_TickCount
LoopC4:
Loop{
	if (resumed = 1){
	break LoopC4
	}
	now4 := A_TickCount-start4
	PixelSearch, XX, YY, Crash_Home_Screen_X-2, Crash_Home_Screen_Y-2, Crash_Home_Screen_X+2, Crash_Home_Screen_Y+2, Crash_Home_Screen_C, 6, Fast RGB
	if (XX != ""){
	sleep 400
	BlockInput, MouseMove
	sleep 100
	MouseClick, Left, Crash_Home_Screen_X, Crash_Home_Screen_Y, 1, 0
	sleep 100
	BlockInput, MouseMoveOff

	break LoopC4
	}
	} until now4 > Menu_Timeout*1000

start5 := A_TickCount
LoopC5:
Loop{
	if (resumed = 1){
	break LoopC5
	}
	now5 := A_TickCount-start5
	PixelSearch, XX, YY, Crash_Raid_Dungeons_X-2, Crash_Raid_Dungeons_Y-2, Crash_Raid_Dungeons_X+2, Crash_Raid_Dungeons_Y+2, Crash_Raid_Dungeons_C, 6, Fast RGB
	if (XX != ""){
	sleep 400
	BlockInput, MouseMove
	sleep 100
	MouseClick, Left, Crash_Raid_Dungeons_X, Crash_Raid_Dungeons_Y, 1, 0
	sleep 100
	BlockInput, MouseMoveOff

	break LoopC5
	}
	} until now5 > Menu_Timeout*1000
	
start6 := A_TickCount
LoopC6:
Loop{
	if (resumed = 1){
	break LoopC6
	}
	now6 := A_TickCount-start6
	PixelSearch, XX, YY, Crash_Event_Dungeons_X-2, Crash_Event_Dungeons_Y-2, Crash_Event_Dungeons_X+2, Crash_Event_Dungeons_Y+2, Crash_Event_Dungeons_C, 6, Fast RGB
	if (XX != ""){
	sleep 400
	BlockInput, MouseMove
	sleep 100
	MouseClick, Left, Crash_Farm_X, Crash_Farm_Y, 1, 0
	sleep 100
	BlockInput, MouseMoveOff

	break LoopC6
	}
	} until now6 > Menu_Timeout*1000
	
Goto Loop0

^Space::ExitApp