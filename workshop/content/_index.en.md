+++
title = "Bring Your Own Data Labs (BYOD)"
chapter = true
weight = 70
+++
Bring Your Own Data (BYOD) labs help you build a serverless data pipeline based on your own data. Starting from a sample of your data saved in Amazon S3, you will go through an intensive workshop that focuses on transforming, analysing and visualizing your data.

At the end, you will have a POC on which you can continue to evolve into a more complex data pipeline and deriving more insights. You will be leveraging [AWS Glue](https://aws.amazon.com/glue/) for the data catalogue and run ETL on the data lake; [Amazon Athena](https://aws.amazon.com/athena/) to query the data lake; and [Amazon QuickSight](https://aws.amazon.com/quicksight/) for data visualization.

## Architectural Diagram

This is an example architecture, the raw data is stored in Amazon S3 in CSV format and we will use Databrew to read, prepare the data and write it into a destination bucket. 


 