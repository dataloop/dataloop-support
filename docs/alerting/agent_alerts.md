!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

# Agent Alerts

Agents create a persistent websocket connection to <https://agent.dataloop.io> when they start.

If this connection drops you will see Dataloop (Outlyer) Agent names will change to either orange or red.

The Agent will do everything within its power to try to reconnect. So you may see some drops and reconnects depending on network issues.

A large portion of the Outlyer web application depends on real time connectivity (remote command execution and live streaming graphs for instance) so we therefore make it obvious when a connection has dropped to prevent frustration when buttons are clicked but nothing happens.

To alert on Dataloop (Outlyer) Agent failure create a new rule and select your scope, be that either an individual Dataloop (Outlyer) Agent or a group of agents in a tag. In the 'Alert On' drop down you can now select the `agent.status` metric. You'll then get the option to specify how long the agent(s) need to have been down for in order to trigger an alert.
