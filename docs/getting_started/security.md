## Security

### Dataloop Agent

The Dataloop Agent connects outbound on port `443` only.

Installation of the agent can be done in a number of ways. Most of our customers use configuration management tools and the repos provided in the public Dataloop Github account. These are extremely simple; they add a repo file, install the dataloop-agent package, modify a config file and start a service.

We provide a curl installer for people who want to give Dataloop a quick try on a test machine. Curl installers by their very nature are not secure, however they are extremely quick (just a simple copy and paste). We strongly advise people stop using the curl installer after they have moved past the test phase.

By default the agent runs as a non privileged user `dataloop` which can be locked down further by the operating system if required.

The agent uses an non privileged account key to join Dataloop. On initial start up a key exchange happens and a unique agent identifier is stored in a fingerprint file in the agent config directory. This securely registers your server to Dataloop.

### Data Privacy

By default we only send back basic operating system metrics like cpu, disk, memory, network, and a process list and some metadata about your servers. This metadata includes things like network addresses, environment variables, and metadata from services like AWS and Facter / Ohai. We send all of this data back for the sole purpose of helping you to troubleshoot issues and for auto discovery of services, so that we can automate the setup of your monitoring. We will never share this data with any 3rd party.

### Solo Mode

Dataloop has some unique technology that allows teams outside of operations to quickly write plugins and deploy them to groups of servers. We recommend that this feature is enabled and used in development and test so that you get the full value out of our self service capability.

In some cases, usually on production or in more tightly controlled environments you will need to turn off these capabilities. For this scenario we provide `Solo` mode which completely disables remote script execution and deployment. This is as simple as updating the agent.yaml with solo: yes and restarting the service.

In Solo Mode the agent no longer polls the Dataloop.IO API for plugin downloads and instead polls the local disk. Drop all of your plugins into the plugins directory and the agent will still only load those configured in the app. This means you keep the benefit of rapid script creation and deployment, while retaining control of what runs on your servers via your normal config management workflow.
