#!/bin/bash

source $1
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export WALE_S3_PREFIX
export AWS_ENDPOINT
export AWS_S3_FORCE_PATH_STYLE
export AWS_REGION
export WALG_PGP_KEY_PATH
export WALG_GPG_KEY_ID

exec wal-g wal-push $2
