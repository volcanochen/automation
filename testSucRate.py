from cards import *

def testcase1():

    print("xxxx")

    file = "t"
    rawdata = rawFileHandle.getFileContent(file)
    srcD = sourceData(rawdata)
    
    aRate = anlaysisRate() 
    aRate.initData(srcD)
    
    print("===================== %s ================================="%file)
    print(aRate.getData())


if __name__ == '__main__':
    testcase1()