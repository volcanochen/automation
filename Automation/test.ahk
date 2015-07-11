;
;ctrl -> ^
;alt ->  !
;win ->  #
;shelf -> +
;
;


#SingleInstance force

; ------ 0001 -------
; Assign Ctrl-Alt-R as a hotkey to restart the script.
;
^!r::
{
	SplashTextOn, 400, 150, !!,  `rReload script !!!!! wait~ `r ==========================`r %A_ScriptName%  
	Sleep, 1000
	SplashTextOff
	reload ;   Assign Ctrl-Alt-R as a hotkey to restart the script.
	;error handling:
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
	return
}
; --- 0002 ----
;volcano
; WIN + Z:  1.start the everything, if not started.
; 2. toggle the search windows.
;
#z::
{
IfWinExist Everything
{
	IfWinActive, Everything
	{
		WinMinimize  
	}else{
		WinActivate
		;Hotkey, #z, Off  ; disables the hotkey
	}
}
else{
	Run %ProgramFiles%\Everything\Everything.exe
	;Hotkey, #z, Off  ; disables the hotkey
}
return
}


; ---- 0003 text auto-----
;
::btw::by the way
:*b0:<em>::</em>{left 5}


#q::
test()
test()
{
;	ControlGetFocus, OutputVar, Untitled - Notepad
;if ErrorLevel
;    MsgBox, The target window doesn't exist or none of its controls has input focus.
;else
;    MsgBox, Control with focus = %OutputVar%
	
	tgpPath_pre_title = 腾讯游戏平台
	tgpPreWin_ahkclass = ahk_class TWINCONTROL
	tgpPrePasswordControl_ahkclass = ahk_class Edit
	
	SetTitleMatchMode, MatchMode
ControlGetFocus, OutputVar, tgpPreWin_ahkclass
if ErrorLevel
    MsgBox, The target window doesn't exist or none of its controls has input focus.
else
    MsgBox, Control with focus = %OutputVar%
	
	WinActivate tgpPath_pre_title,tgpPreWin_ahkclass
	WinActivate tgpPrePasswordControl_ahkclass
	
	return	
}
return





