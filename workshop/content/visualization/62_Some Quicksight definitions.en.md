+++
title = "Some Quicksight definitions"
date = 2021-01-18T12:36:11+01:00
weight = 52
chapter = true
pre = "<b>6.2. </b>"
+++

### Some Quicksight definitions

**What is a data source and what is a dataset?**

A **data source** is an external data store and you use it to access the data in this external data store eg. Amazon S3, Amazon Athena, Salesforce etc.

A **data set** identifies the specific data in a data source that you want to use. For example, the data source might be a table if you are connecting to a database data source. It might be a file if you are connecting to an Amazon S3 data source. A data set also stores any data preparation you have performed on that data, such as renaming a field or changing its data type. Storing this preparation means that you don't have to reprepare the data each time you want to create an analysis based on it.

**What is an Analysis, a Visual and a Dashboard?**

An **analysis** is a container for a set of related visuals and stories, for example all the ones that apply to a given business goal or key performance indicator. You can use multiple data sets in an analysis, although any given visual can only use one of those data sets.

A **visual** is a graphical representation of your data. You can create a wide variety of visuals in an analysis, using different datasets and visual types.

A **dashboard** is a read-only snapshot of an analysis that you can share with other Amazon QuickSight users for reporting purposes. A dashboard preserves the configuration of the analysis at the time you publish it, including such things as filtering, parameters, controls, and sort order. The data used for the analysis isn't captured as part of the dashboard. When you view the dashboard, it reflects the current data in the data sets used by the analysis.
