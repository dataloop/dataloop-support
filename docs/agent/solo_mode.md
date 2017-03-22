_**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything._

## Solo Mode

You can configure the dataloop Dataloop (Outlyer) Agent to run in solo mode by updating the agent.yaml and restarting the dataloop-agent service.

**When running in solo mode the Dataloop (Outlyer) Agent won't run remote commands from the web interface.**

**It will also not automatically download plugins.**

However, you should still tag solo mode agents in the usual way so that the metrics coming from these agents appear in dashboards and alerts.

Solo mode agents show up in the UI with a little padlock next to their icon. Plugins deployed into the folder will also show up in the agent details page so you can verify they are being run.

When running agents in solo mode you will also need to deploy a copy of `base.py` locally.

### Agent Config

To enable solo mode edit the `agent.yaml` file and restart the dataloop-agent service.

```
---
## Set to yes to disable RPC and run plugins from local plugin source
solo:  yes

## Set to yes to create lots of logs
debug: no

## The dataloop api key
api-key: xxxxxx

### The dataloop server endpoint
server: wss://agent.dataloop.io

##  set tags to a comma separated list of tags applied to this agent
tags: tag1,tag2,tag3

## Set if you would like a custom name for this agent. Default is hostname
#name:
```

### Local Plugin Deployment

You can deploy plugins to agents running in Solo mode or normal mode. Local plugins take precedence over plugins stored in Dataloop.

    Copy a plugin into /opt/dataloop/plugins (linux) or c:\dataloop\plugins (windows).
    Ensure the file has a valid file extension
    Ensure the file is owned by the dataloop user
    Ensure the file is executable

Within 10 seconds the plugin will be automatically loaded into a running Dataloop agent. The agent.log file will display whether plugins have been successfully loaded or not.
Local Plugin Config

You can optionally change plugin settings by creating a file in the plugins directory alongside the plugins.

    Create a file called plugin_name.yaml
    The file must exactly match the name of the plugin except with a yaml extension
    The file must be owned by the dataloop user

An example yaml file to change the settings for a plugin called node_exporter.sh

```
# cat /opt/dataloop/plugins/node_exporter.yaml
---
interval: 10
params: ''
shell: ['/bin/bash']
type: INPROCESS
format: PROMETHEUS
```

* interval: any number in seconds and defaults to 30 seconds if not supplied

* params: a string to pass into the plugin as an argument. defaults to '' if not supplied

* shell: a list of commands used to execute the plugin. defaults to [''] if not supplied

* type: either `INPROCESS` or `SCRIPT`. defaults to SCRIPT which executes plugins as if they were run on the command line with the shebang. `INPROCESS` runs Python 2.7 code in the context of the running Dataloop (Outlyer) Agent code.

* format: `NAGIOS` (default) or `PROMETHEUS` depending on the output format of the plugin
