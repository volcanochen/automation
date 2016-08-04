

class MY_ACCOUNT
{
	
	static accounts := {0: "45376928", 1: "798010623", 2:"2926133917", 3:"2122507448",4:"2726465197",5:"3169063469",6:"2679529946",7:"",8:"3228753792",9:"2139784228" }
	
	;can be many cids
	static accountsCid := {0: ["0x53423D 0x594638"] , 1: ["0x65ABE7 0x7EB7E4"] , 2:["0x2A76B4 0xBDC2C7"],3:["0x77A9B5 0x79A9B5"],4:["0x4249AC 0x7CB4FB"],5:["0x299E77 0x269D77","0x289E79 0x259D77"],6:["0xCB996B 0x251D0C"],7:[""],8:["0xE9E1E5 0xEBE3E7"],9:["0xBCBDC6 0xAAC2CD"] }

	static cipherPassFile1 := "password1" ; for minor account
	static cipherPassFile2 := "password2" ; for 4537
	static cipherPassFile3 := "password3" ; for 7980
	
	getAccount(aid){
		log("MY_ACCOUNT getAccount " aid)
		return % MY_ACCOUNT.accounts[aid]
	}
	getCIDs(id){
		return % MY_ACCOUNT.accountsCid[id]
	}
	verifyCID(wintitle, id){
		;log("MY_ACCOUNT verifyCID  " id)
		match := 0
		cid := PictureRecognizeTool.getCid(wintitle)
		toMatchCids :=  MY_ACCOUNT.getCIDs(id)
		for k, value in toMatchCids
			;log("try (" cid " ?= " value ")")
			if (value == cid){
				match := 1
				return % match
			}
		return % match
	
	}
}


class PictureRecognizeTool
{
	static p1x = 15	
	static p1y = 61
	static p2x = 18	
	static p2y = 61

	getCid(wintitle, clip:=0 ){
	
		WinActivate  % wintitle
		PixelGetColor,OutputVar , % PictureRecognizeTool.p1x , PictureRecognizeTool.p1y
		PixelGetColor,OutputVar2 , % PictureRecognizeTool.p2x , PictureRecognizeTool.p2y
		cid := % OutputVar " " OutputVar2
		;log("getCid " cid )
		if (clip){
			log(cid " is pasted into your clipboard.")
			clipboard = % cid
		}
		
		return % cid
	}
	
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
		;log("commond: " com)
		run % com
		Sleep 1000
		str := ""
		file := FileOpen(tempfileO, "rw")
		str := file.read()
		file.Close()
		Sleep 400
		;for security
		file := FileOpen(tempfileO, "w")
		file.write("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		file.Close()
		Sleep 400
		;MsgBox % str
		FileDelete, % tempfileO
		log(str)
		return str
	}


}












