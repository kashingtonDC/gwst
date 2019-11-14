import pandas as pd
import os
import sys

print('reading ' + sys.argv[1])

df = pd.read_csv(sys.argv[1])

df.columns = [x.replace(" ", "_") for x in df.columns]

print(df.columns)

n_signatories = len(df.Las_Name.unique())
n_countries = len(df.Country.unique())
n_institutions = len(df.Company.unique())

print("N signatories = {}".format(n_signatories))
print("N countries = {}".format(n_countries))
print("N institutions = {}".format(n_institutions))
