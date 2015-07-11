from cards import *

def view():

    print("xxxx")

    f = ("a","b","c")
    f = ("c")
    rawdata = rawFileHandle.getFileListContent(f)
    srcD = sourceData(rawdata)
    
    aP = analysisPattern(srcD.getData())

    print("====================================================")
    print f
    print("====================================================")
   
    #print(aP.getDataWithKey("23"))
    #print(aP.getPatternOutput("23", 8))
    #print(aP.getPatternOutput("13", 8))
    
    aP.analysisLastNPatternRate("24",4)


if __name__ == '__main__':
    view()