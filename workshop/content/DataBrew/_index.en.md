+++
title = "Data Preparation"
date = 2021-01-30T20:13:10+01:00
weight = 10
chapter = true
pre = "<b>2. </b>"
+++

AWS Glue DataBrew is a visual data preparation tool that makes it easy for data analysts, data scientists and non-technical users to prepare data with an interactive, point-and-click visual interface without writing code. With Glue DataBrew, you can easily visualize, clean, and normalize terabytes, and even petabytes of data directly from your data lake, data warehouses, and databases. You can create a dataset using any of these data sources; Amazon S3, AWS Glue Data Catalog (Amazon Redshift, Amazon Aurora, and Amazon RDS) and [AWS Data Exchange](https://aws.amazon.com/data-exchange/). For more information on Data Sources supported on DataBrew, see [Creating and using AWS Glue DataBrew datasets](https://docs.aws.amazon.com/databrew/latest/dg/datasets.html).

In this lab, we will use DataBrew to explore, and prepare the data for analytics. This lab

{{% notice info %}}
This lab is optional. You can run it before starting the labs or you can go directly to [Ingestion with AWS Glue](/en/glue.html).
{{% /notice %}}

## Architectural Diagram

This is an example architecture, the raw data is stored in Amazon S3 in CSV format. We will use DataBrew to read and prepare the data and write the results to a destination bucket.


![architecture-overview.png](/databrew_img/Databrew_Arch.png)