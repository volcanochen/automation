from cards import *

def testcase2():

    print("xxxx")

    file = "a"
    rawdata = rawFileHandle.getFileContent(file)
    srcD = sourceData(rawdata)
    
    aP = analysisPattern(srcD.getData())

    
    print("===================== %s ================================="%file)
    print(aP.getDataWithKey("23"))
    
    print(srcD.getData()[1])


if __name__ == '__main__':
    testcase2()