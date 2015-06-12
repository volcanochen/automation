from cards import *

def view():

    print("xxxx")

    f = ("a","b","c")
    rawdata = rawFileHandle.getFileListContent(f)
    srcD = sourceData(rawdata)
    
    aP = analysisPattern(srcD.getData())

    print("====================================================")
    print f
    print("====================================================")
   
    print(aP.getPatternOutput("33", 3))


if __name__ == '__main__':
    view()