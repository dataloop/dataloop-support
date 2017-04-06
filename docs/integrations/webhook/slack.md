# Slack

![Slack Alert](/img/slack_alert.png)

## Setting up Slack

We integrate to allow the sending of alert triggers, updates and resolutions to a Slack channel.

Create a new incoming webhook in Slack. <https://my.slack.com/services/new/incoming-webhook/>. This allows you to set the Slack channel for Outlyer notifications.

This will look in the form: `https://hooks.slack.com/services/T02<RANDOM>/<UUID>`

For more details see their documentation: <https://api.slack.com/incoming-webhooks>

From an alert, choose to add a new webhook action

![Create webhook action](/img/select_webhook.png)

Paste the URL into an alert action in Outlyer.

![Enter Slack URL](/img/slack_webhook.png)

Click the test button and you should receive a message in your slack channel.

You can add further text to the payload if you wish, such as links to your runbooks for alert resolution.
