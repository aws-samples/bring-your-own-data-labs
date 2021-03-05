+++
title = "Workflows - Create your workflow"
date = 2021-01-18T12:36:11+01:00
weight = 31
chapter = true
pre = "<b>4.1. </b>"
+++


### Workflows in Glue

In AWS Glue, you can use workflows to create and visualize complex extract, transform, and load (ETL) activities involving multiple crawlers, jobs, and triggers. 

In the case where you may need to build complex flows or ETLs - for example chaining multiple jobs and crawlers plus running different jobs in parallel - AWS Glue workflow can help to automate such task.

The example presented here assumes a linear/ dependant approach - some jobs before running the others. The plan is to create a pipeline, which will refresh the data-set every certain amount of time depending on the configuration.

For this basic example we decided to automate the following steps:

* Crawl raw data
* Transform data into parquet
* Crawl Parquet data

### Creating Workflow in the console

Let's get started - navigate to the **Workflows** in the **ETL** section on the left side-pane.

* we start by clicking on the **Add Workflow** button;
* add a name for our workflow (e.g. `byod`) and press the **Add Workflow** button;

![add workflow](/orch_img/orchestration/wf1.png)

Now, in the new created workflow, please click on **Add Trigger**

* Make sure you select the *Add New* tab;
* Define a *Name* for the new trigger (`Trigger`);
* Trigger Type - Schedule

![configuring the trigger](/orch_img/orchestration/firsttrigger.png)

Now, let's specify the *Frequency* before you press **Add** (let's say you run this workflow once a day);
![configuring the scheduler](/orch_img/orchestration/wf3-1.png)

Now, we need to configure the job that is going to be triggered...