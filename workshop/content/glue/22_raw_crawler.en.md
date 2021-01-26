+++
title = "Create data catalog from Amazon S3 files"
date = 2020-10-20T20:12:11+01:00
weight = 22
chapter = true
pre = "<b>2.2. </b>"
+++

We will be using AWS Glue Crawlers to infer the schema of the files and create data catalog. Without a crawler, you can still read data from the Amazon S3 by a AWS Glue job, but it will not be able to determine data types (string, int, etc) for each column.

Go back to the AWS Glue Console at [https://console.aws.amazon.com/glue/](https://console.aws.amazon.com/glue/).

- Start by navigating to the **Crawlers** menu on the navigation pane, then press **Add crawler**.
- Specify the name: “byod-YOUR_TABLE_NAME-raw-crawler”  and press **Next**;
- Choose **Data stores** as _Crawler source type_ and press **Next**;
- Choose _Amazon S3_ as data store. Add Amazon S3 path of the **specific folder** where your files for your table resides (for example: mybyodbucket/raw/orders) and press \*_Next_. We will create a separate crawler for each table (each folder in your raw folder),so for this step just add one folder.
- At this stage we don't add any other data source;
- Choose the _glue-processor-role_ as IAM Role and proceed to the schedule;
- Leave the _Run on demand_ option at the Frequency section and press **Next**;
- Click on the **Add database** button and specify "byod_src" as database name (this will be the name representing the source database in the data catalog). Press **Next** and **Finish**;

![add a new database](/glue_images/ingestion/crawler2.png)

![add a new database](/glue_images/ingestion/crawler3.png)

- Select the newly created crawler and push the **Run crawler** button. It will take a few minutes until it populates the data catalog.

Validation: After the crawler finishes running, from the left menu, go to **Databases**, select your database, and click "Tables in <database-name>" link. Choose the table you just created. You will be able to see information and schema of your files.