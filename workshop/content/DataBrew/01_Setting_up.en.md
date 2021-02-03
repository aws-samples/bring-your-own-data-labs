+++
title = "Setting up DataBrew"
date = 2020-01-30T20:12:40+01:00
weight = 01
chapter = true
pre = "<b>0.1. </b>"
+++

In this section we will setup an AWS Glue DataBrew project which is an interactive data preparation workspace in DataBrew. During this process we will create the following:

- **Dataset:** rows or records that are divided into columns or fields.
- **Recipe:** a set of instructions or steps for data that you want DataBrew to act on. A recipe can contain many steps, and each step can contain many actions. We will create the Reciepe without adding any steps, as we will add the steps in the next section.

### Creating a DataBrew project

  

1. Make sure the Data is stored in S3. In one of the following formats; ***csv***, ***json***, ***parquet*** or ***tsv***.
   > Note: GZIP is currently not supported. For more information, see [Creatiing Datasets](https://docs.aws.amazon.com/databrew/latest/dg/datasets.html)
2. On the DataBrew console, choose Projects.
3. Choose Create a project.
4. For Name, enter <project_name>.
5. For Attached recipe, choose Create a new recipe. 
6. For Recipe name, enter <recipe_name>.
   ![image](/databrew_img/databrew_project1.png)
7. Scroll down and for Select a dataset, choose New dataset.
8. For Dataset name¸ enter <dataset_name>.
   ![image](/databrew_img/databrew_project2.png)
9.  For the **Connect to new dataset** you have the option either upload a files, connect to S3, Glue Data Catlogue or Data Exchange. Choose Amazon S3, then S3 path and choose the path to your dataset in S3. The example below shows the data is stored in the following S3 prefix; s3://byod-data-preperation/raw/
   ![image](/databrew_img/databrew_project3.png)
11. Leave the rest as default and scroll down to the **Persmission** section, choose Create new IAM Role and add **byod** as a suffix
    ![image](/databrew_img/databrew_project4.png)
12. Click Create Project

The Project is now created and DataBrew will open a new session to start preparing the data interactively. The session will take around 1-3 minutes to be ready.
