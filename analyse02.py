import pandas as pd
from IPython.display import display


df = pd.read_csv("dataset/to_merge/combined.csv")

# Set the options to display the full DataFrame
pd.set_option("display.max_rows", None)
pd.set_option("display.max_columns", None)


df["Monthly Rent ($)"] = df["Monthly Rent ($)"].str.replace(",", "")
df["Monthly Rent ($)"] = pd.to_numeric(df["Monthly Rent ($)"])

display(
    df.groupby(by="Floor Area (SQFT)").agg(
        {"Monthly Rent ($)": ["min", "max", "mean", "median"]}
    )
)
