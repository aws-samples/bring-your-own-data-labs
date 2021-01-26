+++
title = "Interactive SQL Queries Using Amazon Athena"
date = 2020-10-20T20:12:40+01:00
weight = 40
chapter = true
pre = "<b>4. </b>"
+++


Amazon Athena is an interactive query service that makes it easy to analyze data in Amazon S3 using standard SQL. Athena is serverless, so there is no infrastructure to setup or manage, and you can start analyzing data immediately. You don’t even need to load your data into Athena, it works directly with data stored in Amazon S3.

In this lab, we will use Athena to explore, analyze and prepare the data for visualization in QuickSight. This lab is divided into three sections; one mandatory and two optional:

*  To start working with Athena, continue on this lab and follow through the different section. Next lab is [Setting up Amazon S3 and Athena for Storing Query Results](#setting-up-amazon-s3-and-athena-for-storing-query-results)
*  [Optional] In [lab 1](/en/glue.html), we used AWS Glue Crawlers to create our Database and Tables. To create your Database and tables using Athena, click [here](/en/athena/46_optional.html)
*  [Optional] To review Athena best practices, click on [Amazon Athena Best Practices](/en/athena/45_athena_best_practices.html)


## Architectural Diagram

This is an example architecture, the raw data is stored in Amazon S3 in CSV format and the curated data is stored in another Amazon S3 bucket in Parquet. While you might have a different setup, this is only for illustrative purposes. Amazon Athena will be used to query both data sources if needed. 

![architecture-overview-lab2.png](https://s3.amazonaws.com/us-east-1.data-analytics/labcontent/reinvent2017content-abd313/lab2/architecture-overview-lab2.png)