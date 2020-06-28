#SingleInstance Force
#InstallMouseHook
CoordMode, pixel, Screen
CoordMode, Mouse, Screen
;Build 20200401
;All pixel coordinates in this section must use the "Screen (less often used)" value.
;Unless otherwise specified, the search range will be a 3x3 box centered on the specified pixel.
;All colours in this section should be of the format 0xRRGGBB
;If the script won't run for you in Windows 10, you need to set your variables, compile the script as an EXE then run the EXE as Administrator.
;Alternitively set the AHK.exe main executable to always run as Administrator.
;Note: To stop the script, either close the script by right clicking the icon in the system tray or press Control+Space

;The amount of time, in minutes, you want the script to wait while in the battle before it decides something has gone wrong and triggers the crash handling.
;(Default := 5)
Battle_Timeout := 6

;The amount of time, in seconds, you want the script to wait in menus before it decides something has gone wrong and triggers the crash handling.
;(Default := 30)
Menu_Timeout := 30

;The amount of time, in milliseconds, the script will wait between finding a pixel and clicking.
;Due to FFRK's habit of drawing menus before they are clickable, setting this bellow 400ms will generally result in the script stalling, if the default causes stalling increase until it stops stalling.
;(Default := 400)
Click_Timeout := 350

;A variable to adjust the "sensitivity" of the Skip Button Detection. The higher it is, the more times it needs to "confirm" the button exists, so will click the button slower, but will be less likely to false trigger. The lower it it, the less times it needs to "confirm" the button exists, so will click the button faster but it might trigger falsely. I highly recommend not lowering it, only increasing it.
;(Default := 3)
Skip_Sensitivity := 3

;A PURPLE pixel on the top right corner of the "(Apocalypse +)" dungeon button.
;Apocalypse_Purple := [-1511, 283, 0x70074B]
; This is the top button
Apocalypse_Purple := [-1520, 205, 0x780750] 


;A YELLOW pixel in the center of the screen that can sometimes be covered up by the grey "Loading" dialog. This is to prevent misclicks of the Enter Dungeon button when it is not active.
Enter_Dungeon_Yellow := [-1694, 395, 0xC5A574]

;A BLUE pixel on the "Enter Dungeon" button.
Enter_Dungeon_Blue := [-1602, 630, 0x0725B3]

;A BROWN pixel on the "Solo Raid" button.
Solo_Raid_Brown := [-1718, 409, 0x471D0F]

;A BLUE pixel on the "Next" button.
Next_Blue := [-1643, 666, 0x0D2FCC]

;A BROWN pixel on the "Remove" button of the first Roaming Warrior.
;This script is intended for farming, if you need to rely on Cloud USB1 this script isn't for you.
;If you really want to use the top RW, change the "Use_RW" variable to 1
Remove_Brown := [-1531, 318, 0x32120B]
Use_RW := 0

;A BLUE pixel on the "GO!" button.
Go_Blue := [-1674, 674, 0x0923AA]

;A YELLOW pixel on the "1" underneath the word "Stamina" or on the word Stamina itself.
;Hint: The pixel should have a red value of FF
;Searches a 50x50 box on the specified pixel.
;One_Yellow := [-1689, 382, 0xFFDD8E]
One_Yellow := [-1689, 379, 0xD7C885]

;A BLUE pixel directly above the first "t" in "Begin Battle".
;Make sure it's closer to the top of the button than the top of the "t" so the orange search below works.
;If it stalls on the orange button set the pixel a little higher.
Battle_Blue := [-1577, 457, 0x196BE8]

;The a nearby (preferably the same) pixel but the ORANGE of the spend gems dialogue, allow retries when out of stamina.
;In any case it shouldn't spend gems even if it does click as Loop_BattleEnd is looking for white, not blue.
;Get to <=49 Stamina and trigger the stamina refresh dialogue on a 50 stamina fight if needs be.
Battle_Orange := [-1574, 490, 0xDB6A1D]

;A BLUE pixel on the "Back" button when you've run out of stamina.
;Get to <=49 Stamina and trigger the stamina refresh dialogue on a 50 stamina fight if needs be.
Back_Blue := [-1620, 590, 0x081D7C]
 
;Differently coloured pixels in the Skip Button
;For best results pick two different blue ones and a white one.
Top_Skip := [-1533, 583, 0x3D4DCB]
Middle_Skip := [-1539, 602, 0xFFFFFF]
Bottom_Skip := [-1533, 618, 0x021970]


;A WHITE pixel in the "Next" button text after the battle is won, will be used for all the next buttons.
;The colour code should be 0xFFFFFF unless you've got a really weird setup.
;Black_Loading_Screen_Colour is the black of the loading screen when returning to menu in case your one is weird.
Next_White := [-1660, 599,0xFFFFFF]
Black_Loading_Screen_Colour := 0x000000

Mission_Complete_Brown := [-1673, 513, 0x291410]

;************************;
;*****Crash Handling*****;
;************************;
;This will enable the macro to recover for when (yes, when) FFRK crashes.
;It can handle either the infinite black loading screen or a total crash to home screen.
;This only works for emulators with a tab-like switcher at the top of the screen, like MeMu.
;However, since this relies on exact positioning, the emulator needs to be at the same position each time.
Enable_Crash_Handle := 1

;This will cause the crash handling to go back and try the next dungeon down for when events add a new MP dungeon if it stalls on finding the Apocalypse_Purple pixel
Enable_Primitive_Event_Update_Handling := 1

;A pixel on the tab that brings up the home screen (not the X, since there is no X you can't close this tab)
Crash_Home_Tab_Pixel := [-1830, 17,0xA5A6AA]
;Crash_Home_Tab_Pixel := [-1758, 742, 0xEEEEEE]

;A pixel on the X that closes the current tab (this is for the infinite black loading screen crash).
Crash_Close_Pixel := [-1698, 17, 0x1282B8]

;The position of the FFRK launcher icon. For best results, select a WHITE pixel somewhat centered.
;Please note that when you close an app on MeMu it will go to the default launcher, not Nova Launcher
;As such please use the position of the app on the default launcher.
;Searches a 50x50 box on the specified pixel.
Crash_App_Launch := [-1606, 120, 0xF4F4F4]

;A BLUE pixel on the blue "Play" button when FFRK launches.
Crash_Play_Blue := [-1652, 561, 0x0E31CE]

;A BROWN pixel on the "Cancel" button when resuming an interrupted fight (This is for the battle load crash).
Crash_Cancel_Brown := [-1772, 479, 0x22110D]

;A YELLOW pixel on the Event Dungeons scroll banner, just to the right of the word Event, without moving the home screen after pressing the "Home" button after entering the event dungeons but also while NOT in a battle.
Crash_Home_Scroll_Yellow := [-1669, 382, 0xF1BA40]
; Crash_Home_Scroll_Yellow := [-1669, 383, 0xF2C34D]

;A YELLOW pixel in the word "Battle" when you're "In Battle" in an Event Dungeon.
;To force this screen, enter any Event Battle staging screen, and before going into the battle itself, press "Home".
; Crash_Event_Battle_Yellow := [-1669, 382, 0xF1BA40]
Crash_Event_Battle_Yellow := [-1818, 384, 0xE9B344] 

;A WHITE pixel on the white hair of the Bartz lookalike in the "Raid Dungeons" button.
; Crash_Raid_Dungeons_White := [-1545, 75, 0xBD7A1E]
Crash_Raid_Dungeons_White := [-1578, 68, 0xFFFFFF]

;A GREEN pixel on the green hair of the Bartz lookalike in the "Event Dungeons" button.
Crash_Event_Dungeons_Green := [-1556, 67,0x64CE1A]

;A BROWN pixel on the rounded "Back" button on the Raid Dungeons screen.
Crash_Raid_Dungeons_Brown := [-1827, 679,0x703314]

;The position of the event dungeon banner you wish to farm, 1 being the top banner.
;This is so you only need to get the pixel information for the banners once below and can edit this variable to change which dungeon you wish to farm.
Crash_Farm_Dungeons_Selection := 4

;Any pixel of each of the event dungeon banners, from top to bottom.
Crash_Farm_Dungeon_1 := [-1513, 155, 0x180524]
Crash_Farm_Dungeon_2 := [-1513, 266, 0x210F01]
Crash_Farm_Dungeon_3 := [-1513, 393, 0x20072F]
Crash_Farm_Dungeon_4 := [-1513, 497, 0x1A0529]
Crash_Farm_Dungeon_5 := [-1515, 609, 0x1D062E]

;*******************************************************************;
;**Do not edit below this line unless you know what you are doing.**;
;*****************Or do, I'm a comment, not a cop.******************;
;*******************************************************************;

PhantomClick(toX, toY) {
	BlockInput, MouseMove
	sleep 50
	MouseGetPos oldX, oldY
	WinGetTitle, TitleA, A
	MouseClick, Left, toX, toY, 1, 0
	sleep 20
	MouseMove %oldX%, %oldY%, 0
	WinActivate, %TitleA%
	BlockInput, MouseMoveOff
}

;Define MenuPixelFinder
MenuPixelFinder(posX,posY,colour_value,crash_handle,menu_timeout,click_timeout,battle_timeout,resumed:=0,battle_crash:=0,expanded:=0,use_rw:=0,look_for_orange:=0,battle_orange1:=0,battle_orange2:=0,battle_orange3:=0,back1:=0,back2:=0) {
	timeout_start := A_TickCount
	loop{
		if(resumed || battle_crash || use_rw){
			return 0
		}
		if(expanded == 0){
		pixelSearch, XX, YY, posX-3, posY-3, posX+3, posY+3, colour_value, 5, Fast RGB
		} else {
		pixelSearch, XX, YY, posX-24, posY-24, posX+24, posY+24, colour_value, 5, Fast RGB
		}
		if(XX != ""){
			sleep click_timeout
			PhantomClick(posX, posY)
			return 0
		}
		if(look_for_orange==1){
			pixelSearch, XX, YY, battle_orange1-1, battle_orange2-1, battle_orange1+1, battle_orange2+1, battle_orange3, 5, Fast RGB
			if(XX != ""){
				sleep click_timeout
				PhantomClick(back1, back2)
				return 2
		}
			}
		now := A_TickCount-timeout_start
		if(now > menu_timeout*1000 && crash_handle == 1){
			return 1
		}
	}
}

;Menu clickings
Main_Loop:
loop{
	if(MenuPixelFinder(Apocalypse_Purple[1],Apocalypse_Purple[2],Apocalypse_Purple[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash) == 1 && Enable_Crash_Handle == 1) {
		if(Enable_Primitive_Event_Update_Handling == 1 && possible_new_event < 10){
			possible_new_event++
		}
		goto CrashHandle
		} else {
			possible_new_event := 0
		}
		
	sleep click_timeout
	if(MenuPixelFinder(Enter_Dungeon_Yellow[1],Enter_Dungeon_Yellow[2],Enter_Dungeon_Yellow[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash) == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle
		
	if(MenuPixelFinder(Enter_Dungeon_Blue[1],Enter_Dungeon_Blue[2],Enter_Dungeon_Blue[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash) == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle
		
	sleep click_timeout
	if(MenuPixelFinder(Solo_Raid_Brown[1],Solo_Raid_Brown[2],Solo_Raid_Brown[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash) == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle
		
	sleep click_timeout
	if(MenuPixelFinder(Next_Blue[1],Next_Blue[2],Next_Blue[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash) == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle
		
	sleep click_timeout
	if(MenuPixelFinder(Remove_Brown[1],Remove_Brown[2],Remove_Brown[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash,0,Use_RW) == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle
		
	sleep 50
	
	if(MenuPixelFinder(Go_Blue[1],Go_Blue[2],Go_Blue[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash) == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle
		
	battle_crash := 0
	resumed := 0
	what_do_timeout_start := A_TickCount
	
Yellow_Label:
	if(MenuPixelFinder(One_Yellow[1],One_Yellow[2],One_Yellow[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash,1) == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle
	
	
	now := A_TickCount-what_do_timeout_start
	if(now > menu_timeout*2000 && crash_handle == 1)
		goto CrashHandle
	
	what_do := 0
	what_do := MenuPixelFinder(Battle_Blue[1],Battle_Blue[2],Battle_Blue[3],Enable_Crash_Handle,Menu_Timeout,Click_Timeout,Battle_Timeout,resumed,battle_crash,0,0,1,Battle_Orange[1],Battle_Orange[2],Battle_Orange[3],Back_Blue[1],Back_Blue[2])
	if(what_do == 2){
	sleep 10000
	goto Yellow_Label
	}
	
	if(what_do == 1 && Enable_Crash_Handle == 1)
		goto CrashHandle


	;Battle End Detection
	start_timeout := A_TickCount 
	find_white_left := 0
	find_white_middle := 0
	find_white_right := 0
	Loop_BattleEnd:
	loop{
		resumed := 0
		pixelSearch, XX, YY, Bottom_Skip[1]-5, Bottom_Skip[2]-5, Bottom_Skip[1]+5, Bottom_Skip[2]+5, Bottom_Skip[3], 1, Fast RGB
		if(XX = ""){
			find_white_right := 0
		}
		if(XX != ""){
			find_white_right++
		if(find_white_left > Skip_Sensitivity && find_white_middle > Skip_Sensitivity && find_white_right > Skip_Sensitivity) {
			sleep Click_Timeout
			PhantomClick(Middle_Skip[1], Middle_Skip[2])
			break Loop_BattleEnd
		}
		}
		
		pixelSearch, XX, YY, Top_Skip[1]-5, Top_Skip[2]-5, Top_Skip[1]+5, Top_Skip[2]+5, Top_Skip[3], 1, Fast RGB
		if(XX = ""){
			find_white_left := 0
		}
		if(XX != ""){
			find_white_left++
		if(find_white_left > Skip_Sensitivity && find_white_middle > Skip_Sensitivity && find_white_right > Skip_Sensitivity) {
			sleep Click_Timeout
			PhantomClick(Middle_Skip[1], Middle_Skip[2])
			break Loop_BattleEnd
		}
		}
		
		
		pixelSearch, XX, YY, Middle_Skip[1]-5, Middle_Skip[2]-5, Middle_Skip[1]+5, Middle_Skip[2]+5, Middle_Skip[3], 1, Fast RGB
		if(XX = ""){
			find_white_middle := 0
		}
		if(XX != ""){
			find_white_middle++
		if(find_white_left > Skip_Sensitivity && find_white_middle > Skip_Sensitivity && find_white_right > Skip_Sensitivity) {
			sleep Click_Timeout
			PhantomClick(Middle_Skip[1], Middle_Skip[2])
			break Loop_BattleEnd
		}
		}
		
		now := A_TickCount-start_timeout
		if(now > Battle_Timeout*60*1000 && Enable_Crash_Handle = 1){
			Goto CrashHandle
		}
	}
	sleep 250
		
	count2 = 0
	Loop_AfterBattle:
	loop{
		pixelSearch, ZZ, YY, Next_White[1], Next_White[2], Next_White[1], Next_White[2], Black_Loading_Screen_Colour, 1, Fast RGB
		if(ZZ != ""){
			break Loop_AfterBattle
		}
		count = 0
		Loop_AfterBattleClicker:
		loop{
			pixelSearch, XX, YY, Next_White[1]-1, Next_White[2]-1, Next_White[1]+1, Next_White[2]+1, Next_White[3], 2, Fast RGB
			count++
			if(XX !=""){
				sleep 100
				PhantomClick(Next_White[1], Next_White[2])
				break Loop_AfterBattleClicker
			}
			count2++
			} until count > 20
		} until count2 > 400
	sleep 750
}

CrashHandle:
sleep 1000
PhantomClick(Crash_Home_Tab_Pixel[1], Crash_Home_Tab_Pixel[2])
sleep 1000
PhantomClick(Crash_Close_Pixel[1], Crash_Close_Pixel[2])
sleep 500
PhantomClick(Crash_Close_Pixel[1], Crash_Close_Pixel[2])
sleep 1000
start_timeout := A_TickCount
LoopC1:
Loop{
	now := A_TickCount-start_timeout
	pixelSearch, XX, YY, Crash_App_Launch[1]-24, Crash_App_Launch[2]-24, Crash_App_Launch[1]+24, Crash_App_Launch[2]+24, Crash_App_Launch[3], 5, Fast RGB
	if(XX != ""){
		sleep click_timeout
		PhantomClick(Crash_App_Launch[1], Crash_App_Launch[2])
		break LoopC1
	}
} until now > Menu_Timeout*1000

if (now > Menu_Timeout*1000){
Goto CrashHandle
}
start_timeout := A_TickCount 
LoopC2:
Loop{
	now := A_TickCount-start_timeout
	pixelSearch, XX, YY, Crash_Play_Blue[1]-2, Crash_Play_Blue[2]-2, Crash_Play_Blue[1]+2, Crash_Play_Blue[2]+2, Crash_Play_Blue[3], 2, Fast RGB
	if(XX != ""){
		sleep click_timeout
		PhantomClick(Crash_Play_Blue[1], Crash_Play_Blue[2])
		break LoopC2
	}
} until now > Menu_Timeout*1000*2

if (now > Menu_Timeout*1000){
Goto CrashHandle
}
resumed := 0

start_timeout := A_TickCount
LoopC3:
Loop{
	now := A_TickCount-start_timeout
	pixelSearch, XX, YY, Crash_Cancel_Brown[1]-2, Crash_Cancel_Brown[2]-2, Crash_Cancel_Brown[1]+2, Crash_Cancel_Brown[2]+2, Crash_Cancel_Brown[3], 2, Fast RGB
	if(XX != ""){
		sleep click_timeout
		PhantomClick(Crash_Cancel_Brown[1], Crash_Cancel_Brown[2])
		resumed := 1
		break LoopC3
	}
} until now > 10000

if (now > Menu_Timeout*1000){
Goto CrashHandle
}
start_timeout := A_TickCount
LoopC44:
Loop{
	if(resumed = 1){
		break LoopC44
	}
	now := A_TickCount-start_timeout
		
	pixelSearch, XX, YY, Crash_Event_Battle_Yellow[1]-2, Crash_Event_Battle_Yellow[2]-2, Crash_Event_Battle_Yellow[1]+2, Crash_Event_Battle_Yellow[2]+2, Crash_Event_Battle_Yellow[3], 6, Fast RGB
	if(XX != ""){
		battle_crash := 1
		sleep click_timeout
		PhantomClick(Crash_Event_Battle_Yellow[1], Crash_Event_Battle_Yellow[2])
		break LoopC44
	}

} until now > Menu_Timeout*1000

start_timeout := A_TickCount
LoopC4:
Loop{
	if(resumed = 1){
		break LoopC4
	}

	now := A_TickCount-start_timeout
	pixelSearch, XX, YY, Crash_Home_Scroll_Yellow[1]-2, Crash_Home_Scroll_Yellow[2]-2, Crash_Home_Scroll_Yellow[1]+2, Crash_Home_Scroll_Yellow[2]+2, Crash_Home_Scroll_Yellow[3], 6, Fast RGB
	if(XX != ""){
		sleep click_timeout
		PhantomClick(Crash_Home_Scroll_Yellow[1], Crash_Home_Scroll_Yellow[2])
		break LoopC4
	}
	
} until now > Menu_Timeout*1000

if (now > Menu_Timeout*1000){
Goto CrashHandle
}
start_timeout := A_TickCount
LoopC5:
Loop{
	if(resumed = 1){
		break LoopC5
	}
	if(battle_crash = 1){
		break LoopC5
	}

	now := A_TickCount-start_timeout
	pixelSearch, XX, YY, Crash_Raid_Dungeons_White[1]-2, Crash_Raid_Dungeons_White[2]-2, Crash_Raid_Dungeons_White[1]+2, Crash_Raid_Dungeons_White[2]+2, Crash_Raid_Dungeons_White[3], 6, Fast RGB
	if(XX != ""){
	sleep click_timeout
	PhantomClick(Crash_Raid_Dungeons_White[1], Crash_Raid_Dungeons_White[2])
	break LoopC5
	}
} until now > Menu_Timeout*1000
	
if (now > Menu_Timeout*1000){
Goto CrashHandle
}

if(possible_new_event > 5){
	Crash_Farm_Dungeons_Selection++
}
if (Crash_Farm_Dungeons_Selection > 5) {
Crash_Farm_Dungeons_Selection := 1
}
		
if(Crash_Farm_Dungeons_Selection) == 2 {
	crash_farm_selected := Crash_Farm_Dungeon_2
} else if(Crash_Farm_Dungeons_Selection) == 3 {
	crash_farm_selected := Crash_Farm_Dungeon_3
} else if(Crash_Farm_Dungeons_Selection) == 4 {
	crash_farm_selected := Crash_Farm_Dungeon_4
} else if(Crash_Farm_Dungeons_Selection) == 5 {
	crash_farm_selected := Crash_Farm_Dungeon_5
} else {
	crash_farm_selected := Crash_Farm_Dungeon_1
}

start_timeout := A_TickCount
LoopC6:
Loop{
	if(resumed = 1){
		break LoopC6
	}
	if(battle_crash = 1){
		break LoopC6
	}

	now := A_TickCount - start_timeout
	pixelSearch, XX, YY, Crash_Event_Dungeons_Green[1]-2, Crash_Event_Dungeons_Green[2]-2, Crash_Event_Dungeons_Green[1]+2, Crash_Event_Dungeons_Green[2]+2, Crash_Event_Dungeons_Green[3], 6, Fast RGB
	if(XX != ""){
		sleep click_timeout
		PhantomClick(crash_farm_selected[1], crash_farm_selected[2])

		break LoopC6
	}
} until now > Menu_Timeout*1000
if (now > Menu_Timeout*1000){
Goto CrashHandle
}
Goto Main_Loop

^Space::ExitApp
