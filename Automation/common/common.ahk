
;========================================
;	reload
;
;========================================
reloadCurrentScript(text:= "")
{
	
	splshow("Reload script !!!!! wait~ `r ==========================`r " A_ScriptName " `r " text)

	reload ;   Assign Ctrl-Alt-R as a hotkey to restart the script.
	return
}
;========================================
;
;========================================
runAhkScript(xx)
{
	splshow("Runing Ahk Script `r" xx)
	Run, %xx%
}
;========================================
;
;========================================
RunWaitOne(command) {
    ; WshShell object: http://msdn.microsoft.com/en-us/library/aew9yb99
    shell := ComObjCreate("WScript.Shell")
    ; Execute a single command via cmd.exe
    exec := shell.Exec(ComSpec " /C " command)
    ; Read and return the command's output
    return exec.StdOut.ReadAll()
}
;========================================
;
;========================================
RunWaitMany(commands) {
    shell := ComObjCreate("WScript.Shell")
    ; Open cmd.exe with echoing of commands disabled
    exec := shell.Exec(ComSpec " /Q /K echo off")
    ; Send the commands to execute, separated by newline
    exec.StdIn.WriteLine(commands "`nexit")  ; Always exit at the end!
    ; Read and return the output of all commands
    return exec.StdOut.ReadAll()
}

;========================================
;	toggle show and hide a program window
;
;========================================
showAndHideProgram(windowName, programPath)
{
	SetTitleMatchMode 2 ; 2: A window's title can contain WinTitle anywhere inside it to be a match. 
	IfWinExist %windowName%
	{
		IfWinActive %windowName%
		{
			WinMinimize  
		}else{
			WinActivate
			;Hotkey, #z, Off  ; disables the hotkey
		}
	}
	else{
		;MsgBox %programPath%
		Run %programPath%
		;Hotkey, #z, Off  ; disables the hotkey
	}
	return

}

;=================================================
; log interface
;=================================================
log(text)
{
	writeLog(text)
	if (true)
	{
		splshow(text)
	}

}
;=================================================
; log to file
;=================================================
writeLog(text)
{
	fileName := A_Desktop . "\Log_" . A_ScriptName . ".txt"
	FileAppend,%A_Now% %text%`n,  %fileName%
}
;=================================================
; splash show
;=================================================
splshow(text)
{
	number := 0
	strLines := StrSplit(text, "`r")
	line := strLines.MaxIndex()
	Loop % line
	{
		number_temp := StrLen(strLines[A_Index])
		if (number_temp > number){
			number := number_temp
		}
	}
	SplashTextOn, number*10, line*38, !!,  `r  %text% ;%line% %number%
	Sleep, 1000
	SplashTextOff
}













