## Data Retention Policy

Outlyer supports Nagios check scripts which send back metrics at 30 second intervals (by default) and Graphite / StatsD metrics which are 1 second resolution.

We store:

    * 10 second resolution for 13 months for statsd metrics
    * 30 second resolution for 13 months for plugins metrics

10 second resolution is really as low as you need go to debug most issues as they happen. Anything more granular will require you to be on servers debugging live.
