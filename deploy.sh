#!/bin/bash

# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=
# export AWS_DEFAULT_REGION=

S3_BUCKET='docs.outlyer.com.us-east-1'

# install all the pips
pip install -r requirements.txt

# Clean the build dir and create new
mkdocs build --clean --strict --verbose

# Push up to s3
aws s3 sync site s3://${S3_BUCKET} --cache-control "public, max-age=300, must-revalidate"


