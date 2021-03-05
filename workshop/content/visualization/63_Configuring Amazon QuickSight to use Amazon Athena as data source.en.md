+++
title = "Configuring Amazon QuickSight to use Amazon Athena as data source"
date = 2021-01-18T12:36:11+01:00
weight = 53
chapter = true
pre = "<b>6.3. </b>"
+++


### Configuring Amazon QuickSight to use Amazon Athena as data source

> For this lab, you will need to choose the region where your data resides. 

![image](/visualization_images/oregon.png)

1. Click on the region icon on the top-right corner of the page, and select the region where your data resides. 

2. Click on **Datasets** in the left menu to review existing data sets.

3. Click on **New dataset** on the top-right corner of the web page and review the options. 

4. Select **Athena** as a Data source.

![image](/visualization_images/connectors.png)

5. Enter the **Data source** **name** (e.g. *AthenaDataSource*).

6. Select the Athena **workgroup** you created specifically for QuickSight. Then **Validate the Connection**.

![image](/visualization_images/AthenaWorkGroup_DataSource.png)

7. Click **Create data source**.

8. Choose curated database you created then choose the table you need to visualize its data.

9. Choose **Select**.

10. Choose to <b>Directly query your data</b> then click <b>Visualize</b>

***Alternative Option***

You can choose to create a dataset using Amazon S3 as your data source. For this:
* Make sure you have granted Amazon QuickSight access to any Amazon S3 buckets that you want to read files from.
* Create a manifest file to identify the text files that you want to import. [Supported Formats for Amazon S3 Manifest Files](https://docs.aws.amazon.com/quicksight/latest/user/supported-manifest-file-format.html)
