import glob
import pandas as pd


lst_csv = glob.glob("./dataset/district/*.csv")
df = pd.concat(map(pd.read_csv, lst_csv), ignore_index=True)
print(df.groupby(by="Floor Area (sq ft)").agg({"Monthly Gross Rent($)": ["min", "max", "mean", "median"]}))
