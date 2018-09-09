from CardData import toKey


class DataList():
    
    sdata = None  #refer to all data
    def __init__(self, sd):
        #########################
        #  suclist = [lineNumber, ...]
        ######################
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
    
    # get all data 
    def getRawList(self,CountBackN,SucFail):
        l = []
        if (SucFail == 1):
            l = self.suclist
        else:
            l = self.faillist
        output = []
        for lineNumber in l:
            j = lineNumber
            lastN = []
            while (j != 0 and j > lineNumber-CountBackN):
                lastN.append(self.sdata[j])  # [234,345,567]
                j -= 1
            output.append(lastN) #[[234,345,567],[],[],...]
        return output     
          

  
class AnalysisPattern:
    MAX = 8
    def __init__(self, srcDATA):
        
        
        ##########################################
        #  {"23" : DataList(all),
        #   "34" : DataList(all), ...
        ###########################################
        self.patternList = {}
        
        #print("AnlaysisRate.__init__")
        START = 1
        for i in range(START,self.MAX):
            for j in range(i,self.MAX):
                key = toKey(i,j)
                #print(key)
                self.patternList[key] = DataList(srcDATA)
                #print(self.patternList[key] )
        self.initData(srcDATA)
        
    @staticmethod
    def filterOut( key):
        if key[0] == "0":
            return True

    def initData(self, src):
        i = 0
        for i in xrange(src.__len__()):
            
            dat = src[i]
            first = dat[0]
            second = dat[1]
            result = dat[2]

            key = toKey(int(first),int(second))
            if self.filterOut(key):
                continue

            if (result != "0"):
                #print("%s add %s"%(key,id))
                self.patternList[key].insertSucData(i)
            else:
                #print(key + " sdd %d"%id)
                self.patternList[key].insertFailData(i)
        #print(self.patternList["23"].getFailId())
      
    def getDataWithKey(self, key):
        str = ''
        str += key[0] + " + " + key[1] + " \r\n" + self.patternList[key].getData()+ "\r\n"
        return str 
       
    def getResult(self):
        str = ''
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = toKey(i,j)
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
        str += self.getSucPatternOutput(key,patternSize+1)
        str += "fail: \r\n"
        str += self.getFailPatternOutput(key,patternSize+1)       
        return str
    
    # eg. ("34", "4")
    def analysisLastNPatternRate(self, analyseKey, lastN):
        #1. get dat with key
        # { "123445":34, "456789":22, ...}
        matrixrate_suc = {}
        # [[234,345,567],[],[],...]
        matrix_suc = self.getCandidates(analyseKey,lastN+1,1)
        
        matrixrate_fail = {}
        matrix_fail = self.getCandidates(analyseKey,lastN+1,0)
        #print matrix_suc
        item = []
        matrixlen_suc = len(matrix_suc)
        matrixlen_fail = len(matrix_fail)
        
        for item in matrix_suc:
            #print item
            keylen = lastN
            key = ""
            for i in range(keylen):
                key += item[i+1] # 234245567...
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
                
        totalSucRate = "%.6f"%(float(matrixlen_suc)/(matrixlen_suc+matrixlen_fail))
        print "======== %sx %s rate last %d ======"%(analyseKey,totalSucRate,lastN)
        printMap = []
        for key in matrixrate_suc.keys():
            printMapKey = matrixrate_suc[key]
            keyData = "[%sx %s]"%(analyseKey, self.recoveryKey(key))
            
            dataTryCnt = matrixrate_suc[key]
            if matrixrate_fail.has_key(key):
                sucRate = "%.6f"%(float(matrixrate_suc[key])/(matrixrate_fail[key]+ matrixrate_suc[key]))
                dataTryCnt+= matrixrate_fail[key]
            else:
                sucRate = "1.000000"
            st = "%s : \t%6d/%d \t\t%s"%(keyData,matrixrate_suc[key], dataTryCnt, sucRate)
            printMap.append((printMapKey,st))
        #print printMap
        printMap.sort()
        printMap.reverse()
        for k in printMap:
            print k[1]
#         print "======== %s fail rate last %d ======"%(analyseKey,lastN)
#         for key in matrixrate_fail.keys():
#             print "[%s] : %d/%d"%(self.recoveryKey(key) ,  matrixrate_fail[key], matrixlen_fail)
    
    # from "234456678" -> "234 456 678"
    def recoveryKey(self,key):
        rt = ""
        for i in range(len(key)):
            rt += key[i]
            if (i%3 ==2):
                rt += " "
        return rt
    def getCandidates(self, key, Size , SucFail):
        l = self.patternList[key].getRawList(Size,SucFail)
        return l    