+++
title = "Optional - Detecting New Partitions"
date = 2020-10-22T16:16:01+01:00
weight = 46
chapter = true
pre = "<b>5.7. </b>"
+++



## Detecting New Partitions
**[OPTIONAL]**

> Note: This lab will run on the Curated dataset and table
> 
If a new partition is added, the **Data Catalog** used by Athena should be updated to recognise the new partition. A common way to detect newly added partitions is to run the AWS Glue Crawler once a new partition is added. In Lab 2 we went through how to orchestrate your jobs and crawlers to run periodically or with on-demand triggers. 
Another approach is to use [MSCK RERAIR TABLE](https://docs.aws.amazon.com/athena/latest/ug/msck-repair-table.html) command to automatically add the partitions to the catalog. This command if the partitioning structure conforms to Hive structure *(s3://dataset/{col1=value}/{col2=value})*. If the portioning structure does not conform to Hive *(for example: s3://dataset/2019/Jan and s3://dataset/2018/Feb)*, then you might have to run the Crawler or manually add the partitions by using ALTER TABLE in Athena

In this section we will manually create a new partition in Amazon S3 bucket. Check if Athena recognises the partition, load all partitions and check again.



 1. Open the [AWS Management console for Amazon S3](https://s3.console.aws.amazon.com/s3/home?region=eu-west-1)
 
 2. Navigate into your **curated dataset** folder and add a new folder (partition) by clicking on **Create Folder**. We will not need to add data to the partition
  ![image](/athena_img/athena_s3_addpart.png)
  
 3. If you do not have sub-partitions (for example; year only) proceed to the next step. 
If your table has sub-partitions (for example; partition by year and month), create a new empty folder inside your new partition. The end result should be something like this; s3://{bucket_name}/{curated_dataset}/{col1=value}/{col2=value}

 4. Let's see if Athena can recognise the new partitions. Go to Athena Console, in the **Query Editor** pane type the following SQL
   ```sql
 SHOW PARTITIONS {curated_table_name}

```

 5. Wait for the query to finish and check the results. You will notice that you will not find the newly created partition.
   ![image](/athena_img/athena_showpart.png)
   
 6. In the **Query Editor** pane execute the following SQL command

  ```sql
 MSCK REAPAIR TABLE {curated_table_name}

```
 7. Wait for the query to finish and check the results.
   ![image](/athena_img/athena_newpart_msc.png)
   
 8. Run the ```SHOW PARTITIONS {curated_table_name}``` query again and wait for the query to finish. You will notice in the results that Athena now recognises the new partitions.
   ![image](/athena_img/athena_showpart2.png)