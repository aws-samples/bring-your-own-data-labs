[0-Prerequisites](../00_Prerequisites/README.md) > [1-Ingestion](../01_ingestion_with_glue/README.md) > [2-Orchestration](../02_orchestration/README.md) > [3-Interactive-SQL](../03_interactive_sql_queries/README.md) > [4-Visualisation](../04_visualization_and_reporting/README.md) > [5-Transformations](../05_transformations/README.md) > 99-Conclusion

# 1. Conclusion Lab : Wrap up and cleaning existing resources

- [1. Conclusion Lab : Wrap up and cleaning existing resources](#1-conclusion-lab--wrap-up-and-cleaning-existing-resources)
  - [1.1. Terminate the following resources](#11-terminate-the-following-resources)
  - [1.2. Clean other resources:](#12-clean-other-resources)
    - [1.2.1. Glue Crawlers and Jobs](#121-glue-crawlers-and-jobs)
    - [1.2.2. Quicksight](#122-quicksight)

Before wrapping up, we strongly recommend you go through these steps to clean the recurrent resources incurred by the workshop:

## 1.1. Terminate the following resources

The Glue development endpoint and the notebook will incur charges. 

* So please go to [Glue](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=devEndpoints)
    * Select the endpoint - Action -> Delete

* Then go to the [notebook](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=notebooks)
    * Select the notebook - Action -> Stop, then Delete

## 1.2. Clean other resources:

Other resources that potentially incur charges may need to be cleaned:

### 1.2.1. Glue Crawlers and Jobs

Make sure you haven't put any recurrence on jobs and triggers:

* go to the [Glue Console](https://console.aws.amazon.com/glue/)
    * Click on **Crawlers**
    * Check that the "Schedule" column is empty for the crawlers created during the labs
* Now click on **Triggers**
    * check you have no triggers with a schedule type

### 1.2.2. Quicksight

If you want to cancel your subscription to Quicksight you can follow these procedure: [https://docs.aws.amazon.com/quicksight/latest/user/closing-account.html]
