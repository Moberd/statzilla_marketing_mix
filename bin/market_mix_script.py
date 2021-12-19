import sys
import pandas as pd
import time
if __name__ == "__main__":
    file = sys.argv[1]
    t1 = pd.read_csv(file, header=0, delimiter=';')
    res = t1.sum()
    res.to_csv(f"{sys.argv[4]}/storage/results/{sys.argv[2]}.{sys.argv[3]}.csv",sep='\t',header=False)
    #time.sleep(10)
    print(f"{sys.argv[2]}.{sys.argv[3]}.csv analytics calculated")
