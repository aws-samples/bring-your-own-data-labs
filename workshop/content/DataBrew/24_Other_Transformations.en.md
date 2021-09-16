+++
title = "Other Transformations"
date = 2020-01-30T20:12:40+01:00
weight = 4
chapter = true
pre = "<b>2.4. </b>"
+++

### Unix TimeStamp to DateTime

  

1. On the DataBrew console, click on **Projects** and choose the project you created earlier which has the unix timestamp column.
   ![image](/databrew_img/databrew_transformation1.png)
2. To transform a column which contains the Epoch Unix Timestamp, click on **Column**, then click **Functions > Date Functions > UNIXTIMEFORMAT**. 
   ![image](/databrew_img/databrew_transformation2.png)
   ![image](/databrew_img/databrew_transformation3.png)
3. This will bring up a pane for **Create Column** on the right of the data grid for you to make the changes. 
   -  Select **Date format** as *mm/dd/yyyy\*HH:MM:SS* from the drop down.
   -  Enter a new name for the **Destination column**
   Keep all the other columns as is and Click **Preview changes** to view how the transformation will look before finally applying the changes to the entire data on the gird.
    ![image](/databrew_img/databrew_transformation4.png)
    ![image](/databrew_img/databrew_transformation5.png)
   -  Click on **Apply** to make the changes to the data on the grid and add the step to the recipe.


   {{% notice info %}}
For BYOD labs, make sure the column names do not have space, or any character other than letters, numbers and underscore(_) in the column name. Use DataBrew to rename such columns.
{{% /notice %}}