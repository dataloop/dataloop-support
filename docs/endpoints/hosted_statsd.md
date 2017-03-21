_**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything._

# Hosted StatsD Server

If you are on an enterprise Outlyer plan, we'd be happy to manage a hosted StatsD and Grafana 3.0 instance for you. Please contact support to make arrangements.

To use your hosted StatsD server (statsite) simply point your StatsD client at the Dataloop (Outlyer) agent in your account. The server address to use is in the format:

```
fingerprint.statsd.dataloop.io
```

To find your fingerprint log into your account and look for the 'dataloop' agent on the Setup Monitoring page. Click the little (i) next to it to look up the info.

 
![agent](../img/agent_info_button.png)

Now on the agent details page look for the fingerprint of your agent.

![agent fingerprint](../img/fingerprint_for_statsd.png)

In this example we would configure our StatsD clients to send to:

```
1a202c1d-77a5-4480-8886-c936e4944fb8.statsd.dataloop.io
```

On the default UDP port 8125. Your server address will match whatever your fingerprint is set to (fingerprints are unique between agents).

You can then find your StatsD metrics by browsing the dataloop agent or using the statsd tag inside Dataloop.
