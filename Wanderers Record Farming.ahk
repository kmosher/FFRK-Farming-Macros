#SingleInstance Force
#InstallMouseHook
#Warn UseUnsetLocal
#Warn UseUnsetGlobal
CoordMode, pixel, Screen
CoordMode, Mouse, Screen

;All pixel coordinates in this section must use the "Screen (less often used)" value.
;Unless otherwise specified, the search range will be a 3x3 box centered on the specified pixel.
;All colours in this section should be of the format 0xRRGGBB
;If the script won't run for you in Windows 10, you need to set your variables, compile the script as an EXE then run the EXE as Administrator.
;Alternitively set the AHK.exe main executable to always run as Administrator.
;Note: To stop the script, either close the script by right clicking the icon in the system tray or press Control+Space

;The amount of time, in minutes, you want the script to wait while in the battle before it decides something has gone wrong and triggers the crash handling.
Battle_Timeout := 1

;The amount of time, in seconds, you want the script to wait in menus before it decides something has gone wrong and triggers the crash handling.
Menu_Timeout := 10

;The amount of time, in milliseconds, the script will wait between finding a pixel and clicking.
;Due to FFRK's habit of drawing menus before they are clickable, setting this bellow too low will generally result in the script stalling, 
; if the default causes stalling increase until it stops stalling.
;(Default := 350)
Click_Timeout := 350

; Number of seconds to sleep after battle. This is also to lessen stalls where the script
; will try to click the next button too soon while things are still fading back in from battle
Sleep_After_Battle := 3

; Number of seconds to wait after Tyro has moved to see if you triggered an encounter
; Increase this if the script keeps triggering crash handlig in the middle of battle
Wait_For_Encounter := 3.5

;A variable to adjust the "sensitivity" of the Skip Button Detection. The higher it is, the more times it needs to "confirm" the button exists, 
; so will click the button slower, but will be less likely to false trigger. The lower it it, the less times it needs to "confirm" the button exists, 
; so will click the button faster but it might trigger falsely.
;(Default := 3)
Skip_Sensitivity := 3

; Pixels from the 4 different dungeon banners in Wanderer's Record
; Technically, you only need to fill in the one you want to farm
Records := {}
Records["Forest"] := [-1552,232,0x7D0807],
Records["Town"] := [-1528,302,0x3F189A],
Records["Cavern"] := [-1531,375,0x4C033B],
Records["Shrine"] := [-1527,443,0x6D0F35],

; Which record to farm
Record_Choice := "Forest"

;A YELLOW pixel in the center of the screen that can sometimes be covered up by the grey "Loading" dialog. This is to prevent misclicks of the Enter Dungeon button when it is not active.
Enter_Dungeon_Yellow := [-1686,384,0xFADAA2]

;A BLUE pixel on the "Enter Dungeon" button.
Enter_Dungeon_Blue := [-1596,627,0x051A99]

;A BLUE pixel on the "GO!" button.
Go_Blue := [-1672,674,0x0520AC]

;A sequence of steps to take to go through each given dungeon
;You can specify either a "Click" with one pixel coordinate 
;(usually the white in the middle of the little shiny spot to walk there)
;Or you can specify a "Drag" with a start and end point. (I use Tyro's hat as the starting point)
;
; TODO: Scroll wheel events work in record dungeons and may be less finnicky than drags.
;
; NOTE: AutoHotKey doesn't truly support array definitions across multiple lines like you might
; expect from other languages. Each line has to start with a comma so it's joined to the line above it.
Command_Sequence := {}
Command_Sequence["Forest"] := [["Click", [-1669,275,0xFFFFF7]]
	, ["Drag", [-1669,276,0x213142], [-1665,571,0x213142]]
	, ["Click", [-1663,180,0xFFFFF7]] 
	, ["Click", [-1668,148,0xFFFFF7]] 
	, ["Click", [-1527,309,0xFFFFF7]] 
    , ["Click", [-1521,307,0xFFFFF7]]
	, ["Click", [-1589,94,0xFFFFF7]]]

; TODO: Map the other dungeons 

; A pixel near the top or bottom of the screen that's always black while a battle is loading
Loading_Black := [-1677,673,0x000000]
	
;Differently coloured pixels in the Skip Button
;For best results pick two different blue ones and a white one.
Top_Skip := [-1531,588,0x1F33AF]
Middle_Skip := [-1536,601,0xFFFFFF]
Bottom_Skip := [-1533,616,0x01186F]

;A WHITE pixel in the "Next" button text after the battle is won, will be used for all the next buttons.
;The colour code should be 0xFFFFFF unless you've got a really weird setup.
Next_White := [-1660,598,0xFFFFFF]

; A pixel on the Menu button at the top-right of the record dungeon
Menu := [-1511,64,0xACBCFA]

; A pixel on the Retreat button
Retreat_Button := [-1564,150,0x4A6A46]

; A pixel on the Quit button to confirm your retreat
Quit := [-1592,452,0x1C90F5]

; A pixel on the Next button after quitting
Next_After_Quit := [-1670,591,0x051A9B]

;************************;
;*****Crash Handling*****;
;************************;
;This will enable the macro to recover for when (yes, when) FFRK crashes.
;It can handle either the infinite black loading screen or a total crash to home screen.
;This only works for emulators with a tab-like switcher at the top of the screen, like MuMu.
;However, since this relies on exact positioning, the emulator needs to be at the same position each time.
;You may need to change the sequence of clicks at the start of Crash_Handle to match how to close and
;re-launch FFRK in your emulator
Enable_Crash_Handle := 1

;A pixel on the tab that brings up the home screen (not the X, since there is no X you can't close this tab)
Crash_Home_Tab_Pixel := [-1830, 17,0xA5A6AA]

;A pixel on the X that closes the current tab (this is for the infinite black loading screen crash).
Crash_Close_Pixel := [-1698, 17, 0x1282B8]

;The position of the FFRK launcher icon. For best results, select a WHITE pixel somewhat centered.
;Please note that when you close an app on MeMu it will go to the default launcher, not Nova Launcher
;As such please use the position of the app on the default launcher.
;Searches a 50x50 box on the specified pixel.
Crash_App_Launch := [-1597,114,0x9F7366]

;A BLUE pixel on the blue "Play" button when FFRK launches.
Crash_Play_Blue := [-1667,572,0x051A99]

; The close button on the announcements popup
; Don't worry if you can't find the coords for this right now
; the crash handling will continue gracefully even if this is wrong
Crash_Close_Messages_Brown := [-1672,643,0x291511]

;A BROWN pixel on the "Cancel" button when resuming an interrupted fight (This is for the battle load crash).
Crash_Cancel_Brown := [-1768,491,0x28120E]

;A YELLOW pixel in the word "Battle" when you're "In Battle" in an Event Dungeon.
;To force this screen, enter any Event Battle staging screen, and before going into the battle itself, press "Home".
Crash_Event_Battle_Yellow := [-1676,447,0x751B15]

; A pixel in the middle of the special Summer Sun Festival 2020 button 
; at the top-middle of the home screen
Crash_Summer_Sun := [-1605,189,0xB9ACA9]

; A pixel on the Wanderer's Record event
Crash_Wanderers_Record := [-1536,146,0x6CDC74]



;*******************************************************************;
;**Do not edit below this line unless you know what you are doing.**;
;*****************Or do, I'm a comment, not a cop.******************;
;*******************************************************************;

; Quickly steal the mouse to click on a position and then
; return the pointer and focus to where it was previously
PhantomClick(startPixel, endPixel:=false) {
	BlockInput, On
	MouseGetPos oldX, oldY
	WinGetTitle, TitleA, A
	if(endPixel) {
		; Can't use the normal MouseClicDrag because the drag detection
		; in FFRK is wonky af
		MouseClick, Left, startPixel[1], startPixel[2], 1, 0
		sleep 100
		MouseClick, Left, startPixel[1], startPixel[2], 1, 0, D
		sleep 500
		MouseClick, Left, endPixel[1], endPixel[2], 1, 60, U
		sleep 500
	} else {
		MouseClick, Left, startPixel[1], startPixel[2], 1, 0
	}
	sleep 10
	MouseMove %oldX%, %oldY%, 0
	WinActivate, %TitleA%
	BlockInput, Off
}

MenuClicker := {}
MenuClicker.default_timeout := Menu_Timeout
MenuClicker.click_sleep := Click_Timeout
MenuClicker.find := Func("Find")
MenuClicker.click := Func("FindAndClick")
MenuClicker.drag := Func("FindAndDrag")

Find(this, pixel, radius:=3, timeout:=-1) {
	if (timeout == -1) {
		timeout := this.default_timeout
	}
	timeout_start := A_TickCount
	loop{
		PixelSearch, XX, YY, pixel[1] - radius, pixel[2] - radius, pixel[1] + radius, pixel[2] + radius, pixel[3], 5, Fast RGB
		if(XX != ""){
			return [XX, YY]
		}
		duration := A_TickCount - timeout_start
		if(duration > timeout * 1000){
			throw Exception(Format("Can't find pixel: [{:d}, {:d}, {:#X}]", pixel[1], pixel[2], pixel[3]))
		}
	}
}

FindAndClick(this, pixel, radius:=3, timeout:=-1, click_sleep:=-1) {
	if (click_sleep == -1) {
		click_sleep := this.click_sleep
	}
	foundPixel := this.find(pixel, radius, timeout)
	sleep click_sleep
	PhantomClick(foundPixel)
}

FindAndDrag(this, startPixel, endPixel, radius:=3, timeout:=-1, click_sleep:=-1) {
	if (click_sleep == -1) {
		click_sleep := this.click_sleep
	}
	foundPixel := this.find(startPixel, radius, timeout)
	sleep click_sleep
	PhantomClick(foundPixel, endPixel)
}

join( strArray )
{
  s := ""
  for i,v in strArray
    s .= ", " . v
  return substr(s, 3)
}

clicker := MenuClicker

; Handle the 
BattleEnd(clicker) {
	global
	local start_timeout, elapsed
	start_timeout := A_TickCount
	loop{
		try {
			loop % Skip_Sensitivity {
				clicker.find(Top_Skip, 5, 0)
				clicker.find(Middle_Skip, 5, 0)
				clicker.find(Bottom_Skip, 5, 0)
			}
			PhantomClick(Middle_Skip)
			break
		}
		elapsed := A_TickCount - start_timeout
		if(elapsed > Battle_Timeout * 60 * 1000){
			throw Exception("Battle Timed Out")
		}
	}
	sleep 250	
	start_timeout := A_TickCount
	loop{
		try {
			clicker.find(Loading_Black, 0, 0)
			sleep Sleep_After_Battle * 1000
			return 0
		}
		try { 
			clicker.click(Next_White, 1, 0)
		}
		elapsed := A_TickCount - start_timeout
		if(elapsed > Menu_Timeout * 1000){
			throw Exception("Timed Out After Battle")
		}
	}
}

Retreat(clicker) {
	global
	clicker.click(Menu)
	try {
		clicker.click(Retreat_Button,,3)
	; Sometimes the script clicks Menu too fast when coming out of a battle
	; Just retry once in that case
	} catch {
		clicker.click(Menu)
		clicker.click(Retreat_Button)
	}
	clicker.click(Quit)
	clicker.click(Next_After_Quit)
}

Main_Loop:
loop{
	try {
		clicker.click(Records[Record_Choice])
		clicker.find(Enter_Dungeon_Yellow)
		clicker.click(Enter_Dungeon_Blue)
		clicker.click(Go_Blue)
		sleep 2000
		commands := Command_Sequence[Record_Choice]
		try{
			; for-loops in AHK seem to flatten multi-dimensional arrays
			; so we do one old-school
			i := 1
			loop % commands.Length() {
				command := commands[i]
;				MsgBox % Format("{:s}: [{:s}], [{:s}]", command[1], join(command[2]), join(command[3]))
				if(command[1] == "Click") {
					clicker.click(command[2], 24)
					try { 
						clicker.find(Loading_Black, 0, Wait_For_Encounter)
						try {
							BattleEnd(clicker)
						} catch e {
							if (Enable_Crash_Handle) {
								goto Crash_Handle
							} else {
								throw e
							}
						}
					}
				} else if (command[1] == "Drag") {
					clicker.drag(command[2], command[3], 24)
				} else {
					throw Exception(Format("Unkown command {:s}", command[1]))
				}
				sleep 500
				i := i + 1
			}
		}
		Retreat(clicker)
	} catch e {
		if (Enable_Crash_Handle) {
			goto Crash_Handle
		} else {
			throw e
		}
	}
}

Crash_Handle:
try {
	PhantomClick(Crash_Close_Pixel)
	sleep 500
	PhantomClick(Crash_Close_Pixel)
	sleep 500
	PhantomClick(Crash_Home_Tab_Pixel)
	sleep 500
	clicker.click(Crash_App_Launch, 24)
	clicker.click(Crash_Play_Blue,, 30)
	try {
		clicker.click(Crash_Cancel_Brown,, 10) 
		goto Main_Loop
	}
	try {
		clicker.click(Crash_Close_Messages_Brown,, 5)
	}
	inBattle := false
	try {
		clicker.find(Crash_Event_Battle_Yellow,, 10)
		inBattle := true
	}
	clicker.click(Crash_Summer_Sun)
	clicker.click(Crash_Wanderers_Record)
	if (inBattle) {
		Retreat(clicker)
	}
	goto Main_Loop
} catch {
	goto Crash_Handle
}

^Space::ExitApp
