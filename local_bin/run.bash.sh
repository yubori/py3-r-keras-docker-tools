#!/bin/bash
SCRIPT_FULL_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_FULL_PATH)
. $SCRIPT_DIR/common.sh

docker run $DOC_OPT $DOCKER_CNT bash
