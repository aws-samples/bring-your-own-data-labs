+++
title = "Joining Tables"
date = 2020-10-20T20:12:40+01:00
weight = 43
chapter = true
pre = "<b>4.3. </b>"
+++


This section shows how to join two tables together.

  

### Create a new Table

> Note: If you already have *two* tables that could be joined together skip this step and proceed to [next sub-section](#sql-joins)

>

Before joining *two* tables, let's create a new table (with mocked data) and will refer to it in this lab as {table2}with a foreign key relationship with our *{curated_table_name}*

  

1. Open the [AWS Management Console for Athena](https://console.aws.amazon.com/athena/home) and make sure you are on the same AWS Region.

2. Choose the *{curated database}* from the dropdown menu and execute ```CREATE EXTERNAL TABLE``` query. Replace any curly braces - {} - with your actual values:

```sql

CREATE  EXTERNAL  TABLE {table2_name} (
{col1_name} BIGINT,
{col2_name} STRING,
{col3_name} BIGINT,
...........
)
STORED AS  PARQUET
LOCATION  's3://{datalake-s3-bucket}/curated/{table2_name}/'
```


Example query would look like the following:

```sql
CREATE  EXTERNAL  TABLE mocked_table (
vendor_id BIGINT,
vendor_name STRING,
CAR_COUNT BIGINT
)
STORED AS  PARQUET
LOCATION  's3://nyc-taxi-trip-duration-byod/curated/mocked_table/'
```
  

> Note: You not need to create the Amazon S3 folder before running the query; Athena will do it for you. Just choose the Amazon S3 path to store the data. However, the Amazon S3 bucket should exist before running the query. Feel free to use any path as long as you own the Amazon S3 bucket and it is in the same region you are using throughout this lab.

  

3. Now let's insert some mocked data to the new table. The data should have foreign key relationship with the original table.

```sql

INSERT  INTO {table2_name} ({col1_name},{col2_name}, {col3_name}, ...)

VALUES ({value1.1}, {value2.1}, {value3.1}, ...),

({value1.2}, {value2.2}, {value3.2}, ...),

({value1.3}, {value2.3}, {value3.3}, ...)

............;

```

	Example query would look like the following:

```sql

INSERT  INTO  mocked_table (vendor_id,vendor_name,car_count)  
VALUES (1,'company1', 30),(3,'company3', 511)

  ```

![image](/athena_img/athena_insert.png)

  

4. Make sure the data is inserted by executing ```SELECT * FROM {table2}```

  

### SQL Joins

  

Here are the different types of the JOINs in SQL:

> Note: The following are just examples to show you the syntax of each JOIN type. Feel free to include any columns that could be added, just replace the {col_name} with your actual column names. In addition to this replace {table1_name} with the actual table name
  

-  *Inner Join*:- Returns records that have matching values in both tables. Run the following query in the **Query Editor**

```sql

SELECT {table1_name}.{col1_name}, {table2_name}.{col3_name}, {table2_name}.{col5_name}

FROM {table1_name}

INNER JOIN {table2_name} ON {table1_name}.{key}={table2_name}.{key}

```

In the below example, we are counting the records that matched the join condition:

```sql

SELECT  mocked_table.vendor_name, count(*) AS Total
FROM mocked_table
INNER JOIN nyc_taxi_duration_curated ON nyc_taxi_duration_curated.vendor_id=mocked_table.vendor_id
GROUP BY mocked_table.vendor_name

```

-  *Left Join*:- If you use the same query but replace ```INNER``` with ```LEFT```. We will see records from left table and the matched records from the right table

```sql

SELECT {table1_name}.{col1_name}, {table2_name}.{col3_name}, {table2_name}.{col5_name}

FROM {table1_name}

LEFT JOIN {table2_name} ON {table1_name}.{key}={table2_name}.{key}

```

-  *Right Join*:- Returns all records from the right table, and the matched records from the left table

```sql

SELECT {table1_name}.{col1_name}, {table2_name}.{col3_name}, {table2_name}.{col5_name}

FROM {table1_name}

RIGHT JOIN {table2_name} ON {table1_name}.{key}={table2_name}.{key}

```

-  *Full Join*:- All records are returned

```sql

SELECT {table1_name}.{col1_name}, {table2_name}.{col3_name}, {table2_name}.{col5_name}

FROM {table1_name}

FULL JOIN {table2_name} ON {table1_name}.{key}={table2_name}.{key}

```
