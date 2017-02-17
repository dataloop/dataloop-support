# StatsD Clients

StatsD enables developers to instrument server side code and send metrics to Outlyer for visualisation and alerting. Data is sent using UDP so network issues will never slow your application down.

### Things you need to get started

  1. Connection details for a StatsD server
  1. A StatsD client library

### Basic one-time setup

Each accounts gets a docker container hosting a StatsD server. [Details for hosted StatsD can be found here](/endpoints/hosted_statsd). Alternatively, you can setup your own StatsD server following our [config guide](/endpoints/self-hosted_statsd).

Once you have a server setup find an appropriate StatsD Client for the language you are using.

For our example we'll use Python and the [pystatsd](https://github.com/jsocol/pystatsd) library. Full documentation can be found [here](http://statsd.readthedocs.org/en/latest/index.html)

All StatsD client libraries will need to be configured with a StatsD server and port to connect to. In our example we've spun up a StatsD server at demo-statsd.dataloop.io on port 8125 udp.

Configuration within the app is as simple as adding:

```
from statsd import StatsClient

statsd = StatsClient(host='demo=statsd.dataloop.io',
                     port=8125,
                     prefix=None,
                     maxudpsize=512)
```

That's pretty much it. You can now use the statsd object in your code to start sending metrics.
