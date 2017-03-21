# Plugin Alerts
 
Outlyer uses Nagios format plugins which means that we adhere to these exit codes:

```
0 OK
1 WARNING
2 CRITICAL
3 UNKNOWN
```

We treat these exit codes like a metric stream in Outlyer. For every Nagios script that returns data you'll see `<script name>.status` in the `Alert On` drop down.

If you select this you'll be prompted with a slightly different set of options from metrics. Essentially you just need to set how long the script needs to have failed for before the criteria is triggered.

We actually treat exit code `2` and `3` as down. So if your script returns exit code `2` or `3` it will trigger a `script.status` rule. This means we ignore OK and Warning for the purposes of alerting.
