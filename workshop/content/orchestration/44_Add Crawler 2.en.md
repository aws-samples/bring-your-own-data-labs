+++
title = "Workflows - add second crawler"
date = 2021-01-18T12:36:11+01:00
weight = 34
chapter = true
pre = "<b>4.4. </b>"
+++


### Workflows in Glue (4)

We are almost there, however there's one more thing: we need to add the crawler for the curated data - Please follow the same steps

Click on the byod job and then click in **Add Trigger**.

![adding jobs to the trigger](/orch_img/orchestration/trigger-crawler-trigger-job.png)

Make sure you Add new one. Choose a name (`trigger-crawler-parquet`) and the trigger to be **Event**

![adding jobs to the trigger](/orch_img/orchestration/addtriggerparquet.png)

For the Event, we want that after the previous job is done (SUCCESS) then trigger the crawler

![adding jobs to the trigger](/orch_img/orchestration/wf8.png)

At this point, if you have multiple tables, please do the following to add other jobs to watch:
1. Click on the first created trigger
2. Click <b>Action</b> menu in the top right of the diagram.
3. Choose <b>Add jobs/crawlers to watch</b>
4. Mark other jobs to be watched as checked and click <b>Add</b>

Now, please click on the trigger, and then **Add Node**.

![adding jobs to the trigger](/orch_img/orchestration/wf8-1.png)

Add the curated crawler to be triggered (In this case the crawler created in the previous step - you probably named it something like this **byod-YOUR-TABLE-NAME-curated-crawler**)

![adding jobs to the trigger](/orch_img/orchestration/addtriggerparquet2.png)

your workflow should look something like this:

![complete workflow](/orch_img/orchestration/entireworkflow.png)