#!/bin/bash
SCRIPT_FULL_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_FULL_PATH)
. $SCRIPT_DIR/common.sh

while : 
do
    docker run $DOC_OPT $DOCKER_CNT sh -c "python3 $*"
    if [ if $LOOP -ne 1 -o $? -eq 0 ]; then
       break 
    fi
done
