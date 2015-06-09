

class rawFileHandle:
    @staticmethod
    def getFileContent(filePathName):
        fsourceFile = None
        content = ''
        try:
            fsourceFile = open(filePathName)
            content = fsourceFile.read()
            #print(content)
        except : 
            print("Error: %s" % e)
        finally:
            if fsourceFile != None:
                fsourceFile.close( )
        return content   
#
# to record the source data
#
class sourceData:

    def __init__(self,rawData):
        # {1:'110',2:'223'}
        self.srcdata = {}
        print('sourceData.__init__')
        linenum = 0
        for line in rawData.split("\n"):
            if line == '':
                continue
            
            self.srcdata[linenum] = line
            linenum += 1
            
    def getData(self):
        return self.srcdata
    
    def printSrcData(self):
        print(self.srcdata)
        
    def getSize(self):
        return self.srcdata.__len__()
#
# suc fail data structure
#
class SF_data:

    def __init__(self):
        self.sucnum = 0
        self.failnum = 0
        pass
    def sucPlus1(self):
        self.sucnum += 1
    def failPlus1(self):
        self.failnum += 1  
    def sucRate(self):
        if self.sucnum+self.failnum >0:
            rat = (0.0 + self.sucnum)/(self.sucnum+self.failnum)
        else:
            rat = 0
        return rat 
    def failRate(self):
        if self.sucnum+self.failnum >0:
            rat = (0.0 + self.failnum)/(self.sucnum+self.failnum)
        else:
            rat = 0
        return rat 
    def tostring(self):
        return '[%5d],  suc:%4d (%f), fail:%4d (%f) '%(self.sucnum+self.failnum, self.sucnum, self.sucRate(),self.failnum,self.failRate())

class anlaysisRate:

    # {11: SF_data}
    def __init__(self):
        self.anallist = {}
        self.MAX = 8
        print("anlaysisRate.__init__")
        for i in range(0,self.MAX):
            for j in range(i,self.MAX):
                key = '%d%d'%(i,j)
                #print(key)
                self.anallist[key] = SF_data()
    def getData(self):
        str = ''
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = '%d%d'%(i,j)
                #print(key)
                str += key[0] + " + " + key[1] + " " + self.anallist[key].tostring()+ "\r\n"
        return str

    def initData(self, srcData):

        content = srcData.getData()
        id = 0
        for id in range(srcData.getSize()):
            
            dat = content[id]
            first = dat[0]
            second = dat[1]
            result = dat[2]
            key = dat[0:2]
            #print('key: '+key)

            if key == '00':
                continue
            if int(first) > int(second):
                temp = first
                first = second
                second = temp
                key = first+second
                
            #TODO: 234 is same with 324
            if result != '0':
                self.anallist[key].sucPlus1()
            else:
                self.anallist[key].failPlus1()

class dataList():

    sdata = None
    def __init__(self, sd):
        self.suclist = []
        self.faillist = []
        self.sdata = sd
        
    def insertSucData(self,id):
        #print("insert %s"%id)
        self.suclist.append(id)
        
    def insertFailData(self,id):
  
        self.faillist.append(id)  

    def getData(self):
        return "suc List: %s  \r\nfail List: %s"%(self.getSucData(),self.getFailData())
    

    def getSucId(self):
        print("getSucId")
        str = ''
        for i in self.suclist:
            temp = "%d "%(i)
            str = str +temp
        return str
    def getFailId(self):
        print("getFailId")
        str = ''
        for i in self.faillist:
            temp = "%d "%(i)
            str = str +temp
        return str
    def getSucData(self):
        str = ""
        for i in self.suclist:
            str += "%s "%self.sdata[i]
        return str
    
    def getFailData(self):
        str = ""
        for i in self.faillist:
            str += self.sdata[i] + " "
        return str    
    def getFailPattern(self, size):
        output = "total %d\r\n"%self.faillist.__len__()
        for i in self.faillist:
            j = i
            str  = "["
            while (j != 0 and j > i-size):
                str += "%s "%self.sdata[j]
                j -= 1
            output += (str+"]\r\n")
        return output  
    def getSucPattern(self, size):
        output = "total %d\r\n"%self.suclist.__len__()
        for i in self.suclist:
            j = i
            str  = "["
            while (j != 0 and j > i-size):
                str += "%s "%self.sdata[j]
                j -= 1
            output += (str+"]\r\n")
        return output    
class analysisPattern:
    MAX = 8
    def __init__(self, srcDATA):
        self.patternList = {}
        print("anlaysisRate.__init__")
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = '%d%d'%(i,j)
                #print(key)
                self.patternList[key] = dataList(srcDATA)
                #print(self.patternList[key] )
        self.initData(srcDATA)
    
    def initData(self,src):
        #print(src.__len__())
        content = src
        id = 0
        for id in range(src.__len__()):
            
            dat = content[id]
            first = dat[0]
            second = dat[1]
            result = dat[2]
            key = dat[0:2]
            
            if key == '00':
                continue
            
            if int(first) > int(second):
                temp = first
                first = second
                second = temp
                key = first+second
            
            if first == "0":
                continue
            
            
            if (result != "0"):
                #print("%s add %s"%(key,id))
                self.patternList[key].insertSucData(id)
            else:
                #print(key + " sdd %d"%id)
                self.patternList[key].insertFailData(id)
        #print(self.patternList["23"].getFailId())
      
    def getDataWithKey(self, key):
        str = ''
        str += key[0] + " + " + key[1] + " \r\n" + self.patternList[key].getData()+ "\r\n"
        return str 
       
    def getResult(self):
        str = ''
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = '%d%d'%(i,j)
                print(self.getDataWithKey(key) + "\r\n")
                
        return str    
    def getSucPattern(self, key, patternSize):
        str = self.patternList[key].getSucPattern(patternSize)
        return str 
    
    def getFailPattern(self, key, patternSize):
        str = self.patternList[key].getFailPattern(patternSize)
        return str           
    
    def getPattern(self, key, patternSize):
        print("==============(%s + %s) list %d ================================="%(key[0],key[1],patternSize))
        str = "suc: \r\n"
        str += self.getSucPattern(key,patternSize)
        str += "fail: \r\n"
        str += self.getFailPattern(key,patternSize)       
        return str
        
        