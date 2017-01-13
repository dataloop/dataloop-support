# Numeric Widgets

### Widgets available when browsing a single agent

##### Last Value

The last value received for the given metric. Basically a gauge.

##### Total Value

The sum of all values for a given metric over the time period set the dashboard.

A good use case for this is adding up counter values from StatsD. We'll add up all of those 10 second flushes and help you display things like 'signups in the last 24 hours'.

### Widgets available when browsing multiple agents (using tags)

##### Average

An average of the last values received by all agents in the tag(s).

##### Lowest

The lowest of the last values received by all agents in the tag(s)

This widget is useful for displaying metrics like best current response time.

##### Highest

The highest of the last values received by all agents in the tag(s)

This widget is useful for displaying metrics like worst current response time.

##### Combined

The summation of the last values received by all agents in the tag(s)

This widget is useful for displaying metrics like current used disk space across a cluster
