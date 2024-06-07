import pandas as pd

url = 'https://en.wikipedia.org/wiki/Comma-separated_values'

listofdfs = pd.read_html(url)

df = listofdfs[1]

df.to_csv(r'C:\Users\Manaa.DESKTOP-VK0JS4M\Dropbox\University of London\Programming for Data Science\Practice Assignments\Live Session 2 Practice Assignment\py_csv\py.csv', index = False, header = True)


print(df)

