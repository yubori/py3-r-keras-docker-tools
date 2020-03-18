#!/bin/bash
SCRIPT_FULL_PATH=$(readlink -f $0)
SCRIPT_DIR=$(dirname $SCRIPT_FULL_PATH)
DOCKER_CNT=$(cat $SCRIPT_DIR/docker_cnt.txt)

LOOP=0
SU=0
CUDA_DEV=
while getopts "ld:sc:" opt; do
    case "$opt" in
        l)
            LOOP=1
            ;;
        d)
            CUDA_DEV="NVIDIA_VISIBLE_DEVICES=$OPTARG"
            ;;
        s)
            SU=1
            ;;
        c)
            DOCKER_CNT="$OPTARG"
            ;;
    esac
done
# オプション部分を切り捨てる。
shift `expr $OPTIND - 1`

CUR_DIR=$(pwd)
DOC_OPT="-u $(id -u):$(id -g)"
if [ $SU -eq 1 ]; then
    DOC_OPT=""
fi
DOC_OPT="$DOC_OPT -w $CUR_DIR -i --rm -v $CUR_DIR:$CUR_DIR"

if [ -e "$(tty)" ]; then
	DOC_OPT="$DOC_OPT -t"
fi

if [ -n "$CUDA_DEV" ];
then
	DOC_OPT="$DOC_OPT --runtime=nvidia -e $CUDA_DEV"
fi

echo "DOC_OPT: $DOC_OPT"

