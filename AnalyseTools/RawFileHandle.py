


class RawFileHandle:
    dataPath = 'data/'
    @staticmethod
    def getFileContent(filePathName):
        fsourceFile = None
        content = ''
        try:
            fsourceFile = open(filePathName)
            content = fsourceFile.read()
            #print(content)
        except : 
            print("Error: %s" % e)
        finally:
            if fsourceFile != None:
                fsourceFile.close( )
        return content   
    @staticmethod
    def getFileListContent(fileList):
        
        fsourceFile = None
        content = ''
        for f in fileList:
            try:
                f = RawFileHandle.dataPath + f
                fsourceFile = open(f)
                content += fsourceFile.read()
                #print(content)
            except Exception, e: 
                print("Error: %s" % e)
            finally:
                if fsourceFile != None:
                    fsourceFile.close( )
        return content    
        