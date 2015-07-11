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














