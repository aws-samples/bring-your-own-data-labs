+++
title = "Orchestrating the data pipeline"
date = 2020-10-20T20:12:26+01:00
weight = 30
chapter = true
pre = "<b>4. </b>"
+++

In this lab we will continue to work with [AWS Glue](https://aws.amazon.com/glue/) and convert the raw data we have extracted in [the previous lab](https://bringyourowndatalabs.workshop.aws/en/glue.html) into a curated data set by using AWS Glue Workflows. We will follow these steps:

- Orchestrate the data pipeline using the Workflow feature
- Reviewing the results
- Orchestrate YOUR data pipeline using Workflows


> **Please note**: this Lab depends on the steps executed in the [Ingestion with AWS Glue ](https://bringyourowndatalabs.workshop.aws/en/glue.html) Lab;
> In case you didn't finish that one yet, now is the time :)

## Architectural Diagram 

In the previous lab we built manually the first three steps, now we are adding automation using Workflows plus adding an extra step. 

This is the architecture of what we are going to build:

![all_steps_glue](/orch_img/orchestration/all_steps_glue2.png)
