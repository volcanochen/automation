#SingleInstance force

#Include C:\Users\volcano\git\fifaOnlineScript\Automation\common\common.ahk

#q::
{
	account1 := "45376928"
	account2 := "798010623"
	account3 := "2926133917"
	account4 := "2990124579"
	account5 := "3252739241"
	cipherPassFile1 := "password1" ; for minor account
	cipherPassFile2 := "password2" ; for 4537
	cipherPassFile3 := "password3" ; for 7980
	
	
	TGP.loginTGP(account1,cipherPassFile2)

	return

}

class PASSWORD
{
	
	static cryptTool := "D:\+downs\crypt_file\openssl.exe"
	
	decrypt(cipherPassFile1)
	{
		workingDirectory := "C:\Users\volcano\git\fifaOnlineScript\Automation\"
		tempfile := workingDirectory . cipherPassFile1
		tempfileO := workingDirectory . "xxxxxxtempoxxxx"
		
		com := this.cryptTool " enc -aes128  -d -in " tempfile " -out " tempfileO " -k volcano"
		;MsgBox % com
		run % com
		str := ""
		file := FileOpen(tempfileO, "rw")
		str := file.read()
		file.Close()
		;for security
		file := FileOpen(tempfileO, "w")
		file.write("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		file.Close()
		;MsgBox % str
		FileDelete, % tempfileO
	
		return str
	}


}


class TGP
{
	static path := "D:\Program Files\Tencent\TGP\tgp_daemon.exe"
	static login_title := "腾讯游戏平台"
	static login_ahkclass := "ahk_class TWINCONTROL"
	
	;login stage
	static login_w:=  514
	static login_h:= 264
	
	;main window stage
	static mw_w:= 282
	static mw_h:= 717
	
	;minimized 
	static min_h :=  27
	
	isStarted()
    {
		rt := 0
		if (WinExist(TGP.login_ahkclass)){
			rt := 1
		}
        return rt
    }
	
	; 0: not started
	; 1: login stage
	; 2: main stage
	; 3: minimized
	getState()
	{
		if (TGP.isStarted()){
			WinGetPos , X, Y, Width, Height, % TGP.login_ahkclass
			;MsgBox % X  "  "   Y  "  "  Width "  "    Height
			if (Height == TGP.mw_h ){
				return 2
			}
			if (Height == TGP.login_h){
				return 1
			}
			if (Height == TGP.min_h){
				return 3
			}
		}
		return 0
	}
	
	loginTGP(account, passfile)
	{
		if (this.getState() == 0)
		{
			run % TGP.path
			passControl := "ahk_class Edit"

			WinWait %passControl% , , 60
			if ErrorLevel
			{
				log("WinWait timed out.")
				return
			}
			;run to login stage
			sleep 1000
			this.loginTGP(account, passfile)
			
		}else if (this.getState() == 1){
			
			;MsgBox stage login
			;splshow ("in")
			sleep 1000
			mouseClick , left,6,-34,2
			sleep 1000
			send , %account%
			sleep 500
			
			isPasswordDone := 0
			PixelGetColor,OutputVar , 314,119
			
			if (OutputVar == "0xFFFFFF"){
			
				isPasswordDone = 1
			}else{
				MsgBox ERROR
			}
			
			if (isPasswordDone){
				
				mouseClick , left,381,214
				Sleep 10000
				this.loginTGP(account, passfile)
			}

		}else if (this.getState() == 2){
		
			mouseClick , left,-157,223
		
		}
	
	}

	

}

threadswitch()
{

	CoordMode, Mouse, Screen  ; 
  while(1)
  {
	  click 1137,37
    	   sleep 20000

	  click 1505,139
    	   sleep 20000

	  click 1872,248
    	   sleep 20000
  }	

}

buy()
{

  while(1)
  {
	  click 1085,518
    	   sleep 100

	  click 614,521
    	   sleep 100

	  click 742,791
    	   sleep 200

	  click 742,791
    	   sleep 100
  }
}

dafuweng()
{

  while(1)
  {
	  click 1085,518
    	   sleep 100

	  click 614,521
    	   sleep 100

	  click 742,791
    	   sleep 200

	  click 742,791
    	   sleep 100
  }
}

test()
{
  while(1)
  {
	  click 1085,518
    	   sleep 100

	  click 614,521
    	   sleep 100

	  click 742,791
    	   sleep 200

	  click 742,791
    	   sleep 100

	  ;WinGet, active_id, PID, ahk_class FIFANG
;SendPlay Joy1 
;ControlSend ,active_id,Joy1,,,,


	}


}

;============================================================================
;  -------  8001 -------
;  ---- fifa online lauch auto----
;============================================================================
		
		
;============================================================================
; global variables
;============================================================================			
globalDef()
{
	global fifaWinName 
	fifaWinName  := "FIFA Online 3登录程序"
	global account1 := "45376928"
	global pass1 := ""
	global pid1 :=  0
  
	global account2 := "798010623"
	global pass2 := ""
	global pid2 := 0
  
	global secondFlag := 0
  
	;MsgBox test define %fifaWinName% 
}
;============================================================================
; log function - via tencent Game Platform
;============================================================================	
^!1::
loginViaTGP()
return

loginViaTGP()
{
	tgpPath = "D:\Program Files\Tencent\TGP\tgp_daemon.exe"
	tgpPath_pre_title = "腾讯游戏平台"
	tgpPreWin_ahkclass = ahk_class TWINCONTROL
	tgpPrePasswordControl_ahkclass = ahk_class Edit
	
	Run %tgpPath%
		
	while (!(WinExist(tgpPreWin_ahkclass) AND  WinExist(tgpPrePasswordControl_ahkclass)))
	{
		sleep 1000
	}
	
	if (isTGPPrewin()){
	;first start
		WinActivate tgpPreWin_ahkclass
		WinActivate tgpPrePasswordControl_ahkclass
		
		;339,73
		;85,-33
		;357,114
		;ahk_class Edit
		MouseClick, left,85,-33, 2
	}else{
		
		
	}
}
isTGPPrewin(){
	return 1
}

;============================================================================
; log function
;============================================================================		
#o::
globalDef()
loginFifaAccout(account1,pass1)
return
		
#p::
globalDef()
loginFifaAccout(account2,pass2)
return

loginFifaAccout(account1,pass1)
{
	if fifaLoginOn()
	{
	    WinActivate
	}
	else
	{
	    lauchFifa()
	    ;MsgBox test lauchFifa
	}
	if readyToInputFifa()
	{
	   ;MsgBox loginFifa
		loginFifa(account1,pass1)
	}
	return
}
fifaLoginOn()
{	
	global fifaWinName 
	;MsgBox test fifaLoginOn %fifaWinName%
	IfWinExist %fifaWinName%
	{
		return true
	}else
	{
		return false
	}
}
lauchFifa()
{
  global fifaWinName
  global pid1
  Run D:\FIFA Online 3\TCLS\Client.exe

  ;MsgBox test lauchFifa before wait %fifaWinName%
  WinWait  %fifaWinName%
  WinGet, active_id, PID, %fifaWinName%
  pid1 := active_id

}
readyToInputFifa()
{
	;MsgBox test readyToInputFifa

	sleep 1000
	;SoundBeep  
	sleep 1000
	;SoundBeep 
	sleep 2000
	;SoundBeep 
	sleep 2000
	;SoundBeep  
	sleep 2000
	;SoundBeep 
	sleep 2000
	;SoundBeep 
	sleep 2000
	;SoundBeep  
	return true
}
loginFifa(a, p)
{
  account := a
  pass := p
	if fifaLoginOn()
	{
		WinActivate
    WinWait  %fifaWinName%
		sleep 1000
    click 981,387, 0
    sleep 1000
    click 2
    sleep 2000
    send %account%
    sleep 2000
    send {tab}
    sleep 2000
    send %pass%{enter}
    sleep 10000
    click 638,369
		sleep 2000
    click 2
		SoundBeep  
		waitGameWin()
		SoundBeep  

	}
}
waitGameWin()
{
   WinWait ahk_class FIFANG
}


;  ---------------------------------------------------------------------
;  -------  8002 -------
;  ---- fifa online play manager auto----
;
#k::
playManagerAuto()
playManagerAuto()
{
	log("playManagerAuto1")
	activateFifa()
	gotoManagerMode3()

}
return

#j::
playManagerAuto2()
playManagerAuto2()
{
  log("playManagerAuto2")

	activateFifa2()
	secondFlag := 1
}
return



^!k::
setInterrup()
return

#m::

displayCnt()
return
;--------------------------------------------------------------------

getPidFromWinName(WinName)
{
	SetTitleMatchMode 3
	WinGet, active_id, PID, %WinName%
	;msgbox pid %active_id%
	return active_id
}

splashBox(text)
{
	SplashTextOn, 400, 50, !!,  `r%text%
	;SplashTextOn, 400, 50, !!,  `rReload script !!!!! wait~
	
	Sleep, 1000
	SplashTextOff
	
}

displayCnt()
{
	global playCnt
	global pid1
	global i
	msgBox have played %playCnt% (pid: %pid1%) (%i% seconds)
	
}
activateFifa()
{
	global pid1
	;WinActivate ahk_class FIFANG
	WinGet, active_id, PID, ahk_class FIFANG
  pid1 := active_id
  ;msgbox %pid1%
}

activateFifa2()
{
	global pid2
	;WinActivate ahk_class FIFANG
	WinGet, active_id, PID, ahk_class FIFANG
  pid2 := active_id
  ;msgbox %pid2%
}

testfifaClick()
{
	global pid1
	activateFifa()
	fifaClick(pid1,692,986)

}
fifaClick(pid, x, y)
{
	  
		WinActivate, ahk_pid %pid%
		click %x%,%y%
    sleep 1000
}

winClick(pid, x, y)
{
	  ;msgbox winclick %x% %y%
		WinActivate, ahk_pid %pid%
		click %x%,%y%
		sleep 50
		click %x%,%y%
    sleep 1000
}


gotoManagerMode()
{
	 global pid1
	 global playCnt
	 playCnt := 0
	 
	  fifaClick(pid1, 692,986)

    fifaClick(pid1, 516,516)
    sleep 3000
    
    loop, 35
    {
    	playCnt++
	    waitForManagerModeScreen()
	    sleep 5000
	    
	    fifaClick(pid1, 1240,998)
	    sleep 50000 ;wait game start
	    
	    setTatic()
	    
	    fifaClick(pid1, 1240,998)
	    
	    repeatEsc()
	    
	    sleep 5000  ;for experience update
	    fifaClick(pid1, 1240,998)
	    
	    sleep 2000
	    fifaClick(pid1, 1240,998)
  	}
}

isManagerMode(pid)
{
  counter := 0
  counterMax := 30
  startX := 0
  startY := 0
  w := 0
  h := 0
	while(true)
	{
		makeSearchable(pid)
		getSearchPos(pid, startX,startY,w,h)
		if (findImagePos("C:\Users\volcano\Desktop\FifaAuto\autoSelect.png",foundX,foundY,startX,startY, w,h))
		{
			;msgbox found (%foundX%,%foundY%)
			
			return true
		}else
		{
			if (counter > counterMax)
			{	
				return false
			}
			splashBox("not found~!")

		}
		counter++
		sleep 2000
	}
	
}
cleanUp(pid)
{
	log("cleanUp")
	findAndClick(pid, "C:\Users\volcano\Desktop\FifaAuto\xvyue.png")
	findAndClick(pid, "C:\Users\volcano\Desktop\FifaAuto\xvyue1.png")
	
	findAndClick(pid, "C:\Users\volcano\Desktop\FifaAuto\endMatch3.png")
	
	findAndClick(pid, "C:\Users\volcano\Desktop\FifaAuto\abort3.png")
	findAndClick(pid, "C:\Users\volcano\Desktop\FifaAuto\abort2.png")
	findAndClick(pid, "C:\Users\volcano\Desktop\FifaAuto\needConfirm.png")
	findAndClick(pid, "C:\Users\volcano\Desktop\FifaAuto\upgradeComfirm.png")
	log("cleanUp End")
}


gotoManagerMode3()
{
	;the first one
	 global pid1
	 global pid2
	 
	 global playCnt
	 playCnt := 0
	 errorCntManagerMode := 0
	 
	 findAndClick(pid1, "C:\Users\volcano\Desktop\FifaAuto\goPaiweisai.png")
	 findAndClick(pid2, "C:\Users\volcano\Desktop\FifaAuto\goPaiweisai.png")
	  ;fifaClick(pid1, 606,974)

    loop, 34
    {
    	playCnt++
    	log("start " playCnt)
    	sleep 8000
   		fifaClick(pid1, 1000,800)
   		fifaClick(pid2, 1000,800)
   		sleep 90
   		fifaClick(pid1, 1000,800)
   		fifaClick(pid2, 1000,800)
   		
   		;findAndClick(pid1,"C:\Users\volcano\Desktop\FifaAuto\goJingjiren.png")
    	
    	if (isManagerMode(pid1) )
    	{
    		log("in manager mode")
    	}else
    	{
    		log("Error in manager mode")
    		errorCntManagerMode++
    		
    		if (errorCntManagerMode > 2)
    		{
    			log("guess still on randon choose")
    			fifaClick(pid1, 1240,998)
    		 	errorCntManagerMode := 0
    		 	log("playCnt " playCnt)
    		 	playCnt = playCnt - 5
    		 	log("playCnt " playCnt)
    		}else
    		{
    		 	cleanUp(pid1)	
    		}
    		continue
    	}
    	
	    waitForManagerModeScreen()
	    sleep 6000 ;wait game start
	    
	    setTatic()
	    
	    fifaClick(pid1, 1240,998)
	    ;findAndClick(pid1,"C:\Users\volcano\Desktop\FifaAuto\Ready.png")
	    	
	    log("repeatEsc in ")
	    repeatEsc()
	    log("repeatEsc out")
	    
	    sleep 5000  ;for experience update
	    
	    cleanUp(pid1)
	    
	    ;if (findAndClick(pid1,"C:\Users\volcano\Desktop\FifaAuto\randonChoose.png"))
	    if (0){
	    }
	    else
	    {
	    	log("randon choose")
	    	fifaClick(pid1, 1240,998)
	    }
	    
	    sleep 2000
	    ;if (findAndClick(pid1,"C:\Users\volcano\Desktop\FifaAuto\endMatch.png"))
	    if (0){
	    }
	    else
	    {
	    	log("end match")
	    	fifaClick(pid1, 1240,998)
	    }
	    
	    sleep 2000
	    if (findAndClick(pid1,"C:\Users\volcano\Desktop\FifaAuto\playoff.png"))
	    {
	    	log("accept result")
	    	fifaClick(pid1, 1240,998)
	    }
	    
  	}
}

onFifaActivatedPid(pid)
{
	;msgbox %pid%
	IfWinActive, ahk_pid %pid%
	{
	    return true
	}else
	{
	  	return false	
	}
}
onFifaActivated()
{
	IfWinActive, ahk_class FIFANG
	{
	    return true
	}else
	{
	  	return false	
	}
}
setInterrup()
{
	soundbeep
	global interrupt
	interrupt := true
	
}
findAndClick(pid,path)
{
	if (pid = 0)
	{
	  return false
  }
	log("findAndClick (" pid ") " path)
	x := 0
	y := 0
	if ( findImageInWindows(pid,path, x,  y) )
	{
		;msgbox found at (%x% %y%)
		winClick(pid,x,y)
		return true
	}else
	{
		log("findAndClick not found")
		return false
	}
	
}
makeSearchable(pid)
{
	;msgbox makeSearchable %pid%
	WinActivate, ahk_pid %pid%
}
getSearchPos(pid, ByRef x,ByRef y,ByRef w,ByRef h)
{
	WinGetPos x,y,w,h,ahk_pid %pid%
	;msgbox %x% %y% - %w% %h%
}
findImageInWindows(pid,path,ByRef foundX,ByRef foundY )
{
  counter := 0
  counterMax := 5
  startX := 0
  startY := 0
  w := 0
  h := 0
  ;msgbox findImageInWindows
	while(true)
	{
		makeSearchable(pid)
		getSearchPos(pid, startX,startY,w,h)
		if (findImagePos(path,foundX,foundY,startX,startY, w,h))
		{
			;msgbox found (%foundX%,%foundY%)
			return true
		}else
		{
			if (counter > counterMax)
			{	
				return false
			}
			;msgbox findImageInWindows not found~!
		}
		counter++
		sleep 1000
	}
}

repeatEsc()
{
	global interrupt
	global pid1
  global matchMin
 
	interrupt := false
	global i := 0
	matchMin := 500

	while (true)
	{
		keyEscape(pid1)
		sleep 1000
		i++
		if (i>1000)
		{
			  log("reach max loop, return")
		  	if (findAndClick(pid1,"C:\Users\volcano\Desktop\FifaAuto\matchEndNext.png"))
		  	{
		  		log("found~ matchEndNext")
		  			fifaClick(pid1, 1240,998)
							;soundbeep
		  	}else
		  	{
		  			sleep 1000
						fifaClick(pid1, 1240,998)
		  	}
		  	return
		}
		;msgbox %interrupt%
		if (%interrupt% <> 0 )
		{
			;msgbox in %interrupt%
			;soundbeep
			clickNext(pid1)
			return
		}
	  if (i > matchMin)
	  {
	  	log("i = " i  " / "  matchMin)
	  	a := mod(i,5)
		  if (a = 0 )
		  {
		  	if (findAndClick(pid1,"C:\Users\volcano\Desktop\FifaAuto\matchEndNext.png"))
		  	{
		  		 fifaClick(pid1, 1240,998)
		  				;soundbeep
							;soundbeep
							return	
		  	}
		  	
		  	if (false)
		  	{
					if (fifaIfMatchEndByImage(pid1) )
					{
						;msgbox in %interrupt%
						if (clickNext(pid1))
						{
							;soundbeep
							;soundbeep
							return
						}else
						{
							
						}
					}
				}
		  }
	  }

	}
	
}
clickNext(pid)
{
	sleep 1000
	fifaClick(pid, 1223,976)
	sleep 1000  
	if (fifaIfMatchEndAfterByImage(pid) )
	{
		return true
	}else
	{
		return false
	}
	
}
keyEscape(pid)
{		
	;if onFifaActivatedPid(pid)
	;{
		;msgbox xxx
		;send {Escape}
		;Send, {ESC}{ESC}{ESC}{ESC}{ESC}
	;}
}
fifaIfMatchEndByImage(pid) 
{
	WinActivate, ahk_pid pid
	moveWindow(pid,0,0)
	if (findImage("C:\Users\volcano\Desktop\matchEnd.png"))
	{
		return true
	}else
	{
		return false
	}
}

fifaIfMatchEndAfterByImage(pid)
{
	WinActivate, ahk_pid pid
	moveWindow(pid,0,0)
	if (findImage("C:\Users\volcano\Desktop\matchEndAfter.png"))
	{
		
		return true
	}else
	{
		return false
	}
}
moveWindow(pid,x,y)
{
	sleep 500
	CoordMode Pixel  ; 
	WinMove, ahk_pid %pid%,,%x%,%y%
	sleep 1000
	
}
waitForManagerModeScreen()
{
	
}

setTatic()
{
	
}

;findImageWait("C:\+volcano\done.png")
moveAwayMouse()
{
	MouseMove 30,30
	
}

findImagePos(path,ByRef  x,ByRef  y, startX,startY, w, h)
{
	;msgbox findImagePos (%startX% %startY% - %w% %h%)
	;CoordMode Pixel,Relative  ; Interprets the coordinates below as relative to the screen rather than the active window.
	;ImageSearch, FoundX, FoundY, startX, startY, startX+w, startY+h, %path% 
	moveAwayMouse()
	ImageSearch, FoundX, FoundY, 0, 0, w, h,*TransBlack %path% 
	if ErrorLevel = 2
	{    
		;log("Could not conduct the search.")
		return false
	}
	else if ErrorLevel = 1
	{    
		;log("Icon could not be found on the screen.")
		return false
	}
	else
	{   
		;log("The icon was found at" . %FoundX% . "x" . %FoundY%)
		highlight(FoundX,FoundY)
		x := FoundX
		y := FoundY
		return true
	}
}

findImage(path)
{
	CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %path% 
	if ErrorLevel = 2
	{    
		log("Could not conduct the search.")
		return false
	}
	else if ErrorLevel = 1
	{    
		log("Icon could not be found on the screen.")
		return false
	}
	else
	{   
		log("The icon was found at" . %FoundX% . "x" . %FoundY%)
		highlight(FoundX,FoundY)
		x := FoundX
		y := FoundY
		return true
	}
}
highlight(FoundX,FoundY)
{
	CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.
  SplashTextOn,30, , here, x
  WinMove, here, , %FoundX%, %FoundY%  ; Move the splash window to the top left corner.
	SplashTextOff
}
findImageWait(path)
{
    while true
    {
        if findImage(path)
        {
        	;msgbox found
        	;return
        	
        }
        sleep 500
    }
}














