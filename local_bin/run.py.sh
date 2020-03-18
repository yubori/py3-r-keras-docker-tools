#!/bin/bash
SCRIPT_FULL_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_FULL_PATH)
. $SCRIPT_DIR/common.sh

while true
do
    docker run $DOC_OPT $DOCKER_CNT sh -c "python3 $*"
    RES=$?
    #echo "$RES"
    if [ $RES -eq 0 -o $LOOP -ne 1 ]; then
       break 
    fi
done
