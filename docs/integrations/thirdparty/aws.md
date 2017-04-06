# Amazon Web Services

Some of the Outlyer plugins need an `AWS Access Key ID` and `Secret Access Key` in order to extract metrics from the CloudWatch API.

To generate them, use the following instructions:

1. To get started, open the [AWS Management Console](https://console.aws.amazon.com)
1. Click the IAM tab.
1. Click the Create a New Group of Users button.
1. Enter a Group Name called Dataloop.
1. Select the Read Only Access Policy Template then click Continue.
1. Click the Create New Users tab.
1. Enter a new User Name called Dataloop and click Continue and then Finish.
1. Click Show User Security Credentials.
1. Copy and paste your `Access Key Id` and the `Secret Access Key` somewhere safe

