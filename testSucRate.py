from cards import *

def testcase1():

    print("xxxx")

    f = ("a","b","c")
    #f = ("a")
    #f = ("b")
    #f = ("c")
    #f = ("b","c")
    rawdata = rawFileHandle.getFileListContent(f)
    srcD = sourceData(rawdata)
    
    aRate = anlaysisRate() 
    aRate.initData(srcD)
    
    print("====================================================")
    print f
    print("====================================================")
    print(aRate.getDataString())


if __name__ == '__main__':
    testcase1()