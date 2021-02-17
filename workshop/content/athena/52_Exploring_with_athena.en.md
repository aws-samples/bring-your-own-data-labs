+++
title = "Start Exploring with Athena"
date = 2020-10-20T20:12:40+01:00
weight = 42
chapter = true
pre = "<b>5.2. </b>"
+++

  

After initial setup you can start exploring your data with Athena. You can run normal SQL queries using the **Query Editor** in Athena console. To run your first query, follow the below:

  

> Note: If you do not have a database created, you can follow [Lab 1: Ingestion with AWS Glue](/en/glue.html) to create your first database. Alternatively, you can follow this lab to [create your first database and table using Athena](/en/athena/46_optional.html#creating-amazon-athena-database-and-table).

  

1. Navigate to Athena console

  

2. In the left pane, choose the curated database name we created in AWS Glue before.

![image](/athena_img/athena-db-selec.png)

  

3. After selecting the DB, browse the tables and explore the schema clicking on the table.

![image](/athena_img/athena-table-selec.png)

  

4. On the right pane, enter the first query and click on **Run query**. 

For example, the below query returns all records inside the table. Remove the curly braces - {} - and replace it with your table name.

```sql

SELECT *

FROM {name_of_your_table}

```

![image](/athena_img/athena-first-query.png)



  

  

