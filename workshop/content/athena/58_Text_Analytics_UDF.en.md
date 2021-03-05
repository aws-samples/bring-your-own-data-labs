+++
title = "Optional - Text Analytics using Athena UDFs "
date = 2020-10-22T16:16:01+01:00
weight = 46
chapter = true
pre = "<b>5.8. </b>"
+++


## Introduction

You already know how to use Amazon Athena to transform data in Amazon S3 using simple SQL commands and the built-in functions in Athena. Now you can also use Athena to translate and analyze text fields, thanks to [Amazon Translate](https://aws.amazon.com/translate/), [Amazon Comprehend](https://aws.amazon.com/comprehend/), and the power of [Athena User Defined Functions (UDFs)](https://docs.aws.amazon.com/athena/latest/ug/querying-udf.html).

If your dataset does not have text fields such as customer reviews, [you can skip this lab](/en/visualization.html). However, if your dataset has text fields (similar to the below) you can continue with this lab to further enrich your dataset. 

![image](/athena_img/athena_udf_0.png)

In this lab, you will see how to use Athena UDFs to do the following:

- Detect the dominant language of a text field
- Detect the prevailing sentiment expressed—positive, negative, neither, or both
- Detect or redact entities (such as items, places, or quantities)

You can also use the UDFs for other Text Analytics use cases, such as but not limited to:
- Detect or redact PII
- Translate text from one language to another

For more information on different use-cases, check this blog post on [Athena Text Analytics](https://aws.amazon.com/blogs/machine-learning/translate-and-analyze-text-using-sql-functions-with-amazon-athena-amazon-translate-and-amazon-comprehend/)

## Architecture

Athena UDF uses AWS Lambda to implement the function capability:

![image](/athena_img/athena_udf_1.png)

The Lambda function used will invoke Comprehend APIs to detect [language](https://docs.aws.amazon.com/comprehend/latest/dg/API_BatchDetectDominantLanguage.html), [sentiment](https://docs.aws.amazon.com/comprehend/latest/dg/API_BatchDetectSentiment.html) and [extract entities](https://docs.aws.amazon.com/comprehend/latest/dg/API_BatchDetectEntities.html) from text fields. 

## Installing the Text Analytics UDF
  
We will be using a pre-build Lambda Function that is available on [GitHub](https://github.com/aws-samples/aws-athena-udfs-textanalytics). Follow the steps below to deploy the function:

1. Navigate to the [TextAnalyticsUDFHandler](https://eu-west-1.console.aws.amazon.com/lambda/home?region=eu-west-1#/create/app?applicationId=arn:aws:serverlessrepo:us-east-1:912625584728:applications/TextAnalyticsUDFHandler) application in the AWS Serverless Application Repository.
2. Switch to the region you are using.
3. In the Application settings section, keep the settings at their defaults.
4. Select I acknowledge that this app creates custom IAM roles.
5. Choose Deploy.

![image](/athena_img/athena_udf_2.png)

And that’s it! Now you have a new Lambda function called ***textanalytics-udf***. We are ready to try some text analytics queries in Athena!

## Configuring Athena to use UDFs

The Athena UDF feature is still in preview. Follow the below steps to enable it:

1. Open the [AWS Management Console for Athena](https://console.aws.amazon.com/athena/home) in the same region you are using.
2. Create an Athena workgroup named ***AmazonAthenaPreviewFunctionality*** like the one [created earlier](/en/athena/51_setting_up.html#setting-up-workgroups).

Now Athena is setup to use UDFs. For the remaining part of this we will **run all the UDF queries from this new workgroup**.

## Analyzing Text

{{% notice warning %}}
In addition to Athena query costs, the text analytics UDF incurs usage costs from Lambda and Amazon Comprehend. The amount you pay is a factor of the total number of records and characters that you process with the UDF. For more information, see [AWS Lambda pricing](https://aws.amazon.com/lambda/pricing/), and[Amazon Comprehend pricing](https://aws.amazon.com/comprehend/pricing/). **Please limit the number of rows that are passed to the UDF** 
{{% /notice %}}

Open the [AWS Management Console for Athena](https://console.aws.amazon.com/athena/home) in the same region you are using.

### Detecting the language

This seb-section we will create a new table, with one new column added: ***language***. The LIMIT clause limits the number of records to 2,000 to limit the number of rows passed to the UDF.

1. In the Athena **Query Editor**, modify the below query by replacing:
   
   - ***<detected_language_table_name>***: The new table name with language column
   - ***<text_column_name>***: The column name with text
   - ***<table_name_with_text_field>***: The table with text field

````sql

CREATE TABLE <detected_language_table_name> WITH (format='parquet') AS
USING FUNCTION detect_dominant_language(col1 VARCHAR) RETURNS VARCHAR TYPE LAMBDA_INVOKE WITH (lambda_name = 'textanalytics-udf')
SELECT *, detect_dominant_language(<text_column_name>) AS language
FROM <table_name_with_text_field>>
LIMIT 2000

````

1. Choose **Run Query**
2. Run the below query to list the all languages detected and sort them by the number of reviews:
````sql
SELECT language, count(*) AS count FROM <detected_language_table_name> GROUP BY language ORDER BY count DESC
````
![image](/athena_img/athena_udf_3.png)

#### What just happened

We invoked the ***textanalytics-udf*** Lambda function and used *detect_dominant_language* method inside the function to detect the language in 2000 fields inside *<text_column_name>* and results written into a new column named *language*.

The Lambda function invoked Comprehend APIs detect the dominant language. 


### Detecting Sentiment and Entities

This seb-section we will create a new table, with two new columns added: ***sentiment*** and ***entities***. We will not be using the LIMIT clause because we will be using [created in the previous section](#detecting-the-language) as the input.

1. In the Athena **Query Editor**, modify the below query by replacing:
   
   - ***<text_analysis_table_name>***: The new table that will be created with the 2 new columns.
   - ***<text_column_name>***: The column name with text
   - ***<detected_language_table_name>***: The new table that was created in the previous section

````sql

CREATE TABLE <text_analysis_table_name> WITH (format='parquet') AS
USING
   FUNCTION detect_sentiment_all(col1 VARCHAR, lang VARCHAR) RETURNS VARCHAR TYPE LAMBDA_INVOKE WITH (lambda_name = 'textanalytics-udf'),
   FUNCTION detect_entities_all(col1 VARCHAR, lang VARCHAR) RETURNS VARCHAR TYPE LAMBDA_INVOKE WITH (lambda_name = 'textanalytics-udf')
SELECT *, 
   detect_sentiment_all(<text_column_name>, language) AS sentiment,
   detect_entities_all(<text_column_name>, language) AS entities
FROM <detected_language_table_name>
WHERE language IN ('ar', 'hi', 'ko', 'zh-TW', 'ja', 'zh', 'de', 'pt', 'en', 'it', 'fr', 'es')

````

2. Choose **Run Query**
3. Run the below query to preview the new table:
````sql
SELECT * FROM <text_analysis_table_name> limit 10;
````

4. Scroll sideways to the two new columns: *sentiment* and *entities*. 
   - Sentiment
    ![image](/athena_img/athena_udf_4.png)
   - Entities
    ![image](/athena_img/athena_udf_5.png)

You will see that both columns are nested JSON and not well prepared for analysis. So let's fix this

#### Preparing sentiment for analysis

1. Run the following SQL query to create a new table containing sentiment and sentiment scores expanded into separate columns:
````sql
CREATE TABLE <sentiment_final_table_name> WITH (format='parquet') AS
SELECT 
   <col1>, <col2>, <col3>, <col4>, language, 
   CAST(JSON_EXTRACT(sentiment,'$.sentiment') AS VARCHAR) AS sentiment,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.positive') AS DOUBLE ) AS positive_score,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.negative') AS DOUBLE ) AS negative_score,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.neutral') AS DOUBLE ) AS neutral_score,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.mixed') AS DOUBLE ) AS mixed_score,
    <text_column_name>
FROM <text_analysis_table_name>
````
Below is an example:
````sql
CREATE TABLE sentiment_results_final WITH (format='parquet') AS
SELECT 
   review_date, year, product_title, star_rating, language, 
   CAST(JSON_EXTRACT(sentiment,'$.sentiment') AS VARCHAR) AS sentiment,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.positive') AS DOUBLE ) AS positive_score,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.negative') AS DOUBLE ) AS negative_score,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.neutral') AS DOUBLE ) AS neutral_score,
   CAST(JSON_EXTRACT(sentiment,'$.sentimentScore.mixed') AS DOUBLE ) AS mixed_score,
   review_headline, review_body
FROM amazon_reviews_with_text_analysis
````
2. Preview the new *,sentiment_results_final>* table
   ![image](/athena_img/athena_udf_6.png)


#### Preparing entities for analysis

1. Run the following SQL query to create a new table containing detected entities unnested into separate rows (inner subquery), with each field in a separate column (outer query):
````sql
CREATE TABLE <entities_final_table_name> WITH (format='parquet') AS
SELECT 
   <col1>, <col2>, <col3>, <col4>, language, 
   CAST(JSON_EXTRACT(entity_element, '$.text') AS VARCHAR ) AS entity,
   CAST(JSON_EXTRACT(entity_element, '$.type') AS VARCHAR ) AS category,
   CAST(JSON_EXTRACT(entity_element, '$.score') AS DOUBLE ) AS score,
   CAST(JSON_EXTRACT(entity_element, '$.beginOffset') AS INTEGER ) AS beginoffset,
   CAST(JSON_EXTRACT(entity_element, '$.endOffset') AS INTEGER ) AS endoffset,
   <text_column_name>
FROM
(
   SELECT * 
   FROM
      (
      SELECT *,
      CAST(JSON_PARSE(entities) AS ARRAY(json)) AS entities_array
      FROM <text_analysis_table_name>
      )
   CROSS JOIN UNNEST(entities_array) AS t(entity_element)
)
````
Below is an example:
````sql
CREATE TABLE entities_results_final WITH (format='parquet') AS
SELECT 
   review_date, year, product_title, star_rating, language, 
   CAST(JSON_EXTRACT(entity_element, '$.text') AS VARCHAR ) AS entity,
   CAST(JSON_EXTRACT(entity_element, '$.type') AS VARCHAR ) AS category,
   CAST(JSON_EXTRACT(entity_element, '$.score') AS DOUBLE ) AS score,
   CAST(JSON_EXTRACT(entity_element, '$.beginOffset') AS INTEGER ) AS beginoffset,
   CAST(JSON_EXTRACT(entity_element, '$.endOffset') AS INTEGER ) AS endoffset,
   review_headline, review_body
FROM
(
   SELECT * 
   FROM
      (
      SELECT *,
      CAST(JSON_PARSE(entities) AS ARRAY(json)) AS entities_array
      FROM amazon_reviews_with_text_analysis
      )
   CROSS JOIN UNNEST(entities_array) AS t(entity_element)
)
````

2. Preview the new *<entities_final_table_name>* table
   ![image](/athena_img/athena_udf_7.png)



#### What just happened

We invoked the ***textanalytics-udf*** Lambda function and used *detect_sentiment_all* and *detect_entities_all* methods inside the function to detect sentiment and extract entities respectively. The results were written into 2 new columns; *sentiment* and *entities*. Both columns were nested JSON, so to prepare them for analysis we unested both columns into 2 new tables; *<sentiment_final_table_name>* and *<entities_final_table_name>*.

Both tables could be input to the QuickSight Dataset that we will create in the [next lab]((/en/visualization.html)).


