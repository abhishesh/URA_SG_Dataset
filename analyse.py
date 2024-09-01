import glob
import pandas as pd


df = pd.read_csv("dataset/district/combined.csv")
print(
    df.groupby(by="Floor Area (sq ft)").agg(
        {"Monthly Gross Rent($)": ["min", "max", "mean", "median"]}
    )
)
