+++
title = "Workflows - add transform job"
date = 2021-01-18T12:36:11+01:00
weight = 33
chapter = true
pre = "<b>3.3. </b>"
+++


### Workflows in Glue (3)


now, we need to set up the job that converts data into parquet. For that please click on the crawler (`byod-YOUR_TABLE_NAME-raw-crawler`)  and then click in **Add Trigger**

Repeat the creation of the trigger
Note: Make sure you select Add new at the top and give it a name (`trigger-job-parquet`). The trigger type Event should be already selected and the option Start after ANY watched event as well. At this point, the workflow should look something like this

![workflow](/orch_img/orchestration/trigger-crawler-trigger.png)

Click on the trigger and then **Add Node**

Select the job that needs to run - In this case, we want the transformation job created in the first step (you probably named it `byod-YOUR-TABLE-NAME-job`), then click **Add**.

![adding jobs to the trigger](/orch_img/orchestration/addjobsimple.png)

We are almost there, however there's one more thing: we need to add the crawler for the curated data...