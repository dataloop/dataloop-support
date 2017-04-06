#!/bin/bash

# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-1

S3_BUCKET='docs.outlyer.com.us-east-1'

# make sure the docker image is up to date
docker build -t python3 .

# build in an immutable docker
docker run -t --rm \
  -v $PWD:/mkdocs \
  --workdir /mkdocs \
  python3 \
  mkdocs build --clean --strict --verbose

# Push up to s3 in a docker
docker run -t --rm \
  -v $PWD:/mkdocs \
  --workdir /mkdocs \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  python3 \
  aws s3 sync site s3://${S3_BUCKET} --cache-control "public, max-age=300, must-revalidate"
