import sys
import pandas as pd
import time
from fpdf import FPDF

if __name__ == "__main__":
    file = sys.argv[1]
    if sys.argv[5] == '.csv':
        t1 = pd.read_csv(file, header=0, delimiter=';')
    else:
        t1 = pd.read_excel(file, header=0)
    res = t1.sum().to_string()
    # res.to_csv(f"{sys.argv[4]}/storage/results/{sys.argv[2]}.{sys.argv[3]}.csv",sep='\t',header=False)
    pdf = FPDF()
    pdf.add_page()
    pdf.set_font("Arial", size=12)
    pdf.cell(200, 10, txt=res, ln=1, align="C")
    pdf.output(f"{sys.argv[4]}/storage/results/{sys.argv[2]}.{sys.argv[3]}.pdf")
    print(f"{sys.argv[2]}.{sys.argv[3]}.pdf analytics calculated")
