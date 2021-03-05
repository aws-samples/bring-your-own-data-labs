+++
title = "Schema Validation"
date = 2020-10-20T20:12:11+01:00
weight = 25
chapter = true
pre = "<b>3.5. </b>"
+++

In the AWS Glue navigation pane, click Databases > Tables. You can also click the database name (e.g., "ticketdata" to browse the tables).

Within the Tables section of your database, check each table's schema. Validate your raw and curated folders have different tables. 

--- 

You may notice that some tables have column headers such as col0,col1,col2,col3. In absence of headers or when the crawler cannot determine the header type, default column headers are specified. **If this is your case, please follow these steps to resolve**:

- Click **"Edit Schema"** on the top right side.
- In the Edit Schema section, double-click col0 (column name) to open edit mode. Type a chosen name, e.g. “id” as the column name.
- Repeat the preceding step to change the remaining column names to match those shown in the following figure.

--- 

NOTE: If you have any "id" column as integer, please make sure type is set to "double".

- Click Save.