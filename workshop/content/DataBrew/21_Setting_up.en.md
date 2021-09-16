+++
title = "Setting up DataBrew"
date = 2020-01-30T20:12:40+01:00
weight = 1
chapter = true
pre = "<b>2.1. </b>"
+++

In this section we will setup an AWS Glue DataBrew project which is an interactive data preparation workspace in DataBrew. During this process we will create the following:

- **Dataset:** data that's stored elsewhere and details on how DataBrew can connect to that data.
- **Recipe:** a set of instructions or steps for data that you want DataBrew to act on. A recipe can contain many steps, and each step can contain many actions. We will create the recipe without adding any steps, as we will add the steps in the next section.

### Creating a DataBrew project

  

1. Make sure the Data is stored in S3. In one of the following formats; ***csv***, ***json***, ***parquet*** or ***tsv***.
   > Note: GZIP is currently not supported. For more information, see [Creating Datasets](https://docs.aws.amazon.com/databrew/latest/dg/datasets.html)
2. On the DataBrew console, choose **Projects** from the left sidebar.
3. Choose **Create project**.
4. For "Name", enter <project_name>.
5. For "Attached recipe", choose _Create new recipe_. 
6. For "Recipe name", enter <recipe_name>.
   ![image](/databrew_img/databrew_project1.png)
7. Scroll down and for "Select a dataset", choose _New dataset_.
8. For "Dataset name"¸ enter <dataset_name>.
   ![image](/databrew_img/databrew_project2.png)
9.  For **Connect to new dataset**, you have the option to either upload files, connect to S3, Glue Data Catalog or Data Exchange. Choose _Amazon S3_, then S3 path and choose the path to your dataset in S3. The example below shows the data is stored in the following S3 prefix; s3://byod-data-preperation/raw/
   ![image](/databrew_img/databrew_project3.png)
10. In the "Additional configurations" section, make sure you have selected the right delimiter if you selected CSV.
11. Leave the rest as default and scroll down to the "Persmission" section, choose _Create new IAM Role_ and add **byod** as a suffix.
    ![image](/databrew_img/databrew_project4.png)
12. Click **Create Project**

The Project is now created and DataBrew will open a new session to start preparing the data interactively. The session will take around 1-3 minutes to be ready.
