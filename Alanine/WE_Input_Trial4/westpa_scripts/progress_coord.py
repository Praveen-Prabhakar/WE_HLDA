import numpy as np

l = np.loadtxt('COLVAR')

for i in range(len(l)):
    print("{:.4f}".format(l[i,1])) 
