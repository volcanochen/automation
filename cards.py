


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
    # {1:'110',2:'223'}
    srcdata = {}
    def __init__(self,rawData):
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
    sucnum = 0
    failnum = 0
    def __init__(self):
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
    anallist = {}
    MAX = 8
    # {11: SF_data}
    def __init__(self):
        print("anlaysisRate.__init__")
        for i in range(1,self.MAX):
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
            #TODO: 234 is same with 324
            if result != '0':
                self.anallist[key].sucPlus1()
            else:
                self.anallist[key].failPlus1()

class dataList():
    suclist = []
    faillist = []
    sdata = None
    def __init__(self, sd):
        
        self.sdata = sd
        
    def insertSucData(self,id):
        self.suclist.append(id)
        
    def insertFailData(self,id):
        self.faillist.append(id)  
    def getData(self):
        return "suc list: %s  \r\n fail list: %s"%(self.getSucDataString(),self.getFailDataString())
    def getSucDataString(self):
        str = ""
        for i in self.suclist:
            str += "%d"%i  + " "
            #str += self.sdata[i] + " "
        return str
    
    def getFailDataString(self):
        str =""
        for i in self.faillist:
            str += self.sdata[i] + " "
        return str    

  
class analysisPattern:
    list = {}
    MAX = 8

    def __init__(self, srcDATA):
        print("anlaysisRate.__init__")
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = '%d%d'%(i,j)
                #print(key)
                self.list[key] = dataList(srcDATA)
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
            
            if (result != "0"):
                self.list[key].insertSucData(id)
            else:
                self.list[key].insertFailData(id)
      
    def getDataWithKey(self, key):
        str = ''
        str += key[0] + " + " + key[1] + " " + self.list[key].getData()+ "\r\n"
        return str    
    def getData(self):
        str = ''
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = '%d%d'%(i,j)
                #print(key)
                str += key[0] + " + " + key[1] + " " + self.list[key].getData()+ "\r\n"
        return str    
                
def main():

    print("xxxx")

    file = "a"
    rawdata = getFileContent(file)
    srcD = sourceData(rawdata)
    
    aRate = anlaysisRate() 
    aRate.initData(srcD)
    
    aP = analysisPattern(srcD.getData())

    
    print("===================== %s ================================="%file)
    print(aRate.getData())
    print("===================== %s ================================="%file)
    print(aP.getDataWithKey("23"))
    
    print(srcD.getData()[1])


if __name__ == '__main__':
    main()