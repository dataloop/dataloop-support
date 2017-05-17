#!/bin/bash

# make sure the docker image is up to date
docker build -t python3 .

# build in an immutable docker
docker run -ti --rm \
  -v $PWD:/mkdocs \
  --workdir /mkdocs \
  --publish 8000:8000 \
  python3 \
  mkdocs serve -a 0.0.0.0:8000
