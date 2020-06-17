[0-Prerequisites](../00_Prerequisites/README.md) > [1-Ingestion](../01_ingestion_with_glue/README.md) > [2-Orchestration](../02_orchestration/README.md) > [3-Interactive-SQL](../03_interactive_sql_queries/README.md) > [4-Visualisation](../04_visualization_and_reporting/README.md) > [5-Transformations](../05_transformations/README.md) > 99-Conclusion

# Conclusion Lab : Wrap up and cleaning existing resources

- [Conclusion Lab : Wrap up and cleaning existing resources](#conclusion-lab--wrap-up-and-cleaning-existing-resources)
  - [Terminate the following resources](#terminate-the-following-resources)
  - [Clean other resources:](#clean-other-resources)
    - [Glue Crawlers and Jobs](#glue-crawlers-and-jobs)
    - [Quicksight](#quicksight)

Before wrapping up, we strongly recommend you go through these steps to clean the recurrent resources incurred by the workshop:

## Terminate the following resources

The Glue development endpoint and the notebook will incur charges. 

* So please go to [Glue](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=devEndpoints)
    * Select the endpoint - Action -> Delete

* Then go to the [notebook](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=notebooks)
    * Select the notebook - Action -> Stop, then Delete

## Clean other resources:

Other resources that potentially incur charges may need to be cleaned:

### Glue Crawlers and Jobs

Make sure you haven't put any recurrence on jobs and triggers:

* go to the [Glue Console](https://console.aws.amazon.com/glue/)
    * Click on **Crawlers**
    * Check that the "Schedule" column is empty for the crawlers created during the labs
* Now click on **Triggers**
    * check you have no triggers with a schedule type

### Quicksight

If you want to cancel your subscription to Quicksight you can follow these procedure: (https://docs.aws.amazon.com/quicksight/latest/user/closing-account.html)
