#SingleInstance force

#Include %A_ScriptDir%\common\common.ahk

#q::
{
	while 1 {
	
		Send, {esc}
		sleep 2000
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













