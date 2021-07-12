+++
title = "Visualizing the data using Amazon QuickSight"
date = 2021-01-18T12:36:11+01:00
weight = 55
chapter = true
pre = "<b>6.5. </b>"
+++


## Visualizing the data using Amazon QuickSight

Now that you have configured the data source and prepared the dataset to work with, we will
start by forecasting values in future dates based on your sample data.

### Forecast Monthly Trend for your Quantity Column

2. Under the **Fields list**, select your **Date** column for x-axis by clicking on the field name.
3. Change the visual type to a line chart by selecting the line chart icon highlighted in the screenshot below under **Visual types**.

At this point, the Y-axis of the visual will be populated automatically with count of records
that match each date individually. You can keep it that way and do forecasting for
**count of records**, or choose another **quantity attribute** from Fields list to populate
 Y-axis automatically and have more meaningful forecast.

Before viewing the forecast, you can choose the level of aggregation you want for your **date**
column to populate X-axis by year, month or day. 
4. Click on the **date** field name in top **Field Wells** bar to reveal a sub-menu.
5. Select **Aggregate:Month** to aggregate by month.

You can also use the slider on the X-axis to select the range of values to appear in the graph.

![image](/visualization_images/prepare-forecast.png)

6. Click arrow in top right corner of the visual to expand graph options. Press over the three dots to select **Add forecast**.

![image](/visualization_images/forecast.png)

![image](/visualization_images/end.png)

If you receive an error, try to use **Forecast properties** panel that opens at left, customizing **Periods backward** value to match your number of data points.

**NOTE:** Make sure your Y-axis is assigned to a quantity column before proceeding.

### Adding Filters

You can apply filters to both regular and calculated fields, which include text, numeric, and date fields.
Let's apply a date filter:

1. Choose **Filter** on the tool bar.
2. On the **Applied filters** pane, choose **Create one**, and then choose a date field to filter on.
![image](/visualization_images/filter_creation.png)

3. Choose in which visual the filter will apply and choose the filter type from the dropdown list.
![image](/visualization_images/filter_selection.png)

4. Choose a comparison type.
![image](/visualization_images/filter_comparison_type.png)

5. Enter date values.
![image](/visualization_images/time_range.png)

6. Choose Apply.

### Visualize Month over Month Quantity

1. Add a new visual by duplicating the previous visual. Click on visual top right arrow, press over the three dots and select **Duplicate visual**.
2. Select **KPI** as the Visual Type (bottom left of the screen).
3. Choose a quantity field by clicking on a column from the left menu.
4. In the field wells, click arrow in **Date** column to change the aggregation level to Month or as needed.

![image](/visualization_images/kpi.png)

1. Now select format visual by clicking on arrow on top right corner of the KPI graph.
2. Select **Different as percent(%)** under **comparison method** on the left.

![image](/visualization_images/kpi-percent.png)


### Review ML Insights

1. Click the ‘Insights’ menu on the left. Notice all the suggested insights QuickSight has generated based on what has been built so far!
2. Hover over any of the insights and click the ‘+’ to add it to the dashboard.

![image](/visualization_images/add-insight.png)

**NOTE:** You can customize the narrative by clicking on top right arrow of the visual and
selecting **Customize narrative**.

> Note: The interesting outlier in the above graph is that on Jan23rd, 2016, you see the dip in the number of taxis across all types. Doing a quick google search for that date, gets us this weather article from NBC New York
> ![image](https://s3.amazonaws.com/us-east-1.data-analytics/labcontent/reinvent2017content-abd313/lab2/qsimage22.PNG)

*Using Amazon QuickSight, you were able to see patterns across a time-series data by building visualizations, performing ad-hoc analysis, and quickly generating insights.*
