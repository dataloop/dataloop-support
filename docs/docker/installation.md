!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.

Docker Agent and Pack installation
==================================

There are two steps to getting our Docker support up and running:

  1. Installing the Docker Agent.
  2. Installing the Docker Monitoring Pack in your account.

## Installing the Agent container

The Docker Agent is itself just a Docker container. It runs alongside the other
containers on your Docker host. How you deploy the container depends on your
environment. Choose the option that matches your needs:

 * [Deploying on a Kubernetes cluster](#deploying-on-kubernetes)
 * [Deploying on a Swarm cluster](#deploying-on-swarm)
 * [Deploying manually](#manually-starting-the-container)

### Deploying on Kubernetes

Download our [sample daemonset file][1] and customize as necessary for your
installation. At minimum, you will want to set your DOCKER_AGENT_KEY:

    :::yaml hl_lines="3"
    env:
      - name: DATALOOP_AGENT_KEY
        value: <your dataloop agent key>

Then deploy it to Kubernetes with this command:

    kubectl apply -f kubernetes_daemonset.yaml

- - -

### Deploying on Swarm

Please follow the instructions detailed [here](/agent/installation_docker.md),
making sure that you pass `--net=host` to the `docker run` command.

#### Why can't the Agent run as a swarm service?

Swarm does not [yet](https://github.com/moby/moby/issues/27082) support running
containers with `--net=host`, which is needed for the Agent to communicate
simply with all containers on the host.

- - -

### Starting the container by hand

The Dataloop container can be manually started with a simple `docker run`
command. Detailed instructions are [here](/agent/installation_docker.md).


## Configuration

No matter which method you choose, you will need to specify your agent key,
which associates the agent with your account. You can also pass in any of
these additional environment variables:

`DATALOOP_AGENT_KEY`
: Your agent key.

`DATALOOP_NAME`
: Assigns a name to the agent. If not provided, the host name will be used.

`DATALOOP_TAGS`
: Comma-separated list of extra tags to apply to the agent.

`DATALOOP_DEBUG`
: If set to `true`, the agent will enable extra verbose logging.


## Installing the Docker monitoring pack

The Docker pack provides some default dashboards and alerts for Docker
environments. To install it:

 1. Go to **Setup Monitoring > Pack Library**.
 2. Scroll down to the Docker pack.
 3. Click the green "Install" button on the right side of the screen.

![Docker pack][2]

### Viewing the Docker dashboard

The dashboard in the Docker pack provides a snapshot of your environment's
overall health, including service status, number of containers running, and
container resource usage. To view it, go to **Dashboards > Docker**.

### Customizing the standard alerts

The pack provides a simple alert rule that triggers whenever any of the
monitored containers goes down. To customize the rule, go to
**Alerts > Docker**.

[1]: https://raw.githubusercontent.com/outlyerapp/docker-alpine/master/agent/kubernetes_daemonset.yaml
[2]: /img/docker_pack.png
