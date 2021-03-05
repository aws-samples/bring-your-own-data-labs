+++
title = "Optional - Creating Amazon Athena Database and Table "
date = 2020-10-22T16:16:01+01:00
weight = 46
chapter = true
pre = "<b>5.6. </b>"
+++


## Introduction

These are optional labs:

 - *Creating Amazon Athena Database and Table* (this one): Should be completed if you want Athena to create the database and table and not AWS Glue Crawlers
 - [Detecting New Partitions]({{< ref "57_optional_partitions.md" >}} "Detecting New Partitions"): Should be completed if you manually added a partition that conforms with Hive format, and do not want want to use AWS Glue crawlers to add the partitions to the table.

## Creating Amazon Athena Database and Table
  

One other method to populate the Data Catalog is using Amazon Athena. If you have a simple dataset and you already know the schema, you can manually populate the Data Catalog using SQL DDL statements. You enter these SQL DDL statements in Athena Console and Athena will execute them **free of charge**

 Athena uses Apache Hive to define tables and create databases. Databases are a logical grouping of tables. When you create a database and table in Athena, you are simply describing the schema and location of the table data in Amazon S3\. In case of Hive, databases and tables don’t store the data along with the schema definition unlike traditional relational database systems. The data is read from Amazon S3 only when you query the table. The other benefit of using Hive is that the metastore found in Hive can be used in many other big data applications such as Spark, Hadoop, and Presto. With Athena catalog, you can now have Hive-compatible metastore in the cloud without the need for provisioning a Hadoop cluster or RDS instance. For guidance on databases and tables creation refer [Apache Hive documentation](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL). The following steps provides guidance specifically for Amazon Athena.

### Create a Database

  

1. Open the [AWS Management Console for Athena](https://console.aws.amazon.com/athena/home).
2. Make a note of the AWS region name.

3. In the Athena **Query Editor**, you will see a query pane with an example query. Now you can start entering your query in the query pane.

4. To create a database named *mydatabase*, copy the following statement, and then choose **Run Query**:

  

````sql

CREATE  DATABASE  mydatabase

````

  

5. Ensure *mydatabase* appears in the DATABASE list on the **Catalog** dashboard

![image](/athena_img/athena_database.png)
  

### Create a Table

  

1. Ensure that you are on the same AWS Region

  

2. Ensure **mydatabase** is selected from the DATABASE list and then choose **New Query**.

  

3. In the query pane, copy the following statement to create a the NYTaxiRides table, and then choose **Run Query**:

  

````sql

CREATE  EXTERNAL  TABLE NYTaxiRides (

vendorid STRING,

pickup_datetime TIMESTAMP,

dropoff_datetime TIMESTAMP,

ratecode INT,

passenger_count INT,

trip_distance DOUBLE,

fare_amount DOUBLE,

total_amount DOUBLE,

payment_type INT

)

PARTITIONED BY (YEAR  INT, MONTH  INT, TYPE string)

STORED AS  PARQUET

LOCATION  's3://us-west-2.serverless-analytics/canonical/NY-Pub'

````

  

4. Ensure the table you just created appears on the Catalog dashboard for the selected database.

  
#### Adding Partition Meta-data
Now that you have created the table you need to add the partition metadata to the Amazon Athena Catalog.

  

1. Choose **New Query**, copy the following statement into the query pane, and then choose **Run Query** to add partition metadata.

  

```sql

MSCK REPAIR TABLE NYTaxiRides

```

The returned result will contain information for the partitions that are added to NYTaxiRides for each taxi type (yellow, green, fhv) for every month for the year from 2009 to 2016

