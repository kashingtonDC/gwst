import pandas as pd
import os
import sys

# Read the file
print('reading ' + sys.argv[1])
df = pd.read_csv(sys.argv[1])

# Remove space from cols
df.columns = [x.replace(" ", "_") for x in df.columns]

# Make first /lastname lowercase 
df.First_Name = df.First_Name.str.lower()
df.Las_Name = df.Las_Name.str.lower()

# Drop duplicates
df = df.drop_duplicates(subset=['First_Name', 'Las_Name'])

# Calc statistics
n_signatories = len(df.Las_Name.unique())
n_countries = len(df.Country.unique())
n_institutions = len(df.Company.unique())

print("N signatories = {}".format(n_signatories))
print("N countries = {}".format(n_countries))
print("N institutions = {}".format(n_institutions))
