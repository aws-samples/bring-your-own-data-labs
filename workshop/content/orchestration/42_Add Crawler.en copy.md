+++
title = "Workflows - add crawlers"
date = 2021-01-18T12:36:11+01:00
weight = 32
chapter = true
pre = "<b>4.2. </b>"
+++


### Workflows in Glue (2)


Now, we need to configure the job that is going to be triggered. Click **Add Node**

![adding node](/orch_img/orchestration/simpletrigger.png)

Select the crawler that needs to run first- In this case, we want the raw data crawler created in the first step (you probably named it `byod-YOUR_TABLE_NAME-raw-crawler`), then click **Add**.

![adding jobs to the trigger](/orch_img/orchestration/addcrawler.png)

Until this point it should look something like this 

![workflow](/orch_img/orchestration/trigger-crawler.png)

now, we need to set up the job that converts data into parquet...