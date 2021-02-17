+++
title = "Storing SQL Join Results"
date = 2020-10-20T20:12:40+01:00
weight = 44
chapter = true
pre = "<b>5.4. </b>"
+++


  

There are two options to store the results from a SQL join statement; *physically* and *virtually*

  

-  *Physically:* When the results are written to Amazon S3. Useful, if the data does not change frequently. This is useful when integrating QuickSight with Athena. To store the join results in Amazon S3, check [Create Table as Select Queries](#create-table-as-select-queries)

-  *Virtually*: A logical representation of the data is stored as View. Every time the view queried, the query that created the view runs again. To create a view from the join, check [Creating Views](#creating-views)

  

## 'Create Table as Select' Queries

A `CREATE TABLE AS SELECT` (CTAS) query creates a new table in Athena from the results of a `SELECT` statement from another query. Athena stores data files created by the CTAS statement in a specified location in Amazon S3.

  

This is useful in joins because it creates tables from join query results in one step, without repeatedly querying raw data sets. In this section we walk through how create a table from join query (or any query) results and store it in Amazon S3.

  

1. Open the [AWS Management Console for Athena](https://console.aws.amazon.com/athena/home) and make sure you are on the same AWS Region.

2. Choose the *{curated database}* from the dropdown menu 

3. Use the following to create the CTAS query:

> Note: Make sure that the Amazon S3 folder [used to store the files] is empty before running the query. If the folder contains any objects, the query will fail.

> There is no need to create the folder before running the query, Athena will create it for you.

```sql

CREATE  Table {join_table_name}
WITH (
format = 'PARQUET',
external_location = 's3://{datalake-s3-bucket}/curated/{join_table_folder}',
partitioned_by = ARRAY['{col1_name}','{col2_name}']
) #optional
AS {your_join_query}
```

The above query creates a new table, stores the results in parquet format, in this s3://{datalake-s3-bucket}/curated/{join_table_folder} location.

In the below example, we are creating a table from a ```FULL JOIN``` and storing the results in Parquet format in the specified Amazon S3 path:

```sql
CREATE TABLE join_table
WITH (
      format = 'PARQUET', 
      external_location = 's3://nyc-taxi-trip-duration-byod/curated/join_table/'
  )
AS SELECT  mocked_table.vendor_name, count(*) AS Total
FROM mocked_table
FULL JOIN nyc_taxi_duration_curated ON nyc_taxi_duration_curated.vendor_id=mocked_table.vendor_id
GROUP BY mocked_table.vendor_name
```

4. Wait for the query to execute. After it finishes you can see the newly created view under **Tables** on the left pane.

  
![image](/athena_img/athena-join-table.png)

  

## Creating Views

**[OPTIONAL]**

  

A view in Amazon Athena is a logical, not a physical table. The query that defines a view runs each time the view is referenced in a query. In this section, we walk through how to create a view:

  

1. Open the [AWS Management Console for Athena](https://console.aws.amazon.com/athena/home) and make sure you are on the same AWS Region.

2. Choose the *{curated database}* from the dropdown menu and execute the following query:

```sql

CREATE VIEW {view_name} AS {your_query}

```

In the below example, we are creating a view from a ```FULL JOIN```

```sql
CREATE VIEW join_view
AS SELECT  mocked_table.vendor_name, count(*) AS Total
FROM mocked_table
FULL JOIN nyc_taxi_duration_curated ON nyc_taxi_duration_curated.vendor_id=mocked_table.vendor_id
GROUP BY mocked_table.vendor_name
```

  

3. Wait for the query to execute. After it finishes you can see the newly created view under **Views** on the left pane.

  

![image](/athena_img/athena_view_create.png)



4. To query a view, run the following:

```sql

SELECT * FROM {view_name}

```

5. To update a view, run the following

```sql

CREATE [ OR REPLACE ] VIEW {view_name} AS {your_query}

```