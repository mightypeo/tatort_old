import requests

import pandas as pd
from bs4 import BeautifulSoup

url = 'http://de.wikipedia.org/wiki/Liste_der_Tatort-Folgen'
response = requests.get( url)
html = response.text

soup = BeautifulSoup( html, 'lxml')
table = soup.find_all('table', 'wikitable')[0]

new_table = pd.DataFrame(columns=range(0, 2), index=[0])  # I know the size

row_marker = 0
for row in table.find_all('tr'):
    column_marker = 0
    columns = row.find_all('td')
    for column in columns:
        new_table.iat[row_marker, column_marker] = column.get_text()
        column_marker += 1

