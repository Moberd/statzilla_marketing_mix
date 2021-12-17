import sys
import pandas as pd

if __name__ == "__main__":
    file = sys.argv[1]
    t1 = pd.read_csv(file, header=0)
    res = t1.sum()
    print(res)
    print("it just works")
