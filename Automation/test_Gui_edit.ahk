
#SingleInstance force

; Generated using SmartGUI Creator 4.0

;========================= main =====================================
name = control panel
version = 20151207
    
Gui, Add, GroupBox, x0 y0 w180 h320 , %version%
;bar:
Gui, Add, Text, x10 y10 w300 h30 +Left, ---------- suc ------ fail ------


Gui, Font, s10 cRed Bold, Verdana  ; If desired, use a line like this to set a new default font for the window.
;GuiControl, Font, MyText  ; Put the above font into effect for a control.


bttns_x0    := 32
bttns_y0    := 26
bttn_w    := 40
bttn_h    := 30
txt_w       := 30
txt_h       := 30

;group 1+1
groupid := 0
txt := "11"
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%2, 2
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0, 0 

;group 1+2
groupid := 1
txt := "12"
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%3, 3
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0, 0 

;group 2+2
groupid := 2
txt := "22"
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%3, 3
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0, 0 

;group 2+3
groupid := 3
txt := "23"
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%4, 4
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0, 0 

;group 3+3
groupid := 4
txt := "33"
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%4, 4
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0, 0 

;group 2+4
groupid := 5
txt := "24"
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%5, 5
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0, 0 

    
    Gui, Add, Edit, x7 y320 w70 h268 R20 vMyEdit ReadOnly, Edit
    GuiControl,, MyEdit, 
    
    ;====== display ========
    Gui, Show, x715 y129 h595 w123, %name% - %version%
    Gui, GuiName:Default
 
    Return
;=====================================================================
F_112:
    appendText("112`n")
    return
F_110:
    appendText("110`n")
    return
F_123:
    appendText("123`n")
    return
F_120:
    appendText("120`n")
    return
F_223:
    appendText("223`n")
    return
F_220:
    appendText("220`n")
    return
F_234:
    appendText("234`n")
    return
F_230:
    appendText("230`n")
    return
F_334:
    appendText("334`n")
    return
F_330:
    appendText("330`n")
    return
F_245:
    appendText("245`n")
    return
F_240:
    appendText("240`n")
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

    ; get and append
    GuiControlGet, CtrlContents,, MyEdit
    GuiControl,, MyEdit, %CtrlContents%%text% 
    
    
    text = %CtrlContents%
    
    ;text := "dfadfa`nsdfa`nsdf"
    ;scroll down to input
    word_array := StrSplit(text,"`n")
    alen := word_array.MaxIndex() - 17
    ;slen := floor(StrLen(CtrlContents) / 4) - 17
    
    ;GuiControlGet, CtrlContents,, MyEdit
    ;GuiControl,, MyEdit, %CtrlContents% %alen%
    
    Loop %alen%  ; <-- Increase this value to scroll faster.
        SendMessage, 0x115, 1, 0, Edit1 
        ;WM_VSCROLL = 0x115 and the 0 after it is down.
    return

}
