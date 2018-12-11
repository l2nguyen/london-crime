library('bigrquery')
library('jsonlite')
library('here')
library('readr')

# Gets data from Google BigQuery and writes to csv

# specify project
project <- fromJSON(here('auth_details.json'))$project_id

# set google api authentication detials
set_service_token(here('auth_details.json'))

# SQL query
sql <- '
SELECT borough, major_category, SUM(value) AS num_crime, year, month
FROM `bigquery-public-data.london_crime.crime_by_lsoa`
GROUP BY borough, major_category, year, month
ORDER BY borough, year, month, major_category
'

# Query the database
table <- bq_project_query(project, sql)
# download query result into table
ldn_crime <- bq_table_download(table)
# write table to csv
write_csv(ldn_crime, here('ldn_crime.csv'))
