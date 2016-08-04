
#SingleInstance force


#Include %A_ScriptDir%\common\common.ahk

name = attach control
version = 2015071417

wintitle := name - version



    

WinGetPos , x, y , w , h , ahk_class FIFANG
xw := x + w
yy := y+220

IfWinNotExist, ahk_class FIFANG
{
    xw :=20
    y:=20
}

Gui, Add, Text, x10 y10 w100 h40 , Ctrl+Alt+g

Gui, Add, Button, x0 y32 w100 h40 , buy
;Gui, Add, Button, x0 y72 w100 h40 , upgrade
Gui, Add, Button, x0 y72 w100 h40 , exchange


Gui, Add, Button, x0 y112 w50 h40 , 112
Gui, Add, Button, x50 y112 w50 h40 , 110

Gui, Add, Button, x0 y152 w50 h40 , 123
Gui, Add, Button, x50 y152 w50 h40 , 120

Gui, Add, Button, x0 y192 w50 h40 , 223
Gui, Add, Button, x50 y192 w50 h40 , 220

Gui, Add, Button, x0 y232 w50 h40 , 234
Gui, Add, Button, x50 y232 w50 h40 , 230

Gui, Add, Button, x0 y272 w50 h40 , 334
Gui, Add, Button, x50 y272 w50 h40 , 330

Gui, Add, Button, x0 y312 w50 h40 , 245
Gui, Add, Button, x50 y312 w50 h40 , 240

Gui, Add, Button, x0 y352 w50 h40 , 000
Gui, Add, Button, x50 y352 w50 h40 , del

; Generated using SmartGUI Creator 4.0
Gui, -MinimizeBox -MaximizeBox
Gui, Show, x%xw% y%yy% h400 w100, wintitle
;Gui, GuiName:Default
	
Return


Buttonbuy:

WinActivate, ahk_class FIFANG
winGet,active_win_ID ,ID, A

shadowClick_(active_win_ID,978,804)
Sleep 200
shadowClick_(active_win_ID,631,695)
Sleep 1000
shadowClick_(active_win_ID,637,666)

return

Buttonupgrade:
WinActivate, ahk_class FIFANG
winGet,active_win_ID ,ID, A

shadowClick_(active_win_ID,968,769)
Sleep 3000
shadowClick_(active_win_ID,516,760)
Sleep 1000
shadowClick_(active_win_ID,516,760)
Sleep 1000
shadowClick_(active_win_ID,516,760)
Sleep 2500
shadowClick_(active_win_ID,1105,833)
Sleep 1000
shadowClick_(active_win_ID,1105,833)
Sleep 1000
shadowClick_(active_win_ID,1105,833)
return

Buttonexchange:
WinActivate, ahk_class FIFANG
winGet,active_win_ID ,ID, A

shadowClick_(active_win_ID,981,756)
Sleep 3000
shadowClick_(active_win_ID,666,849)
Sleep 1000
shadowClick_(active_win_ID,666,849)
Sleep 1000
shadowClick_(active_win_ID,666,849)

Sleep 1500
shadowClick_(active_win_ID,1105,833)
Sleep 1000
shadowClick_(active_win_ID,1105,833)

return

Button000:
inputTextToOnenote("000{Enter}", wintitle)
return
Button112:
inputTextToOnenote("112{Enter}", wintitle)
return
Button110:
inputTextToOnenote("110{Enter}", wintitle)
return
Button123:
inputTextToOnenote("123{Enter}", wintitle)
return
Button120:
inputTextToOnenote("120{Enter}", wintitle)
return
Button223:
inputTextToOnenote("223{Enter}", wintitle)
return
Button220:
inputTextToOnenote("220{Enter}", wintitle)
return
Button230:
inputTextToOnenote("230{Enter}", wintitle)
return
Button234:
inputTextToOnenote("234{Enter}", wintitle)
return

Button330:
inputTextToOnenote("330{Enter}", wintitle)
return
Button334:
inputTextToOnenote("334{Enter}", wintitle)
return

Button240:
inputTextToOnenote("240{Enter}", wintitle)
return
Button245:
inputTextToOnenote("245{Enter}{Del}{Del}{Del}{Del}", wintitle)
return
Buttondel:
inputTextToOnenote("{BACKSPACE}{BACKSPACE}{BACKSPACE}{BACKSPACE}", wintitle)
return



GuiClose:
ExitApp

inputTextToOnenote(text, previoiusWin){
    WinActivate, ahk_exe ONENOTE.EXE
    Send % text
    WinActivate, % previoiusWin
}



shadowClick_(processid, X, Y)
{
    ;in case user is using mouse
    keywait LButton
    keywait RButton
    
    
    ;CoordMode, Mouse, Screen
    ;SendMode Input
    
    ;stop user moving
    BlockInput  MouseMove
    
    MouseGetPos, OutputVarX, OutputVarY, MouseWin, OutputVarControl
    winGet,active_win_ID ,ID, A
    
    ;action
    WinActivate, ahk_id %processid%
    MouseClick , left , X, Y, 1, 0
    
    ;restore
    WinActivate, ahk_id %active_win_ID%
    MouseMove, OutputVarX, OutputVarY, 0

    BlockInput  MouseMoveOff
}
