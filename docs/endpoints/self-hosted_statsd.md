_**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything._

# Self-Hosted StatsD Server

StatsD is a service that aggregates metrics over time. We plan to provide hosted StatsD in the future, but for now you'll need to setup StatsD on your own servers and point them at the Outlyer Graphite port.

Like everything in Outlyer, you need to bind your metrics to a fingerprint. The easiest way to do this may be to setup an AWS micro instance and install an agent on it. You could give the server a host name like 'statsd' so that the agent appears in Outlyer with a friendly name. Drag this agent into the appropriate part of your hierarchy.

## Installing StatsD

1. Clone the statsd repository from Etsy's Github account

```
git clone https://github.com/etsy/statsd.git
```

2. Copy `exampleConfig.js` to `config.js` and edit the file so the bottom section is like this:

```
{
 graphitePort: 2003
, graphiteHost: "graphite.dataloop.io"
, port: 8125
, graphite: { legacyNamespace: false, globalPrefix: "FINGERPRINT" }
, backends: [ "./backends/graphite" ]
, deleteIdleStats: true
, debug: true
}
```

Where `FINGERPRINT` is the string found in `/etc/dataloop/agent.finger`. Often people will install the Dataloop Agent on their StatsD server and use this fingerprint. But you could bind your StatsD metrics to any fingerprint.

Then start statsd by running:

```
node stats.js config.js
```

3. Open Outlyer in a browser. Click on the dashboards tab and then browse down to your StatsD agent in the tree. You should see some metrics already streaming in.

 

## Testing

From on your StatsD server itself you can run:

```
echo "foo:1|c" | nc -u -w0 127.0.0.1 8125
```
