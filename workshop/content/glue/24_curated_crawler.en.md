+++
title = "Add a crawler for curated data"
date = 2020-10-20T20:12:11+01:00
weight = 24
chapter = true
pre = "<b>2.4. </b>"
+++

{{% notice warning %}}
Note: To proceed with this step, you need to wait for all the glue jobs to finish.
{{% /notice %}}

Now that we have the data in Parquet format, we need to infer the schema. 

{{% notice info %}}
Repeat this step per each job you created in the previous step.
{{% /notice %}}

AWS Glue crawler connects to a data store to determine the schema for your data, and then creates metadata tables in the data catalog.


- start by navigating to the _Crawlers_ menu on the navigation pane, then press **Add crawler**.
- specify the name: "byod-YOUR-TABLE-NAME-curated-crawler" and press **Next**;
- choose _Data stores_ as _Crawler source type_ and press **Next**;
- Choose _Amazon S3_ as data store. Add Amazon S3 path where your curated data resides and press \*_Next_;
- If you have more than one folder (meaning different sets type of data), you need to add them as other datastores one by one in this step. Otherwide, choose "No".
- Choose the _glue-processor-role_ as IAM Role and proceed to the schedule;
- Leave the _Run on demand_ option at the Frequency section and press **Next**;
- Click on the **Add database** button and specify "byod_curated" as database name (this will be the name representing the curated database in the data catalog - make sure the name does not have "-" since you may have problems in the future steps). Press **Next** and **Finish**;

- select the newly created crawler and push the **Run crawler** button. It will take a few minutes until it populates the data catalog.