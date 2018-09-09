from RawFileHandle import *


def toKey(i,j):
    if i > j:
        temp = i
        i = j
        j = temp
    return '%d%d'%(i,j)

def loadData(f):
    
    #f = ("a")
    #f = ("b")
    #f = ("c")
    #f = ("b","c")

    
    rawdata = RawFileHandle.getFileListContent(f)
    if rawdata != '':
        srcD = SourceData(rawdata)
        print "load data done."
        return srcD
    else:
        print "load failed."
        return -1
#
# to record the source data
#
class SourceData:

    def __init__(self,rawData):
        #############################
        # {1:'110',2:'223'}
        ############################
        self.srcdata = {}
        #print('sourceData.__init__')
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

