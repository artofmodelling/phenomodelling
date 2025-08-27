import pandas as pd
import requests
from pathlib import Path
import json
from tqdm import tqdm

df = pd.read_excel("pheno_obs_1779.xlsx", sheet_name="data")

cwd = Path.cwd()
url = "https://agera5.containers.wurnet.nl/api/v1/get_agera5"
for row in tqdm(df.itertuples(), total=len(df)):
    payload = dict(latitude=row.Latitude, longitude=row.Longitude, startdate="20050101")
    r = requests.get(url, params=payload)
    with open(cwd / "meteo" / f"{row.ObjectID}.json", "w") as fp:
        fp.write(json.dumps(r.json()))
