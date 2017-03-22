!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

# Graphite

You can stream metrics directly into `graphite.dataloop.io` on tcp port `2003` using the Graphite metric format.

This is great for high resolution metrics up to 1 second granularity or for long running jobs that you may want to schedule via cron. Many open source metric collection tools have Graphite backends which can be configured to stream metrics directly into Dataloop.

The plain text protocol is described here:

<http://graphite.readthedocs.org/en/latest/feeding-carbon.html>

The metric path section of the string determines how Dataloop will store the data. The format should be:

```
fingerprint.metric.path value timestamp
```

The timestamp value is optional. If you don't set one we will set the timestamp as the time the metric arrived. You can send us historical timestamps if you wish to migrate data into Dataloop.

Currently we only allow Graphite data to be attached to an Agent fingerprint.

The first step is therefore to install a Dataloop Agent on your server. After that you can find your Agent fingerprint on Linux in `/etc/dataloop/agent.finger`, or in the Dataloop UI on the Dataloop (Outlyer) Agent details page.

 

## Testing

Set the fingerprint variable so we can use it in the metric path:

```
finger=$(sed -n -e 's/fingerprint = //p' /etc/dataloop/agent.finger)
```

Then echo a random metric to our graphite port:

```
echo "${finger}.test $RANDOM" | nc -c graphite.dataloop.io 2003
```

You can now create a dashboard widget in Outlyer and browse to the Dataloop (Outlyer) Agent you sent the metric in from.
 

## Simple Example

Start by finding your fingerprint:

```
cat /etc/dataloop/agent.finger

[private]
fingerprint = 2afee216-a80f-4f01-9220-14bc3195a3d5
```

Then simply echo the fingerprint followed by a dot separated metric path followed by your value.

```
echo "2afee216-a80f-4f01-9220-14bc3195a3d5.some.metric.path $RANDOM" | nc -c graphite.dataloop.io 2003
```

In our example we just sent in a random value. When you login to the Outlyer UI you'll now see some.metric.path show up in the dashboard tree browser and the alerts metric drop-down.

Warning: There are a couple of implementations of netcat. The above example with the -c option was for the GNU implementation. If you are using a BSD implementation (like OSX) then use -q0 instead. 

 

## Troubleshooting

The easiest way to troubleshoot a Graphite backend integration is to open a netcat instance listening on another port. For example

```
netcat -l -k 2004
```

Then temporarily redirect your 3rd party software to send to localhost port 2004 tcp. The netcat listener will print out the metrics so you can compare to the format listed above.
