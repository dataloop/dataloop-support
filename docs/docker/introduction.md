!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

Introduction to Using Outlyer with Docker
==========================================

## What is Docker?

Docker is software that allows you to run your applications inside
containers on a host. Similar to virtual machines but much more lightweight,
containers package up an application with a complete filesystem.

Read more at [What is Docker?](https://www.docker.com/what-docker)

## Monitoring Docker Environments

Docker brings a new level of complexity to monitoring. Each container consumes
CPU, memory, network, and other resources, but all containers must share the
resources available to their host.

Outlyer gives you the ability to monitor the resources used by each of the
containers as well as the host.

Our packs and plugins work with containers as well. The MySQL plugin, for
example, will report the same metrics whether MySQL is running on a traditional
host, or inside a container.

## Monitoring with Outlyer 

We provide a special agent for Docker environments. Naturally, this agent is
itself packaged as a Docker container. Our container provides the following
features:

 * **Container inventory and autodiscovery.** The agent reports metrics for
   every container. When you create new containers, the agent will automatically
   begin reporting metrics for those new containers without any work from you.
   When you delete containers, they will be removed from the Outlyer console.

 * **Per-container and per-host metrics.** The agent will report base system
   metrics (CPU, memory, I/O, and network usage) consumed by each container,
   as well as for the host machine the containers are running on.

 * **Running packs and plugins.** The agent can run our standard packs and
   monitoring plugins against services running inside containers. There are
   usually no changes required to the plugin scripts.

!!! note
    It is not necessary to install the regular Outlyer (Dataloop) Agent on a host if
    the Outlyer (Dataloop) Docker Agent is deployed there. The Docker Agent will report
    host metrics as well as container metrics.

## Container Orchestration

Managing individual Docker hosts directly has given way to _container
orchestration_ software like Kubernetes, Swarm, and Mesos. These systems
let you manage your Docker hosts as a single cluster, also adding a layer
of additional services like fault-tolerance and DNS.

On our [installation page](installation.md), we show you how to deploy
Outlyer to all of the hosts in your Kubernetes or Swarm cluster with a
single command. (Support for Mesos is coming soon.)

## Getting Started

 1. [Install the agent][1] on your Docker hosts.
 2. [Install the Docker pack][2] in your account.
 3. [Tag your containers][3] for service discovery.
 4. [Use "host view"][4] to visualize your hosts, containers, and the
    connections between them.


[1]: installation.md#installing-the-container
[2]: installation.md#installing-the-docker-monitoring-pack
[3]: tagging.md
[4]: host_view.md
