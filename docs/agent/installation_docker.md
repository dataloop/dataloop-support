-unsure as to whether to replace Dataloop
-added comment re rebrand above

## Installation on Docker


You can run a containerised agent in a Docker container by running:

```
DATALOOP_AGENT_KEY=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
DATALOOP_NAME=docker_container_name
sudo docker run -d -e "DATALOOP_AGENT_KEY=${DATALOOP_AGENT_KEY}" \
-e "DATALOOP_NAME=${DATALOOP_NAME}" \
-p 8000:8000 \
-p 8080:8080 \
--volume=/:/rootfs:ro \
--volume=/var/run:/var/run:rw \
--volume=/sys:/sys:ro \
--volume=/var/lib/docker/:/var/lib/docker:ro \
dataloop/dataloop-docker:latest
```

This will download the container directly from the Docker hub. For more info see <https://github.com/outlyerapp/docker-alpine/tree/master/dataloop-docker> 
