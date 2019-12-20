#!/bin/bash

source /usr/local/bin/exporter.env
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export WALE_S3_PREFIX
export AWS_ENDPOINT
export AWS_S3_FORCE_PATH_STYLE
export AWS_REGION

exec wal-g wal-push $1
