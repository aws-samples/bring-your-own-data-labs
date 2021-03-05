+++
title = "Data Cleaning and Transformation"
date = 2020-01-30T20:12:40+01:00
weight = 03
chapter = true
pre = "<b>2.3. </b>"
+++

### Clean and Transform Data

  

1. On the DataBrew console, click on **Projects** and choose the project you created earlier.
   ![image](/databrew_img/databrew_cleaning.png)
2. To remove a column, click on **Column**, then **Delete**. You can choose which columns to delete from the right sidebar.
   ![image](/databrew_img/databrew_cleaning1.png)
3. Choose the column(s) you want to delete and click **Apply**. This adds the step to the Recipe. In the example below, we are removing "passenger count" column.
   ![image](/databrew_img/databrew_cleaning2.png)
4. To rename a column, select the column, click on **Column actions** (the three dots next to column name), then **Rename**
   ![image](/databrew_img/databrew_cleaning3.png)

   {{% notice info %}}
For BYOD labs, make sure the column names do not have space, or any character other than letters, numbers and underscore(_) in the column name. Use DataBrew to rename such columns.
{{% /notice %}}

5. Enter the **New column name** and click **Apply** to add the step to the Recipe.
   ![image](/databrew_img/databrew_cleaning4.png)
6. To split a column into 2 columns, select the column you want to split and click on **Split**. You can either choose **delimiters** or positions to split the column. Here I am choosing to split by position. NOTE: Certain data types such as dates can NOT be split  , therefore the **Split** icon will be greyed out when you select such columns.
   ![image](/databrew_img/databrew_cleaning5.png)
7. In the right pane, enter the **Position from the beginning**. In the example below we are spliting the word 'id' from the remaining value. Click **Preview changes**.
   > Note: This example is only for illustrative purposes. Therefore we will not apply it.
8. Next let's extract the year and month from the from the date. This could be useful when we partition the data later in the workshop. 
   - Choose the Date column.
   - Click column actions, then **Duplicate**.
   - Click **Apply** to create a copy of the date column.
   - For the extract function to work, we need to change the datatype of the new column to String. To do this, select the new column created and click on the clock icon.
   ![image](/databrew_img/databrew_cleaning6.png)
   - Change the datatype to string.
  ![image](/databrew_img/databrew_cleaning7.png)
   - Select the new column and click on the **Extract**, then **Value between positions**
   - Enter the starting position (starting with 0) and the ending position for Year. Below is an example:
  ![image](/databrew_img/databrew_cleaning8.png)
   - Click **Apply**.
   - Repeat the previous 2 steps to extract the month.
   - Finally select the copy column and delete it as shown earlier.
  ![image](/databrew_img/databrew_cleaning9.png)
9. Continue exploring other transformations and add them as steps to the Recipe. Any transformations done here only affect the data in the session, not the actual data in S3. To apply the changes to the dataset in S3 we need to create a Job from this recipe.



### Creating a Job 

To apply the recipe transformations to the dataset in S3, we will create a job from this recipe. This is the same as the one created in [Data Profiling Section]({{< relref "22_Data_Profiling" >}}).

1. First create a new folder in your S3 BYOD bucket. This folder will be the input for our BYOD workshop.
2. On the DataBrew console, click on **Projects** and choose the Project you created earlier.
3. Click on **Create Job**.
   ![image](/databrew_img/databrew_cleaning10.png)
4. This will open **Create job** page, enter job name.
   ![image](/databrew_img/databrew_cleaning11.png)
5. For **Job output settings**:
 -  Choose the file format. DataBrew can write into 7 different file formats including CSV, JSON, Avro, ORC and Parquet. In the next lab we will convert the file format to Parquet. Therefore, since we are doing this in the next lab, select CSV here.
 -  For **S3 location**, enter the path to the bucket and folder that will be used as the input to workshop.
  ![image](/databrew_img/databrew_cleaning12.png)
 -  In **Additional Configuration**, you can configure the job to **Partition** the data by any column and you can also enable encryption. We will configure partitioning in the [Transformations Lab]({{< relref "transformations" >}}), therefore leave everything as default here.
6. For **Advanced job settings**, you can configure the maximum number of units the job will run in parallel. The default number of nodes is 5. The maximum number of nodes is 149. A single DataBrew node provides 4 vCPU and 16 GB of memory. Leave this as default.
7. In **Permissions**, select the Role created earlier in this lab.
8. Click **Create and run job**. Depending on the size of the dataset the job may take upto 30 mins to complete. Wait until the job is successful. NOTE: By increasing the number of nodes in the previous step, the time a job takes can be shortened, but the running costs may get higher.
9. Navigate to S3 console to the output location and verify that a new file was created there.
  ![image](/databrew_img/databrew_cleaning13.png)




