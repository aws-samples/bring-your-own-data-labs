+++
title = "Signing up for Amazon QuickSight Enterprise Edition"
date = 2021-01-18T12:36:11+01:00
weight = 51
chapter = true
pre = "<b>5.1. </b>"
+++

### Signing up for Amazon QuickSight Enterprise Edition

1. Open the [AWS Management Console for QuickSight](https://quicksight.aws.amazon.com/sn/start).

![image](https://s3.amazonaws.com/us-east-1.data-analytics/labcontent/reinvent2017content-abd313/lab2/qsimage1.PNG)

2. If this is the first time you are accessing QuickSight, you will see a sign-up landing page for QuickSight. 
3. Click on **Sign up for QuickSight**.

> **Note:** Chrome browser might timeout at this step. If that's the case, try this step in Firefox/Microsoft Edge/Safari.

4. On the next page, for the subscription type select the **"Enterprise Edition"** and click **Continue**. 

![image](/visualization_images/enterprise.png)

5. On the next page,

   i. Enter a unique **QuickSight account name.**

   ii. Enter a valid email for **Notification email address**.

   iii. Choose **QuickSight region** where your data resides. 

   iv. Ensure that **Enable autodiscovery of your data and users in your Amazon Redshift, Amazon RDS and AWS IAM Services** and **Amazon Athena** boxes are checked. 

   v. **Click Finish**. 

   ![image](/visualization_images/new-account-fields.png)
   vi. You will be presented with a message **Congratulations**! **You are signed up for Amazon QuickSight!** on successful sign up. Click on **Go to Amazon QuickSight**. 

Now, on the Amazon QuickSight dashboard, navigate to User Settings page by clicking on the Top-Right section - see image below - and click **Manage QuickSight**.

   ![image](/visualization_images/quicksight-first-page.png)

7. In this section, click on **Security & permissions** and then click **Add or remove**.

<p align="center"><img src="img/updated1.png" /></p> 

8. Click on **Amazon S3** and on the tab that says **Amazon S3 buckets linked to QuickSight account**.
9. You have two options depending on the permissions of your account:
  a. Choose **Select All** if you have permissions on all Amazon S3 folders
  b. Choose the following two buckets:
    i. The Amazon S3 bucket(s) you store your data
    ii. The Amazon S3 bucket that that you store Athena query results.
  
NOTE: Make sure to tick the boxes for "Write permission for Athena Workgroup" as well.  

10. Click on **Select buckets**.

![image](/visualization_images/qs-workgroup-permission.png)

12. When you are done doing all this, click **Update** to bring you back to the user settings back.
