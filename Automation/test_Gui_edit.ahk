
#SingleInstance force

; Generated using SmartGUI Creator 4.0
;========================= main =====================================
    name = control panel
    version = 2015071417
    

    Gui, Add, Button, x22 y32 w190 h40 , reload
    Gui, Add, Button, x22 y72 w190 h40 , function1
    Gui, Add, GroupBox, x12 y12 w210 h180 , system function

    
    Gui, Add, Edit, x240 y12 w470 h350 R20 vMyEdit, Edit
    GuiControl,, MyEdit, 
    
    ;====== display ========
    Gui, Show, x282 y374 h379 w740, %name% - %version%
    Gui, GuiName:Default
 
    Return
;=====================================================================
Buttonfunction1:
    ;MsgBox sdfwefsef
    ;Gosub  GuiClose
    ;updateText("EXE")
    appendText("EXE`n")
    return
    
GuiClose:
    ExitApp
    Gui,  Minimize
    Loop 6
    {
        Gui Flash
        Sleep 500  ; It's quite sensitive to this value; altering it may change the behavior in unexpected ways.
    }
    return

loadfile(){

    filename = C:\+work\CODES\fifaOnlineScript_clone\Automation\test.ahk
    FileRead, FileContents, %filename%

    GuiControl,, MyEdit, %FileContents%
    ;GuiControl,, MyEdit, loadfile

}

updateText(text){
    GuiControl,, MyEdit, %text%
}
appendText(text){
    GuiControlGet, CtrlContents,, MyEdit
    GuiControl,, MyEdit, %CtrlContents%%text%
    
    file  = 
    Run, %file%
    
}
