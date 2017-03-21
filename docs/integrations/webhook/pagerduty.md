# PagerDuty

## Setting up PagerDuty

Setup a new Generic API Service in PagerDuty and take a copy of the Integration Key.

Set the webhook URL in Outlyer to:

<https://events.pagerduty.com/generic/2010-04-15/create_event.json>

Then in the Extra Payload box add the following:

```
{
  "service_key": "your_pagerduty_integration_key"
}
```

Hit the test button and you will get an incident triggered in PagerDuty.

When the rule is resolved in Outlyer the webhook will fire again to resolve the incident in PagerDuty automatically.

## Optional Settings

You can pass in some additional details to PagerDuty via the optional fields as specified in the Developer Docs

<https://developer.pagerduty.com/documentation/integration/events/trigger>
