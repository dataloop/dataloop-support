# Prometheus Plugins

The Dataloop (Outlyer) Agent can run plugins that scrape Prometheus http endpoints. We recommend that you install a Dataloop (Outlyer) Agent on each server and then create a separate plugin to monitor each endpoint on localhost.

## Example for Node Exporter

Start the Prometheus Node Exporter on a server following the instructions here:

<https://github.com/prometheus/node_exporter>

Then create a new plugin in Dataloop called `node_exporter.py`.

Paste in the following code to scrape the endpoint:

```
#!/usr/bin/env python
import requests
requests.get('http://localhost:9100/metrics').text
```

Where port 9100 is the port the Node Exporter is running. Select the Dataloop (Outlyer) Agent and press run to confirm that metrics are being received.

Now **set the output format to Prometheus** and specify the scrape interval (the default is to scrape every 30 seconds) on the plugin details page. Save and apply to either a single Dataloop (Outlyer) Agent or a tag for deployment.

A list of other exporters can be found here:

<https://prometheus.io/docs/instrumenting/exporters/>

 

## Example for Application Instrumentation

Select a Prometheus client library for your language.

<https://prometheus.io/docs/instrumenting/clientlibs/>

Each library has a set of documentation for how to instrument your code. In our example we'll pick a Python app for payments processing. The example shows how to import the client library and expose metrics on <http://localhost:8000>.

Create a plugin called payments.py with the following content:

```
#!/usr/bin/env python
import requests
requests.get('http://localhost:8000/metrics').text
```

Test this by pressing the run button against a node running the payments application. Remember to switch the plugin format to Prometheus on the plugin details page. Save and apply to either a single Dataloop (Outlyer) Agent or a tag for deployment.
