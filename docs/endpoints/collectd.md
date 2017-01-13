# Collectd

## CollectD Configuration

It's best to use the latest CollectD package. You can find instructions for setting up the repo's for Debian and Redhat based distros here:

https://github.com/collectd/collectd-ci/blob/master/README.md

Change the following lines in your collectd.conf file. Where fingerprint is the string from /etc/dataloop/agent.finger. You may need to uncomment the LoadPlugin line.


```
Hostname    "fingerprint"

LoadPlugin  write_graphite

<Plugin write_graphite>
  <Node "fingerprint">
    Host "graphite.dataloop.io"
    Port "2003"
    Protocol "udp"
    LogSendErrors true
    Prefix ""
    Postfix ".collectd"
    StoreRates true
    AlwaysAppendDS false
    EscapeCharacter "_"
  </Node>
</Plugin>
```

The metrics will appear under 'collectd' when browsing in the Dataloop web interface.

## Other Software

Lots of open source tools have a Graphite backend. In general you should only need to configure two settings; the graphite server address, and the metric prefix. Where our server address is graphite.dataloop.io and our metric prefix is your fingerprint.
