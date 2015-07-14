
#SingleInstance force

name = control panel
version = 2015071417

    Gui, Add, Button, x22 y32 w190 h40 , reload
    Gui, Add, Button, x22 y72 w190 h40 , function1
    Gui, Add, GroupBox, x12 y12 w260 h180 , system function
    ; Generated using SmartGUI Creator 4.0
	
    Gui, Show, x127 y87 h379 w479, %name% - %version%
	Gui, GuiName:Default
		
    Return

	Buttonfunction1:
	;MsgBox sdfwefsef
	Gosub  GuiClose
	return
	
    GuiClose:
    ;ExitApp
    Gui,  Minimize
    Loop 6
	{
		Gui Flash
		Sleep 500  ; It's quite sensitive to this value; altering it may change the behavior in unexpected ways.
	}
    return
