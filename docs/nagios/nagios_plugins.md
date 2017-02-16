# Nagios Plugins

Dataloop supports Nagios standard plugins.

The simplest example of a Nagios plugin written in bash is:

```
#!/usr/bin/env bash

echo "OK | metric=0"

exit 0 
```

Nagios plugins write a string to stdout containing a message, a pipe symbol and then key value pairs separated by an equals sign as per above. You can put multiple key value pairs on the same line separated by spaces. Anything after the pipe symbol can be used as performance data in Dataloop. Tip: ensure there is a pipe symbol in your plugins.

You should also place exit codes in logic throughout your plugins. 0 means OK, 1 means warning, 2 means critical and 3 means unknown. These map to `plugin_name.status` metrics in Dataloop and can be used in Dashboards and alerts to express a state change which will change widget colours and fire off email alerts if you set them up.

You can also add units of measure and other options to the stdout string of Nagios plugins. The full spec can be found here:

<https://nagios-plugins.org/doc/guidelines.html>

In Dataloop something is either considered working, or it is broken. So for alerting off exit codes we only alert when the status is critical (2). Which means the majority of your plugins should emit exit code 0 on success and 2 on failure.

If you need to monitor something generic, and we don't have it as an out of the box plugin, then usually the first place to look is the Nagios Exchange:

<http://exchange.nagios.org/directory/Plugins>

Alternatively, email us at <info@dataloop.io> or [come and find us in Slack](https://slack.outlyer.com/) and we'll create a script for you and place it into our plugin library on Github:

<https://github.com/dataloop/plugins>
