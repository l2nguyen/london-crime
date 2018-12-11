# Crime in London
An exploratory data analysis of crime in London from 2008 to present. 

## Data Source
I initially stumbled in this dataset on [Kaggle](https://www.kaggle.com/LondonDataStore/london-crime). The [London crime data](https://www.kaggle.com/LondonDataStore/london-crime) is provided as a public dataset on [Google BigQuery](https://cloud.google.com/public-datasets/). Accessing the data on Big Query does require some SQL knowledge.

### Getting the data
To access the data in R, I used the [bigrquery](https://github.com/r-dbi/bigrquery) package from Hadley Wickham. Google also has great documentation for setting up your machine to get data from [BigQuery](https://cloud.google.com/bigquery/docs/) that is long but extremely useful. Big Query also provides a UI for querying the dataset that was very useful for testing out my SQL code. 

The easiest way to start working the data is to use a [kernel](https://www.kaggle.com/docs/kernels) on Kaggle. This will save time since you will not have to do the standard BigQuery setup and authentication process. However, this can only be done in Python. To get started with the dataset on in a kernel, you can fork [this kernel](https://www.kaggle.com/paultimothymooney/how-to-query-the-london-crime-data).