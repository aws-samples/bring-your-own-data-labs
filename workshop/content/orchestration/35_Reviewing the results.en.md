+++
title = "Reviewing the results"
date = 2021-01-18T12:36:11+01:00
weight = 37
chapter = true
pre = "<b>3.5. </b>"
+++

### Reviewing the results



Once we are ready, we can try out the workflow by clicking on **Run** in the **Actions** menu.

{{% notice info %}}
Once you selected a job, you can monitor the execution status in the *History* TAB in the bottom panel; If the job(s) succeeded, visit the *Metrics* TAB to see resource utilisation and data movement information; Also note that the jobs can take quite a bit of time to end, about 15 minutes in total.
{{% /notice  %}}

When jobs succeed, you should find in your Amazon S3 bucket a folder called *curated* with subfolders for all your tables.

By selecting the latest Job and clicking on the **View run details** you can monitor the execution results of the data processing pipeline:

![check out the execution results](/orch_img/orchestration/wf-observe1.png)

Once the pipeline succeeded at least once, we should be able to observe the newly created databases in the data catalog.

![check out the execution results](/orch_img/orchestration/databases.png)

When you navigate to the **Tables**, you will observe tables created from your data files.

"What can I do with it?", you may wonder. Stay tuned, we will cover this in great details in the next session.