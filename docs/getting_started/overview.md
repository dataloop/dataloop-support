!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

## Overview


### Agent Installation and Tagging

You should plan to install the dataloop-agent on every server. On Linux the Dataloop (Outlyer) Agent is packaged up as a deb and rpm to make this simple. We have configuration management repositories for:

[Puppet](https://github.com/outlyerapp/agent-puppet)  
[Chef](https://github.com/outlyerapp/dataloop-chef)  
[Ansible](https://github.com/outlyerapp/dataloop-ansible)  
[Salt](https://github.com/outlyerapp/dataloop-salt)  

On Windows it's a manual install via the installer. However, this does support silent install if you wish to automate with Powershell.

We advise that you use configuration management to tag your servers so that plugin deployment, dashboards and alerts can be setup in an aggregated way. Each configuration management repository has a README.md that describes how to do the tagging.

Our recommended best practices for tags are:

```
product_name,environment,role
```

For example, production web servers for the acme todo list app would get tagged:

```
todo,prod,web
```

Then when a product manager comes along and says: "we should do some kind of funky calendar app next", you can spin up new product environments with:

```
calendar,prod,web
```

or,

```
calendar,qa,database
```

Tagging can also be done in the UI although this is only recommended for static environments. You want your servers to spin up with the Dataloop (Outlyer) Agent installed and with a set of tags that can be used in Outlyer to setup the rest of the monitoring.

You can of course add any number of tags to your agents. The more you add the better actually. The whole premise of our future auto discovery is that we'll detect what is running on your server and automatically tag it. But feel free to apply tags for versions, colours (blue, green deploy?) or any thing you'd like to use in future to refine how plugins are deployed, or dashboards and alerts are created.

It is important that you have a Dataloop (Outlyer) Agent installed on every server, that they are in the right tags and that you keep vigilant for any discrepancies between what's in Outlyer and what is reality. If you get the building blocks correct then the plugins, dashboards and alerts you layer on top will almost guarantee you'll get told when something breaks. If you accidentally don't install agents or put agents into the correct tags then the monitoring is invalid.

### Metrics Collection

Once you have the agents installed and the tags setup as per section 1. you can start to layer on monitoring coverage.

By default every Dataloop (Outlyer) Agent gets put into a tag called `all`. This is useful because you can drag plugins onto this tag and they will run on every single server. We use this tag to deploy a script called 'base' which sends back all of the basic operating system metrics you would expect. Things like CPU, Memory, Disk, Network etc. We'd advise you leave 'base' running on the all tag otherwise you won't get alerted when disks fill up or servers max out on CPU.

Every server role that you have probably has something installed on it, like Apache, or Nginx or MySQL or Elasticsearch, etc. For every role you should ensure that each of the components you depend on has at least one script deployed to monitor it. We provide scripts for most commonly used services. If your service is not listed then you may need to create a plugin to cover it, or request one via email to support@outlyer.com

In our example before we had todo,prod and web tags. These boxes only run Nginx. In the Outlyer UI we would therefore drag the Nginx plugin on top of the 'web' tag so that it will automatically deploy and start sending back metrics.

It is worth noting at this stage that some plugins require some configuration. You should always click `edit` on a plugin, select a server to test it on and hit run. The console will show either an error, which needs fixing by either configuration or setting some variables in the script. In the case of variables we tend to put good comments into the script so it's easy to see what variables to update. Commonly altered variables will always be set at the top of the script in uppercase.

In a ideal world you'd have base running on every system via the all tag. Then a plugin deployed for every service you have. Ultimately this will all be auto-discovered, but for now you need to assign the correct plugins.

You will also undoubtedly have some things you want to check that we don't have out-of-the-box. For these things write some quick check scripts in the browser, test them via the run button, and drag them onto the tag you wish to run them on to deploy.

Monitoring is an ongoing effort. You should aim for good coverage out of the gate, however, you will need to continually add check scripts as services are added, or as gaps in your monitoring are found (usually as a result of incident reviews and postmortems). The more Boolean checks and meaningful metrics you have, the better the dashboards and alerts get when you create them.

Once you have good Nagios check script coverage it might be time to think about some other ways to improve your coverage.

Real-time metrics: Not everything needs to be measured in real time. You'll end up with a lot of coverage from the Nagios check scripts and you probably won't use all of those. We know this because we've got a great deal of experience collecting metrics in real time that have never been used, ever, and likely never will. The argument for 'collect everything as you can never go back in time and enable it' is valid and for every case I've wanted to look at trends back in time, 30 second resolution check scripts have been good enough.

You can install 3rd party agents like CollectD or BrightCover Diamond, configured with the Dataloop (Outlyer) Agent fingerprint as the metrics prefix to send metrics back to Outlyer in realtime. Doing this provides real-time metrics at the expense of additional complexity that needs to be managed outside of Outlyer. Use these tools if you want to spend the time setting them up and would like to create dashboards that update faster and alert on highly time sensitive items. We would however caution that this adds complexity back into your configuration management and typically puts the setup work back onto a select number of people.

You can fire metrics at graphite.dataloop.io at one second resolution. These metrics 'append' the Dataloop (Outlyer) Agent metrics, in so far as they bind to a Dataloop (Outlyer) Agent fingerprint so they look like they come from the same source as your Nagios plugins from that server. We have a support page dedicated to how Graphite metrics work.

Examples of things you may want realtime metrics on are API response times or message queue statistics. These power the graphs that people stare at when there is an issue, and they expect to see immediate changes when something is fixed. We recommend you run scripts that send these real-time metrics to us from the boxes themselves, hitting localhost. This way they append the Nagios metrics and you can use the same tagging system in Outlyer to aggregate all response times across multiple hosts in a tag in graphs and alerts. You'll then see instantly which box has the problem.

You may want to check the entire service response time from outside. In this case it is valid to run the scripts on external agents, hitting an endpoint like a load balancer. If you do this be careful to identify the Dataloop (Outlyer) Agent these metrics are bound to as something easily recognisable as an external check box. Otherwise, you may end up with metrics bound to agents that are not in any way associated with the environment you are monitoring. It is not uncommon for people to setup Amazon micro instances in various regions to run these. Why would you do this in preference to something like Pingdom? Well, you get to run scripts and have an entire programming language at your disposal. You can get these agents to constantly run smoke tests against production. Obviously, it's a bit overkill if you do just want to do simple curls.

The Dataloop (Outlyer) Agent and plugins are our primary source of monitoring, and the Graphite metrics sit on top. The deployment architecture is extremely flexible as you can install a Dataloop (Outlyer) Agent anywhere, either inside your network, or outside and monitor either localhost or other servers.

Application Metrics: Nagios metrics poll the operating system and services from the outside. Some services expose a lot of useful metrics that we write scripts to collect. But what about the application that your team wrote? For that there are a couple of options.

1. The developers can expose metrics via a REST endpoint which could be scraped via a plugin. You could either make up your own spec, or use one like this: 

    <https://github.com/beamly/SE4>  

    If you're in a Java shop the Coda Hale metrics library is awesome. A lot of other languages have similar libraries for exposing internal metrics over an api so that monitoring tools like Dataloop can extract them.  
  

2. StatsD - This is a piece of software that you can install on a central server somewhere (or we can host one for you). You then add a StatsD client library in your code and start to push realtime application level metrics into Outlyer. We use StatsD internally a lot to debug backend processes. Every time you send us a metric we measure how that flows through our system by monitoring various worker stats like inbound, outbound, held metrics etc. On top of counters like that you can also use StatsD to collect business and performance metrics. Timing the duration of functions and metrics is quite fun, especially when you can see what's happening in realtime in production.

For large installations we recommend setting up a StatsD server per environment and tagging the Dataloop (Outlyer) Agent on the StatsD server with the environment tag it is part of. This then makes metrics browsing easier inside Outlyer.


### Dashboards

Always create dashboards widgets based on tags, or combinations of tags. We let you create them for individual hosts but that's mostly for new people playing. If you create a dashboard of widgets based off a host and you delete that host, you will need to edit all of your widgets. Whereas if you created the dashboard from a tag, the hosts are expendable. You just need to put a Dataloop (Outlyer) Agent back into the tag again to resume showing metrics.

We recommend creating a dashboard per environment / role combo. So in our example above we had production web servers for the todo list product. For this I'd create a dashboard called `Todo Prod Webservers` and start to add a variety of tag level widgets.

The most important widgets to get onto a dashboard are the status widgets. Add an agent.status so you can visibly see all servers are alive. Beyond this, each plugin has a .status metric you should add. For our example this would be nginx.status. Then for each service there may be various metrics you want to see. For Nginx these might be:

* Requests per second

* Connections

* 4xx and 5xx errors

* Response times

You may want to add a few OS metrics too. Then you'll be able to tell if your disks are getting filled, or if you need to buy bigger boxes with more cpu or memory.

It's also a good idea to create some business dashboards. Write scripts that poll systems that have those metrics in them, or use StatsD as mentioned above. As with scripts, the dashboards are an ongoing process. Update them every time you want to keep an eye on something new.
 

### Rules and Alerts

By default you get an `all systems` ruleset with criterial in it that will alert you on the `base` plugin on the all tag. Things like servers going down, cpu, disk, load etc. You should probably leave these as they are and possibly extend them if there are things you want to check across every box.

For each of your services it's probably worth having a catch all ruleset. For instance you might create a ruleset for `Nginx` and put some criteria in there for the service status being alive and perhaps requests per second being below a certain threshold.

You should create different rulesets depending on who gets alerted. For instance you might create a ruleset for todo,stag,web that simply emails a group email address when alert criteria are triggered. Whereas your ruleset for todo,prod,web might send emails to pagerduty so that people get an SMS and woken up.
