Dataloop supports Nagios check scripts which send back metrics at 30 second intervals (by default) and Graphite / StatsD metrics which are 1 second resolution.

We store:

    * 1 second resolution for 48 hours
    * 1 minute resolution for 60 days
    * 1 hour resolution for 10 years

The 1 second resolution metrics are great for troubleshooting issues as they happen. They also allow us to alert extremely quickly if something does break.

Holding 1 minute resolution for 60 days provides a high level of detail for dashboards, reports and looking at trends.

We will effectively keep every metrics you enter into Dataloop forever at a 1 hour resolution.
