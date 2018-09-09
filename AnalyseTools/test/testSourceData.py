import unittest
from CardData import loadData,toKey

class TestSourceData(unittest.TestCase):

    def setUp(self):

        f = ['defaultTestData']
        self.srcD = loadData(tuple(f))
 
    def tearDown(self):
        # Do something to clear the test environment here.
        pass
    
    #@unittest.skip('skip is upper.')
    def test_getSize(self):
        self.assertTrue(self.srcD != -1)
        self.assertEqual(self.srcD.getSize(), 10, "%d"%(self.srcD.getSize()))

class TestCommon(unittest.TestCase):

    def testToKey(self):
        self.assertEqual(toKey(3,7), '37', "")
    

class TestSorted(unittest.TestCase):

    def setUp(self):

        self.d = {'2':[9,3,4],'6':[4,7,9], '5':[3,9,5]}
 
    def tearDown(self):
        # Do something to clear the test environment here.
        pass
    

    def test_Sorted(self):
        
        d = sorted(self.d.iteritems(), key= lambda i:i[1][0])
        print d
        #  [('5', [3, 9, 5]), ('6', [4, 7, 9]), ('2', [9, 3, 4])]
        
        d = sorted(self.d.iteritems(), key= lambda i:i[1][2])
        print d
        #  [('2', [9, 3, 4]), ('5', [3, 9, 5]), ('6', [4, 7, 9])]
        
if __name__ == '__main__':
    unittest.main()