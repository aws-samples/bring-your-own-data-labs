[0-Prerequisites](../00_Prerequisites/README.md) > [1-Ingestion](../01_ingestion_with_glue/README.md) > [2-Orchestration](../02_orchestration/README.md) > [3-Interactive-SQL](../03_interactive_sql_queries/README.md) > [4-Visualisation](../04_visualization_and_reporting/README.md) > [5-Transformations](../05_transformations/README.md) > 99-Conclusion

# Conclusion Lab : Wrap up and cleaning existing resources

- [Terminate your resources](#terminate-your-resources)
- [Clean other resources:](#clean-other-resources)
  - [Glue Crawlers and Jobs](#glue-crawlers-and-jobs)
  - [Quicksight](#quicksight)

Before wrapping up, we strongly recommend you go through these steps to clean the recurrent resources incurred by the workshop.

Most of the charges incurred follows a pay as you go model, but some resources incur charges unless you stop them:

- Glue development endpoints incur charges until you stop them. cf. (cf. [Glue detailed pricing](https://aws.amazon.com/glue/pricing/))
- Quicksight is priced per user/month (cf. [Quicksight pricing](https://aws.amazon.com/quicksight/pricing/))


## Terminate your resources

As the Glue development endpoint and the notebook will incur charges, let's stop them : 

* Go to [Glue](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=devEndpoints)
    * Select the endpoint - Action -> Delete

* Go to the [notebook](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=notebooks)
    * Select the notebook - Action -> Stop, then Delete

## Clean other resources:

Other resources that potentially incur charges may need to be cleaned:

### Glue Crawlers and Jobs

Make sure you haven't put any recurrence on jobs and triggers:

* Go to the [Glue Console](https://console.aws.amazon.com/glue/)
    * Click on **Crawlers**
    * Check that the "Schedule" column is empty for the crawlers created during the labs
* Now click on **Triggers**
    * check you have no triggers with a schedule type

### Quicksight

If you want to cancel your subscription to Quicksight you can follow these procedure: (https://docs.aws.amazon.com/quicksight/latest/user/closing-account.html)

