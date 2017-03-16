_**PLEASE NOTE:** We have recently rebranded and changed our name from Dataloop.IO to Outlyer. Our agent is still called “dataloop agent”, and relevant code reflects the old name (Dataloop) as well. Thank you for your patience as we update everything._

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
