from cards import *
import re

def loadData(f):
    
    #f = ("a")
    #f = ("b")
    #f = ("c")
    #f = ("b","c")
    rawdata = rawFileHandle.getFileListContent(f)
    if rawdata != '':
        srcD = sourceData(rawdata)
        print "load data done."
        return srcD
    else:
        print "load failed."
        return -1

def handleOverall( srcD):
    aRate = anlaysisRate() 
    aRate.initData(srcD)

    print(aRate.getDataString())
    
    aRate.showSucRateRanking()
    
    
def handleLoad(cmd, parm):
    ss = None
    m  = re.match(r'\w+\s+(.*)', cmd)
    f = m.group(1)
    f = re.sub(r' ','',f)
    flist = re.split(r',',f)
    if  flist.__len__() < 1:
        print "parameters missing."
        return None
    ss = loadData(flist)
    if (ss != -1):
        parm[1] = flist.__str__()
        parm[0] =  ss
    
def handleView(cmd,srcD):
    m  = re.match(r'\w+\s+(.*)', cmd)
    f = m.group(1)
    f = re.sub(r' ','',f)
    mlist = re.split(r',',f)
    if  mlist.__len__() < 2:
        print "parameters missing."
        return -1
    aP = analysisPattern(srcD.getData())
    print(aP.getPatternOutput(mlist[0], int(mlist[1])))
    
def handlePattern(cmd,srcD):
    m  = re.match(r'\w+\s+(.*)', cmd)
    f = m.group(1)
    f = re.sub(r' ','',f)
    mlist = re.split(r',',f)
    
    if  mlist.__len__() < 2:
        print "parameters missing."
        return -1
    aP = analysisPattern(srcD.getData())
    aP.analysisLastNPatternRate(mlist[0], int(mlist[1]))
    
def help():
    print "===== command list: =============="
    print "o[verall]"
    print "    eg: o"
    print "l[oad] a[,b,c] [-]<N>"
    print "    eg: l a,b,c 100"
    print "p[attern] <2 cards>,<lastN>"
    print "    eg: p 23,5"
    print "v[iew] <2 cards>,<lastN>"
    print "    eg: v 23,5"
    print "=================================" 
    
    
def mainLoop():

    print("xxxx")
    m = 0;
    f = ("a","b","c")
    srcD = loadData(f)
    prompt = f.__str__()
    while(1):
        x = raw_input(prompt+" >> ")
        #print x
        if re.match(r'help', x):
            help()
        elif re.match(r'o|overall', x):
            ######## 1 ###########
            handleOverall( srcD)
                             
                
        elif re.match(r'load\s+|l\s+', x):
            ######## 2 ###########
            parm = [srcD,prompt]
            handleLoad(x, parm)
            prompt = parm[1]
            srcD = parm[0]
            
        elif re.match(r'v\s+|view\s+', x):
            ######## 3 ###########
            handleView(x,srcD)

        elif re.match(r'p\s+|pattern\s+', x):
            ######## 4 ###########
            handlePattern(x,srcD)



if __name__ == '__main__':
    mainLoop()