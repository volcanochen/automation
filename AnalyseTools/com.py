from CardData import loadData
from AnalysisPattern import AnalysisPattern
from AnlaysisRate import AnlaysisRate
import re

def handleOverall( srcD):
    aRate = AnlaysisRate() 
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
        #parm[1] = flist.__str__()
        parm[1] = '%d files: %s'% (flist.__len__(), ss.getSize())
        parm[0] =  ss
    
def handleView(cmd,srcD):
    m  = re.match(r'\w+\s+(.*)', cmd)
    f = m.group(1)
    f = re.sub(r' ','',f)
    mlist = re.split(r',',f)
    if  mlist.__len__() < 2:
        print "parameters missing."
        return -1
    aP = AnalysisPattern(srcD.getData())
    print(aP.getPatternOutput(mlist[0], int(mlist[1])))
    
def handlePattern(cmd,srcD):
    m  = re.match(r'\w+\s+(.*)', cmd)
    f = m.group(1)
    f = re.sub(r' ','',f)
    mlist = re.split(r',',f)
    
    if  mlist.__len__() < 2:
        print "parameters missing."
        return -1
    aP = AnalysisPattern(srcD.getData())
    aP.analysisLastNPatternRate(mlist[0], int(mlist[1]))
    