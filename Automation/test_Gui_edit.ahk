
#SingleInstance force

#Include %A_ScriptDir%\common\common.ahk

; Generated using SmartGUI Creator 4.0

;========================= main =====================================
name = control panel
version = 20151207

FileName := "C:\+work\CODES\fifaOnlineScript_clone\Automation\textFile"

modifierState := 0
modifierText := "___"
modifierTextIndex := 0

Gui, Add, GroupBox, x0 y0 w180 h320 , %version%
;bar:
Gui, Add, Text, x10 y13 w300 h30 +Left, ---------- suc ------ fail ------


Gui, Font, s10 cBlack Bold, Verdana  ; If desired, use a line like this to set a new default font for the window.
;GuiControl, Font, MyText  ; Put the above font into effect for a control.


bttns_x0    := 32
bttns_y0    := 26
bttn_w      := 40
bttn_h      := 30
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
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%2   vMyB112, 2
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0   vMyB110, 0 

;group 1+2
txt := "12"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%3   vMyB123, 3
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0   vMyB120, 0 

;group 2+2
txt := "22"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%3   vMyB223, 3
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0   vMyB220, 0 

;group 2+3
txt := "23"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%4   vMyB234, 4
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0   vMyB230, 0 

;group 3+3
txt := "33"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%4   vMyB334, 4
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0   vMyB330, 0 

;group 2+4
txt := "24"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%5   vMyB245, 5
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0   vMyB240, 0 

;group 4+5
txt := "45"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%6   vMyB456, 6
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_%txt%0   vMyB450, 0 

;group del
txt := "del"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
;Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_000   vMyB000, 000
Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_del   vMyBdel, del


;group modifier
txt := "***"
groupid := groupid + 1
x1 := 0 
x2 := txt_w
x3 := txt_w + bttn_w
y := bttns_y0 + bttn_h*groupid
;Gui, Add, Text,     x%x1%   y%y%   w%txt_w%    h%txt_h%        +Center, %txt%
Gui, Add, Button,   x%x2%   y%y%   w%bttn_w%   h%bttn_h%       gF_modifier  vMyModifier, %txt%
;Gui, Add, Button,   x%x3%   y%y%   w%bttn_w%   h%bttn_h%       gF_go, ->


    
    Gui, Add, Edit, x7 y320 w70 h268 R20 vMyEdit ReadOnly, Edit
    GuiControl,, MyEdit, 
    
    ;====== display ========
    Gui, Show, x715 y129 h650 w123, %name% - %version%
    Gui, GuiName:Default
 
    Return
;=====================================================================
F_000:
    handleButton("000`r`n")
    return
F_112:
    handleButton("112`r`n")
    return
F_110:
    handleButton("110`r`n")
    return
F_123:
    handleButton("123`r`n")
    return
F_120:
    handleButton("120`r`n")
    return
F_223:
    handleButton("223`r`n")
    return
F_220:
    handleButton("220`r`n")
    return
F_234:
    handleButton("234`r`n")
    return
F_230:
    handleButton("230`r`n")
    return
F_334:
    handleButton("334`r`n")
    return
F_330:
    handleButton("330`r`n")
    return
F_245:
    handleButton("245`r`n")
    return
F_240:
    handleButton("240`r`n")
    return
F_456:
    handleButton("456`r`n")
    return
F_450:
    handleButton("450`r`n")
    return  
    
F_del:
    deleteOne()
    return
F_modifier:
    clickModifier()
    return
F_go:
    clickModifier()
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
    
handleButton(text){
    global modifierState
    if (modifierState = 0){
        appendTextUI(text)
        appendTextFile(text)
    }else{ ;modifier is on
        RegExMatch(text,"\d{3}",str)
        ;log(" " + str)
        modifierAction(str)
    }
}

clickModifier(){
    global modifierState
    if (modifierState == 0){
        
        buttonOnModifier()
        modifierState = 1
    }else{
    
        buttonOnModifierBack()
        modifierState = 0
    }

}


buttonOnModifierBack(){

    GuiControl,, MyModifier, ***
    GuiControl,, MyB112, 2
    GuiControl,, MyB110, 0
    
    GuiControl,, MyB123, 3
    GuiControl,, MyB120, 0
    
    GuiControl,, MyB223, 3
    GuiControl,, MyB220, 0
    
    GuiControl,, MyB234, 4
    GuiControl,, MyB230, 0
    
    GuiControl,, MyB334, 4
    GuiControl,, MyB330, 0
    
    GuiControl,, MyB245, 5
    GuiControl,, MyB240, 0
    
    GuiControl,, MyB456, 6
    GuiControl,, MyB450, 0
    
    GuiControl,, MyB000, 000
    GuiControl,, MyBdel, del
   
}
buttonOnModifier(){

    GuiControl,, MyModifier, ___
    GuiControl,, MyB112, 0
    GuiControl,, MyB110, 1
    
    GuiControl,, MyB123, 2
    GuiControl,, MyB120, 3
    
    GuiControl,, MyB223, 4
    GuiControl,, MyB220, 5
    
    GuiControl,, MyB234, 6
    GuiControl,, MyB230, 7
    
    GuiControl,, MyB334, 8
    GuiControl,, MyB330, 9
    
    GuiControl,, MyB245, X 
    GuiControl,, MyB240, ->
    
    GuiControl,, MyB456,  
    GuiControl,, MyB450,  
    
    GuiControl,, MyB000,  
    GuiControl,, MyBdel,  
   
}
modifierAction(text){
    ipt := -1
    if (text = "112")  {
        ipt := 0
    }    
    if (text == "110") {
        ipt := 1  
    }  
    if (text == "123")  {
        ipt := 2   
    } 
    if (text == "120")  {
        ipt := 3    
    }
    if (text == "223") {
        ipt := 4    
    }
    if (text == "220")  {
        ipt := 5   
    } 
    if (text == "234") {
        ipt := 6    
    }
    if (text == "230") {
        ipt := 7   
    } 
    if (text == "334") {
        ipt := 8   
    } 
    if (text == "330") {
        ipt := 9    
    }
    if (text == "245") {
        ipt := "clean"    
    }
    if (text == "240") {
        ipt := "go"    
    }
    if (ipt != -1){
        modifierInput(ipt)
    }

}

modifierInput(n){
    global modifierText
    global modifierTextIndex
    
    if (n == "clean"){
        modifierTextIndex := 0
        modifierText := "___"
    }else if (n == "go"){
        GuiControlGet, CtrlContents,, MyModifier
        text = %CtrlContents%`r`n
        
        if (InStr(text,"_")){
        
        }else{
            appendTextUI(text)
            appendTextFile(text)
        }
        

    }else{
        ;log("n: ".n)
        S1 := SubStr(modifierText,1,1)
        S2 := SubStr(modifierText,2,1)
        S3 := SubStr(modifierText,3,1)

        if (modifierTextIndex = 0){
            S1 := n
        }
        if (modifierTextIndex = 1){
            S2 := n
        }
        if (modifierTextIndex = 2){
            S3 := n
        }
        modifierText := S1 . S2 . S3
        ;log("     " + modifierText )
        modifierTextIndex := modifierTextIndex + 1
        modifierTextIndex := Mod(modifierTextIndex,3)
    }
    GuiControl,, MyModifier, %modifierText%
}


updateText(text){
    GuiControl,, MyEdit, %text%
}

appendTextUI(text){

    ; get and append
    GuiControlGet, CtrlContents,, MyEdit
    GuiControl,, MyEdit, %CtrlContents%%text% 
    
    text = %CtrlContents%
    navigateToBottom(text)

}

navigateToBottom(text){

    word_array := StrSplit(text,"`r`n")
    alen := word_array.MaxIndex() - 17
    Loop %alen%  ; <-- Increase this value to scroll faster.
        SendMessage, 0x115, 1, 0, Edit1 
        ;WM_VSCROLL = 0x115 and the 0 after it is down.
    return

}
   
appendTextFile(text){
    global FileName
    FileAppend, %text%, %FileName%

}



deleteOne(){
    ; get and append
    GuiControlGet, CtrlContents,, MyEdit
    
    text = %CtrlContents%
    NewStr := RegExReplace(text, "\d{3}`n$")
    
    word_array := StrSplit(text,"`r`n")
    alen := word_array.MaxIndex()
    if (alen <= 0){
        return
    }
    
    GuiControl,, MyEdit, %NewStr%    

    navigateToBottom(NewStr)
    
    deleteOneFile()
}
deleteOneFile(){
    ;log("deleteOneFile")
    global FileName
    FileRead, FileContents, %FileName%
    if not ErrorLevel  ; Successfully loaded.
    {
        text = %FileContents%
        ;log(text)
        NewStr := RegExReplace(text, "\d{3}`r`n$")
        
        FileDelete, %FileName%
        FileAppend, %NewStr%, %FileName%
        FileContents =  ; Free the memory.
    }else{
        log("read failed")
    }
    
    
}
