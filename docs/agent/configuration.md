**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

## Configuration


By default the dataloop-agent will read `agent.yaml` for configuration from `/etc/dataloop` on Linux and `c:\dataloop` on Windows.

The only mandatory configuration required in this file is the api-key.

Changes will be picked up on dataloop-agent service restart.

* Example:

```
---
##
## Set to yes to disable RPC and run plugins from local plugin source
solo_mode: no

## Set to yes to create lots of logs
debug: no

## The dataloop api key
api-key: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

##  set tags to a comma separated list of tags applied to this agent
#tags:

## Set if you would like a custom name for this agent. Default is hostname
#name:
```

On Linux there are also a couple of tweaks that can be made in `/etc/default/dataloop-agent` for Debian based distros and `/etc/sysconfig/dataloop-agent` for Redhat.

* Example:

```
# Deregister node with dataloop when the agent stops?
# Only 'no' will make this stop.
DEREGISTER_ONSTOP=yes
export HTTP_PROXY=http://squid.box
```

By default the Dataloop agent will deregister on server and service shutdown. This is extremely useful when you have dynamically scaled environments e.g. Amazon ASG's.

If you have a more static infrastructure or want to perform the deregister at your orchestration later then set to no.

You can also specify `HTTP_PROXY` or `HTTPS_PROXY` if the agent needs to proxy out to the internet.

On Windows you can configure these as environment variables and the agent will connect out via a proxy.
