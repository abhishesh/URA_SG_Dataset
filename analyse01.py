import pandas as pd
from IPython.display import display

# Set the options to display the full DataFrame
pd.set_option("display.max_rows", None)
pd.set_option("display.max_columns", None)


df = pd.read_csv("dataset/district/combined.csv")
display(
    df.groupby(by="Floor Area (sq ft)").agg(
        {"Monthly Gross Rent($)": ["min", "max", "mean", "median"]}
    )
)
