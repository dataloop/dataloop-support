# Where We Fit in the Monitoring Landscape

We are a platform for time-series data visualisation and alerting. You can send us any volume of data and we will aim to process and display it in real time with seamless historical querying. Our platform is agnostic in terms of what time-series data you send to us. However, we spend most of our time helping SaaS companies scale their online services. This generally includes operating system, application and business level metrics; hence a focus on plugins, interfaces and integrations that make sense in that context.

We believe in using a few best of breed tools rather than a single mediocre unified tool. With open standards protocols and APIs, you can easily join tools together to prevent vendor lock-in and future-proof your monitoring stack.

## Logs

We don't accept log data. Other tools such as ELK, Splunk and Graylog do a great job at processing, indexing and querying logs. However, we do integrate with these systems. In the case of the ELK stack, you can use the StatsD forwarder to send time-series metrics from your logging pipeline to us via our Graphite port. For Splunk we have plugins that can scrape the API.

## APM

We don't provide tools that profile or introspect your production applications. Tools like New Relic and AppDynamics do a good job here. We integrate with these tools via scripts that poll their API.

## StatsD

Where it gets slightly confusing is with StatsD. We do support StatsD metrics which a lot of companies use to send back data from their live production apps. These are custom metrics that have to be specifically configured within the application code.

APM and StatsD are best used in combination. Use an APM tool to profile your application and provide top 10s and drill-downs into slow transactions. Use StatsD custom metrics when you want to track a particular thing, like the performance of a section of code, business metrics like signups or even feature usage.

## On-Call Management

Managing on-call scheduling, nagging, escalation and policies isn't our specialty at this time. We integrate with other tools like PagerDuty and OpsGenie for those features.

## Exception Tracking

Tools like Bugsnag will email your developers directly with stack traces caused by users in production. We're not that type of tool.

## Incident Management Tools

We focus on gathering data, visualizing it and alerting. We don't help manage incidents in the way that tools like BigPanda do. If you have a wide variety of monitoring tools then our alerts could be configured to send to incident management tools for correlation.
