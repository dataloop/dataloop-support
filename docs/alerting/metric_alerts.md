# Metric Alerts

Dataloop supports Nagios script performance metrics and Graphite metrics. We convert both of these metric sources to our own internal format so that you can graph and alert on both.

Metric alerts can be configured via rules. Simply create a new rule, add a criteria and then select either an agent, or a tag of agents as the scope. The `Alert On` drop down will then show all of the available metrics that can be alerted on.

Currently you can set a threshold and a duration. We will be adding more advanced features soon.

The rules engine is real-time. You can stream 1 second granularity metrics into Dataloop and we'll alert you instantly when a rule is triggered. We can do this across multiple sources and with multiple criteria. Most importantly, we do this without any single points of failure so you can trust us to monitor production.
