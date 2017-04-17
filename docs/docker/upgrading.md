!!! note
    We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called `dataloop agent`, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything.


Upgrading to the latest version
===============================

The latest version of our agent is always available on [Docker Hub][1] with
the `latest` tag, so upgrading should be as simple as:
```
    docker pull dataloop/dataloop-docker:latest
    docker stop dataloop
    docker start dataloop
```

If you are using Docker Compose to run the container, just execute this in the
directory where you placed our `docker-compose.yml`:
```
    docker-compose down && docker-compose up
```

For Kubernetes versions prior to 1.6, you must delete the Outlyer DaemonSet and
recreate it:
```
    kubectl delete -f outlyer_daemonset.yaml
    kubectl apply -f outlyer_daemonset.yaml
```

Kubernetes 1.6 and later support rolling updates to DaemonSets. See the
[Kubernetes docs][2] for guidance.

For Swarm, you should update the image on your manager nodes and worker
nodes as follows:
```
    docker service update --image dataloop/dataloop-docker:latest agent-worker
    docker service update --image dataloop/dataloop-docker:latest agent-manager
```

Upgrading from the previous generation agent
============================================

If you are currently running a version of our Docker Agent prior to
`2017.3-1`, you should remove it before installing the latest agent.
This only needs to be done once.

 1. First, remove any existing Dataloop Docker containers. Use `docker ps`
    to find the container:

```
    docker ps | grep dataloop | cut -f1 -d" "
```

 2. Stop and remove the container, using the container ID you obtained
    in step 1.

```
    docker rm -f 7a5c126f7297
```

 3. If the Host Agent is installed, you should remove that also. The Host
    Agent is no longer required on Docker machines. Follow our
    [uninstall instructions](../agent/uninstall.md) to remove it.

 4. Now you can [install the latest version](installation.md) of the
    Docker Agent.

[1]: https://hub.docker.com/r/dataloop/dataloop-docker/ "Docker Hub"
[2]: https://kubernetes.io/docs/tasks/manage-daemon/update-daemon-set/ "Performing a Rolling Update on a DaemonSet"
