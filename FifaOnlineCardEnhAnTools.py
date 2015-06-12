from cards import *
import re

def loadData(f):
    
    #f = ("a")
    #f = ("b")
    #f = ("c")
    #f = ("b","c")
    rawdata = rawFileHandle.getFileListContent(f)
    srcD = sourceData(rawdata)
    print "load data done"
    print f
    return srcD

def overall( srcD):
    aRate = anlaysisRate() 
    aRate.initData(srcD)
    
    print("====================================================")
    #print f
    print("====================================================")
    print(aRate.getData())

def mainLoop():

    print("xxxx")
    f = ("a","b","c")
    loadData(f)
    prompt = f.__str__()
    while(1):
        x = raw_input(prompt+" >> ")
        #print x
        if re.match(r'help', x):
            print "===== command list: =============="
            print "o[verall]"
            print "    eg: o"
            print "l[oad] a[,b,c]"
            print "    eg: l a,b,c"
            print "p[attern] <2 cards>,<lastN>"
            print "    eg: p 23,5"
            print "v[iew] <2 cards>,<lastN>"
            print "    eg: v 23,5"
            print "================================="
        else:
            pass
    srcD = loadData()
    
    overall(srcD)



if __name__ == '__main__':
    mainLoop()