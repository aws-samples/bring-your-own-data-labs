+++
title = "Transformations Using Local Docker Environment"
date = 2020-10-20T20:13:10+01:00
weight = 62
chapter = true
pre = "<b>6.2. </b>"
+++

This lab covers a few examples for cleaning, transforming and partitioning yoour data before putting the final results to your data lake. You may or may not need them depending on your data structure.

{{% notice info %}}
The code snippets shared here are examples and may require modification, trial and error for each dataset.
{{% /notice %}}

## Open the notebook

Go to the terminal window that you initiated the command to run your local Jupyter container. By this time, it should be already started. There will be instructions along with a url to open the Jupyter environment. (If you closed the terminal window, go to the second part of this workshop and rerun the command you used)

### Upload a sample csv file

If you want, you can use one of your own CSV files for this part of the workshop. Else:

Download [byodSmallTestData.csv](byodSmallTestData.csv) and upload it into your "work" folder.
1. Go to "work" folder
2. Click on "Upload" button and select the downloaded csv file.
3. Your file should now be under your "work" folder.

A line from the sample CSV:

{{% table %}}
| customerId | dateDMY   | dateUnixTimestamp   | dateISO8601                     | nonsenseCol1 | nonsenseCol2 |
|------------|-----------|---------------------|---------------------------------|--------------|--------------|
|192062      |26/12/2020 |1609012948           |2020-12-26T20:02:28.199+03:00    |WTXR          |LKJY          |
{{% /table %}}


## Initial script setup
1. Once you see the Jupyter environment on your browser, go to "work" folder
2. Click on the **New** button on the top right and select "Python 3". 
3. You can add your code in blocks, select and run it by clicking the **Run** button on the top bar.
4. When a block is running, you will see "In [*]" next to it.
5. When the block finishes, there will be a number between the brackets.

``` python
import sys
import datetime

from pyspark.sql import SparkSession

## These will be used for datetime conversions
from pyspark.sql.functions import from_unixtime, date_format, to_date, to_timestamp
from pyspark.sql.types import DateType, TimestampType
from pyspark.sql.functions import year, month, dayofmonth
```

Now we will load our local files. This part is different than what you would normally do in a Glue environment. So, please change this part when you move the codes into production. A better idea would be just to copy the necessary lines of codes to your existing Glue job. 

```python
# This part is for local pySpark development and it would be different for Glue
# You would use GlueContext instead of SparkSession and read files from S3
spark = SparkSession \
    .builder \
    .appName("BYOD Example") \
    .getOrCreate()

df = spark.read.csv("byodSmallTestData.csv",header=True,sep=",")
df.show()
######
```
Then click Run. When the run finishes, you will see a representation of the file.

## Transformations

### Drop Columns

You probably have a large number of columns and some of them can have complicated names. To analyze the data, perhaps we may not need all the columns, just a small set of them, and to make easier to recall, we may want to change the name of the columns. It is possible to either keep only the necessary columns, or drop unwanted columns and keep the rest.


1. You use the select method to drop all the columns and keep just the ones you need

``` python
df = df.select("COLUMN1","COLUMN2")

```

2. You use the drop method to keep all the columns and just drop the ones you do not need. 

``` python
df = df.drop("COLUMN1","COLUMN2")

```

To rename columns:

```python
df = df.withColumnRenamed("OLDNAME", "NEWNAME")
```

For our sample dataset, we will drop the columns "nonsenseCol1" and "nonsenseCol2":
```python
# We dont want those two nonsense columns so we will drop them
# NOTE: You would use dynamicFrame.drop_fields in a Glue context
columns_to_drop = ['nonsenseCol1', 'nonsenseCol2']
df = df.drop(*columns_to_drop)
df.show()
```

{{% notice info %}}
Check the [previous part]({{< relref "61_transformations_dev_endpoint.en.md" >}}) of the workshop to see how to do those transformations with dynamicFrames instead of dataFrames in a Glue environment.
{{% /notice %}}


### Date fields

Working with different date and time formats, time zones can prove a challenge. Spark has some ways to deal with different time formats. You can convert a date or datetime field to a different format either by creating a new column or replacing the existing column.

If you only need the date part and note the time part of your existing data, you might want to use **DateType**. Otherwise, **TimestampType** would be better since it also contains the time information.

Below, we will going to convert different date formats into TimestampType

```python
## If your column is in ISO 8601 format. Example: 2020-12-26T20:02:28.199+03:00
df = df.withColumn('dateISO8601', to_timestamp("dateISO8601", "yyyy-MM-dd'T'HH:mm:ss.SSSXXX").cast(TimestampType()))

## If your column is in a custom format. Example: 26/12/2020
df = df.withColumn('dateDMY', to_timestamp("dateDMY", "dd/MM/yyyy").cast(TimestampType()))

## If your column is in Unix Timestamp: Example: 1609012948. Here we used DateType instead of TimestampType just to give an example.
df = df.withColumn('dateUnixTimestamp', date_format(from_unixtime(df['dateUnixTimestamp']), "yyyy-MM-dd").cast(DateType()))

df.show()
```


If you do not get an error but the date column is full of NULL, then probably you didn't substitute your own date-format instead of yyyy-MM-dd.

{{% notice info %}}
Check the datetime patterns from [Spark docs](https://spark.apache.org/docs/latest/sql-ref-datetime-pattern.html).
{{% /notice %}}

## Partitioning

Partitioning the data greatly increases the performance of your queries and reduce costs. For example, if you only need last month's data from a large dataset, if the data is partitioned by day, month and year, then you can use a "where" clause in your query and Athena will only use relevant folders and will not scan the unnecessary ones.

In order to partition our data, we will first create extra columns for year, month and day. Then when writing the data into Amazon S3, we will partition it by year, month and day. So, our final folder structure will be like:

```
/curated/TABLE-NAME-1/year=YYYY/month=MM/day=DD/file1.parquet
```

You can also add additional partitions if you know you will often use those fields to filter data. For example, if you will often filter your data on product types, you can add a column for that field and also partition by that column additionally.

Add this code at the end of your script:

```python
df = df.withColumn('year', year(df.dateDMY)).withColumn('month', month(df.dateDMY)).withColumn('day', dayofmonth(df.dateDMY))
df.show()

```

See that there are three extra fields for year, month and day - If you want, you can also drop the your initial date column using ```df.drop('DATE-COLUMN-NAME')```

In order to write the resulting files in your local envrionment as parquet files:

```python
df.write.partitionBy('year', 'month', 'day').parquet("parquet/")
```

## Conclusion
This section is created to give an idea on how to work with pySpark on a local environment. As stated before, you need to make the necessary modifications when you move your code to a Glue environment. 