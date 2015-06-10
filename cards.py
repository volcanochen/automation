

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
    def getFailPatternOutput(self, size):
        output = "total %d\r\n"%self.faillist.__len__()
        for i in self.faillist:
            j = i
            str  = "["
            while (j != 0 and j > i-size):
                str += "%s "%self.sdata[j]
                j -= 1
            output += (str+"]\r\n")
        return output  
    def getSucPatternOutput(self, size):
        output = "total %d\r\n"%self.suclist.__len__()
        for i in self.suclist:
            j = i
            str  = "["
            while (j != 0 and j > i-size):
                str += "%s "%self.sdata[j]
                j -= 1
            output += (str+"]\r\n")
        return output    
    
    #
    def getPattern(self,size,SucFail):
        datalist = []
        if (SucFail == 1):
            datalist = self.suclist
        else:
            datalist = self.faillist
        output = []
        for i in datalist:
            j = i
            lastN = []
            while (j != 0 and j > i-size):
                lastN.append(self.sdata[j])
                j -= 1
            output.append(lastN)
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
    def getSucPatternOutput(self, key, patternSize):
        str = self.patternList[key].getSucPatternOutput(patternSize)
        return str 
    
    def getFailPatternOutput(self, key, patternSize):
        str = self.patternList[key].getFailPatternOutput(patternSize)
        return str           
    
    def getPatternOutput(self, key, patternSize):
        print("==============(%s + %s) list %d ================================="%(key[0],key[1],patternSize))
        str = "suc: \r\n"
        str += self.getSucPatternOutput(key,patternSize)
        str += "fail: \r\n"
        str += self.getFailPatternOutput(key,patternSize)       
        return str
    def analysisLastNPatternRate(self, anaalysiskey, lastN):
        #1. get dat with key
        matrixrate_suc = {}
        matrix_suc = self.getPattern(anaalysiskey,lastN+1,1)
        matrixrate_fail = {}
        matrix_fail = self.getPattern(anaalysiskey,lastN+1,0)
        #print matrix_suc
        item = []
        matrixlen_suc = len(matrix_suc)
        matrixlen_fail = len(matrix_fail)
        for item in matrix_suc:
            #print item
            keylen = lastN
            key = ""
            for i in range(keylen):
                key += item[i+1]
            #print key
            if matrixrate_suc.get(key,-1) == -1:
                matrixrate_suc[key] = 1
            else:
                matrixrate_suc[key] += 1
        for item in matrix_fail:
            #print item
            keylen = lastN
            key = ""
            for i in range(keylen):
                key += item[i+1]
            #print key
            if matrixrate_fail.get(key,-1) == -1:
                matrixrate_fail[key] = 1
            else:
                matrixrate_fail[key] += 1
        totalSucRate = "%.0f%%"%(float(matrixlen_suc*100)/(matrixlen_suc+matrixlen_fail))
        print "======== %s %s rate last %d ======"%(anaalysiskey,totalSucRate,lastN)
        printMap = []
        for key in matrixrate_suc.keys():
            printMapKey = matrixrate_suc[key]
            keyData = "[%sx %s]"%(anaalysiskey,self.recoveryKey(key))
            dataTryCnt = matrixrate_suc[key]
            if matrixrate_fail.has_key(key):
                sucRate = "%.0f%%"%(float(matrixrate_suc[key]*100)/(matrixrate_fail[key]+ matrixrate_suc[key]))
                dataTryCnt+= matrixrate_fail[key]
            else:
                sucRate = "100%"
            st = "%s : \t%d/%d \t%s"%(keyData,matrixrate_suc[key], dataTryCnt, sucRate)
            printMap.append((printMapKey,st))
        #print printMap
        printMap.sort()
        printMap.reverse()
        for k in printMap:
            print k[1]
#         print "======== %s fail rate last %d ======"%(anaalysiskey,lastN)
#         for key in matrixrate_fail.keys():
#             print "[%s] : %d/%d"%(self.recoveryKey(key) ,  matrixrate_fail[key], matrixlen_fail)
           
    def recoveryKey(self,key):
        rt = ""
        for i in range(len(key)):
            rt += key[i]
            if (i%3 ==2):
                rt += " "
        return rt
    def getPattern(self, key, Size , SucFail):
        l = self.patternList[key].getPattern(Size,SucFail)
        return l    
  