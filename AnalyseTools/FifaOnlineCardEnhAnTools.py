
from com import *
import re

def help():
    print "===== command list: =============="
    print "o[verall]"
    print "    eg: o"
    print "l[oad] a[,b,c] [-]<N>  to load files "
    print "    eg: l a,b,c 100"
    print "p[attern] <2 cards>,<lastN>  to get pattern analysis"
    print "    eg: p 23,5"
    print "v[iew] <2 cards>,<lastN>  to see raw data"
    print "    eg: v 23,5"  
    print "=================================" 

    
# l 201505.txt,201506.txt,201507.txt,201508.txt,201509.txt,201510.txt,201511.txt,201512+.txt,201512.txt,201601.txt,201602.txt,201603.txt,201604.txt,201605.txt


def mainLoop():

    print("FIFA ol3 card analysis tool")

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