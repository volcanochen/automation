#SingleInstance force


#Include %A_ScriptDir%\common\common.ahk

; ------ 0001 -------
; Assign Ctrl-Alt-R as a hotkey to restart the script.
;
^!r::
{
	reloadCurrentScript("User called")
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
#n::
{
	name = OneNote
	path = "%ProgramFiles%/Microsoft Office/Office14/ONENOTE.EXE"
	showAndHideProgram(name,path)
	return

}
^!f::
{
	testahk = "C:\Users\volcano\git\fifaOnlineScript\Automation\FifaOL3.ahk"
	runAhkScript(testahk)
	return
}











