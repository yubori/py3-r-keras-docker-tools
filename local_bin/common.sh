#!/bin/bash
SCRIPT_FULL_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_FULL_PATH)
DOCKER_CNT=$(cat $SCRIPT_DIR/docker_cnt.txt)

CUDA_DEV=
while getopts "d:" opt; do
    case "$opt" in
        d)
            CUDA_DEV="NVIDIA_VISIBLE_DEVICES=$OPTARG"
            ;;
    esac
done
# オプション部分を切り捨てる。
shift `expr $OPTIND - 1`

CUR_DIR=$(pwd)
DOC_OPT="-u $(id -u):$(id -g) -w $CUR_DIR -i --rm -v $CUR_DIR:$CUR_DIR"

if [ -e "$(tty)" ]; then
	DOC_OPT="$DOC_OPT -t"
fi

if [ -n "$CUDA_DEV" ];
then
	DOC_OPT="$DOC_OPT --runtime=nvidia -e $CUDA_DEV"
fi

echo "DOC_OPT: $DOC_OPT"


