#SingleInstance force

#Include %A_ScriptDir%\common\common.ahk

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






