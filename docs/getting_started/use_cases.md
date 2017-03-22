!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

## Use Cases

Outlyer supports several ways to collect data. We are typically used as a central aggregation point for consolidating many tools into a single platform. This document describes best practices for which collection method we recommend depending upon use case.

### Server Monitoring

Install a Dataloop Agent onto each server. This lets Outlyer know if your server is up or down and collects operating system metrics like CPU, Disk, Memory and Network.

### Service Monitoring

For common services Outyer provides [packs](https://github.com/outlyerapp/packs) which include a plugin, dashboard and alert rules. 

### Custom Service Monitoring

Create custom Nagios check scripts and apply them to agents using tags. Build dashboards and alert rules based on tags. To automate sharing configuration between teams, create private packs.

### Docker Monitoring

Install a Dataloop Agent onto each Docker host to collect host level metrics and run Nagios plugins for service monitoring. Also run a dataloop/dataloop-docker container on each Docker host to collect container resource metrics.

### Application Metrics

Instrument your application with a Prometheus client library. Install a Dataloop Agent onto each server and scrape the Prometheus /metrics endpoint using a Prometheus format plugin.

<https://prometheus.io/docs/instrumenting/clientlibs/>

### Applications Instrumented with StatsD

Run the Prometheus StatsD exporter on each StatsD server.

<https://github.com/prometheus/statsd_exporter>

Configure StatsD to send metrics into the StatsD exporter. Scrape the Prometheus metrics endpoint on the StatsD exporter using a Dataloop Agent and Prometheus format plugin: 

[StatsD, Tags and Outlyer](https://blog.outlyer.com/statsd-tags-and-dataloop)

### Long Running Jobs

For tasks that take a long time to complete write the output to a local file and monitor it with a Dataloop Agent and custom Nagios check script.

### Event Driven Jobs

For tasks that are initiated as a result of an external event like CI builds or cron jobs push Graphite line protocol metrics to graphite.dataloop.io on TCP port 2003 using netcat.

<https://docs.outlyer.com/endpoints/graphite/>

### Remote Monitoring

Use the Dataloop Agent and custom Nagios plugins to remotely monitor over the network. For remote website monitoring designate a single Dataloop (Outlyer) Agent to run the plugin. For monitoring external services like AWS RDS run the plugin from the application servers that access it. Where configuration varies between agents deploy a YAML file with settings from configuration management and read the file on each plugin run.

### Aggregation

Many open source collection tools like CollectD support Graphite output. These collectors can be configured to send metrics into Outlyer via our Graphite port.
