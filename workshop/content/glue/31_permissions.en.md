+++
title = "Configure Permissions"
date = 2020-10-20T20:12:11+01:00
weight = 21
chapter = true
pre = "<b>3.1. </b>"
+++

### Create a Policy for Amazon S3 Bucket (Console)

1. Sign in to the IAM console at https://console.aws.amazon.com/iam/ with your user that has administrator permissions.
2. In the navigation pane, choose Policies.
3. In the content pane, choose Create policy.
4. Select "JSON" tab.
5. Paste the following string in the text area. DO NOT FORGET TO PUT YOUR BUCKET NAME INSTEAD OF "YOUR-BUCKET-NAME"

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "s0",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:DeleteObject"
      ],
      "Resource": [
        "arn:aws:s3:::YOUR-BUCKET-NAME",
        "arn:aws:s3:::YOUR-BUCKET-NAME/*"
      ]
    }
  ]
}
```

6. Click "Review policy"
7. Enter the name of policy as “BYOD-S3Policy”
8. Click "Create policy"

### Create a Role for AWS Service AWS Glue (Console)

1. Open the IAM console at https://console.aws.amazon.com/iam/.
2. In the navigation pane of the IAM console, choose **Roles**, and then choose Create role.
3. For Select type of trusted entity, choose AWS service.
4. Choose **AWS Glue** as the service that you want to allow to assume this role.
5. Choose Next: Permissions.
6. Mark “**AWSGlueServiceRole**” policy as checked to attach to the role.
7. Mark “**BYOD-S3Policy**” policy as checked to attach to the role.
8. Choose Next: Tags.
9. (Optional) Add metadata to the role by attaching tags as key–value pairs. For more information about using tags in IAM, see Tagging IAM Users and Roles.
10. Choose Next: Review.
11. For Role name, enter “**glue-processor-role**”.
12. Review the role and then choose **Create role**.

NOTE: “AWSAWS GlueServiceRole” is an AWS Managed Policy to provide AWS Glue with needed permissions to access Amazon S3 data. However, you still need to allow access to your specific Amazon S3 bucket for AWS Glue by attaching “BYOD-S3Policy” created policy.