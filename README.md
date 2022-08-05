# Hotel Project
This is a small project that is interesting enough for me to try out with the skills that I accuire since I decided to start my journey with data. The data set that I used for this project is from [Kaggle](https://www.kaggle.com/datasets/ferranindata/hotel-revenue-data-project)
This project was to answer two simple questions: 
Is the hotel revenue growing by year?
Should we increase the parking lot size?

## This project was executed by the following steps:
### 1. Build a database
The data was downloaded from the Kaggle in form of Excel files including the information of hotel's records in three years 2018, 2019, 2020. There are also two additional files which specifies the market segment and meal cost.
The hotel's records files then was imported into SQL Server and UNION into one large table. The additional files was also JOINED into that table to easily use later.

### 2. Analyze and Retrieve Data with SQL
Once that database was created, I use some SQL queries to retrieve that Data to get some important information such as the total revenue of the hotel by year or by hotel or the number of visitors, etc. 

### 3. Connect Power BI to the database
The Power BI was connect to SQL Server with all the data about the hotel.

### 4. Visualize Data in Power BI
