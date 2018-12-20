library('bigrquery')
library('jsonlite')
library('here')
library('readr')

# Function to get crime data from Google BigQuery and writes to csv
get_crimedata <- function(query, file = '') {

# check filename was specified
if (file == ''){
  stop('Specify a file name.')
}

# specify project
project <- fromJSON(here('auth_details.json'))$project_id

# set google api authentication detials
set_service_token(here('auth_details.json'))

# Query the database
table <- bq_project_query(project, query)
# download query result into table
query_result <- bq_table_download(table)

# write table to csv
write_csv(query_result, here(file))
}

# SQL query
sql_query <- '
SELECT borough, major_category, SUM(value) AS num_crime, year, month
FROM `bigquery-public-data.london_crime.crime_by_lsoa`
GROUP BY borough, major_category, year, month
ORDER BY borough, year, month, major_category
'

get_crimedata(sql_query, file = 'ldn_crime.csv')