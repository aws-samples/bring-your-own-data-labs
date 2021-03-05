+++
title = "Setting up Amazon S3 and Athena for Storing Query Results"
date = 2020-10-20T20:12:40+01:00
weight = 41
chapter = true
pre = "<b>5.1. </b>"
+++

  

If you’re a first time Athena user, you will have to configure an Amazon S3 bucket, where Athena will store the query results.

  

### Creating an Amazon S3 Bucket

  

> Note: If you have already had an Amazon S3 bucket in your AWS Account and can be used to store Athena Query results, [you can skip this section](#setting-up-workgroups).

  

1. Open the [AWS Management console for Amazon S3](https://s3.console.aws.amazon.com/s3/home?region=eu-west-1)

  

2. On the Amazon S3 Dashboard, Click on **Create Bucket**.

  

  

![image](/athena_img/create-bucket.png)

  

  

3. In the **Create Bucket** pop-up page, input a unique **Bucket name**. It is advised to choose a large bucket name, with many random characters and numbers (no spaces). Select the region and make sure you are using the same region used throughout the lab.

  

![image](/athena_img/athena-s3.png)

### Setting up Workgroups

  

Workgroups are used to isolate queries for teams, applications, or different workloads. Workgroups offer some benefits such as:

  

- Enforcing cost constraints - you can apply a limit for each workgroup or you can limit the data scanned by each query.

- Track query-related metrics for all workgroup queries in CloudWatch.

  

You may create separate workgroups for different teams in your organisation. In this lab, we will create a workgroup for our QuickSight Users

  

1. Open the [AWS Management Console for Athena](https://console.aws.amazon.com/athena/home).

  

2. Make sure you are in the same region as the previous labs.

  

3. If this is your first time visiting the AWS Management Console for Athena, you will get a Getting Started page. Choose **Get Started** to open the Query Editor.

  

4. Click on **Workgroup:Primary**. In the Workgroup page, click on **Create workgroup**

![image](/athena_img/athena_workgroup.png)

  

5. In the new page, enter the **Workgroup name**, **Description**, the **Query result location** and click on **Create workgroup**.

![image](/athena_img/athena_workgroup_general_1.png)

  

6. In the Workgroup page, select the newly created workgroup and click on **Switch workgroup**.

![image](/athena_img/athena_workgroup_switch.png)

  

7. In the top bar, make sure you are currently on the new workgroup.
> Note: If the workgroup did not change, try clearing the browser cookies or change the browser.

![image](/athena_img/athena_workgroup_validate.png)

### Setting up Amazon Athena

  

You can use an already existing bucket with a dedicated folder or you can create a new, dedicated bucket. Here, we will use the bucket we created earlier.

  

1. Navigate to Athena console

2. <!---Make sure you are on the right workgroup and--->Click on **Settings** on the top bar

  

3. Fill in the Amazon S3 path **again** (the bucket we created earlier) in **Query result location** field and click **Save**

  > Note: Make sure you have forward slash at the end of the Amazon S3 path

  ![image](/athena_img/athena-setup.png)
