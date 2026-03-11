import pandas as pd


df = pd.read_csv('../2019-Nov.csv')

# columns_to_drop = ['category_code', 'brand']
# df_cleaned = df.drop(columns=columns_to_drop, axis=1)
# df_cleaned = df_cleaned.dropna(subset=['price', 'user_id'])
#
#
# output = 'cleaned.csv'
# df_cleaned.to_csv(output, index=False)


import mysql.connector
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import seaborn as sns

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="sandzhar2007",
    database="cosmetics_db"
)

query = "SELECT event_type, COUNT(*) as total_events FROM events GROUP BY event_type ORDER BY total_events DESC;"
df = pd.read_sql(query, db)

plt.figure(figsize=(10, 6))
sns.barplot(x='event_type', y='total_events', data=df, palette='magma')
plt.title('Customer Behavior Funnel (Cosmetics Shop)')
plt.ylabel('Number of Events')
plt.yscale('log')
plt.show()
db.close()