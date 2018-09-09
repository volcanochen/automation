#from CardData import *

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
        if self.sucnum + self.failnum >0:
            rat = (0.0 + self.sucnum)/(self.sucnum + self.failnum)
        else:
            rat = 0.0
        return rat 
    def failRate(self):
        if self.sucnum + self.failnum >0:
            rat = (0.0 + self.failnum)/(self.sucnum + self.failnum)
        else:
            rat = 0.0
        return rat 
    def sucNum(self):
        return self.sucnum
    def failNum(self):   
        return self.failnum
    def tostring(self):
        return '[%5d],  suc:%5d (%f), fail:%5d (%f) '%(self.sucnum+self.failnum, self.sucnum, self.sucRate(),self.failnum,self.failRate())


class AnlaysisRate:
    
    @staticmethod
    def toKey(i,j):
        return '%d%d'%(i,j)
    # {11: SF_data}
    def __init__(self):
        ###############################################
        #  { key:SF_data, ...}
        #  key is source cards, like 23, 45, ..
        ###############################################
        self.anallist = {}
        
        self.MAX = 8
        #print("AnlaysisRate.__init__")
        for i in range(0,self.MAX): # 
            for j in range(i,self.MAX):
                key = AnlaysisRate.toKey(i,j)
                #print(key)
                self.anallist[key] = SF_data()

    def showSucRateRanking(self):
        mp = self.getDataIntoMapping()
        #sorted by suc rate
        mp = sorted(mp.iteritems(),key=lambda d:d[1][0], reverse = True)
        for i in range(2,9):
            print "list get %d:"%i
            for xx in (mp):
                key = xx[0]
                #print it
                m = 0
                first = int(key[0])
                second = int(key[1])
                if second >= first:
                    m = second
                else:
                    m = first
            
                if m+1 == i:
                    data = xx[1]
                    print ("  %d+%d  \t %f  (%d/%d)"%(first,second, data[0],data[1],data[2]))
            print "---------------------------------"          
    def getDataIntoMapping(self):
        
        ###############################
        # {23: [susRate, sucNum, totalNum], 
        #  24: [],...}
        #################################
        rateSucMappig = {}
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = AnlaysisRate.toKey(i,j)
                #print(key)
                rateSucMappig[key] = [self.anallist[key].sucRate(), self.anallist[key].sucNum(), self.anallist[key].sucNum()+self.anallist[key].failNum()]
        return rateSucMappig
                
    def getDataString(self):
        st = ''
        for i in range(1,self.MAX):
            for j in range(i,self.MAX):
                key = AnlaysisRate.toKey(i,j)
                #print(key)
                st += key[0] + " + " + key[1] + " " + self.anallist[key].tostring()+ "\r\n"
        return st

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

            if result != '0':
                self.anallist[key].sucPlus1()
            else:
                self.anallist[key].failPlus1()