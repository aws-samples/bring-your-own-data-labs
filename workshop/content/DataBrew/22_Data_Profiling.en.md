+++
title = "Data Profiling"
date = 2020-01-30T20:12:40+01:00
weight = 02
chapter = true
pre = "<b>2.2. </b>"
+++

New session will open automatically displaying a sample of your dataset. The default sample is 500 records and this could be changed when creating the project. 

When you work on a project, DataBrew displays statistics such as the number of rows in the sample and the distribution of unique values in each column. These statistics, and many more, represent a profile of the sample. When you profile your data, DataBrew creates a report called a data profile. You can make a data profile for any dataset by running a data profile job.



### Running a Profile job

  

1. On the newly opened session page, click on **Profile** tab.
   ![image](/databrew_img/databrew_profile.png)
2. Click on **Run data Profile**
   ![image](/databrew_img/databrew_profile1.png)
3. This will take you to ***Create job** page. Enter a name for the job.
   ![image](/databrew_img/databrew_profile2.png)
4. In the **Job output settings** section, choose the S3 location to store the output of the job.
   ![image](/databrew_img/databrew_profile3.png)
5. Leave **Advanced job settings**, **Associated schedules** and **Tags** as default. In the **Permission** section choose the role created in the [previous section]({{< relref "21_Setting_up#creating-a-databrew-project" >}}).
   ![image](/databrew_img/databrew_profile4.png)
6. Click **Create and run job**.

Depending on the size of the dataset the job will take 2-10 minutes to complete.
> Note: Data profile is limited to the first 20,000 rows of a dataset. Request a limit increase for larger datasets.

You don't need to wait for the job to finish. You can, now, go back to "Grid" view, by using the button on the top-right, and continue to work on your data as explained in the [next section]({{< relref "23_Data_Cleaning" >}}). 10 minutes later, you can come back to this page and continue viewing your profile, as explained below.
### Viewing Profile


1. On the DataBrew console, click on **Jobs**, then **Profile jobs** tab.
2. Check **Last job run status**, make sure it succeeded. Click on **View data profile** under **Data profile** column.
   ![image](/databrew_img/databrew_profile5.png)
3. This will take you to **Data profile overview**. This page shows general summary of the data like the number of columns, different data types, null values and duplicate repords. In the below example, you can see there are 9 columns, no missing cells and no duplicate rows. In the **Correlation** section you can see the relationship between different columns which could be useful for Machine Learning use-cases.
   ![image](/databrew_img/databrew_profile6.png)
4. In **Column Statistics**, you can dive deeper into each column, check **Data quality** and **Value distribution**. This is useful to find columns with high cardinality, Min, Max and Average values.
   ![image](/databrew_img/databrew_profile7.png)
5. Finally, **Data lineage** view shows you how the data flows through different entities from where it originally came. You can see its origin, other entities it was influenced by, what happened to it over time, and where it was stored.
   ![image](/databrew_img/databrew_profile8.png)
   


