
#SingleInstance force

; ------ 0001 -------
; Assign Ctrl-Alt-R as a hotkey to restart the script.
;
^!r::
{
	reloadCurrentScript("user called")
	return
}

; --- 0002 ----
;volcano
; WIN + Z:  1.start the everything, if not started.
; 2. toggle the search windows.
;
#z::
{
	path = "%ProgramFiles%/Everything/Everything.exe"
	showAndHideProgram("Everything",path)
	return

}
#q::
{
	testahk = "C:\+work\CODES\fifaOnlineScript\Automation\test.ahk"
	runAhkScript(testahk)
	return
}
;========================================
;	reload
;
;========================================
reloadCurrentScript(text:= "")
{
	SplashTextOn, 400, 150, !!,  `rReload script !!!!! wait~ `r ==========================`r %A_ScriptName% `r %text%
	Sleep, 1000
	SplashTextOff
	reload ;   Assign Ctrl-Alt-R as a hotkey to restart the script.
	return
}
;========================================
;
;========================================
runAhkScript(Target)
{
	Run, %Target%
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






