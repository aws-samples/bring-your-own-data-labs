+++
title = "Wrap up and cleaning existing resources"
date = 2020-10-22T15:26:43+01:00
weight = 70
chapter = true
pre = "<b>8. </b>"
+++

- [Terminate your resources](#terminate-your-resources)
- [Clean other resources:](#clean-other-resources)
  - [AWS Glue Crawlers and Jobs](#aws-glue-crawlers-and-jobs)
  - [Quicksight](#quicksight)
- Next Steps

{{% notice warning %}}
Before wrapping up, we strongly recommend you go through these steps to clean the recurrent resources incurred by the workshop.
{{% /notice %}}

Most of the charges incurred follows a pay as you go model, but some resources incur charges unless you stop them:


- AWS Glue development endpoints incur charges until you stop them. cf. (cf. [AWS Glue detailed pricing](https://aws.amazon.com/glue/pricing/))
- QuickSight is priced per user/month (cf. [Quicksight pricing](https://aws.amazon.com/quicksight/pricing/))


## Terminate your resources

As the AWS Glue development endpoint and the notebook will incur charges, let's stop them : 

* Go to [AWS Glue](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=devEndpoints)
    * Select the endpoint - Action -> Delete

* Go to the [notebook](https://console.aws.amazon.com/glue/home?region=us-east-1#etl:tab=notebooks)
    * Select the notebook - Action -> Stop, then Delete

## Clean other resources:

Other resources that potentially incur charges may need to be cleaned:

### AWS Glue Crawlers and Jobs

Make sure you haven't put any recurrence on jobs and triggers:

* Go to the [AWS Glue Console](https://console.aws.amazon.com/glue/)
    * Click on **Crawlers**
    * Check that the "Schedule" column is empty for the crawlers created during the labs
* Now click on **Triggers**
    * check you have no triggers with a schedule type

### Quicksight

If you want to cancel your subscription to Quicksight you can follow these procedure: (https://docs.aws.amazon.com/quicksight/latest/user/closing-account.html)

## Next Steps

[Check BYOD Graduates Path here](/pdf/byod-graduate-path.pdf)