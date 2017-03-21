# Nagios Performance Data

You can create, edit, run / test and deploy Nagios format check scripts in any language from within the Outlyer web interface. This is unique to Outlyer and we believe this is the secret sauce that enables adoption.

For performance data we adhere to the full spec listed [here](https://nagios-plugins.org/doc/guidelines.html#AEN200) (the relevant bit copied below)

We support the absolute minimum in terms of what you can get away with and still have us graph the output. The following is a perfectly legitimate bash script that would graph properly if you used it in Outlyer:

```
#!/bin/bash

echo "OK | something=$RANDOM"
```

We graph everything after the pipe `|` symbol. You could even add a space after `something=$RANDOM` and add another `whatever=value`.

If you deployed this via drag and drop to some agents and wait 30 seconds (our default script interval) then you'll see 'something' and 'whatever' appear as metrics in the dashboard side panel and in the rules criteria metrics drop down.

Obviously in your scripts you will want to build up the performance data string so that it includes metrics worth graphing. If you have metrics that can be grouped our advice is to use dots to separate. For instance:

```
OK | load.load1min=1234;;;; load.load5min=1234;;;; load.load15min=1234;;;;
```

We do some cool stuff in the Dataloop UI to group on dots.

## The full specification

Nagios 3 and newer will concatenate the parts following a `|` in a) the first line output by the plugin, and b) in the second to last line, into a string it passes to whatever performance data processing it has configured. (Note that it currently does not insert additional whitespace between both, so the plugin needs to provide some to prevent the last pair of a) and the first of b) getting run together.) Please refer to the Nagios documentation for information on how to configure such processing. However, it is the responsibility of the plugin writer to ensure the performance data is in a "Nagios Plugins" format.

This is the expected format: 

```
'label'=value[UOM];[warn];[crit];[min];[max]
```

### Notes: 

1. space separated list of label/value pairs 
1. label can contain any characters except the equals sign or single quote (') 
1. the single quotes for the label are optional. Required if spaces are in the label 
1. label length is arbitrary, but ideally the first 19 characters are unique (due to a limitation in RRD). Be aware of a limitation in the amount of data that NRPE returns to Nagios 
1. to specify a quote character, use two single quotes 
1. warn, crit, min or max may be null (for example, if the threshold is not defined or min and max do not apply). Trailing unfilled semicolons can be dropped 
1. min and max are not required if UOM=% 
1. value, min and max in class [-0-9.]. Must all be the same UOM. value may be a literal "U" instead, this would indicate that the actual value couldn't be determined 
1. warn and crit are in the range format (see the Section called Threshold and ranges). Must be the same UOM 
1. UOM (unit of measurement) is one of: 
    * no unit specified - assume a number (int or float) of things (eg, users, processes, load averages) 
    * s - seconds (also us, ms) 
    * % - percentage 
    * B - bytes (also KB, MB, TB) 
    * c - a continous counter (such as bytes transmitted on an interface)
