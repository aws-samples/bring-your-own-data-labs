+++
title = "OPTIONAL: Testing Pyspark Locally with Docker"
date = 2020-10-20T20:12:11+01:00
weight = 27
chapter = true
pre = "<b>2.7. </b>"
+++

{{% notice info %}}
This part is the **optional method** for testing and debugging, and will be useful for our 6th Lab: Transformations. Alternative is using AWS Glue Development Endpoint which is explained in the previous part. Otherwise it would be difficult and time consuming to debug your Spark script.
{{% /notice %}}

{{% notice info %}}
Limitations of this approach:<br />1. You don't have access to your AWS resources such as your files in S3.<br />2. [Glue-specific PySaprk extensions](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-python-extensions.html) are not available by default in your local environment. If you need those extensions, you have two options:<br />- Prepare your environment to use Glue Libraries: [documentation](https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-libraries.html).<br />- Use Glue Development Endpoint, which is explained in the previous section.
{{% /notice %}}

In order to test your Pyspark scripts locally, you will need a Spark environment on your local machine. Also, you will need your data files (exported CSVs) available in your local machine.

One of the easiest ways to manage such an environment is using Docker. Many Docker images for this specific purpose can be found online. We will use [Jupyter Pyspark Notebook](https://hub.docker.com/r/jupyter/pyspark-notebook) for this purpose.

{{% notice info %}}
Docker must be locally installed and running on your local environment. Instructions on installing and running Docker for your specific operating system can be found online.
{{% /notice %}}

1. Open terminal (or Powershell for Windows)
2. Run 
```bash
docker run -it --rm -p 8888:8888 jupyter/pyspark-notebook
```

{{% notice info %}}
If you use the above command, your files inside the notebook environment will be lost after you stop the container. If you want to **keep your notebook files** even after stopping the container, create a folder in your local computer, and use the below command instead (DONT FORGET TO REPLACE YOUR FOLDER LOCATION). It basically mounts a local folder to the working folder inside the container.
{{% /notice %}}

```bash
docker run -it -p 8888:8888 -v /[YOUR-LOCAL-FOLDER-LOCATION]:/home/jovyan --rm --name jupyter jupyter/pyspark-notebook
```

3. It will take a few minutes to download and run the container. If you dont want to wait, leave your terminal open, continue with the workshop, check back before the 5th Lab: Transformation.
4. When the process finishes, it will give you the necessary instructions to open the notebook on your browser (It will prompt a url with a specific token).
5. Open the notebook on your browser, create a new file and you are ready to create and run your scripts.

Example code to test your environment. Copy and paste it into your notebook and run.

```python
import pyspark 
sc = pyspark.SparkContext('local[*]')
# do something to prove it works
rdd = sc.parallelize(range(1000))
rdd.takeSample(False, 5)
```

{{% notice info %}}
You can continue to the next lab now. You will use this notebook on our 6th Lab: Transformations.
{{% /notice %}}