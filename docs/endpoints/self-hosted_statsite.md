# Self-Hosted Statsite

Statsite is an awesome alternative to the Etsy StatsD server implementation. Install as per the instructions here:

<https://github.com/armon/statsite>

Then create a `statsite.conf` with the following configuration:

```
[statsite]
bind_address = 0.0.0.0
tcp_port = 8125
udp_port = 8125
log_level = INFO
flush_interval = 10
timer_eps = 0.01
set_eps = 0.02
stream_cmd = python sinks/graphite.py graphite.dataloop.io 2003 fingerprint.
input_counter = numStats
extended_counters = true
```

The important line here is the stream_cmd setting. You may need to update the location of the graphite.py file. The last part of the line is the metric prefix that is sent to dataloop. Usually people install a Dataloop agent onto their Statsite server so they can use the fingerprint string from `/etc/dataloop/agent.finger`. Remember to append a fullstop to the end of the fingerprint.

An example of a good stream_cmd line is:

```
stream_cmd = python sinks/graphite.py graphite.dataloop.io 2003 529b7fc2-2de5-4525-983a-184c8f43c085.
```

## Troubleshooting

The only reliable way I have found to troubleshoot this is to open up netcat to listen on a new port, then temporarily change statsite.conf to send metrics to it.

For example open a new tab and run netcat to listen on port 2004

```
# nc -l 2004
```

Now change the stream_cmd to point to port 2004 localhost

```
stream_cmd = python sinks/graphite.py localhost 2004 529b7fc2-2de5-4525-983a-184c8f43c085.
```

Start statsite and wait for 10 seconds. Your netcat listening tab will show you the metrics being sent. An example of some that look correct:

```
529b7fc2-2de5-4525-983a-184c8f43c085.production.agent.flush.size.sum 57619.000000 1436185723
529b7fc2-2de5-4525-983a-184c8f43c085.production.agent.flush.size.sum_sq 571869.000000 1436185723
529b7fc2-2de5-4525-983a-184c8f43c085.production.agent.flush.size.mean 9.741167 1436185723
529b7fc2-2de5-4525-983a-184c8f43c085.production.agent.flush.size.lower 1.000000 1436185723
529b7fc2-2de5-4525-983a-184c8f43c085.production.agent.flush.size.upper 10.000000 1436185723
529b7fc2-2de5-4525-983a-184c8f43c085.production.agent.flush.size.count 5915 1436185723
529b7fc2-2de5-4525-983a-184c8f43c085.production.agent.flush.size.stdev 1.338330 1436185723
```

Here we can see the fingerprint first, then the dot seperator between the metric paths followed by the value and timestamp. If you have a malformed `fingerprint.metric.path` then metrics won't display in Dataloop

Once you have confirmed it's working against localhost port 2004 you can flip it back to sending to dataloop. Metrics will appear under the agent fingerprint that you used.

Also, be careful about the time on your Statsite server. Installing NTP should help with this. Dataloop will display whatever values against the timestamp you send in, so if your timestamps are wrong strangeness abounds.

 
## Sending to Graphite + Dataloop

Sometimes people want to keep their local Graphite server running in parallel. You can do that quite easily with Statsite by changing the `sink/graphite.py` that they provide to a modified version.

Grab the modified one from here: [gist](https://gist.github.com/tomashley/b38b8a784fd2e9d4210af25e9f9c996f)

You'll need to modify the `self.fingerprint` variable in the init script with a valid agent fingerprint as discussed above.
