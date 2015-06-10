from cards import *

def testcase2():

    print("xxxx")

    file = "t"
    rawdata = rawFileHandle.getFileContent(file)
    srcD = sourceData(rawdata)
    
    aP = analysisPattern(srcD.getData())

    
    print("===================== %s ================================="%file)
    #print(aP.getDataWithKey("23"))
    
    print("===================== %s ================================="%file)
    #print(aP.getPatternOutput("23", 8))
    print("===================== %s ================================="%file)
    #print(aP.getPatternOutput("13", 8))
    
    aP.analysisLastNPatternRate("34",3)


if __name__ == '__main__':
    testcase2()