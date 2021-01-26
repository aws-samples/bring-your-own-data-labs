+++
title = "Creating a Development Endpoint for AWS Glue"
date = 2020-10-20T20:12:11+01:00
weight = 26
chapter = true
pre = "<b>2.6 </b>"
+++

{{% notice info %}}
This part is the **preferred method** for testing and debugging, and will be useful for our 6th Lab: Transformations.
{{% /notice %}}

{{% notice warning %}}
Development endpoints [incur costs](https://aws.amazon.com/glue/pricing/) whether or not you are using them. **Please delete the endpoints AND notebooks after usage.** 
{{% /notice %}}

In AWS Glue, you can create an environment — known as a development endpoint — that you can use to iteratively develop and test your extract, transform, and load (ETL) scripts. For more info, please refer to: [Developing Scripts Using Development Endpoints](https://docs.aws.amazon.com/glue/latest/dg/dev-endpoint.html)

The advantages of having a development endpoint compared to the local Docker method are:
- [Glue-specific PySaprk extensions](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-extensions.html) are available for you to use.
- Multiple people can use the same endpoint and notebook for development.
- You have access to other AWS resources such as Amazon S3 from this endpoint, whereas you should have your files locally with the Docker option.

## Creating a Development Endpoint and Notebook - Step 1

How to create an endpoint and use it from a notebook:

Go to AWS Glue in the console https://console.aws.amazon.com/glue/
1. On the left menu, click in Dev endpoints and **Add endpoint**.
2. Development endpoint name: `byod`
3. IAM role: **glue-processor-role**
4. Click **Next**
5. Select Skip networking information
6. Click **Next**
7. Click **Next** \- No need to Add SSH public key for now
8. Click **Finish**

It will take a while to create the endpoint.


## Creating a Development Endpoint and Notebook - Step 2

You can, now, create a notebook that connects to the endpoint, and use your notebook to author and test your ETL script. When you're satisfied with the results of your development process, you can create an ETL job that runs your script.

1. In the glue console, Go to Notebooks, click Create notebook
2. Notebook name: aws-glue-`byod`
3. Attach to development: choose the endpoint created some steps back
4. Create a new IAM Role.
5. **Create notebook**

{{% notice info %}}
You can continue to the next lab while the process continues. You will only need this notebook on our 6th Lab: Transformations.
{{% /notice %}}