# FAQ

Dataloop.IO was built to be the fastest and simplest way to setup monitoring for your rapidly changing infrastructure. We’re constantly looking for ways to help users get up to speed in minutes and this FAQ is our first step.
 

**Q. My question isn’t covered here, where can I get help?**

A. Email us at support@dataloop.io or join our Slack room

**Q. I signed up and logged in for the first time but I’m confused. How  do I start monitoring?**

A. The best way to start is to install an agent via curl onto a test virtual machine and have a play with installing packs and writing your own plugins. If you get stuck contact support and we'll happily guide you through everything.

 

> Q. I'm sending metrics into Dataloop. How do I browse them?
> 
> A. You can browse your metrics on the dashboards and rules pages.

Create a new dashboard and then click on the + widget to bring up the metric browser. Click on one tag, or a combination of tags, or a single agent and click 'select'. You will now be shown a tree of metrics available across the agents selected.

The metrics you see will be determined by the Nagios plugins running and the Graphite or StatsD metrics you are sending in. You can now tick one or many metrics to display on graph and number widgets.

On the rules page add a new rule and then add a new criteria. You will be presented with several drop downs that allow metric browsing and selection.

 

Q. I can't see my StatsD metrics. Where should they appear?

A. If you are using the Dataloop hosted StatsD then metrics can be browsed under the 'statsd' tag, or by browsing the 'dataloop' agent directly. If you cannot see your StatsD metrics in the tree then check your client settings or contact us for support by email or Slack.

If you have setup your own StatsD server then metrics will appear under whatever agent fingerprint they are being sent from.

 

Q. How do I troubleshoot what the Agent is doing?

A. You’ll hopefully never have to troubleshoot, but just in case..

The Agent installer creates a ‘dataloop’ directory in /var/log. In this directory you’ll find an agent.log file that shows you exactly what the agent is doing.

You can increase the logging information by turning on debugging. In the agent.yaml configuration file, set debug to yes:

debug: yes

To restart the agent just run:

service dataloop-agent restart

On Windows the installer creates a service called ‘Dataloop’. To restart the agent just restart the Windows service from computer management. Windows puts the log file in C:\Dataloop.

 

 

Q. How does the Agent connect to the web interface? Do I need to open any ports?

A. The agent connects outbound on tcp port 443 to agent.dataloop.io.

 

Q. Can I connect the Agent to the internet via a proxy?

A. Yes, export the HTTPS_PROXY environment variable in /etc/default/dataloop-agent and restart the dataloop-agent service

 

Q. What data are you collecting from me?

A. The agent sends the hostname, mac address, fingerprint (a random unique string that we create to identify your server) and the data from your scripts. We also send back a list of processes (process.name from the psutils library) and some metadata.

We use Nagios format scripts so the output is limited to 0,1,2 and 3 for alert status and something=value for the performance metrics. What gets sent back will largely be decided by you when you assign plugins.

 

Q. How exactly do you keep up with the rate of change in my dynamic environments?

A. All configuration is driven by tags. Simply run dataloop-agent --add-tags on the command line (or automate it via config management). Plugin deployment, dashboards and alerts are all bound to tags so purely by manipulating what tags your agent belongs to we keep up with change.

We provide secure agent registration, de-registration and presence detection. Simply run dataloop-agent --deregister to remove your agent from the system.

We also support agent finger printing so that you can recreate nodes and reattach to old metrics. This is especially useful for phoenix deployments.

By default agents will deregister on graceful shutdown which works well on AWS with auto scaling groups. You can spin up and down instances and your dashboards and alert rules will dynamically update.

 

Q. Where is your product roadmap?

A. We are very customer focused and are constantly iterating the product based on feedback. You can see and vote on which features you would like to see in Dataloop here: https://dataloop.uservoice.com/forums/289987-general/filters/top

 

Q. What are shells?

A. Something we added mostly for Windows.

Linux and OSX run scripts with a shebang at the top of the file. Windows treats everything as if it’s a .cmd or a .exe. For those wanting to run Powershell or WSF / vbs / js files you can setup shell paths under the settings page. You could for instance setup a WSF shell pointing to c:\windows\system32\cscript.exe and apply it to your WSF script using the shell dropdown in the editor.

Shells can also be used on Linux / OSX and we’ve found them very helpful for running PhantomJS scripts.

 

Q. How do I remove the agent?

A. On Linux remove the dataloop-agent package

On Windows remove the agent via the add/remove programs interface.

 

Q. What’s the quickest way to write Nagios plugins?

A. If you’re using Linux then you’re spoilt for choice as you have Bash, Ruby and Python installed by default. Pick your favourite scripting language and start writing.

On Windows you can use batch, or setup a shell for Powershell. Or, alternately use our built in Python interpreter by selecting 'Built-In Python' from the drop down at the top of the plugin editor page.

You can find the Nagios Plugin Development Guide here: link

If you need any help with writing scripts let us know.

 

Q. Will you support other operating systems and architectures?

A. We’ll probably only ever create installers for Linux and Windows. However, for those that want to install our agent on more exotic platforms (like Raspberry Pi or AIX / HP-UX / Solaris etc) we may be open to providing special builds. The agent is written in Python so in theory should run everywhere. If you’d like another operating system package please contact us.

 

Q. How can I secure the Agent?

A. We have a support page for security.

 

Q. The share dashboard button has gone missing. How can I get it back?

A. This can happen when you have browser extensions like Adblock installed
